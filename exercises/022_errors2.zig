//
// A common case for errors is a situation where we're expecting to
// have a value OR something has gone wrong. Take this example:
//
//     var text: Text = getText("foo.txt");
//
// What happens if getText() can't find "foo.txt"?  How do we express
// this in Zig?
//
// Zig lets us make what's called an "error union" which is a value
// which could either be a regular value OR an error from a set:
//
//     var text: MyErrorSet!Text = getText("foo.txt");  // todo x, 很风骚的写法, 类型+自定义错误(类型 union, 并集)
//
// For now, let's just see if we can try making an error union!
//
const std = @import("std");

// todo x: 自定义错误类型
const MyNumberError = error{TooSmall};

pub fn main() void {
    var my_number: MyNumberError!u8 = 5; // todo x: 很风骚的写法! 自定义错误+基本类型(类型 union, 并集)

    // Looks like my_number will need to either store a number OR
    // an error. Can you set the type correctly above?
    my_number = MyNumberError.TooSmall; // todo x: 自定义错误类型值

    std.debug.print("I compiled!\n", .{});
}
