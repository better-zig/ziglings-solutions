//
// The power and purpose of async/await becomes more apparent
// when we do multiple things concurrently. Foo and Bar do not  // todo x: 基于 async/await 并发编程
// depend on each other and can happen at the same time, but End
// requires that they both be finished.
//
//               +---------+
//               |  Start  |
//               +---------+
//                  /    \
//                 /      \
//        +---------+    +---------+
//        |   Foo   |    |   Bar   |
//        +---------+    +---------+
//                 \      /
//                  \    /
//               +---------+
//               |   End   |
//               +---------+
//
// We can express this in Zig like so:
//
//     fn foo() u32 { ... }
//     fn bar() u32 { ... }
//
//     // Start
//
//     var foo_frame = async foo(); // todo x: 异步, 线程切换
//     var bar_frame = async bar(); // todo x: 异步, 线程切换
//
//     var foo_value = await foo_frame; // todo x: 已经并发中, await 阻塞等待线程返回值
//     var bar_value = await bar_frame; // todo x: 已经并发中, await 阻塞等待线程返回值
//
//     // End
//
// Please await TWO page titles!
//
const print = @import("std").debug.print;

//
// todo x: 并发编程: 异步 IO(async + await + return = 基于 await 做线程间通信)
//
pub fn main() void {

    // todo x: 并发操作:
    var com_frame = async getPageTitle("http://example.com"); // todo x: 异步, 线程切换
    var org_frame = async getPageTitle("http://example.org"); // todo x: 异步, 线程切换

    var com_title = await com_frame; // todo x: 已经并发中, await 阻塞等待线程返回值
    var org_title = await org_frame; // todo x: 已经并发中, await 阻塞等待线程返回值

    print(".com: {s}, .org: {s}.\n", .{ com_title, org_title });
}

fn getPageTitle(url: []const u8) []const u8 {
    // Please PRETEND this is actually making a network request.
    _ = url;
    return "Example Title";
}
