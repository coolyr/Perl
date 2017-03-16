print "##########################SubRoutine#############################\n";
# Perl 子程序(函数)
# Perl 子程序也就是用户定义的函数。
# Perl 子程序即执行一个特殊任务的一段分离的代码，它可以使减少重复代码且使程序易读。
# Perl 子程序可以出现在程序的任何地方，语法格式如下：
	# sub subroutine{
	   # statements;
	# }
# 调用子程序语法格式：
	# subroutine( 参数列表 );
# 在 Perl 5.0 以下版本调用子程序方法如下：
	# &subroutine( 参数列表 );
	# 函数定义
sub Hello{
   print "Hello, World!\n";
}

# 函数调用
Hello();

print "#########################################################\n";# 向子程序传递参数
# Perl 子程序可以和其他编程一样接受多个参数，子程序参数使用特殊【数组】 @_ 标明。
# 因此子程序第一个参数为 $_[0], 第二个参数为 $_[1], 以此类推。
# 不论参数是标量型还是数组型的，用户把参数传给子程序时，perl默认按引用的方式调用它们。
# 定义求平均值函数
sub Average
{
   # 获取所有传入的参数
   $n = scalar(@_);
   $sum = 0;

   foreach $item (@_)
   {
      $sum += $item;
   }
   $average = $sum / $n;
   print 'input paras: : ',"@_\n";              # 打印整个数组
   print "first paras: $_[0]\n";                # 打印第一个参数
   print "average paras : $average\n";          # 打印平均值
}
# 调用函数
Average(10, 20, 30);

print "#########################################################\n";# 向子程序传递列表
# 由于 @_ 变量是一个数组，所以它可以向子程序中传递列表。
# 但如果我们需要传入标量和数组参数时，需要把列表放在最后一个参数上，如下所示：
# 定义函数
sub PrintList
{
   # 私有变量
   my @list = @_;
   print "list: @list\n";
}
$a = 10;
@b = (1, 2, 3, 4);

# 列表参数
PrintList($a, @b);
# 我们可以向子程序传入多个数组和哈希，但是在传入多个数组和哈希时，会导致丢失独立的标识。
# 所以我们需要使用引用（下一章节会介绍）来传递。

print "#########################################################\n";
# 向子程序传递哈希
# 当向子程序传递哈希表时，它将复制到 @_ 中，哈希表将被展开为键/值组合的列表。
# 方法定义
sub PrintHash
{
   # 私有变量
   my (%hash) = @_;

   foreach my $key ( keys %hash ){
      my $value = $hash{$key};
      print "$key : $value\n";
   }
}
%hash = ('name' => 'runoob', 'age' => 3);

# 传递哈希
PrintHash(%hash);print "#########################################################\n";
# 子程序返回值
# 子程序可以向其他编程语言一样使用 return 语句来返回函数值。
# 如果没有使用 return 语句，则子程序的【最后一行语句】将作为返回值。
# 方法定义
sub add_a_b
{
   # 不使用 return
   $_[0]+$_[1];  

   # 使用 return
   # return $_[0]+$_[1];  
}
print add_a_b(1, 2) . "\n";print "#########################################################\n";
# 子程序的私有变量
# 默认情况下，Perl 中所有的变量都是全局变量，这就是说变量在程序的任何地方都可以调用。
   # ##如果我们需要设置私有变量，可以使用 my 操作符来设置。
   # ##my 操作符用于创建词法作用域变量，通过 my 创建的变量，存活于声明开始的地方，直到闭合作用域的结尾。
   # 闭合作用域指的可以是一对花括号中的区域，可以是一个文件，也可以是一个 if, while, for, foreach, eval字符串。
# 以下实例演示了如何声明一个或多个私有变量：
sub somefunc
{
   my $variable; # $variable 在方法 somefunc() 外不可见
   my ($another, @an_array, %a_hash); #  同时声明多个变量
}
# 全局变量
$string = "Hello, World!";

# 函数定义
sub PrintHello{
   # PrintHello 函数的私有变量
   my $string;
   $string = "Hello, Runoob!";
   print "In Function: $string\n";
}
# 调用函数
PrintHello();
print "Out Function: $string\n";

print "#########################################################\n";# 变量的临时赋值
# 我们可以使用 local 为全局变量提供临时的值，在退出作用域后将原来的值还回去。
# local 定义的变量不存在于主程序中，但存在于该子程序和该子程序调用的子程序中。定义时可以给其赋值，如：# 全局变量
$string = "Hello, World!";

sub PrintRunoob{
   # PrintHello 函数私有变量
   local $string;
   $string = "Hello, Runoob!";
   # 子程序调用的子程序
   PrintMe();
   print "PrintRunoob in: $string\n";
}
sub PrintMe{
   print "PrintMe in: $string\n";
}

sub PrintHello{
   print "PrintHello in: $string\n";
}

# 函数调用
PrintRunoob();
PrintHello();
print "out: $string\n";
print "#########################################################\n";
# 静态变量
# state操作符功能类似于C里面的static修饰符，state关键字将局部变量变得持久。
# state也是词法变量，所以只在定义该变量的词法作用域中有效，举个例子：
   # 注1：state仅能创建闭合作用域为子程序内部的变量。
   # 注2：state是从Perl 5.9.4开始引入的，所以使用前必须加上 use。
   # 注3：state可以声明标量、数组、哈希。但在声明数组和哈希时，不能对其初始化（至少Perl 5.14不支持）。# use feature 'state';

# sub PrintCount
# {
   # state $count = 0; # 初始化变量

   # print "counter = $count\n";
   # $count++;
# }

# for (1..5){
   # PrintCount();
# }

print "#########################################################\n";# 子程序调用上下文
# 子程序调用过程中，会根据上下文来返回不同类型的值，比如以下 localtime() 子程序，在标量上下文返回字符串，在列表上下文返回列表:

# 标量上下文
my $datestring = localtime( time );
print $datestring;
print "\n";
# 列表上下文
($sec,$min,$hour,$mday,$mon, $year,$wday,$yday,$isdst) = localtime(time);
printf("%d-%d-%d %d:%d:%d",$year+1990,$mon+1,$mday,$hour,$min,$sec);
print "\n";















