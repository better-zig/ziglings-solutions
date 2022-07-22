//
// Zig has a handy "try" shortcut for this common error handling pattern:
//
//     canFail() catch |err| return err;
//
// which can be more compactly written as:
//
//     try canFail(); // todo x: 使用 try 会捕捉 panic, 避免程序挂起. 类似其他语言的 try catch 机制
//
const std = @import("std");

const MyNumberError = error{
    TooSmall,
    TooBig,
};

pub fn main() void {
    var a: u32 = addFive(44) catch 0;
    var b: u32 = addFive(14) catch 0;
    var c: u32 = addFive(4) catch 0;

    std.debug.print("a={}, b={}, c={}\n", .{ a, b, c });
}

//
// todo x: try 语句, 实现 try ... catch 机制, 手动管理 panic, 很灵活.
//
fn addFive(n: u32) MyNumberError!u32 {
    // This function needs to return any error which might come back from detect().
    // Please use a "try" statement rather than a "catch".
    //
    var x = try detect(n); // todo x: try 特性

    return x + 5; // TODO x: 数值计算
}

fn detect(n: u32) MyNumberError!u32 {
    if (n < 10) return MyNumberError.TooSmall;
    if (n > 20) return MyNumberError.TooBig;
    return n;
}
