// zig-0.9.0 2021/12
const std = @import("std");
const win = @import("win32api").everything;
const c = @cImport({
    @cInclude("xprintf.h");
});

fn outc(ch: u8) callconv(.C) void {
    var num: u32 = 0;
    var str: [1]u8 = undefined;
    str[0] = ch;
    _ = win.WriteConsoleA(win.GetStdHandle(win.STD_OUTPUT_HANDLE), &str, 1, &num, null);
}

pub fn main() void {
    const year: i32 = 2024;
    c.xfunc_out = outc;
    // MS-DOS窓以外のコンソールでは表示できない
    c.xprintf("Hello xprintf() = %d: 0x%04X\n", year, year);
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
