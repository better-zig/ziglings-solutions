//
// Quiz time! Let's see if you can fix this whole program.
//
// You'll have to think about this one a bit.
//
// Let the compiler tell you what's wrong.
//
// Start at the top.
//
const std = @import("std");

// todo x: 字符串操作: 下标取元素, 赋值. undefined 未定义类型
pub fn main() void {
    // What is this nonsense? :-)
    const letters = "YZhifg"; // todo x: 提取 Z,i, g , = 1,3,5

    // Note: usize is an unsigned integer type used for...sizes.
    // The exact size of usize depends on the target CPU
    // architecture. We could have used a u8 here, but usize is
    // the idiomatic type to use for array indexing.
    //
    // There IS a problem on this line, but 'usize' isn't it.
    var x: usize = 1; // todo x: x 值下面被修改, 需改为变量

    // Note: When you want to declare memory (an array in this
    // case) without putting anything in it, you can set it to
    // 'undefined'. There is no problem on this line.
    var lang: [3]u8 = undefined;

    // The following lines attempt to put 'Z', 'i', and 'g' into the
    // 'lang' array we just created by indexing the array
    // 'letters' with the variable 'x'. As you can see above, x=1
    // to begin with.
    lang[0] = letters[x];

    x = 3; // todo x: 索引值变更, so, x 需是变量
    lang[1] = letters[x];

    x = 5;
    lang[2] = letters[x];

    // We want to "Program in Zig!" of course:
    std.debug.print("Program in {s}!\n", .{lang});
}
