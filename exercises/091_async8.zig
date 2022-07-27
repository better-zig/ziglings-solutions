//
// You have doubtless noticed that 'suspend' requires a block
// expression like so:
//
//     suspend {} // todo x: suspend 块语句表达式
//
// The suspend block executes when a function suspends. To get
// sense for when this happens, please make the following
// program print the string
//
//     "ABCDEF"
//
const print = @import("std").debug.print;

//
// todo x: 异步 IO(suspend + async + resume), 此例子非常典型, 完全理解每条语句执行顺序
//
pub fn main() void {
    print("A", .{}); // [step 1]

    //
    // TODO X: 这个练习, 非常经典, 理解所有语句的执行顺序
    //
    var frame = async suspendable(); // todo x: 异步, 线程切换 [step 2]

    print("D", .{}); // [step5]

    resume frame; // todo x: 恢复

    print("F", .{});
}

fn suspendable() void {
    print("B", .{}); // [step3]

    suspend { // TODO X: 异步, 挂起
        print("C", .{}); // [step4]
    }

    print("E", .{}); // [step6]
}
