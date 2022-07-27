//
// It has probably not escaped your attention that we are no
// longer capturing a return value from foo() because the 'async'
// keyword returns the frame instead.
//
// One way to solve this is to use a global variable. // todo x: 使用全局变量
//
// See if you can make this program print "1 2 3 4 5".
//
const print = @import("std").debug.print;

var global_counter: i32 = 0; // todo x: 全局变量

pub fn main() void {
    var foo_frame = async foo(); // todo x: 异步方法

    while (global_counter <= 5) {
        print("{} ", .{global_counter});

        // todo x: 线程(协程)间 - 控制流切换
        resume foo_frame; // todo x: 恢复到挂起处
    }

    print("\n", .{});
}

fn foo() void {
    while (true) {
        global_counter += 1; // TODO x: 计数器
        suspend {} // todo x: 挂起+返回
    }
}
