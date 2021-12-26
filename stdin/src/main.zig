// Referred from,
// https://stackoverflow.com/questions/62018241/current-way-to-get-user-input-in-zig
// zig-0.9.0 2021/12
// stdin/src/main.zig

const std = @import("std");

fn ask_user() !i64 {
    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();

    var buf: [10]u8 = undefined;

    try stdout.print("A number please: ", .{});

    if (try stdin.readUntilDelimiterOrEof(buf[0..], '\n')) |user_input| {
        const sIn = std.mem.trimRight(u8, user_input, "\n\r "); // Remove '\n\r '
        return std.fmt.parseInt(i64, sIn, 10);
    } else {
        return @as(i64, 0);
    }
}

pub fn main() anyerror!void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Your number is {}", .{ask_user()});
}
