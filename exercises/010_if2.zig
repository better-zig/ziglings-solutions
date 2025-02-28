//
// If statements are also valid expressions:
//
//     var foo: u8 = if (a) 2 else 3;
//
const std = @import("std");

//
// todo x: 条件表达式, 类似 Python 的三目表达式, 条件需要加()
//
pub fn main() void {
    var discount = true;

    // Please use an if...else expression to set "price".
    // If discount is true, the price should be $17, otherwise $20:
    var price: u8 = if (discount) 17 else 20;

    std.debug.print("With the discount, the price is ${}.\n", .{price});
}
