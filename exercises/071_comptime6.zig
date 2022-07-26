//
// There have been several instances where it would have been
// nice to use loops in our programs, but we couldn't because the
// things we were trying to do could only be done at compile
// time. We ended up having to do those things MANUALLY, like
// NORMAL people. Bah! We are PROGRAMMERS! The computer should be
// doing this work.
//
// An 'inline for' is performed at compile time, allowing you to // todo x: 新增关键字 'inline for', 内联, 类似 C/C++ 内联概念
// programatically loop through a series of items in situations
// like those mentioned above where a regular runtime 'for' loop
// wouldn't be allowed:
//
//     inline for (.{ u8, u16, u32, u64 }) |T| {    // TODO X: 内联优化(编译期优化), 这种有点类似 rust 生命周期标注的做法. 本质也是一种标注(辅助)
//         print("{} ", .{@typeInfo(T).Int.bits}); // todo x: 使用编译器内建方法
//     }
//
// In the above example, we're looping over a list of types,
// which are available only at compile time.
//
const print = @import("std").debug.print;

// Remember Narcissus from exercise 065 where we used builtins
// for reflection? He's back and loving it. // todo x: 反射效果
const Narcissus = struct {
    me: *Narcissus = undefined,
    myself: *Narcissus = undefined,
    echo: void = undefined, // TODO X: 空类型, 以示与其他2个字段区别
};

pub fn main() void {
    print("Narcissus has room in his heart for:", .{});

    // Last time we examined the Narcissus struct, we had to
    // manually access each of the three fields. Our 'if'
    // statement was repeated three times almost verbatim. Yuck!
    //
    // Please use an 'inline for' to implement the block below
    // for each field in the slice 'fields'!

    const fields = @typeInfo(Narcissus).Struct.fields; // todo x: 类似 go reflect 反射机制, 取出结构体的字段类型列表

    // todo x: 内联优化
    inline for (fields) |field| { // todo x: 遍历结构体的内部字段
        if (field.field_type != void) { // todo x: 检查字段类型
            print(" {s}", .{field.name});
        }
    }

    // Once you've got that, go back and take a look at exercise
    // 065 and compare what you've written to the abomination we
    // had there!

    print(".\n", .{});
}
