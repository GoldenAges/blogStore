<?php 
date_default_timezone_set('Asia/Shanghai');

if(empty($query)) {
	echo "查询条件为空";
}
if(is_numeric($query)) {
	//9999999999 => 2286/11/21
	$biggerThan2286 = strlen($query) > 10;
	if($biggerThan2286){
		echo "输入的时间戳大于2286年，重新输入";
	}
	date('Y-m-d H:i:s', $query);
}

return strtotime($query);

function dateToStamp($date = '')
{
	if (empty($date)) {
		echo "日期不能为空";
	}

	return strtotime($date);
}

function stampToData($stamp = 0)
{
	if (empty($stamp)) {
		echo "时间戳不能为空";
	}

	return data('Y-m-d H:i:s');
}

?>