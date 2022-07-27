//
// So, 'suspend' returns control to the place from which it was
// called (the "call site"). How do we give control back to the
// suspended function? // todo x: suspend, 会提前暂停+返回控制权, 何时回到暂停处继续执行?
//
// For that, we have a new keyword called 'resume' which takes an
// async function invocation's frame and returns control to it.
//
//     fn fooThatSuspends() void {
//         suspend {} // todo x: suspend 暂停, 提前返回
//     }
//
//     var foo_frame = async fooThatSuspends();
//     resume foo_frame; // todo x: resume 恢复到 suspend 位置处, 继续向下执行
//
// See if you can make this program print "Hello async!".
//
const print = @import("std").debug.print;

//
// todo x: 异步 IO(async + suspend + resume)
//
pub fn main() void {
    var foo_frame = async foo(); // todo x: 异步关键字, 控制流切换

    resume foo_frame; // todo x: 恢复到 suspend 挂起处, 继续执行

}

fn foo() void {
    print("Hello ", .{});
    suspend {} // todo x: 挂起处, 提前返回
    print("async!\n", .{});
}
