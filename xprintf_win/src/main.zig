// zig-0.15.2  2016/01
// zig-0.9.0   2021/12
const std = @import("std");
const win = @import("win32api").everything;
const xp = @import("xprintf");

fn outc(ch: u8) callconv(.c) void {
    var num: u32 = 0;
    var str: [1]u8 = undefined;
    str[0] = ch;
    _ = win.WriteConsoleA(win.GetStdHandle(win.STD_OUTPUT_HANDLE), &str, 1, &num, null);
}

pub fn main() void {
    const year: i32 = 2026;
    xp.xfunc_out = outc;
    // MS-DOS窓以外のコンソールでは表示できない
    xp.xprintf("Hello xprintf() = %d: 0x%04X\n", year, year);
}

//pub extern "KERNEL32" fn GetStdHandle(
//    nStdHandle: STD_HANDLE,
//) callconv(@import("std").os.windows.WINAPI) HANDLE;
//
//pub extern "KERNEL32" fn WriteConsoleA(
//    hConsoleOutput: ?HANDLE,
//    lpBuffer: [*]const u8,
//    nNumberOfCharsToWrite: u32,
//    lpNumberOfCharsWritten: ?*u32,
//    lpReserved: ?*anyopaque,
//) callconv(@import("std").os.windows.WINAPI) BOOL;
