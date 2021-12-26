// コマンドライン引数を取得するプログラム
// zig-0.9.0 2021/12
// cmd/src/main.zig
const std = @import("std");
const heap = std.heap;

pub fn main() anyerror!void {
    var arena = heap.ArenaAllocator.init(heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();
    const args = try std.process.argsAlloc(allocator);

    std.debug.print("number of args: {}\n", .{args.len});
    for (args) |arg, i| {
        std.debug.print("args[{}]: {s}\n", .{ i, arg });
    }
}
// コマンドライン引数を取得するプログラム
//
// 実行結果
// (cmd)$ ./zig-out/bin/cmd.exe 12 34 56
// number of args: 4
// args[0]: D:\cmd\zig-out\bin\cmd.exe
// args[1]: 12
// args[2]: 34
// args[3]: 56

