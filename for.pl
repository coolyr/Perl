print "##########################For#############################\n";
#注意，数字 0, 字符串 '0' 、 "" , 空 list () , 和 undef 为 false ，其他值均为 true。 true 前面使用 ! 或 not则返回 false 。
# while 循环
# 当给定条件为 true 时，重复执行语句或语句组。循环主体执行之前会先测试条件。
$a = 10;
# 执行 while 循环
while( $a < 20 ){
   printf "a = $a\n";
   $a = $a + 1;
}
print "#########################################################\n";
# until 循环
# 重复执行语句或语句组，直到给定的条件为 true。 循环主体执行之前会先测试条件。
$a = 5;

# 执行 until 循环
until( $a > 10 ){
   printf "a = $a\n";
   $a = $a + 1;
}
print "#########################################################\n";
# for 循环
# 多次执行一个语句序列，简化管理循环变量的代码。
# 执行 for 循环
for( $a = 0; $a < 10; $a = $a + 1 ){
    print "a = $a\n";
}
print "#########################################################\n";
# foreach 循环
# foreach 循环用于迭代一个列表或集合变量的值。
@list = (2, 12, 36, 42, 51);

# 执行foreach 循环
foreach $a (@list)
{
    print "a = $a\n";
}
print "#########################################################\n";
# do...while 循环
# 除了它是在循环主体结尾测试条件外，其他与 while 语句类似。
$a = 10;

# 执行 do...while 循环
do{
   printf "a = $a\n";
   $a = $a + 1;
}while( $a < 15 );
print "#########################################################\n";
# 嵌套循环
# 您可以在 while、for 或 do..while 循环内使用一个或多个循环。
$a = 0;
$b = 0;

# 外部循环
while($a < 3){
   $b = 0;
   # 内部循环
   while( $b < 3 ){
      print "a = $a, b = $b\n";
      $b = $b + 1;
   }
   $a = $a + 1;
   print "a = $a\n\n";
}print "##########################Control###############################\n";
# next 语句
# 停止执行从next语句的下一语句开始到循环体结束标识符之间的语句，转去执行continue语句块，然后再返回到循环体的起始处开始执行下一次循环。
$a = 10;
while( $a < 20 ){
   if( $a == 15)
   {
       # 跳出迭代
       $a = $a + 1;
       next;
   }
   print "a = $a\n";
   $a = $a + 1;
}
print "#########################################################\n";
# last 语句
# 退出循环语句块，从而结束循环
$a = 10;
while( $a < 20 ){
   if( $a == 15)
   {
       # 退出循环
       $a = $a + 1;
       last;
   }
   print "a = $a\n";
   $a = $a + 1;
}

print "#########################################################\n";# continue 语句
# continue 语句块通常在条件语句再次判断前执行。@list = (1, 2, 3, 4, 5);
foreach $a (@list){
   print "a = $a\n";
}continue{
   last if $a == 4;
}
$a = 0;
while($a < 3){
   print "a = $a\n";
}continue{
   $a = $a + 1;
}
print "#########################################################\n";
# redo 语句
# redo 语句直接转到循环体的第一行开始重复执行本次循环，redo语句之后的语句不再执行，continue语句块也不再执行；
$a = 0;
while($a < 10){
   if( $a == 5 ){
      $a = $a + 1;
      redo;
   }
   print "a = $a\n";
}continue{
   $a = $a + 1;
}
print "#########################################################\n";
# goto 语句
# Perl 有三种 goto 形式：got LABLE，goto EXPR，和 goto &NAME。
	# 序号	goto 类型
	# 1	goto LABEL	找出标记为 LABEL 的语句并且从那里重新执行。
				
	# 2	goto EXPR	goto EXPR 形式只是 goto LABEL 的一般形式。它期待表达式生成一个标记名称，并跳到该标记处执行。
				
	# 3	goto &NAME	它把正 在运行着的子进程替换为一个已命名子进程的调用。
printf "goto LABEL\n";
$a = 10;
LOOP:do
{
    if( $a == 15){
       # 跳过迭代
       $a = $a + 1;
       # 使用 goto LABEL 形式
       goto LOOP;
    }
    print "a = $a\n";
    $a = $a + 1;
}while( $a < 20 );

printf "goto EXPR\n";$a = 10;
$str1 = "Lo";
$str2 = "oP";

LooP:do
{
    if( $a == 15){
       # 跳过迭代
       $a = $a + 1;
       # 使用 goto EXPR 形式
       goto $str1.$str2;    # 类似 goto LOOP
    }
    print "a = $a\n";
    $a = $a + 1;
}while( $a < 20 );

#无限循环
# 你可以按下 Ctrl + C 键来终止循环。
# 当条件表达式不存在时，它被假设为 true 。您也可以设置一个初始值和增量表达式，但是一般情况下，Perl 程序员偏向于使用 for(;;) 结构来表示一个无限循环。
for( ; ; )
{
   printf "循环会无限执行。\n";
}

				


