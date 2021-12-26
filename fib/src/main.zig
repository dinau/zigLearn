const dprint = @import("std").debug.print;

fn fib(n: i32) i32 {
    if (n < 2) {
        return n;
    }
    return fib(n - 1) + fib(n - 2);
}

pub fn main() anyerror!void {
    dprint("{}", .{fib(42)});
}
