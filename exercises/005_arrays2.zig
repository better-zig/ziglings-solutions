//
// Zig has some fun array operators.
//
// You can use '++' to concatenate two arrays:
//
//   const a = [_]u8{ 1,2 };
//   const b = [_]u8{ 3,4 };
//   const c = a ++ b ++ [_]u8{ 5 }; // equals 1 2 3 4 5
//
// You can use '**' to repeat an array:
//
//   const d = [_]u8{ 1,2,3 } ** 2; // equals 1 2 3 1 2 3
//
// Note that both '++' and '**' only operate on arrays while your
// program is _being compiled_. This special time is known in Zig
// parlance as "comptime" and we'll learn plenty more about that
// later.
//
const std = @import("std");

//
// todo x: 数组操作: 合并/重复元素/遍历
//
pub fn main() void {
    const le = [_]u8{ 1, 3 };
    const et = [_]u8{ 3, 7 };

    // todo x: (Problem 1)
    // Please set this array concatenating the two arrays above.
    // It should result in: 1 3 3 7
    const leet = le ++ et; // todo x: 合并数组

    // todo x: (Problem 2)
    // Please set this array using repetition.
    // It should result in: 1 0 0 1 1 0 0 1 1 0 0 1
    const bit_pattern = [_]u8{ 1, 0, 0, 1 } ** 3; // todo x: 数组元素, 重复3次

    // Okay, that's all of the problems. Let's see the results.
    //
    // We could print these arrays with leet[0], leet[1],...but let's
    // have a little preview of Zig 'for' loops instead:
    //
    //    for (<item array>) |item| { <do something with item> }
    //
    // Don't worry, we'll cover looping properly in upcoming
    // lessons.
    //
    std.debug.print("LEET: ", .{});

    // TODO x: 遍历元素 // 类似闭包(迭代器)写法
    for (leet) |n| {
        std.debug.print("{}", .{n});
    }

    std.debug.print(", Bits: ", .{});

    for (bit_pattern) |n| {
        std.debug.print("{}", .{n});
    }

    std.debug.print("\n", .{});
}
