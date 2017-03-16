use Employee;

$object = new Employee( "xiaoming", "Wang", 23234345);
# 获取姓名
$firstName = $object->getFirstName();

print "Before setFirstName: $firstName\n";

# 使用辅助函数设置姓名
$object->setFirstName( "Xiaoqiang" );

# 通过辅助函数获取姓名
$firstName = $object->getFirstName();
print "After SetFirstName: $firstName\n";


print "######################################################";

# 默认载入
# 如果在当前类、当前类所有的基类、还有 UNIVERSAL 类中都找不到请求的方法， 这时会再次查找名为 AUTOLOAD() 的一个方法。
# 如果找到了 AUTOLOAD，那么就会 调用，同时设定全局变量 $AUTOLOAD 的值为缺失的方法的全限定名称。
# 如果还不行，那么 Perl 就宣告失败并出错。
# 如果你不想继承基类的 AUTOLOAD，很简单，只需要一句：
# sub AUTOLOAD;

# 析构函数及垃圾回收
# 当对象的最后一个引用释放时，对象会【自动析构】。
# 如果你想在析构的时候做些什么，那么你可以在类中定义一个名为"DESTROY"的方法。它将在适合的时机自动调用，并且按照你的意思执行额外的清理动作。
# package MyClass;
# ...
# sub DESTROY
# {
    # print "MyClass::DESTROY called\n";
# }







