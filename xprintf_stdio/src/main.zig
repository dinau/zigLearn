const std = @import("std");
const c = @cImport({
    @cInclude("stdio.h");
    @cInclude("xprintf.h");
});

fn outc(ch:u8) callconv(.C) void{
    _ = c.putchar(ch);
}

pub fn main() void {
    var year :i32 =2021;
    c.xfunc_out = outc;

    c.xprintf("Hello xprintf()=%d: %X\n",year,year);
}

