#!/usr/bin/perl
$value = 9.01e+21 + 0.01 - 9.01e+21;
print ("First Value:", $value, "\n");
$value = 9.01e+21 - 9.01e+21 + 0.01;
print ("Second Value:", $value, "\n");



#标量变量$age = 25;             # 整型
$name = "runoob";      # 字符串
$salary = 1445.50;     # 浮点数


print "Age = $age\n";
print "Name = $name\n";
print "Salary = $salary\n";


print "##########################Array###########################\n";#数组变量
#数组是用于存储一个有序的标量值的变量。
#数组 @ 开始。
#要访问数组的变量，可以使用 $ + 变量名称 + [索引值] ，实例如下所示：
#数组索引值从 0 开始，即 0 为第一个元素，1 为第二个元素，以此类推。
#负数从反向开始读取，-1 为第一个元素， -2 为第二个元素

@ages = (25, 30, 40);             
@names = ("google", "runoob", "taobao");

print "\$ages[0] = $ages[0]\n";
print "\$ages[1] = $ages[1]\n";
print "\$ages[2] = $ages[2]\n";
print "\$names[0] = $names[0]\n";
print "\$names[1] = $names[1]\n";
print "\$names[2] = $names[2]\n";

@var_10 = (1..10);
@var_20 = (10..20);
@var_abc = (a..z);

print "@var_10\n";   # 输出 1 到 10
print "@var_20\n";   # 输出 10 到 20
print "@var_abc\n";  # 输出 a 到 z


print "#####################Hash#############################\n";
#哈希变量
#哈希是一个 key/value 对的集合。
#哈希 % 开始。
#如果要访问哈希值，可以使用 $ + {key} 格式来访问：
%data = ('google', 45, 'runoob', 30, 'taobao', 40);
print "\$data{'google'} = $data{'google'}\n";
print "\$data{'runoob'} = $data{'runoob'}\n";
print "\$data{'taobao'} = $data{'taobao'}\n";

@names = ('google', 'runoob', 'taobao');

@copy = @names;   # 复制数组
$size = @names;   # 数组赋值给标量，返回数组元素个数

print "name : @copy\n";
print "name sum : $size\n";

print  "###########################\n";
$str = "hello" . "world";       # 字符串连接
$num = 5 + 10;                  # 两数相加
$mul = 4 * 5;                   # 两数相乘
$mix = $str . $num;             # 连接字符串和数字

print "str = $str\n";
print "num = $num\n";
print "mix = $mix\n";

print "File Name: ". __FILE__ . "\n";
print "Line Nume: " . __LINE__ ."\n";
print "Package Name: " . __PACKAGE__ ."\n";

#v 字符串$smile  = v9786;
$foo    = v102.111.111;
$martin = v77.97.114.116.105.110; 

print "smile = $smile\n";
print "foo = $foo\n";
print "martin = $martin\n";
print "###########################Test#####################################\n";
$data = {'google'=>'google.com', 'runoob'=>'runoob.com', 'taobao'=>'taobao.com'}; 
print $data{'google'};
