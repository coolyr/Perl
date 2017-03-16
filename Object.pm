package Person;print "##########################Object#############################\n";

# Perl 面向对象
# Perl 中有两种不同的面向对象编程的实现：
	# 一是基于匿名哈希表的方式，每个对象实例的实质就是一个指向匿名哈希表的引用。在这个匿名哈希表中，存储来所有的实例属性。
	# 二是基于数组的方式，在定义一个类的时候，我们将为每一个实例属性创建一个数组，而每一个对象实例的实质就是一个指向这些数组中某一行索引的引用。在这些数组中，存储着所有的实例属性。
# 面向对象基础概念
# 面向对象有很多基础概念，这里我们接收三个：对象、类和方法。
	# 对象：	对象是对类中数据项的引用。.
	# 类：		类是个【Perl包】，其中含提供对象方法的类。
	# 方法：	方法是个【Perl子程序】，类名是其第一个参数。
# Perl 提供了 bless() 函数，bless 是用来构造对象的， 通过 bless 把一个引用和这个类名相关联，返回这个引用就构造出一个对象。

# 类的定义
	# 一个类只是一个简单的【包】。
	# 可以把一个包当作一个类用，并且把包里的函数当作类的方法来用。
	# Perl 的包提供了【独立的命名空间】，所以不同包的方法与变量名不会冲突。
	# Perl 类的文件后缀为 【.pm】。
# 接下来我们创建一个 Person 类：
	# package Person;
# 类的代码范围到脚本文件的最后一行，或者到下一个 package 关键字前。

# 创建和使用对象
	# 创建一个类的实例 (对象) 我们需要定义一个构造函数，大多数程序使用类名作为构造函数，Perl 中可以使用【任何名字】。
	# 你可以使用多种 Perl 的变量作为 Perl 的对象。大多数情况下我们会使用【引用数组】或【引用哈希】。
	# 接下来我们为 Person 类创建一个构造函数，使用了 Perl 的【哈希引用】。
	# 在创建对象时，你需要提供一个构造函数，它是一个【子程序】，返回对象的【引用】。
# 实例如下：#package Person; 必须置顶
sub new
{
    my $class = shift;
    #匿名哈希引用，使用 {} 定义
    my $self = {
        _firstName => shift,
        _lastName  => shift,
        _ssn       => shift,
    };
    # 输出用户信息
    print "firstName: $self->{_firstName}\n";
    print "lastName: $self->{_lastName}\n";
    print "ssn: $self->{_ssn}\n";
    
        #Perl 提供了 bless() 函数，bless 是用来构造对象的， 通过 bless 把一个引用和这个类名相关联，返回这个引用就构造出一个对象。
    bless $self, $class;
    return $self;
}
# 接下来我们创建一个对象：
#$object = new Person( "coolyr", "poochai", 23234345);
# 定义方法
    # Perl类的方法只是个Perl子程序而已，也即通常所说的【成员函数】。
    # Perl面向对象中Perl的方法定义不提供任何特别语法，但规定方法的【第一个参数为对象或其被引用的包】。
    # Perl 没有提供私有变量，但我们可以通过【辅助】的方式来管理对象数据。
# 接下来我们定义一个获取名字的方法：
sub getFirstName 
{
    my ( $self ) = @_; #必须设置一下
    print "getFirstName run =>  $self->{_firstName}\n";
    return $self->{_firstName};
}
sub setFirstName 
{
    my ( $self, $firstName ) = @_;#必须设置一下
    
    print "setFirstName run =>  $self->{_firstName}\n";    
    $self->{_firstName} = $firstName if defined($firstName);
    
        print "setFirstName run =>  $self->{_firstName}\n";    

    return $self->{_firstName};
}
1; # 返回值：since it's a package and it needs to return a value