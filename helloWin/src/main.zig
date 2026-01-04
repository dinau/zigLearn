// zig-0.9.0 2021/12
// src/helloWin.zig
const win = @import("std").os.windows;
const std = @import("std");

extern "user32" fn MessageBoxA(hWnd: ?win.HANDLE, lpText: ?win.LPCSTR, lpCaption: ?win.LPCSTR, uType: win.UINT) callconv(.winapi) c_int;

pub export fn wWinMain(hInstance: win.HINSTANCE, hPrevInstance: ?win.HINSTANCE, lpCmdLine: win.PWSTR, nCmdShow: win.INT) win.INT {
    _ = hInstance;
    _ = hPrevInstance;
    _ = lpCmdLine;
    _ = nCmdShow;
    _ = MessageBoxA(null, "Hello", "Title string", 0);
    return 0;
}
