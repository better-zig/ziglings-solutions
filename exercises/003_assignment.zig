//
// It seems we got a little carried away making everything "const u8"!
//
//     "const" values cannot change.
//     "u"     types are "unsigned" and cannot store negative values.
//     "8"     means the type is 8 bits in size.
//
// Example: foo cannot change (it is CONSTant)
//          bar can change (it is VARiable):
//
//     const foo: u8 = 20;
//     var bar: u8 = 20;
//
// Example: foo cannot be negative and can hold 0 to 255
//          bar CAN be negative and can hold −128 to 127
//
//     const foo: u8 = 20;
//     const bar: i8 = -20;
//
// Example: foo can hold 8 bits (0 to 255)
//          bar can hold 16 bits (0 to 65,535)
//
//     const foo: u8 = 20;
//     const bar: u16 = 2000;
//
// You can do just about any combination of these that you can think of:
//
//     u32 can hold 0 to 4,294,967,295
//     i64 can hold −9,223,372,036,854,775,808 to 9,223,372,036,854,775,807
//
// Please fix this program so that the types can hold the desired values
// and the errors go away!
//
const std = @import("std");

//
// TODO X: 考察: 基本数据类型(有符号/无符号), 变量/常量区别
//  - zig 基本数据类型: https://ziglang.org/documentation/master/#toc-Primitive-Types
//  - const 常量类型, 赋值后, 值不可更改.
//  - var 变量, 赋值后, 值可以变更.
//  - u8, u32, 无符号类型, 值 >0
//  - i8, i32, 有符号类型
//
pub fn main() void {
    var n: u8 = 50; //  todo x: const 是常量, 改成 var 变量
    n = n + 5;

    const pi: u32 = 314159; // todo x: 数据类型溢出

    const negative_eleven: i8 = -11; // TODO X: 无符号类型, 改成 有符号类型

    // There are no errors in the next line, just explanation:
    // Perhaps you noticed before that the print function takes two
    // parameters. Now it will make more sense: the first parameter
    // is a string. The string may contain placeholders '{}', and the
    // second parameter is an "anonymous list literal" (don't worry
    // about this for now!) with the values to be printed.
    std.debug.print("{} {} {}\n", .{ n, pi, negative_eleven });
}
