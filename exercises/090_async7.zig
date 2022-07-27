//
// Remember how a function with 'suspend' is async and calling an // todo x: 存在 suspend, 显式异步
// async function without the 'async' keyword makes the CALLING
// function async?
//
//     fn fooThatMightSuspend(maybe: bool) void {
//         if (maybe) suspend {} // todo x: suspend 异步方法, 挂起, 提前返回
//     }
//
//     fn bar() void {
//         fooThatMightSuspend(true); // Now bar() is async! // todo x: 异步传染性!
//     }
//
// But if you KNOW the function won't suspend, you can make a
// promise to the compiler with the 'nosuspend' keyword:
//
//     fn bar() void {
//         nosuspend fooThatMightSuspend(false); // todo x: nosuspend 关键字, 让编译期忽略
//     }
//
// If the function does suspend and YOUR PROMISE TO THE COMPILER
// IS BROKEN, the program will panic at runtime, which is // todo x: 如果方法出现 suspend, 会在运行时 Panic
// probably better than you deserve, you oathbreaker! >:-(
//
const print = @import("std").debug.print;

pub fn main() void {

    // The main() function can not be async. But we know
    // getBeef() will not suspend with this particular
    // invocation. Please make this okay:
    var my_beef = nosuspend getBeef(0); // todo x: 显式忽略挂起信号
    print("beef? {X}!\n", .{my_beef});

    //
    // todo x: 下述代码, 会 Panic, 触发 UB(未定义行为)报错
    //
    // var my_beef2 = nosuspend getBeef(0xDEAD); // todo x: 显式忽略挂起信号
    // print("beef? {X}!\n", .{my_beef2});
}

fn getBeef(input: u32) u32 {
    if (input == 0xDEAD) {
        suspend {} // todo x: 线程挂起, 线程切换
    }

    return 0xBEEF;
}
//
// Going Deeper Into...
//                     ...uNdeFiNEd beHAVi0r!
//
// We haven't discussed it yet, but runtime "safety" features // todo x: 运行时安全机制
// require some extra instructions in your compiled program.
// Most of the time, you're going to want to keep these in.
//
// But in some programs, when data integrity is less important
// than raw speed (some games, for example), you can compile
// without these safety features.
//
// Instead of a safe panic when something goes wrong, your
// program will now exhibit Undefined Behavior (UB), which simply // todo x: 未定义行为
// means that the Zig language does not (cannot) define what will
// happen. The best case is that it will crash, but in the worst
// case, it will continue to run with the wrong results and
// corrupt your data or expose you to security risks.
//
// This program is a great way to explore UB. Once you get it
// working, try calling the getBeef() function with the value
// 0xDEAD so that it will invoke the 'suspend' keyword:
//
//     getBeef(0xDEAD)
//
// Now when you run the program, it will panic and give you a
// nice stack trace to help debug the problem.
//
//     zig run exercises/090_async7.zig
//     thread 328 panic: async function called...
//     ...
//
// But see what happens when you turn off safety checks by using
// ReleaseFast mode:
//
//     zig run -O ReleaseFast exercises/090_async7.zig // todo x: 编译期忽略安全检查
//     beef? 0!
//
// This is the wrong result. On your computer, you may get a
// different answer or it might crash! What exactly will happen
// is UNDEFINED. Your computer is now like a wild animal,
// reacting to bits and bytes of raw memory with the base
// instincts of the CPU. It is both terrifying and exhilarating.
//
