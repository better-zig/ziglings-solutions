//
// One way to deal with error unions is to "catch" any error and
// replace it with a default value.
//
//     foo = canFail() catch 6; // todo x: 错误处理, 类似 panic 机制 + default value(赋默认值)
//
// If canFail() fails, foo will equal 6.
//
const std = @import("std");

const MyNumberError = error{TooSmall};

pub fn main() void {
    var a: u32 = addTwenty(44) catch 22;

    //
    // todo x: 风骚的特性, 通过 catch 赋默认值
    //
    var b: u32 = addTwenty(4) catch 22; // todo x: 执行效果: 当抛出错误, catch 赋默认值(22)

    std.debug.print("a={}, b={}\n", .{ a, b });
}

// Please provide the return type from this function.
// Hint: it'll be an error union.
fn addTwenty(n: u32) MyNumberError!u32 { // todo x: 类型 Union = 自定义错误类型 + 基本数据类型
    if (n < 5) {
        return MyNumberError.TooSmall;
    } else {
        return n + 20;
    }
}
