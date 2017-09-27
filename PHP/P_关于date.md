```
strtotime('03-18-2010');// return false

```

http://php.net/manual/en/function.strtotime.php
UK dates (eg. 27/05/1990) won't work with strotime, even with timezone properly set. 

/* 
However, if you just replace "/" with "-" it will work fine. 
<?php 
$timestamp = strtotime(str_replace('/', '-', '27/05/1990')); 
?> 
*/ 

[red., derick]: What you instead should do is: 

<?php 
$date = date_create_from_format('d/m/y', '27/05/1990'); 
?> 

That does not make it a timestamp, but a DateTime object, which is much more versatile instead.
