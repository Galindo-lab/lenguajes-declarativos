#lang racket

(module+ main
  (require raylib/2d/unsafe)

  (InitWindow 800 450 "raylib [core] example - basic window")

  (let loop ()
    (when (not (WindowShouldClose))
      (BeginDrawing)
      (ClearBackground RAYWHITE)
      (DrawText "Congrats! You created your first window!" 190 200 20 LIGHTGRAY)
      (EndDrawing)
      (loop)))

  (CloseWindow))
