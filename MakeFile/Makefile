# makfile 的一大原则就是，任何以tab键开始的语句都会当作命令来处理
# 基于这一原则，因此判断语句就不能出现在目标的执行语句中

run: test
	@./test
	@-rm test

test: test.c
	@cc -o test test.c

kbd.o: kbd.h #自动推导, *.o 会自动关联*.c 文件, cc -c *.c会被推导出来

main: main.h #自动推导, 直接生成可以执行文件, 要求必须包含main函数, 否则推导失败

runmain: main
	@./main
	@-rm main

body: header1.h
body: header2.h

#以上两句等价于如下语句
body: header1.h header2.h
#建议使用第二种方式, 应为能够方便的查看依赖关系

.PHONY: clean #定义伪目标
clean:
	@echo "clean" # @ 不打印当前执行的命令内容
	@-rm a.exe # - 忽略错误, 继续执行, 但是任然会输出错误信息
	-rm body
# 还有一个全局办法，给make加上 -i或--ignore-errors参数，也会忽略所有的错误
# 如果一个规则是以.IGNORE作为目标，那该规则中的所有命令将会忽略错误
# -k 或者 --keep-going 如果规则中的命令出错了，就终止该规则的执行，继续执行其他规则

# 执行makefile的方法之一是使用 make -f fname, make --file fname 详见P15
# 引用其他的makefile， 语法是： include <filename>
# MAKEFILES 环境变量，P16

# make在展开变量时，使用的是拖延战术，如果变量出现在依赖关系的规则中，则当这条依赖
# 被决定要执行了，变量才会在内部展开

test1 test2: runmain #多个目标, make会以UNIX的标准shell来执行命令，即/bin/sh

# 在规则中使用通配符P18

objects = *.c #objects的值就是*.c， 而不会是展开的值，验证方法是make -n testobj
testobj:
	@echo $(objects)

# 文件搜寻P19
# VPATH = path
# vpath make的关键字，
# vpath %.h ../headers 表示在../headers目录中搜寻所有的.h结尾的文件，如果某文件
# 在当前路径下未找到


all: prog1 prog2 prog3
.PHONY: all #定义all为伪目标， 伪目标的特性是总是被执行，因此可以一口气生成多个目标
# 目标可以成为依赖，伪目标也可以成为依赖P21

# 多目标P22

# 静态模式, 静态模式的用法很灵活，是一个非常强大的功能P22
#语法： targets: target-pattern: prereq-pattern
#			command

# 自动生成依赖P24

# make -n 或者 make --just-print 只显示命令，不执行命令，可以用于调试makefile
# make -s 或者 make --slient 全面禁止命令的显示
# 如果需要让上一条命令的结果应用于下一条命令，则应该使用分号分割这两个语句
# 而不能换行书写第二条命令
subsytem:
	cd subdir && $(MAKE) # 执行subdir目录下的makefile，等价于$(MAKE) -C subdirP28
	cd subdir && $(MAKE) MAKEFLAGS= # 不想传递MAKEFLAGS的值到下一层makefile

# 嵌套执行的参数-w或者--print-directory会在make的过程中输出一些信息，可以看到目前的
# 工作目录，当使用-C 参数执行下一层makefile时，-w会被自动打开，如果有-s/--slient
# --no-print-directory时，-w总是是失效的

# 变量传递 P29

# 定义命令包 P30

# 变量使用时需要使用()/{}包围起来，变量可以使用后面的变量来定义
foo = ${bar}
bar = ${ugh}
ugh = Huh?

# foo1 = ${bar1}
# bar1 = ${foo1}
# 变量会陷入无限的展开过程中，make是有能力检测到这样的定义，并会报错
# 为避免上面的问题，可以使用 := 来定义变量
z := ${x} zz # 不会获取x的值
x := foo
y := ${x} bar
x := later

ifeq (${MAKELEVEL}, 0)
cur-dir := $(shell pwd) # 不能用tab前开头，否则可能会出现错误
varwithspace := /foo/bar # varwithspace will has a space
varspace := ${varwithspace}test
endif

foo ?= bar? # 等价于如下语句
ifeq ($(origin foo), undefined)
foo = bar?
endif

# 变量替换 P34
foo := a.o b.o c.o
bar := $(foo:.o=.c)

bar := $(foo:%.o=%.c) # 采用静态模式替换

# 将变量的值当作变量使用
x = y
y = z
a := ${${x}}

# 追加变量 +=
objects = main.o foo.o
objects += another.o #等价于 objects := ${objects} another.o

# override 指示符 P38
override varo := beforeoverride

# 多行变量
define two-lines
echo foo
echo foo2
endef

printvar:
	@echo ${foo}
	@echo ${y}
	@echo ${x}
	@echo ${z}
	@echo ${cur-dir}
	@echo ${varspace}
	@echo ${bar}
	@echo "a = "${a}
	@echo "objects = "${objects}
	@echo ${varo}
	$(tow-lines)

# 目标变量 p39
# 语法规则，<target ... >: <variable-assigment>
# 或者 <target ... >: override <variable-assigment

#prog: CFLAGS = -g
#	@echo $(CFLAGS) # 报错，无法执行

# 模式变量
# 语法如下：
# <patter ... > : <variable-assigment>
# <patter ... > : override <variable-assigment>

# 函数调用 P43
# 为了规则的统一，函数和变量的括号最好一样，函数中的参数可以使用变量，
# 参数间使用逗号分割，函数名和参数间使用空格分割。函数调用以$符号开头
# 例如：
comma := ,
empty :=
space := $(empty) $(empty)
foo := a b c
bar := $(subst $(space), $(comma), $(foo))
funtest:
	@echo $(bar)
	@echo a/$(space)/a

# origin 函数 P51， origin的返回值：P51

# Shell 函数 P53
# shell函数把执行操作系统命令后的输出作为函数返回，因此可以用操作系统命令以及
# 字符串处理命令awk，sed等等
# 该函数会新生成一个shell程序来执行命令，因此对性能有一定的影响。
# 例如:
content := $(shell cat foo)

# make 的运行 P54
# make 命令执行后有3个退出码
# 0： 成功执行， 1：make运行时出现任何错误，
# 2：使用了make -q选项，并且make使得一些目标不需要更新

