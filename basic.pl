#!/usr/bin/perl

=pdo 注释
这是一个多行注释
这是一个多行注释
这是一个多行注释
这是一个多行注释
=cut

# 输出 "Hello, World"
print "Hello, world\n";

$a = 10;
print "a = $a\n";
print 'a = $a\n';


$a = 10;
$var = <<"EOF";
这是一个 Here 文档实例，使用双引号。
可以在这输如字符串和变量。
例如：a = $a
EOF
print "$var\n";

$var = <<'EOF';
这是一个 Here 文档实例，使用单引号。
例如：a = $a
EOF
print "$var\n";


$result = "菜鸟教程 \"runoob\"";
print "$result\n";
print "\$result\n";
