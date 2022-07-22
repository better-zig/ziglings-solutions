//
// Now we get into the fun stuff, starting with the 'if' statement!
//
//     if (true) {
//         ...
//     } else {
//         ...
//     }
//
// Zig has the "usual" comparison operators such as:
//
//     a == b   means "a equals b"
//     a < b    means "a is less than b"
//     a > b    means "a is greater than b"
//     a != b   means "a does not equal b"
//
// The important thing about Zig's "if" is that it *only* accepts
// boolean values. It won't coerce numbers or other types of data
// to true and false.
//
const std = @import("std");

//
// TODO x: 控制流程 if/else
//
pub fn main() void {
    const foo = 1;

    // Please fix this condition:
    if (foo == 1) { // todo x: 表达式判断
        // We want our program to print this message!
        std.debug.print("Foo is 1!\n", .{});
    } else {
        std.debug.print("Foo is not 1!\n", .{});
    }
}
