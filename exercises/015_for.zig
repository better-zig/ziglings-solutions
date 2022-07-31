//
// Behold the 'for' loop! For loops let you execute code for each
// element of an array:
//
//     for (items) |item| {
//
//         // Do something with item
//
//     }
//
const std = @import("std");

const x = 2233;
var y: f64 = 22.33;

//
// todo x: for 遍历写法
//
pub fn main() void {
    const story = [_]u8{ 'h', 'h', 's', 'n', 'h' };

    std.debug.print("x = {}, y = {}\n", .{ x, y }); // todo x: 测试 debug 插件, 断点调试, 捕获全局变量/常量
    std.debug.print("A Dramatic Story: ", .{});

    for (story) |scene| { // todo x: for 遍历写法, 类似闭包
        if (scene == 'h') std.debug.print(":-)  ", .{});
        if (scene == 's') std.debug.print(":-(  ", .{});
        if (scene == 'n') std.debug.print(":-|  ", .{});
    }

    std.debug.print("The End.\n", .{});
}
// Note that "for" loops also work on things called "slices"
// which we'll see later.
