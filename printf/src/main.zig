const std = @import("std");
const c = @cImport({
    @cInclude("stdio.h");
});

pub fn main() void {
    const year: i32 = 2024;
    _ = c.printf("Hello world %d\n", year);
}
