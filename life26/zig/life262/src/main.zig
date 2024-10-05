// zig-0.14.0 2024/10 updated.
// zig-0.12.0 2024/06 updated.
// zig-0.9.0  2021/12

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
  for (0..H) |h| {
      for (0..W) |w| {
          realpf[h][w] = 0;
      }
  }
  while (try stdin.readUntilDelimiterOrEof(buf[0..], '\n')) |user_input| {
    const sUserInput = user_input[0..(user_input.len - 1)]; // Delete 0x0D end of line
    if ((sUserInput.len) == 0) {
      for(pf, 0..)|v, y| {
        try stdout.print("\n", .{});
        for(v, 0..)|_, x|{
          var c: i32 = 0;
          var yy: i32 = @as(i32, @intCast(y)) - 1;
          while (yy <= y + 1) : (yy += 1) {
            var xx: i32 = @as(i32, @intCast(x)) - 1;
            while (xx <= x + 1) : (xx += 1) {
              if ((yy < 0) or (yy >= H) or (xx < 0) or (xx >= W) or ((x == xx) and (y == yy))) continue;
              c += pf[@intCast(yy)][@intCast(xx)];
            }
          }
          f[y][x] = if (((c == 2) and (pf[y][x] == 1)) or (c == 3)) 1 else 0;
          const st = if (f[y][x] == 1) " o" else " .";
          try stdout.print("{s}", .{st});
        }
      }
      tempf = pf; pf = f; f = tempf;
    } else if (sUserInput[0] == 'q') {
      break;
    } else {
      var iter = std.mem.splitSequence(u8, sUserInput, " ");
      const sx = iter.next() orelse continue;
      const sy = iter.next() orelse continue;
      const x = std.fmt.parseInt(usize, sx, 10) catch continue;
      const y = std.fmt.parseInt(usize, sy, 10) catch continue;
      pf[y][x] = 1;
    }
  }
}
