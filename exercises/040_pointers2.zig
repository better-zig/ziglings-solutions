//
// It's important to note that variable pointers and constant pointers
// are different types.
//
// Given:
//
//     var foo: u8 = 5;
//     const bar: u8 = 5; // todo x: 指针类型差异
//
// Then:
//
//     &foo is of type "*u8" // todo x: 指针类型差异
//     &bar is of type "*const u8"
//
// You can always make a constant pointer to a variable, but you cannot
// make a variable pointer to a constant. This sounds like a logic puzzle,
// but it just means that once data is declared immutable, you can't
// coerce it to a mutable type. It's a safety thing (to prevent mistakes).
//
const std = @import("std");

pub fn main() void {
    var a: u8 = 12; // todo x:  指针类型差别, var vs const
    const b: *u8 = &a; // fix this! // todo x: 使用常量指针, 可以指向一个变量(非常量). 而不能反过来.(逻辑上不成立)

    std.debug.print("a: {}, b: {}\n", .{ a, b.* });
}
