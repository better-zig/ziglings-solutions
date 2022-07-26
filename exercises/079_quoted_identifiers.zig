//
// Sometimes you need to create an identifier that will not, for
// whatever reason, play by the naming rules:
//
//     const 55_cows: i32 = 55; // ILLEGAL: starts with a number
//     const isn't true: bool = false; // ILLEGAL: what even?!
//
// If you try to create either of these under normal
// circumstances, a special Program Identifier Syntax Security
// Team (PISST) will come to your house and take you away.
//
// Thankfully, Zig has a way to sneak these wacky identifiers
// past the authorities: the @"" identifier quoting syntax.
//
//     @"foo" // todo x: 特殊语法糖, 扩展变量命名规则
//
// Please help us safely smuggle these fugitive identifiers into
// our program:
//
const print = @import("std").debug.print;

pub fn main() void {
    const @"55_cows": i32 = 55; // todo x: 好无聊的语法糖, 支持这种不合法的变量命名, 添加 @ + "", 方式来命名变量
    const @"isn't true": bool = false;

    print("Sweet freedom: {}, {}.\n", .{
        @"55_cows",
        @"isn't true",
    });
}
