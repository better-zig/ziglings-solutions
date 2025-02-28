//
// We were able to get a printable string out of a many-item
// pointer by using a slice to assert a specific length.
//
// But can we ever GO BACK to a sentinel-terminated pointer
// after we've "lost" the sentinel in a coercion?
//
// Yes, we can. Zig's @ptrCast() builtin can do this. Check out // todo x:  @ptrCast() 内建函数, 指针强制转换
// the signature:
//
//     @ptrCast(comptime DestType: type, value: anytype) DestType // todo x: @ptrCast() 内建函数用例
//
// See if you can use it to solve the same many-item pointer
// problem, but without needing a length!
//
const print = @import("std").debug.print;

pub fn main() void {
    // Again, we've coerced the sentinel-terminated string to a
    // many-item pointer, which has no length or sentinel.
    const data: [*]const u8 = "Weird Data!";

    // Please cast 'data' to 'printable':
    const printable: [*:0]const u8 = @ptrCast([*:0]const u8, data); // todo x: 强制类型转换, 与上个示例题, 对比写法差异

    print("{s}\n", .{printable});
}
