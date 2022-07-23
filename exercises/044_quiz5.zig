//
//    "Elephants walking
//     Along the trails
//
//     Are holding hands
//     By holding tails."
//
//     from Holding Hands
//       by Lenore M. Link
//
const std = @import("std");

// todo x: 链表定义
const Elephant = struct {
    letter: u8,
    tail: *Elephant = undefined, // todo x: 链表定义, 尾节点
    visited: bool = false, // todo x: 节点已访问状态
};

// todo x: 链表定义 + 遍历
pub fn main() void {
    var elephantA = Elephant{ .letter = 'A' };

    // (Please add Elephant B here!)
    var elephantB = Elephant{ .letter = 'B' }; // TODO X: 链表节点
    var elephantC = Elephant{ .letter = 'C' };

    // Link the elephants so that each tail "points" to the next elephant.
    // They make a circle: A->B->C->A...
    elephantA.tail = &elephantB;
    // (Please link Elephant B's tail to Elephant C here!)
    elephantB.tail = &elephantC; // todo x: 链表节点串联
    elephantC.tail = &elephantA;

    visitElephants(&elephantA); // todo x: 链表遍历

    std.debug.print("\n", .{});
}

// This function visits all elephants once, starting with the
// first elephant and following the tails to the next elephant.
// If we did not "mark" the elephants as visited (by setting
// visited=true), then this would loop infinitely!
fn visitElephants(first_elephant: *Elephant) void {
    var e = first_elephant;

    while (!e.visited) {
        std.debug.print("Elephant {u}. ", .{e.letter});
        e.visited = true;
        e = e.tail;
    }
}
