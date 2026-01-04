// zig-0.15.2: 2026/01 by dinau
//
const std = @import("std");

const Config = struct {
    id: u32,
    name: []const u8,
    active: bool,
    tags: []const []const u8,
};

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer _ = gpa.deinit();

    { // Write to File
        const my_config = Config{
            .id = 1,
            .name = "Zig User",
            .active = true,
            .tags = &.{ "zig", "programming", "json" },
        };

        const file = try std.fs.cwd().createFile("config.json", .{});
        defer file.close();

        // Use std.Io.Writer
        var buffer: [4096]u8 = undefined;
        var writer: std.io.Writer = .fixed(&buffer);

        var jw: std.json.Stringify = .{
            .writer = &writer,
            .options = .{ .whitespace = .indent_4 },
        };
        try jw.write(my_config);

        try file.writeAll(writer.buffered());

        std.debug.print("JSON saved to config.json\n", .{});
    }

    { // Parse from File
        const file = try std.fs.cwd().openFile("config.json", .{});
        defer file.close();

        const buffer = try file.readToEndAlloc(allocator, 1024 * 1024);
        defer allocator.free(buffer);

        const parsed = try std.json.parseFromSlice(
            Config,
            allocator,
            buffer,
            .{ .ignore_unknown_fields = true },
        );
        defer parsed.deinit();

        const config = parsed.value;
        std.debug.print("Loaded Name: {s}, Active: {}\n", .{ config.name, config.active });
    }
}
