<?php
$_GET['baz'] = 'xxx';

function foo(&$var)
{
    $var = 'd';
    // $c = &$var;
    // return $c;
    // $var =& $_GET["baz"];
}

foo($d);

?>
