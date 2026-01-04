const std = @import("std");
const xp = @import("xprintf");

pub extern fn putchar(_Ch: c_int) c_int;

fn outc(ch: u8) callconv(.c) void {
    //_ = c.putchar(ch);
    _ = putchar(ch);
}

pub fn main() void {
    const year: i32 = 2026;
    xp.xfunc_out = outc;
    _ = xp.xprintf("Hello xprintf() = %d: 0x%X\n", year, year);
}
