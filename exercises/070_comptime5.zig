//
// Being able to pass types to functions at compile time lets us
// generate code that works with multiple types. But it doesn't  // todo x: 函数参数, 强制在编译期阶段, 传入参数类型, 可以实现多态(泛型/鸭子类型)效果
// help us pass VALUES of different types to a function.
//
// For that, we have the 'anytype' placeholder, which tells Zig
// to infer the actual type of a parameter at compile time.
//
//     fn foo(thing: anytype) void { ... } // todo x: anytype 关键字, 编译期推断类型
//
// Then we can use builtins such as @TypeOf(), @typeInfo(),
// @typeName(), @hasDecl(), and @hasField() to determine more
// about the type that has been passed in. All of this logic will
// be performed entirely at compile time.
//
const print = @import("std").debug.print;

// Let's define three structs: Duck, RubberDuck, and Duct. Notice
// that Duck and RubberDuck both contain waddle() and quack()    // todo x: 鸭子类型(动态语言, 如 Python): 摇摆+嘎嘎叫
// methods declared in their namespace (also known as "decls").

// todo x: 鸭子:
const Duck = struct {
    eggs: u8,
    loudness: u8,
    location_x: i32 = 0,
    location_y: i32 = 0,

    // todo x: 摇摆
    fn waddle(self: Duck, x: i16, y: i16) void {
        self.location_x += x;
        self.location_y += y;
    }

    // todo x: 嘎嘎叫
    fn quack(self: Duck) void {
        if (self.loudness < 4) {
            print("\"Quack.\" ", .{});
        } else {
            print("\"QUACK!\" ", .{});
        }
    }
};

// todo x: 橡皮鸭
const RubberDuck = struct {
    in_bath: bool = false,
    location_x: i32 = 0,
    location_y: i32 = 0,

    // todo x: 摇摆
    fn waddle(self: RubberDuck, x: i16, y: i16) void {
        self.location_x += x;
        self.location_y += y;
    }

    // todo x: 嘎嘎叫
    fn quack(self: RubberDuck) void {
        // Assigning an expression to '_' allows us to safely
        // "use" the value while also ignoring it.
        _ = self;
        print("\"Squeek!\" ", .{});
    }

    fn listen(self: RubberDuck, dev_talk: []const u8) void {
        // Listen to developer talk about programming problem.
        // Silently contemplate problem. Emit helpful sound.
        _ = dev_talk;
        self.quack();
    }
};

// todo x: 管道
const Duct = struct {
    diameter: u32,
    length: u32,
    galvanized: bool,
    connection: ?*Duct = null,

    // todo x: 联通
    fn connect(self: Duct, other: *Duct) !void {
        if (self.diameter == other.diameter) {
            self.connection = other;
        } else {
            return DuctError.UnmatchedDiameters;
        }
    }
};

const DuctError = error{UnmatchedDiameters};

pub fn main() void {
    // This is a real duck!
    const ducky1 = Duck{
        .eggs = 0,
        .loudness = 3,
    };

    // This is not a real duck, but it has quack() and waddle()
    // abilities, so it's still a "duck".
    const ducky2 = RubberDuck{
        .in_bath = false,
    };

    // This is not even remotely a duck.
    const ducky3 = Duct{
        .diameter = 17,
        .length = 165,
        .galvanized = true,
    };

    print("ducky1: {}, ", .{isADuck(ducky1)});
    print("ducky2: {}, ", .{isADuck(ducky2)});
    print("ducky3: {}\n", .{isADuck(ducky3)});
}

// This function has a single parameter which is inferred at
// compile time. It uses builtins @TypeOf() and @hasDecl() to
// perform duck typing ("if it walks like a duck and it quacks
// like a duck, then it must be a duck") to determine if the type
// is a "duck".
fn isADuck(possible_duck: anytype) bool { // todo x: 注意新关键字, 实现泛型(多态)效果
    // We'll use @hasDecl() to determine if the type has
    // everything needed to be a "duck".
    //
    // In this example, 'has_increment' will be true if type Foo
    // has an increment() method:
    //
    //     const has_increment = @hasDecl(Foo, "increment"); // todo x: @hasDecl 声明过某个方法, 返回值 bool 类型 // 一个断言
    //
    // Please make sure MyType has both waddle() and quack()
    // methods:
    const MyType = @TypeOf(possible_duck); // todo x: 获取类型, 类似 go reflect 反射写法
    const walks_like_duck = @hasDecl(MyType, "waddle"); // todo x: 类似动态语言的鸭子类型(泛型)
    const quacks_like_duck = @hasDecl(MyType, "quack"); // todo x: 使用方式, 类似 go reflect 反射的写法

    const is_duck = walks_like_duck and quacks_like_duck;

    if (is_duck) {
        // We also call the quack() method here to prove that Zig
        // allows us to perform duck actions on anything
        // sufficiently duck-like.
        //
        // Because all of the checking and inference is performed
        // at compile time, we still have complete type safety:
        // attempting to call the quack() method on a struct that
        // doesn't have it (like Duct) would result in a compile
        // error, not a runtime panic or crash!
        possible_duck.quack();
    }

    return is_duck;
}
