// zig-0.15.2      2026/01
// Zig v0.14.0-dev 2024/10
// Zig v0.9.0      2021/12
// exec/src/main.zig
// UTF-8
const std = @import("std");
const win = @import("win32api").everything;
const msg = @import("win32api").ui.windows_and_messaging;
const process = @cImport({
    @cInclude("process.h");
});
const system = process.system;

fn libcSystem(cmd: [*]const u8) void {
    _ = system(cmd);
}

fn stdOsExecveZ(cmd: [*:0]const u8) anyerror!void {
    const args = [_:null]?[*:0]const u8{ "-v", null };
    const env = [_:null]?[*:0]const u8{ "PATH", null };
    std.posix.execvpeZ(cmd, &args, &env) catch {
        std.debug.print("\n{s}", .{"Error!: execvpeZ()"});
    };
}
//pub extern "SHELL32" fn ShellExecuteW(
//    hwnd: ?HWND,
//    lpOperation: ?[*:0]const u16,
//    lpFile: ?[*:0]const u16,
//    lpParameters: ?[*:0]const u16,
//    lpDirectory: ?[*:0]const u16,
//    nShowCmd: i32,
//) callconv(@import("std").os.windows.WINAPI) ?HINSTANCE;
fn win32ShellExecute() void {

    // SW_SHOWNORMAL = SHOW_WINDOW_CMD.SHOWNORMAL;
    //const hwnd: ?HWND = null;
    const opn: ?[*:0]const u16 = std.unicode.utf8ToUtf16LeStringLiteral("open");
    const cmd: ?[*:0]const u16 = std.unicode.utf8ToUtf16LeStringLiteral("notepad");
    const arg: ?[*:0]const u16 = std.unicode.utf8ToUtf16LeStringLiteral("src/main.zig");
    _ = win.ShellExecuteW(null, opn, cmd, arg, null, msg.SW_SHOW.SHOWNORMAL);
}

pub fn main() anyerror!void {
    libcSystem("zig version");
    try stdOsExecveZ("zig");
    win32ShellExecute();
}
