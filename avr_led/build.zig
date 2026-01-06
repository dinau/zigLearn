const std = @import("std");

pub fn build(b: *std.Build) !void {
    const main_file_name = "main";

    const atmega328p = std.Target.Query{
        .cpu_arch = .avr,
        .cpu_model = .{ .explicit = &std.Target.avr.cpu.atmega328p },
        .os_tag = .freestanding,
        .abi = .none,
    };

    const target = b.resolveTargetQuery(atmega328p);
    const optimize = .ReleaseSmall;

    const source_file = b.fmt("src/{s}.zig", .{main_file_name});

    // 1. Compile Zig source to object file
    const obj = b.addObject(.{
        .name = main_file_name,
        .root_module = b.createModule(.{
            .root_source_file = b.path(source_file),
            .target = target,
            .optimize = optimize,
        }),
    });

    // Get the object file path
    const obj_file = obj.getEmittedBin();

    const elf_file = b.fmt("{s}.elf", .{main_file_name});
    const hex_file = b.fmt("{s}.hex", .{main_file_name});
    const lst_file_name = b.fmt("{s}.lst", .{main_file_name});

    // 2. Link with avr-gcc to create ELF
    const avr_gcc = b.addSystemCommand(&.{
        "avr-gcc",
        "-mmcu=atmega328p",
        "-Os",
        "-o",
        elf_file,
    });
    avr_gcc.addFileArg(obj_file);

    // 3. Generate HEX file from ELF
    const avr_objcopy = b.addSystemCommand(&.{
        "avr-objcopy",
        "-O",
        "ihex",
        "-R",
        ".eeprom",
        elf_file,
        hex_file,
    });
    avr_objcopy.step.dependOn(&avr_gcc.step);

    // 4. Generate disassembly listing
    const avr_objdump = b.addSystemCommand(&.{
        "avr-objdump",
        "-hdSC",
        elf_file,
    });
    const lst_file = avr_objdump.captureStdOut();
    avr_objdump.step.dependOn(&avr_gcc.step);

    // Install the listing file
    const install_lst = b.addInstallFile(lst_file, lst_file_name);
    install_lst.step.dependOn(&avr_objdump.step);

    // 5. Display size information
    const avr_size = b.addSystemCommand(&.{
        "avr-size",
        elf_file,
    });
    avr_size.step.dependOn(&avr_gcc.step);

    // Add all steps to default build
    b.default_step.dependOn(&avr_objcopy.step);
    b.default_step.dependOn(&install_lst.step);
    b.default_step.dependOn(&avr_size.step);
}
