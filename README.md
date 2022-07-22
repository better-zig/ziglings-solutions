# Ziglings Solutions

- Ziglings 解题报告
- 持续更新

> 当前版本:

- zig 社区项目, 基本都是基于 zig dev 版本(不维护稳定版本).
- so, 请使用 dev 版本, 更快追踪最新特性变更

```ruby
➤ zig version
0.10.0-dev.2617+47c4d4450

```

## 说明:

- 本 repo fork 原项目, 会持续同步更新.
- 解题报告在 `solutions` 分支.

> solutions 分支:

- 对每个语法练习题, 都补充了注释和错误点.
- 补充官方文档对各语法点的详细介绍(数据类型/基本操作等)

> [解题进度](./exercises/)

- [x] [ex001](./exercises/001_hello.zig) - [ex003](./exercises/)
- [ ] [ex004](./exercises/) - [ex091](./exercises/091_async8.zig)

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
