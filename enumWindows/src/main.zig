// zig-0.15.2     2026/01
// zig-0.14.0-dev 2024/10
// zig-0.9.0      2021/12

const std = @import("std");
const win = @import("win32api").everything;

const TITILE_MAX: i32 = 2048;
var sTitle: [TITILE_MAX:0]u8 = undefined;
var gHandle: win.HWND = undefined;
pub fn callBackProc(hWnd: win.HWND, param: win.LPARAM) callconv(.winapi) win.BOOL {
    _ = param;
    const sLen: usize = @intCast(win.GetWindowTextA(hWnd, &sTitle, TITILE_MAX));
    if (0 < sLen) {
        sTitle[sLen] = 0;
        const a = std.ascii.startsWithIgnoreCase(std.mem.span(sTitle[0..].ptr), "Default IME");
        const b = std.ascii.startsWithIgnoreCase(std.mem.span(sTitle[0..].ptr), "MSCTFIME");
        if (a or b) {
            // discard
        } else {
            gHandle = hWnd;
            std.debug.print("[{}]:{s}\n", .{ gHandle, sTitle });
        }
    }
    return 1;
}

pub fn main() anyerror!void {
    _ = win.EnumWindows(callBackProc, 0);
    std.debug.print("Last process number:{}", .{gHandle});
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
// TODO: this type is limited to platform 'windows5.0'

//pub extern "USER32" fn GetWindowTextA(
//    hWnd: ?HWND,
//    lpString: [*:0]u8,
//    nMaxCount: i32,
//) callconv(@import("std").os.windows.WINAPI) i32;
//
//// TODO: this type is limited to platform 'windows5.0'
//pub extern "USER32" fn GetWindowTextW(
//    hWnd: ?HWND,
//    lpString: [*:0]u16,
//    nMaxCount: i32,
//) callconv(@import("std").os.windows.WINAPI) i32;
