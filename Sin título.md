convierte esto:
```python
object, created = CorresponsableOrden.objects.get_or_create(autorizador=item, orden=instance)  
  
if created:  
    send_mail(  
        subject="Test Email",  
        from_email=settings.EMAIL_HOST_USER,  
        fail_silently=False,  
        message=render_to_string(  
            'emails/aceptar_corresponsable.html',  
            {  
                'invitacion': object,  
                'orden': object.orden,  
                'user': object.autorizador,  
                'host': settings.URL_BASE_PARA_EMAILS,  
            }  
        ),  
        recipient_list=[  
            object.autorizador.email  
        ]  
    )
```

en un método de prestatario:

```python
class Prestatario(User):  
    """  
    Un tipo de usuario con permisos específicos para solicitar    equipos del almacén y ser corresponsable de órdenes.    """  
    class Meta:  
        verbose_name_plural = "Prestatarios"  
        proxy = True  
  
    class PrestatarioManager(models.Manager):  
        def get_queryset(self, *args, **kwargs):  
            return super().get_queryset(*args, **kwargs).filter(groups__name='prestatarios')  
  
    objects = PrestatarioManager()  
  
    @staticmethod  
    def get_user(user: User) -> Any | None:  
        """  
        Obtiene el usuario prestatario.  
        :param user: El usuario que se quiere obtener.        :returns: El usuario prestatario o None si no existe.  
        """        try:  
            user = Prestatario.objects.get(pk=user.pk)  
        except Prestatario.DoesNotExist:  
            user = None  
        return user  
  
    @staticmethod  
    def crear_usuario(*args, **kwargs) -> 'Prestatario':  
        """  
        Crea un usuario de tipo prestatario. Útil para pruebas unitarias.  
        :returns: El usuario prestatario creado.  
        """        grupo, _ = Prestatario.crear_grupo()  
        user = User.objects.create_user(*args, **kwargs)  
        grupo.user_set.add(user)  
        return Prestatario.get_user(user)  
  
    @staticmethod  
    def crear_grupo() -> tuple[Any, bool]:  
        """  
        Crea el grupo de permisos para el usuario prestatario.  
        :returns: El grupo creado y si se creó el grupo.  
        """        group, created = Group.objects.get_or_create(name='prestatarios')  
        group.permissions.add(Permission.objects.get(codename='add_carrito'))  
        group.permissions.add(Permission.objects.get(codename='add_orden'))  
        group.permissions.add(Permission.objects.get(codename='add_corresponsableorden'))  
        return group, created  
  
    def ordenes(self) -> QuerySet[Any]:  
        """  
        Obtiene las órdenes realizadas por el usuario.  
        :returns: Lista de órdenes del usuario.  
        """        return Orden.objects.filter(_corresponsables__in=[self])  
  
    def reportes(self) -> QuerySet['Reporte']:  
        """  
        Devuelve los reportes del prestatario.  
        :returns: Lista de reportes del prestatario.  
        """        return Reporte.objects.filter(orden__in=self.ordenes())  
  
    def materias(self) -> QuerySet['Materia']:  
        """  
        Devuelve las materias del prestatario.  
        :returns: Lista de materias del prestatario.  
        """        return self.materia_set.all()  
  
    def carrito(self) -> QuerySet['Carrito']:  
        """  
        Devuelve el carrito actual del prestatario. Un usuario solo        puede tener un carrito a la vez.  
        :returns: El carrito del prestatario o None si no existe.  
        """        return Carrito.objects.get(prestatario=self)  
  
    def tiene_carrito(self) -> bool:  
        """  
        Verifica si el usuario tiene un carrito.  
        :returns: True si el usuario tiene un carrito, False en caso contrario.  
        """        return Carrito.objects.filter(prestatario=self).exists()  
  
    def suspendido(self) -> bool:  
        """  
        Verifica si el usuario está suspendido.  
        :returns: True si el usuario está suspendido, False en caso contrario.  
        """        return self.reportes().filter(estado=Reporte.Estado.ACTIVO).exists()
```