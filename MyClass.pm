# 下面是简单的类实现
package MyClass;

sub new
{
   print "MyClass::new called\n";
   my $type = shift;            # 包名
   my $self = {};               # 引用空哈希
   return bless $self, $type;   
}

sub DESTROY
{
   print "MyClass::DESTROY called\n";
}

sub MyMethod
{
   print "MyClass::MyMethod called!\n";
}

###############################################################################
# 继承实现
package MySubClass;

@ISA = qw( MyClass );

sub new
{
   print "MySubClass::new called\n";
   my $type = shift;            # 包名
   my $self = MyClass->new;     # 引用空哈希
   return bless $self, $type;  
}

sub DESTROY
{
   print "MySubClass::DESTROY called\n";
}

sub MyMethod
{
   my $self = shift;
   $self->SUPER::MyMethod();
   print "   MySubClass::MyMethod called!\n";
}

#################################################################################
# 调用以上类的主程序
package main;

print "1 - call MyClass method\n";

$myObject = MyClass->new();
$myObject->MyMethod();

print "\n2 - call MySubClass method\n";

$myObject2 = MySubClass->new();
$myObject2->MyMethod();

print "\n3 - create one domain object\n";
{
  my $myObject2 = MyClass->new();
}
# 自动调用析构函数

print "\n4 - create object\n";
$myObject3 = MyClass->new();
undef $myObject3;

print "\n5 - script run over...\n";
# 自动执行析构函数