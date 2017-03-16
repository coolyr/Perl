use Object;

$object = new Person( "Xiaoming", "Wang", 23234345);
# 获取姓名
$firstName = $object->getFirstName();

print "before Set : $firstName\n";

# 使用辅助函数设置姓名
$object->setFirstName( "Xiaoqiang" );

# 通过辅助函数获取姓名
$firstName = $object->getFirstName();
print "after Set : $firstName\n";








