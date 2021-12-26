// https://memo88.hatenablog.com/entry/2021/01/07/235019#C-%E3%81%AE-sprintf-%E7%9B%B8%E5%BD%93-v071
// zig-0.9.0 2021/12
const std = @import("std");

pub fn main() !void {
    const s = "foo";
    const n = -123;
    var buf: [16]u8 = undefined;

    const slice: []u8 = try std.fmt.bufPrint( &buf, "{s} bar {}", .{ s, n });

    std.debug.print("ret:{s}\n", .{ slice });
}
