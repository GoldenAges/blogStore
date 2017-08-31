[array_map](http://php.net/manual/en/function.array-map.php)

1. array_map 是值传递

2. 函数的参数只能有一个

3. 返回值是作用了函数之后的值

```
function a($arg1)
{
    return $arg1['aa'] * 2;
}
$b = [['aa' => 0,1,2],['aa' => 5,3,4]];
$a = array_map("a", $b);
print_r($b);
print_r($a);
```

Result：

```
Array
(
    [0] => Array
        (
            [aa] => 0
            [0] => 1
            [1] => 2
        )

    [1] => Array
        (
            [aa] => 5
            [0] => 3
            [1] => 4
        )

)
Array
(
    [0] => 0
    [1] => 10
)
```
