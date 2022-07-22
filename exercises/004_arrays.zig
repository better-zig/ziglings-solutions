//
// Let's learn some array basics. Arrays are declared with:
//
//   var foo: [3]u32 = [3]u32{ 42, 108, 5423 };
//
// When Zig can infer the size of the array, you can use '_' for the
// size. You can also let Zig infer the type of the value so the
// declaration is much less verbose.
//
//   var foo = [_]u32{ 42, 108, 5423 };
//
// Get values of an array using array[index] notation:
//
//     const bar = foo[2]; // 5423
//
// Set values of an array using array[index] notation:
//
//     foo[2] = 16;
//
// Get the length of an array using the len property:
//
//     const length = foo.len;
//
const std = @import("std");

//
// TODO x: 数组类型
//  - 数组: 声明方式
//  - 数组下标: 取元素
//  - 数组下标: 修改值
//  - 数组长度: 获取
//
pub fn main() void {
    // TODO X: (Problem 1) // 改成变量
    // This "const" is going to cause a problem later - can you see what it is?
    // How do we fix it?
    var some_primes = [_]u8{ 1, 3, 5, 7, 11, 13, 17, 19 }; // todo x: 改成 var, 后面会修改数组内元素

    // Individual values can be set with '[]' notation.
    // Example: This line changes the first prime to 2 (which is correct):
    some_primes[0] = 2;

    // Individual values can also be accessed with '[]' notation.
    // Example: This line stores the first prime in "first":
    const first = some_primes[0];

    // TODO X: (Problem 2) // 下标取元素
    // Looks like we need to complete this expression. Use the example
    // above to set "fourth" to the fourth element of the some_primes array:
    const fourth = some_primes[3];

    // TODO X: (Problem 3) // 获取数组长度
    // Use the len property to get the length of the array:
    const length = some_primes.len;

    std.debug.print("First: {}, Fourth: {}, Length: {}\n", .{
        first, fourth, length,
    });
}
