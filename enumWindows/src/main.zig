// zig-0.9.0 2021/12
const std = @import("std");
const win = @import("win32api").everything;

const TITILE_MAX: i32 = 2048;
var sTitle: [TITILE_MAX:0]u8 = undefined;
var gHandle: win.HWND = undefined;
pub fn callBackProc(hWnd: win.HWND, param: win.LPARAM) callconv(@import("std").os.windows.WINAPI) win.BOOL {
    _ = param;
    const stdout = std.io.getStdOut().writer();
    if (0 < win.GetWindowTextA(hWnd, &sTitle, TITILE_MAX)) {
        const a = std.ascii.startsWithIgnoreCase(std.mem.span(&sTitle), "Default IME");
        const b = std.ascii.startsWithIgnoreCase(std.mem.span(&sTitle), "MSCTFIME");
        if (a or b) {
            // discard
        } else {
            gHandle = hWnd;
            stdout.print("[{}]:{s}\n", .{ gHandle, sTitle }) catch return 1;
        }
    }
    return 1;
}

pub fn main() anyerror!void {
    const stdout = std.io.getStdOut().writer();
    _ = win.EnumWindows(callBackProc, 0);
    try stdout.print("Last process number:{}", .{gHandle});
}
// 参考
//pub const WNDENUMPROC = fn(
//    param0: HWND,
//    param1: LPARAM,
//) callconv(@import("std").os.windows.WINAPI) BOOL;

//pub extern "USER32" fn EnumWindows(
//    lpEnumFunc: ?WNDENUMPROC,
//    lParam: LPARAM,
//) callconv(@import("std").os.windows.WINAPI) BOOL;
//
