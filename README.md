# Ziglings Solutions

- [x] Ziglings 解题报告, 已完成.
- [x] 持续更新

## related:

- [x] [zig 中文教程](https://better-zig.github.io/)
- [x] [better-zig/learn-zig](https://github.com/better-zig/learn-zig): zig 学习练习代码

## 说明:

> Zig 当前版本:

- zig 社区项目, 基本都是基于 `zig dev` 版本(不维护稳定版本).
- so, 请使用 `dev 版本`, 更快追踪最新特性变更

```ruby
➤ zig version
0.10.0-dev.2617+47c4d4450

```

> 解题方式:

```ruby

# 方式1: 逐一按照顺序解题
zig build

# 方式2: 传入指定题目编号, 可以忽略其他题目
zig build 1
zig build 83
zig build 84

```

- 本 repo fork 原项目, 会持续同步更新.
- 解题报告在 `solutions` 分支.

> solutions 分支:

- 对每个语法练习题, 都补充了注释和错误点.
- 补充官方文档对各语法点的详细介绍(数据类型/基本操作等)

> [解题进度](./exercises/)

- [x] [ex001](./exercises/001_hello.zig) - [ex091](./exercises/091_async8.zig)
- 已完成

> 补充说明:

- [ex001](./exercises/) - [ex008](./exercises/) : 简单数据类型(数组, 字符串基本操作)
- [ex009](./exercises/) - [ex017](./exercises/017_quiz2.zig) : 控制逻辑语句(if/else, while, for 语法)
- [ex018](./exercises/) - [ex020](./exercises/) : 函数定义(参数/返回值)
- [ex021](./exercises/021_errors.zig) - [ex025](./exercises/025_errors5.zig) : 错误处理
  - ⭐⭐⭐⭐⭐
  - [ex022](./exercises/022_errors2.zig) : zig 的自定义错误+类型 union 并集写法, 非常风骚.
  - zig 的错误处理, catch 语义, 融合了 go panic 机制+ 赋默认值, 很特别的设计
  - try 语言, 实现了 常规语言的 try...catch 机制, 手动管理(忽略) panic.
- [ex027](./exercises/) - [ex027](./exercises/) : defer/errdefer 机制, 类似 go defer
  - ⭐⭐⭐
- [ex030](./exercises/) - [ex032](./exercises/) : switch + else, 类似 rust match
- [ex033]() : if/err 语义
- [ex34]() : try catch
- [ex35]() - [ex36]() : enum 枚举类型
- [ex37]() - [ex38]() : struct 结构体类型
- [ex39]() - [ex44]() : pointer 指针类型, 取地址操作(类似 C 语言), 指针参数, 传引用类型
  - ⭐⭐⭐⭐⭐
- [ex045]() - [ex046]() : optional 语义, 类似 `dart Null Safety 语义`.
  - ⭐⭐
- [ex047]() - [ex049]() : struct method 语义, 类似 `python class + self 语义`, 区分 类函数(静态) vs 类方法.
- [ex050]() - [ex051]() : value 类型: `undefined vs null vs errors vs void` 语义区别
  - ⭐⭐⭐
- [ex052]() - [ex053]() : 数组切片 + 指针
  - ⭐⭐
- [ex054]() : 数组指针, 指向一片元素. (难理解, 类 C 语言)
  - ⭐⭐⭐⭐⭐
- [ex055]() - [ex058]() : union 联合体类型(类 c 语言), 联合体+枚举 混合类型.
  - ⭐⭐
- [ex059]() - [ex060]() : 数值计算: 整型(2 进制, 8 进制, 16 进制) vs 浮点型
  - ⭐⭐
- [ex061]() : 定长数组指针
  - ⭐
- [ex062]() - [ex063]() : for + break label + else 语义
  - ⭐⭐⭐
- [ex064]() - [ex065]() : builtin functions 编译器内建函数, 实现类似 `go reflect 反射`等语义
  - ⭐⭐⭐⭐
- [ex066]() - [ex075]() : builtin functions 编译期阶段的高阶用法
  - ⭐⭐⭐⭐⭐
  - [ex066]() - [ex067]() : 变量定义, 加 `comptime` 前缀, 强制指定编译期检查. (类似 rust 生命周期标记, 改变变量生命周期)
  - [ex068]() - [ex069]() : 函数参数, 加 `comptime` 前缀, 强制指定编译期检查.
  - [ex070]() : 函数参数, 指定为 `anytype` 类型, 配合 `@TypeOf() + @hasDecl()`实现多态(鸭子类型). 类似 go + reflect 反射效果.(用法也类似)
  - [ex071]() : 内联优化, `inline for`, 类似 `C/C++` 内联概念.
  - [ex072]() : 内联优化, `inline while`.
  - [ex073]() : 任意表达式, 加 `comptime` 前缀, 强制指定编译期阶段检测(分配).
  - [ex074]() - [ex075]() : 默认省略 `comptime` 前缀的场景.
- [ex076]() - [ex078]() : 字符串类型, `sentinel` 尾哨兵机制. 兼容 `C 字符串` 语义, `@ptrCast()` 强制类型转换.
  - ⭐⭐⭐
- [ex079]() : 命名规则扩展, `@"x-y-z"` 作为命名字段. 比较无聊的`语法糖`.
- [ex080]() - [ex083](): 泛型数据结构 + 鸭子类型(多态/反射) - `匿名结构体 + @typeName(@TypeOf()) + @as() + @field()`,
  - ⭐⭐⭐
- [ex084](./exercises/084_async.zig) - [ex091](./exercises/091_async8.zig) : 异步并发编程, `suspend + resume + async + await + nosuspend + panic UB error`.
  - ⭐⭐⭐⭐⭐
  - [ex084]() - [ex086](): 异步编程, `suspend + resume + async`, 简单用法
  - [ex087]() : 异步编程, 使用`async + suspend + resume + global var` 全局变量, 实现协程间同步通信.
  - [ex088]() - [ex089](): 异步编程, 使用`async + await + return` 基于 await 实现协程同步.
  - [ex090]() : 异步编程, `nosuspend + suspend + panic UB(未定义)错误`
  - [ex091]() : 异步编程, `suspend + async + resume`, 完整理解每条语句的执行顺序.(控制流切换)

## 快速开始:

> 准备:

- [配置 zig 开发环境(vscode 设置)](https://github.com/hhstore/blog/issues/361)
- 安装 go-task

> 开始:

```ruby

# 拉取本 repo 代码:
git clone git@github.com:better-zig/ziglings-solutions.git

# 切换分支:
git checkout solutions



```

> 验证:

```ruby
# 切换本项目根目录
cd this-repo-root/

# 编译+运行, 交互式逐个修复有问题的测试题
zig build

# or:
task dev

```

# Ziglings

Welcome to Ziglings! This project contains a series of tiny broken programs.
By fixing them, you'll learn how to read and write
[Zig](https://ziglang.org/)
code.

![ziglings](https://user-images.githubusercontent.com/1458409/109398392-c1069500-790a-11eb-8ed4-7d7d74d32666.jpg)

Those tiny broken programs need your help! (You'll also save the planet from
evil aliens and help some friendly elephants stick together, which is very
sweet of you.)

This project was directly inspired by the brilliant and fun
[rustlings](https://github.com/rust-lang/rustlings)
project for the [Rust](https://www.rust-lang.org/) language.
Indirect inspiration comes from [Ruby Koans](http://rubykoans.com/)
and the Little LISPer/Little Schemer series of books.

## Intended Audience

This will probably be difficult if you've _never_ programmed before.
But no specific programming experience is required. And in particular,
you are _not_ expected to have any prior experience with "systems programming"
or a "systems" level language such as C.

Each exercise is self-contained and self-explained. However, you're encouraged
to also check out these Zig language resources for more detail:

- https://ziglearn.org/
- https://ziglang.org/documentation/master/

Also, the [Zig community](https://github.com/ziglang/zig/wiki/Community) is incredibly friendly and helpful!

## Getting Started

Install a [development build](https://ziglang.org/download/) of the Zig compiler.
(See the "master" section of the downloads page.)

Verify the installation and build number of `zig` like so:

```bash
$ zig version
0.10.0-dev.1427+xxxxxxxxx
```

Clone this repository with Git:

```bash
$ git clone https://github.com/ratfactor/ziglings
$ cd ziglings
```

Then run `zig build` and follow the instructions to begin!

```bash
$ zig build
```

## A Note About Versions

The Zig language is under very active development. In order to be current,
Ziglings tracks **development** builds of the Zig compiler rather than
versioned **release** builds. The last stable release was `0.9.1`, but Ziglings
needs a dev build with pre-release version "0.10.0" and a build number at least
as high as that shown in the example version check above.

It is likely that you'll download a build which is _greater_ than the minimum.

_(For those who cannot easily update Zig, there are also community-supported
branches in this repo. At the moment, there's one for v0.8.1. Older version
branches may or may not have all exercises and/or bugfixes.)_

Once you have a build of the Zig compiler that works with Ziglings, they'll
continue to work together. But keep in mind that if you update one, you may
need to also update the other.

Also note that the current "stage 1" Zig compiler is very strict
about input:
[no tab characters or Windows CR/LF newlines are allowed](https://github.com/ziglang/zig/issues/544).

### Version Changes

- _2022-03-19_ zig 0.10.0-dev.1427 - method for getting sentinel of type changed
- _2021-12-20_ zig 0.9.0-dev.2025 - `c_void` is now `anyopaque`
- _2021-06-14_ zig 0.9.0-dev.137 - std.build.Id `.Custom` is now `.custom`
- _2021-04-21_ zig 0.8.0-dev.1983 - std.fmt.format() `any` format string required
- _2021-02-12_ zig 0.8.0-dev.1065 - std.fmt.format() `s` (string) format string required

## Advanced Usage

It can be handy to check just a single exercise or _start_ from a single
exercise:

```bash
zig build 19
zig build 19_start
```

You can also run without checking for correctness:

```bash
zig build 19_test
```

Or skip the build system entirely and interact directly with the compiler
if you're into that sort of thing:

```bash
zig run exercises/001_hello.zig
```

Calling all wizards: To prepare an executable for debugging, install it
to zig-cache/bin with:

```bash
zig build 19_install
```

## What's Covered

I've decide to limit Ziglings to the core language and not
attempt coverage of the Standard Library. Perhaps you can change
my mind?

Core Language

- [x] Hello world (main needs to be public)
- [x] Importing standard library
- [x] Assignment
- [x] Arrays
- [x] Strings
- [x] If
- [x] While
- [x] For
- [x] Functions
- [x] Errors (error/try/catch/if-else-err)
- [x] Defer (and errdefer)
- [x] Switch
- [x] Unreachable
- [x] Enums
- [x] Structs
- [x] Pointers
- [x] Optionals
- [x] Struct methods
- [x] Slices
- [x] Many-item pointers
- [x] Unions
- [x] Numeric types (integers, floats)
- [x] Labelled blocks and loops
- [x] Loops as expressions
- [x] Builtins
- [x] Inline loops
- [x] Comptime
- [x] Sentinel termination
- [x] Quoted identifiers @""
- [x] Anonymous structs/tuples/lists
- [ ] Async <--- IN PROGRESS!

## Contributing

Contributions are very welcome! I'm writing this to teach myself and to create
the learning resource I wished for. There will be tons of room for improvement:

- Wording of explanations
- Idiomatic usage of Zig
- Maybe additional exercises?

Please see CONTRIBUTING.md in this repo for the full details.
