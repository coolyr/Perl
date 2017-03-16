print "##########################Array###########################\n";
#数组变量
#数组是用于存储一个有序的标量值的变量。
#数组 @ 开始。
#要访问数组的变量，可以使用 : 【 $ + 变量名称 + [索引值] 】
#实例如下所示：
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
print "\$names[-1] = $names[-1]\n";

print	"############################################\n";

@var_10 = (1..10);
@var_20 = (10..20);
@var_abc = (a..z);

print "@var_10\n";   # 输出 1 到 10
print "@var_20\n";   # 输出 10 到 20
print "@var_abc\n";  # 输出 a 到 z

print	"############################################\n";

#数组长度返回的是数组物理大小，而不是元素的个数
@array = (1,2,3);
$array[50] = 4;

$size = @array;
$max_index = $#array;

print "Array size:  $size\n";
print "Max index: $max_index\n";

print	"############################################\n";

#添加和删除数组元素
# Perl 提供了一些有用的函数来添加和删除数组元素。
# 1	push @ARRAY, LIST
# 将列表的值放到数组的末尾

# 2	pop @ARRAY
# 弹出数组最后一个值，并返回它

# 3	shift @ARRAY
# 弹出数组第一个值，并返回它。数组的索引值也依次减一。

# 4	unshift @ARRAY, LIST
# 将列表放在数组前面，并返回新数组的元素个数。

# 创建一个简单是数组
@sites = ("google","runoob","taobao");
print "1. \@sites  = @sites\n";

# 在数组结尾添加一个元素
push(@sites, "baidu");
print "2. \@sites  = @sites\n";

# 在数组开头添加一个元素
unshift(@sites, "weibo");
print "3. \@sites  = @sites\n";

# 删除数组末尾的元素
pop(@sites);
print "4. \@sites  = @sites\n";

# 移除数组开头的元素
shift(@sites);
print "5. \@sites  = @sites\n";

print	"############################################\n";

# 切割数组
# 我们可以切割一个数组，并返回切割后的新数组：
@sites = qw/google taobao runoob weibo qq facebook 网易/;

@sites2 = @sites[3..5];

print "@sites2\n";

print	"############################################\n";

# 替换数组元素
# Perl 中数组元素替换使用 splice() 函数，语法格式如下：
# splice @ARRAY, OFFSET [ , LENGTH [ , LIST ] ]
# 参数说明：
# @ARRAY：要替换的数组。
# OFFSET：起始位置。
# LENGTH：替换的元素个数。
# LIST：替换元素列表。

@nums = (1..20);
print "before replace - @nums\n";

splice(@nums, 5, 5, 21..25); 
print " after replace - @nums\n";

print	"############################################\n";

# 将字符串转换为数组
# Perl 中将字符串转换为数组使用 split() 函数，语法格式如下：
# split [ PATTERN [ , EXPR [ , LIMIT ] ] ]
# 参数说明：
# PATTERN：分隔符，默认为空格。
# EXPR：指定字符串数。
# LIMIT：如果指定该参数，则返回该数组的元素个数。
# 定义字符串
$var_test = "runoob";
$var_string = "www-runoob-com";
$var_names = "google,taobao,runoob,weibo";

# 字符串转为数组
@test = split('', $var_test);
@string = split('-', $var_string);
@names  = split(',', $var_names);

print "$test[3]\n";  # 输出 o [默认按照字符切割]
print "$string[2]\n";  # 输出 com
print "$names[3]\n";   # 输出 weibo

print	"############################################\n";
# 将数组转换为字符串
# Perl 中将数组转换为字符串使用 join() 函数，语法格式如下：
# join EXPR, LIST
# 参数说明：
# EXPR：连接符。
# LIST：列表或数组。
# 定义字符串
$var_string = "www-runoob-com";
$var_names = "google,taobao,runoob,weibo";

# 字符串转为数组
@string = split('-', $var_string);
@names  = split(',', $var_names);


# 数组转为字符串
$string1 = join( '-', @string );
$string2 = join( ',', @names );

print "$string1\n";
print "$string2\n";

print	"############################################\n";

# 数组排序
# Perl 中数组排序使用 sort() 函数，语法格式如下：
# sort [ SUBROUTINE ] LIST
# 参数说明：
# SUBROUTINE：指定规则。
# LIMIT：列表或数组。
# 定义数组
@sites = qw(google taobao runoob facebook);
print "sort before: @sites\n";

# 对数组进行排序
@sites = sort(@sites);
print "sort after: @sites\n";
#注意：数组排序是根据 ASCII 数字值来排序。所以我们在对数组进行排序时最好先将每个元素转换为小写后再排序。
print	"############################################\n";
# 特殊变量： $[
# 特殊变量 $[ 表示数组的第一索引值，一般都为 0 ，如果我们将 $[ 设置为 1，则数组的第一个索引值即为 1，第二个为 2，以此类推.
# 定义数组
@sites = qw(google taobao runoob facebook);
print "网站: @sites\n";

# 设置数组的第一个索引为 1
$[ = 1;

print "\@sites[1]: $sites[1]\n";
print "\@sites[2]: $sites[2]\n";
print	"############################################\n";
# 合并数组
# 数组的元素是以逗号来分割，我们也可以使用逗号来合并数组，如下所示：
@numbers = (1,3,(4,5,6));
print "numbers = @numbers\n";
@odd = (1,3,5);
@even = (2, 4, 6);
@numbers = (@odd, @even);
print "numbers = @numbers\n";
print	"############################################\n";




