const std = @import("std");
const c = @cImport({
    @cInclude("stdio.h");
});

pub fn main() void {
    var year :i32 =2021;
    _ = c.printf("Hello world %d\n",year);
}
