print "##########################IF#############################\n";
# Perl 条件语句是通过一条或多条语句的执行结果（True或者False）来决定执行的代码块。
# 注意，数字 0, 字符串 '0' 、 "" , 空 list () , 和 undef 为 false ，其他值均为 true。 true 前面使用 ! 或 not则返回 false 。
# if 语句
# 一个 if 语句 由一个布尔表达式后跟一个或多个语句组成。

$a = 10;
# 使用 if 语句判断布尔表达式
if( $a < 20 )
{
    # 布尔表达式为true时执行
    print "a less than 20\n";
}
print "a = : $a\n";

$a = "";
# 使用 if 语句判断布尔表达式
if( $a )
{
    # i布尔表达式为true时执行
    print "a means : true\n";
}
print "a =  $a\n";
print "##########################################################\n";
# if...else 语句
# 一个 if 语句 后可跟一个可选的 else 语句，else 语句在布尔表达式为假时执行。
$a = 100;
# 使用 if 语句判断布尔表达式
if( $a < 20 ){
    # 布尔表达式为true时执行
    printf "a less than 20\n";
}else{ 
    # 布尔表达式为false时执行
    printf "a bigger than 20\n";
}
print "a = $a\n";
print "##########################################################\n";
# 一个 if 语句后可跟一个可选的 elsif 语句，然后再跟另一个 else 语句。
# 这种条件判断语句在多个条件的情况下非常有用。
# 在使用 if , elsif , else 语句时你需要注意以下几点。
	# if 语句后可以跟上 0 个 或 1 个 else 语句，但是 elsif 后面必须有 else 语句。
	# if 语句后可以跟上 0 个 或 1 个 elsif 语句，但它们必须写在 else 语句前。
	# 如果其中的一个 elsif 执行成功，其他的 elsif 和 else 将不再被执行。
$a = 100;
# 使用 == 判断两个数是否相等
if( $a  ==  20 )
{
    # 条件为 true 时执行
    printf "a = 20\n";
}
elsif( $a ==  30 )
{
    # 条件为 true 时执行
    printf "a = 30\n";
}
else
{
    # 以上所有的条件为 false 时执行
    printf "a = $a\n";
}	

print "##########################################################\n";
# unless 语句
# 一个 unless 语句 由一个布尔表达式后跟一个或多个语句组成。
$a = 20;
# 使用 unless 语句检测布尔表达式
unless( $a < 20 ){
    # 布尔表达式为 false 时执行
    printf "a >= 20\n";
}
print "a = $a\n";

print "##########################################################\n";# unless...else 语句。
# 一个 unless 语句 后可跟一个可选的 else 语句。
$a = 100;
# 使用 unless 语句检测布尔表达式
unless( $a == 20 )
{
    # 布尔表达式为 false 时执行
    printf "condition -> false\n";
}else{ 
    # 布尔表达式为 true 时执行
    printf "condition ->. true\n";
}
print "a = $a\n";
print "##########################################################\n";
# unless...elsif..else statement
# 一个 unless 语句 后可跟一个可选的 elsif 语句，然后再跟另一个 else 语句。
$a = 20;
# 使用 unless 语句检测布尔表达式
unless( $a  ==  30 ){
    # 布尔表达式为 false 时执行
    printf "a != 30\n";
}elsif( $a ==  30 ){
    # 布尔表达式为 true 时执行
    printf "a = 30\n";
}else{
    # 没有条件匹配时执行
    printf "a  = $a\n";
}

print "##########################################################\n";# switch 语句
# 在最新版本的 Perl 中，我们可以使用 switch 语句。它根据不同的值执行对应的代码块。
# 一个 switch 语句允许测试一个变量等于多个值时的情况。每个值称为一个 case，且被测试的变量会对每个 switch case 进行检查。
# switch case 执行是基于 Switch 模块， Switch 模块使用Filter::Util::Call 和 Text::Balanced 来执行，这两个模块都需要安装。
# 语法
# 语法格式如下所示：
# use Switch;

# switch(argument){
   # case 1            { print "数字 1" }
   # case "a"          { print "字符串 a" }
   # case [1..10,42]   { print "数字在列表中" }
   # case (\@array)    { print "数字在数组中" }
   # case /\w+/        { print "正则匹配模式" }
   # case qr/\w+/      { print "正则匹配模式" }
   # case (\%hash)     { print "哈希" }
   # case (\&sub)      { print "子进程" }
   # else              { print "不匹配之前的条件" }
# }
# 以下是 switch 语句的规则:
	# switch 语句的括号中可以使用【任意类型】的标量参数。
	# 在一个 switch 中可以有【任意数量】的 case 语句。每个 case 后跟一个要比较的值和一个冒号。
	# case 语句后的标量会与 switch 语句的标量进行比较，判断是否相等。
	# 当被测试的变量等于 case 中的常量时，case 后跟的语句将被执行，直到遇到 break 语句为止。
	# switch 语句可以有一个可选的 else ,该语句在最后面，该语句在所有 case 不匹配的情况下执行。
	# 【当匹配 case 后，会执行 case 语句块代码，执行后跳出 switch 语句。】
	# 【当匹配 case 后，如果我们需要继续执行接下来的 case 语句，则需要添加 next 语句。】
$var = <<"END";
use Switch;

$var = 10;
@array = (10, 20, 30);
%hash = ('key1' => 10, 'key2' => 20);

switch($var){
   case 10           { print "数字 10\n" }
   case "a"          { print "字符串 a" }
   case [1..10,42]   { print "数字在列表中" }
   case (\@array)    { print "数字在数组中" }
   case (\%hash)     { print "在哈希中" }
   else              { print "没有匹配的条件" }
}
use Switch;

$var = 10;
@array = (10, 20, 30);
%hash = ('key1' => 10, 'key2' => 20);

switch($var){
   case 10           { print "数字 10\n"; next; }  # 匹配后继续执行
   case "a"          { print "string a" }
   case [1..10,42]   { print "数字在列表中" }
   case (\@array)    { print "数字在数组中" }
   case (\%hash)     { print "在哈希中" }
   else              { print "没有匹配的条件" }
}
END












