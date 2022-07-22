//
// Here's a fun one: Zig has multi-line strings!
//
// To make a multi-line string, put '\\' at the beginning of each
// line just like a code comment but with backslashes instead:
//
//     const two_lines =
//         \\Line One
//         \\Line Two
//     ;
//
// See if you can make this program print some song lyrics.
//
const std = @import("std");

//
// todo x: 多行字符串格式: 使用 \\ 来拼接, 没有 Python 简洁
//
pub fn main() void {
    const lyrics =
        \\Ziggy played guitar
        \\Jamming good with Andrew Kelley
        \\And the Spiders from Mars
    ;

    std.debug.print("{s}\n", .{lyrics});
}
