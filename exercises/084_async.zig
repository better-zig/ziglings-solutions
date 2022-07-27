//
// Six Facts:
//
// 1. The memory space allocated to your program for the
// invocation of a function and all of its data is called a
// "stack frame". // todo x: 栈帧
//
// 2. The 'return' keyword "pops" the current function
// invocation's frame off of the stack (it is no longer needed)
// and returns control to the place where the function was
// called.
//
//     fn foo() void {
//         return; // Pop the frame and return control // todo x: 函数控制流, return, 栈顶出 + 交还控制权
//     }
//
// 3. Like 'return', the 'suspend' keyword returns control to the
// place where the function was called BUT the function
// invocation's frame remains so that it can regain control again
// at a later time. Functions which do this are "async"
// functions.
//
//     fn fooThatSuspends() void {
//         suspend {} // return control, but leave the frame alone // todo x: suspend 暂停, 交还控制权, 但保留栈帧
//     }
//
// 4. To call any function in async context and get a reference
// to its frame for later use, use the 'async' keyword:
//
//     var foo_frame = async fooThatSuspends(); // todo x: async 关键字, 异步上下文
//
// 5. If you call an async function without the 'async' keyword,
// the function FROM WHICH you called the async function itself
// becomes async! In this example, the bar() function is now
// async because it calls fooThatSuspends(), which is async.
//
//     fn bar() void {
//         fooThatSuspends(); // todo x: 未使用 async 关键字调用 异步方法, 会导致 调用者 "自身" 被异步化! (传染性)
//     }
//
// 6. The main() function cannot be async! // todo x: main() 函数, 不可异步化! (其他语言如 dart, 与此设计不同)
//
// Given facts 3 and 4, how do we fix this program (broken by facts
// 5 and 6)?
//
const print = @import("std").debug.print;

//
// todo x: 异步 IO(async + suspend + resume)
//
pub fn main() void {
    // Additional Hint: you can assign things to '_' when you
    // don't intend to do anything with them.
    _ = async foo(); // todo x: 使用 _ 忽略不关注的返回值, 补充异步关键字
}

fn foo() void {
    print("foo() A\n", .{});
    suspend {} // todo x: 异步关键字
    print("foo() B\n", .{});
}
