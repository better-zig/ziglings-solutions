//
// Now let's use pointers to do something we haven't been
// able to do before: pass a value by reference to a function!
//
const std = @import("std");

pub fn main() void {
    var num: u8 = 1;
    var more_nums = [_]u8{ 1, 1, 1, 1 };

    // Let's pass a reference to num to our function and print it:
    makeFive(&num); // todo x: 传入引用(地址) = c 语言, 取地址操作
    std.debug.print("num: {}, ", .{num});

    // Now something interesting. Let's pass a reference to a
    // specific array value:
    makeFive(&more_nums[2]); // todo x: 传入引用(地址) = c 语言, 取地址操作

    // And print the array:
    std.debug.print("more_nums: ", .{});
    for (more_nums) |n| {
        std.debug.print("{} ", .{n});
    }

    std.debug.print("\n", .{});
}

// This function should take a reference to a u8 value and set it
// to 5.
fn makeFive(x: *u8) void { // todo x: 指针变量, 作为函数入参
    x.* = 5; // fix me! // todo x: 指针解引用, 赋值修改
}
