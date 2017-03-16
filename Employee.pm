package Employee;

# 继承
	# Perl 里 类方法通过@ISA数组继承，这个数组里面包含其他包（类）的名字，变量的继承必须明确设定。
	# 多继承就是这个@ISA数组包含多个类（包）名字。
	# 通过@ISA只能继承方法，不能继承数据。

	
# 接下来我们创建一个 Employee 类继承 Person 类。
# Employee.pm 文件代码如下所示：
	#use Person;
use Object;
use strict;
our @ISA = qw(Person);    # 从 Person 继承
# 方法重写
# 上面实例中，Employee 类继承了 Person 类，但如果 Person 类的方法无法满足需求，就需要对其方法进行【重写】。
# 接下来我们在 Employee 类中添加一些【新方法】，并重写了 Person 类的方法：

# 重写构造函数
sub new 
{
    my ($class) = @_;

    # 调用父类的构造函数
    my $self = $class->SUPER::new( $_[1], $_[2], $_[3] );
    
    # 添加更多属性
    $self->{_id}   = undef;
    $self->{_title} = undef;
    bless $self, $class;
    return $self;
}

# 重写方法
sub getFirstName 
{
    my( $self ) = @_;
    # 这是子类函数
    print "This is SubClass getFirstName\n";
    return $self->{_firstName};
}

# 添加方法
sub setLastName
{
    my ( $self, $lastName ) = @_;
    $self->{_lastName} = $lastName if defined($lastName);
    return $self->{_lastName};
}

sub getLastName {
    my( $self ) = @_;
    return $self->{_lastName};
}

1;


