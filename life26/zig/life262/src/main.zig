// zig-0.9.0 2021/12
// life262/src/main.zig
const std = @import("std");
const W = 10;
const H = 10;
var realf: [H][W]i32 = undefined;
var realpf: [H][W]i32 = undefined;
var f = &realf;
var pf = &realpf;
var tempf = &realf;
pub fn main() anyerror!void {
    var buf: [100:0]u8 = undefined;
    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();
    for (realpf) |*h| { for (h.*) |*w| { w.* = 0; } }
    while (try stdin.readUntilDelimiterOrEof(buf[0..], '\n')) |user_input| {
        if (user_input.len == 0) {
            for(pf)|v,y|{
                try stdout.print("\n", .{});
                for(v)|_,x|{
                    var c: i32 = 0;
                    var yy: i32 = @intCast(i32,y) - 1;
                    while (yy <= y + 1) : (yy += 1) {
                        var xx: i32 = @intCast(i32,x)- 1;
                        while (xx <= x + 1) : (xx += 1) {
                            if ((yy < 0) or (yy >= H) or (xx < 0) or (xx >= W) or ((x == xx) and (y == yy))) continue;
                            c += pf[@intCast(usize,yy)][@intCast(usize,xx)];
                        }
                    }
                    f[y][x] = if (((c == 2) and (pf[y][x] == 1)) or (c == 3)) 1 else 0;
                    var st = if (f[y][x] == 1) " o" else " .";
                    try stdout.print("{s}", .{st});
                }
            }
            tempf = pf; pf = f; f = tempf;
        } else if (user_input[0] == 'q') {
            break;
        } else {
            var iter = std.mem.split(u8,user_input, " ");
            const sx = iter.next() orelse continue;
            const sy = iter.next() orelse continue;
            const x = std.fmt.parseInt(usize, sx, 10) catch continue;
            const y = std.fmt.parseInt(usize, sy, 10) catch continue;
            pf[y][x] = 1;
        }
    }
}
