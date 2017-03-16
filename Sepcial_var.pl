print "##########################Special Var#############################\n";
# Perl 特殊变量
# Perl 语言中定义了一些特殊的变量，通常以 $, @, 或 % 作为前缀，例如：$_。
# 很多特殊的变量有一个很长的英文名，操作系统变量 $! 可以写为 $OS_ERROR。
# 如果你想使用英文名的特殊变量需要在程序头部添加 use English;。这样就可以使用具有描述性的英文特殊变量。
# 最常用的特殊变量为 $_，该变量包含了默认输入和模式匹配内容。实例如下：
foreach ('Google','Runoob','Taobao') {
	print $_;
	print "\n";
}
print "#########################################################\n";
foreach ('Google','Runoob','Taobao') {
	print;#不使用 $_ 来输出内容：
	print "\n";
}
# 实例中，首先输出 "Google" ，接着输出 "Runoob" ，最后输出 "Taobao" 。
# 在迭代循环中，当前循环的字符串会放在 $_ 中, 然后 通过 print 输出。另外 print 在不指定输出变量，默认情况下使用的也是 $_。


	# 各种单目函数，包括像 ord() 和 int() 这样的函数以及除 "-t"以外所有的文件 测试操作 ("-f"，"-d")，"-t" 默认操作 STDIN。
	# 各种列表函数，例如 print() 和 unlink()。
	# 没有使用 "=~" 运算符时的模式匹配操作 "m//"、"s///" 和"tr///"。
	# 在没有给出其他变量时是 "foreach" 循环的默认迭代变量。
	# grep() 和 map() 函数的隐含迭代变量。
	# 当 "while" 仅有唯一条件，且该条件是对 ""操作的结果进行测试时，$_ 就是存放输入记录的默认位置。除了"while" 测试条件之外不会发生这种情况。(助记：下划线在特定操作中是可以省略的。)
print "#########################################################\n";
	# 根据特殊的变量的使用性质，可以分为以下几类：
	# 全局标量特殊变量。
	# 全局数组特殊变量。
	# 全局哈希特殊变量。
	# 全局特殊文件句柄。
	# 全局特殊常量。
	# 正则表达式特殊变量。
	# 文件句柄特殊变量。
	
	
	

# 以下列出了所有的标量特殊变量，包含了特殊字符与英文形式的变量：
# $_	默认输入和模式匹配内容。
# $ARG
# $.	前一次读的文件句柄的当前行号
# $NR
# $/	输入记录分隔符,默认是新行字符。如用undef这个变量,将读到文件结尾。
# $RS
# $,	输出域分隔符
# $OFS
# $\	输出记录分隔符
# $ORS
# $"	该变量同 $,类似，但应用于向双引号引起的字符串(或类似的内插字符串)中内插数组和切片值的场合。默认为一个空格。
# $LIST_SEPARATOR
# $;	在仿真多维数组时使用的分隔符。默认为 "\034"。
# $SUBSCRIPT_SEPARATOR
# $^L	发送到输出通道的走纸换页符。默认为 "\f".
# $FORMAT_FORMFEED
# $:	The current set of characters after which a string may be broken to fill continuation fields (starting with ^) in a format. Default is "\n"".
# $FORMAT_LINE_BREAK_CHARACTERS
# $^A	打印前用于保存格式化数据的变量
# $ACCUMULATOR
# $#	打印数字时默认的数字输出格式（已废弃）。
# $OFMT
# $?	返回上一个外部命令的状态
# $CHILD_ERROR
# $!	这个变量的数字值是errno的值,字符串值是对应的系统错误字符串
# $OS_ERROR or $ERRNO
# $@	命令eval的错误消息.如果为空,则表示上一次eval命令执行成功
# $EVAL_ERROR
# $$	运行当前Perl脚本程序的进程号
# $PROCESS_ID or $PID
# $<	当前进程的实际用户号
# $REAL_USER_ID or $UID
# $>	当前进程的有效用户号
# $EFFECTIVE_USER_ID or $EUID
# $(	当前进程的实际组用户号
# $REAL_GROUP_ID or $GID
# $)	当前进程的有效组用户号
# $EFFECTIVE_GROUP_ID or $EGID
# $0	包含正在执行的脚本的文件名
# $PROGRAM_NAME
# $[	数组的数组第一个元素的下标,默认是 0。
# $]	Perl的版本号
# $PERL_VERSION
# $^D	调试标志的值
# $DEBUGGING
# $^E	在非UNIX环境中的操作系统扩展错误信息
# $EXTENDED_OS_ERROR
# $^F	最大的文件捆述符数值
# $SYSTEM_FD_MAX
# $^H	由编译器激活的语法检查状态
# $^I	内置控制编辑器的值
# $INPLACE_EDIT
# $^M	备用内存池的大小
# $^O	操作系统名
# $OSNAME
# $^P	指定当前调试值的内部变量
# $PERLDB
# $^T	从新世纪开始算起,脚步本以秒计算的开始运行的时间
# $BASETIME
# $^W	警告开关的当前值
# $WARNING
# $^X	Perl二进制可执行代码的名字
# $EXECUTABLE_NAME
# $ARGV	从默认的文件句柄中读取时的当前文件名
# 全局数组特殊变量
# @ARGV	传给脚本的命令行参数列表
# @INC	在导入模块时需要搜索的目录列表
# @F	命令行的数组输入
# 全局哈希特殊变量
# %INC
# 散列表%INC包含所有用do或require语句包含的文件.关键字是文件名,值是这个文件的路径
# %ENV
# 包含当前环境变量
# %SIG
# 信号列表及其处理方式
# 全局特殊文件句柄
# ARGV
# 遍历数组变量@ARGV中的所有文件名的特殊文件句柄
# STDERR
# 标准错误输出句柄
# STDIN
# 标准输入句柄
# STDOUT
# 标准输出句柄
# DATA
# 特殊文件句柄引用了在文件中 __END__ 标志后的任何内容包含脚本内容。或者引用一个包含文件中__DATA__ 标志后的所有内容，只要你在同一个包有读取数据，__DATA__ 就存在。
# _ (下划线)
# 特殊的文件句柄用于缓存文件信息(fstat、stat和lstat)。
# 全局特殊常量
# __END__
# 脚本的逻辑结束，忽略后面的文本。
# __FILE__
# 当前文件名
# __LINE__
# 当前行号
# __PACKAGE__
# 当前包名，默认的包名是main。
# 正则表达式特殊变量
# $n
# 包含上次模式匹配的第n个子串
# $&
# 前一次成功模式匹配的字符串
# $MATCH
# $`
# 前次匹配成功的子串之前的内容
# $PREMATCH
# $'
# 前次匹配成功的子串之后的内容
# $POSTMATCH
# $+
# 与上个正则表达式搜索格式匹配的最后一个括号。例如：
# /Version: (.*)|Revision: (.*)/ && ($rev = $+);
# $LAST_PAREN_MATCH

# 文件句柄特殊变量
	# $|
	# 如果设置为零,在每次调用函数write或print后，自动调用函数fflush,将所写内容写回文件
	# $OUTPUT_AUTOFLUSH
	# $%
	# 当前输出页号
	# $FORMAT_PAGE_NUMBER
	# $=
	# 当前每页长度。默认为 60。
	# $FORMAT_LINES_PER_PAGE
	# $-
	# 当前页剩余的行数
	# $FORMAT_LINES_LEFT
	# $~
	# 当前报表输出格式的名称。默认值是文件句柄名。
	# $FORMAT_NAME
	# $^
	# 当前报表输出表头格式的名称。默认值是带后缀"_TOP"的文件句柄名。
	# $FORMAT_TOP_NAME
