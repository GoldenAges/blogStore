###PHP 算术操作符需要注意的
1. 求余操作符只能对整数（向上取整）
2. 符号位由前面的数字决定
```
echo (8.3) % (-3.9); // 2

```
1. 除法总是return float，除非能被整除
````
echo -8 / -3.4;
````

*****
###数组操作符
```
$a = array('one' => 2, 'two' => 3);
$b = array('one' => 6, 'four' => 4);
print_r($a + $b);// Array ( [one] => 2 [four] => 4 [two] => 3 )
```

###变量的重解释
intaval()
in 32bit systerm, as signed, biggest is 2^31 = 2147483647;
so, 1e10 is truncate, result will be 10000000000 % 2147483647 = 1410065408;
```
    echo intval(1e10); // 1410065408
```

floatval()
strval()
