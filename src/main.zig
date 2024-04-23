const std = @import("std");
const builtin = @import("builtin");

const c = @cImport({
    @cInclude("raylib.h");
});

const WINDOW_WIDTH: i32 = 1024;
const WINDOW_HEIGHT: i32 = 700;

pub fn main() !void {
    // Prints to stderr (it's a shortcut based on `std.io.getStdErr()`)
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});
    const fps: i32 = 60;
    c.InitWindow(WINDOW_WIDTH, WINDOW_HEIGHT, "raylib [core] example - keyboard input");
    defer c.CloseWindow();

    c.SetTargetFPS(fps);

    while (!c.WindowShouldClose()) {
        c.BeginDrawing();
        {
            c.ClearBackground(c.RAYWHITE);
            c.DrawText("move the ball with arrow keys", 10, 10, 20, c.DARKGRAY);
        }
        c.EndDrawing();
    }
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Run `zig build test` to run the tests.\n", .{});
}
