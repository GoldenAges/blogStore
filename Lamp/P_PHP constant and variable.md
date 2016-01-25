###PHP 常量和变量的区别
[PHP Manual](http://php.net/manual/en/language.constants.php)
1. 常量声明后不能改变
2. 常量只能被声明为4中基本类型
3. 不同的声明方式 Inside clss and OutSide Class
```
    defined("MAX") or define("MAX", 10); //Right
    const Max = 10; //Wrong
    class TeCon{
        const MAX = 10; //Right
        public MAX = 10; //Wrong 不能被权限限定符修饰
        defined("MAX") or define("MAX", 10); //Wrong
    }
    TeCOnt::Max; //Right
```
