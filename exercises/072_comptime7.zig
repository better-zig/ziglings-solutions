//
// There is also an 'inline while'. Just like 'inline for', it  // todo x: 新关键字 'inline while', 类似 'inline for'
// loops at compile time, allowing you do all sorts of
// interesting things not possible at runtime. See if you can
// figure out what this rather bonkers example prints:
//
//     const foo = [3]*const [5]u8{ "~{s}~", "<{s}>", "d{s}b" };
//     comptime var i = 0; // todo x: 指定编译期分配
//
//     inline while ( i < foo.len ) : (i += 1) {  // TODO X: 内联优化写法
//         print(foo[i] ++ "\n", .{foo[i]});
//     }
//
// You haven't taken off that wizard hat yet, have you?
//
const print = @import("std").debug.print;

pub fn main() void {
    // Here is a string containing a series of arithmetic
    // operations and single-digit decimal values. Let's call
    // each operation and digit pair an "instruction".
    const instructions = "+3 *5 -2 *2";

    print("instructions={s}\n", .{instructions});

    // Here is a u32 variable that will keep track of our current
    // value in the program at runtime. It starts at 0, and we
    // will get the final value by performing the sequence of
    // instructions above.
    var value: u32 = 0;

    // This "index" variable will only be used at compile time in
    // our loop.
    comptime var i = 0; // todo x: 强制编译期分配

    // Here we wish to loop over each "instruction" in the string
    // at compile time.
    //
    // Please fix this to loop once per "instruction":
    inline while (i < instructions.len) : (i += 3) { // todo x: 内联优化, 迭代步长 = 3, 跳过空格等

        // This gets the digit from the "instruction". Can you
        // figure out why we subtract '0' from it?
        comptime var digit = instructions[i + 1] - '0'; // todo x: 注意 instructions[i + 1] 获取的是 字符 '3' 的编码值, 故需要减去 '0' 编码值, 才是真正的差值

        print("i = {}, inst={}, '0'= {}, [inst - '0' = digit] = {},\n", .{ i, instructions[i + 1], '0', digit });

        // This 'switch' statement contains the actual work done
        // at runtime. At first, this doesn't seem exciting...
        switch (instructions[i]) { // todo x: 数值计算
            '+' => value += digit,
            '-' => value -= digit,
            '*' => value *= digit,
            else => unreachable,
        }

        // ...But it's quite a bit more exciting than it first appears.
        // The 'inline while' no longer exists at runtime and neither // todo x: 特别注意! inline while 在运行时, 并不会存在!
        // does anything else not touched directly by runtime
        // code. The 'instructions' string, for example, does not
        // appear anywhere in the compiled program because it's
        // not used by it!
        //
        // So in a very real sense, this loop actually converts
        // the instructions contained in a string into runtime
        // code at compile time.
        // Guess we're compiler writers
        // now. See? The wizard hat was justified after all.
    }

    print("{}\n", .{value});
}
