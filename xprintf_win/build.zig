const std = @import("std");
pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe_name = "xprintf_win";
    const mod_name = "xprintf";

    // ----------------------
    // "xprintf" module
    // ----------------------
    const step = b.addTranslateC(.{
        .root_source_file = b.path("src/xprintf_int/xprintf.h"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });
    const xprintf_mod = step.addModule(mod_name);
    xprintf_mod.addCSourceFiles(.{
        .files = &.{"src/xprintf_int/xprintf.c"},
        .flags = &.{},
    });
    xprintf_mod.addIncludePath(b.path("src/xprintf_int"));

    // ------------
    // Main module
    // ------------
    const main_mod = b.createModule(.{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });
    const exe = b.addExecutable(.{
        .name = exe_name,
        .root_module = main_mod,
    });
    exe.root_module.link_libc = true;
    exe.root_module.addImport(mod_name, xprintf_mod);

    const win32mod = b.addModule("win32api", .{ .root_source_file = b.path("../zigwin32/win32.zig") });
    exe.root_module.addImport("win32api", win32mod);

    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }
    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}
