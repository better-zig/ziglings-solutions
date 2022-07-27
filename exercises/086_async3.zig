//
// Because they can suspend and resume, async Zig functions are
// an example of a more general programming concept called
// "coroutines". One of the neat things about Zig async functions // todo x: coroutines 协程概念(类似 go 协程)
// is that they retain their state as they are suspended and
// resumed.
//
// See if you can make this program print "5 4 3 2 1". // todo x: 输出结果
//
const print = @import("std").debug.print;

//
// todo x: 异步 IO(async + suspend + resume)
//
pub fn main() void {
    const n = 5;
    var foo_frame = async foo(n); // todo x: 异步方法

    // 返回
    resume foo_frame; // todo x: resume 恢复次数 和 suspend 挂起次数相等.
    resume foo_frame;
    resume foo_frame;
    resume foo_frame;
    resume foo_frame;

    print("\n", .{});
}

fn foo(countdown: u32) void {
    var current = countdown;

    while (current > 0) {
        print("{} ", .{current});
        current -= 1;
        suspend {} // todo x: 挂起
    }
}
