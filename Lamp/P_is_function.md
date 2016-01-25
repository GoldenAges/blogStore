http://php.net/manual/en/types.comparisons.php
isset() 和 is_null() 的结果是相反的 // 检查变量是否存在
empty() 和 if() 的结果是相反的 // 检查变量是否存在，以及他的值是否为空

###检测变量的类型
http://php.net/manual/zh/function.gettype.php
is_int()
is_numberic() 检测变量是否为数字或数字字符串
is_float() 若想测试一个变量是否是数字或数字字符串（如表单输入，它们通常为字符串），必须使用 is_numeric()。
```
$a = "22.0";
is_numeric($a); // true
is_int($a);//false
is_float($a);// false

```


is_scalar() 检测变量是否为标量（四种）
is_bool()
is_string()

is_array()
is_object()

is_resource()
is_null()

