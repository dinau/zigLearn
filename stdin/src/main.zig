// zig-0.15.2 2026/01
// Referred from,
// https://stackoverflow.com/questions/62018241/current-way-to-get-user-input-in-zig
// zig-0.14.0 2024/10
// zig-0.9.0 2021/12
// stdin/src/main.zig

const std = @import("std");

fn ask_user() !i64 {
    var buf: [10]u8 = undefined;
    var stdin = std.fs.File.stdin().reader(&buf);

    std.debug.print("A number please: ", .{});
    const user_input = try stdin.interface.takeDelimiterExclusive('\n');
    const sUserInput = if (user_input.len > 0 and user_input[user_input.len - 1] == '\r')
        user_input[0..(user_input.len - 1)]
    else
        user_input;

    if (sUserInput.len > 0) {
        return std.fmt.parseInt(i64, sUserInput, 10);
    } else {
        return @as(i64, 0);
    }
}

pub fn main() anyerror!void {
    std.debug.print("Your number is {}", .{try ask_user()});
}
