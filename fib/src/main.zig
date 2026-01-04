const std = @import("std");
const heap = std.heap;

fn fib(n: i32) i32 {
    if (n < 2) {
        return n;
    }
    return fib(n - 1) + fib(n - 2);
}

pub fn main() anyerror!void {
    var arena = heap.ArenaAllocator.init(heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();
    const args = try std.process.argsAlloc(allocator);

    const num = try std.fmt.parseInt(i32, args[1], 10);
    std.debug.print("{}", .{fib(num)});
}
