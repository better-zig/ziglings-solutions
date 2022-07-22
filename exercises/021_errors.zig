//
// Believe it or not, sometimes things go wrong in programs.
//
// In Zig, an error is a value. Errors are named so we can identify
// things that can go wrong. Errors are created in "error sets", which
// are just a collection of named errors.
//
// We have the start of an error set, but we're missing the condition
// "TooSmall". Please add it where needed!

// todo x: 自定义错误类型, 类似枚举类型
const MyNumberError = error{
    TooBig,
    TooSmall, // todo x: 添加自定义错误类型
    TooFour,
};

const std = @import("std");

pub fn main() void {
    const nums = [_]u8{ 2, 3, 4, 5, 6 };

    for (nums) |n| { // TODO x: 遍历元素
        std.debug.print("{}", .{n});

        const number_error = numberFail(n);

        if (number_error == MyNumberError.TooBig) {
            std.debug.print(">4. ", .{});
        }
        if (number_error == MyNumberError.TooSmall) { // todo x: 错误类型匹配
            std.debug.print("<4. ", .{});
        }
        if (number_error == MyNumberError.TooFour) {
            std.debug.print("=4. ", .{});
        }
    }

    std.debug.print("\n", .{});
}

// Notice how this function can return any member of the MyNumberError
// error set.
fn numberFail(n: u8) MyNumberError {

    // todo x: 错误类型判断
    if (n > 4) return MyNumberError.TooBig;
    if (n < 4) return MyNumberError.TooSmall; // <---- this one is free!
    return MyNumberError.TooFour;
}
