//
// Sure, we can solve our async value problem with a global
// variable. But this hardly seems like an ideal solution. // todo x: 不推荐使用全局共享变量来做 线程间通信
//
// So how do we REALLY get return values from async functions?
//
// The 'await' keyword waits for an async function to complete
// and then captures its return value.
//
//     fn foo() u32 {
//         return 5;
//     }
//
//    var foo_frame = async foo(); // invoke and get frame     // todo x: 只是线程切换(不获取返回值)
//    var value = await foo_frame; // await result using frame // todo x: 获取异步方法的返回值
//
// The above example is just a silly way to call foo() and get 5
// back. But if foo() did something more interesting such as wait // todo x: 如果是网络 IO, await 会阻塞等待
// for a network response to get that 5, our code would pause
// until the value was ready.
//
// As you can see, async/await basically splits a function call
// into two parts:
//
//    1. Invoke the function ('async')      // todo x: async = 线程切换(控制权切换)
//    2. Getting the return value ('await') // todo x: await = 阻塞获取异步 IO 返回值
//
// Also notice that a 'suspend' keyword does NOT need to exist in
// a function to be called in an async context.  // todo x: 在异步上下文中, suspend 可忽略.
//
// Please use 'await' to get the string returned by
// getPageTitle().
//
const print = @import("std").debug.print;

//
// todo x: 异步 IO(async + await + return = 基于 await 做线程间通信)
//
pub fn main() void {
    var myframe = async getPageTitle("http://example.com"); // todo x: 线程切换

    var value = await myframe; // todo x: 阻塞等待异步线程返回值

    print("{s}\n", .{value});
}

fn getPageTitle(url: []const u8) []const u8 {
    // Please PRETEND this is actually making a network request.
    _ = url; // todo x: 假装存在网络 IO(请求)
    return "Example Title.";
}
