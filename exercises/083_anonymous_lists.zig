//
// Anonymous struct literal syntax can also be used to compose an
// "anonymous list" with an array type destination:
//
//     const foo: [3]u32 = .{10, 20, 30}; // todo x: 匿名结构体
//
// Otherwise it's a "tuple":
//
//     const bar = .{10, 20, 30}; // todo x: 匿名元组
//
// The only difference is the destination type.
//
const print = @import("std").debug.print;

pub fn main() void {
    // Please make 'hello' a string-like array of u8 WITHOUT
    // changing the value literal.
    //
    // Don't change this part:
    //
    //     = .{'h', 'e', 'l', 'l', 'o'};
    //
    const hello: [5]u8 = .{ 'h', 'e', 'l', 'l', 'o' }; // TODO X : 匿名元组, 改变数据类型 => 定长数组
    print("I say {s}!\n", .{hello});
}
