const std = @import("std");

//const c = @cImport({
//    @cInclude("stdio.h");
//});

pub extern fn printf(_Format: [*c]const u8, ...) c_int;

pub fn main() void {
    const year: i32 = 2026;
    //_ = c.printf("Hello world %d\n", year);

    _ = printf("Hello world %d\n", year);
}
