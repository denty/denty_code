<?php
/**
 * Created by PhpStorm.
 * User: broydenty
 * Date: 14-8-14
 * Time: 下午1:34
 */


$con = mysql_connect("localhost","root","");
if (!$con)
{
////    die('Could not connect: ' . mysql_error());
    echo"can't connect";
}else
{
    mysql_select_db("denty",$con);
    echo"connect ok";
     $result = mysql_query("select name from user",$con);
    if($result == null)
    {
        print_r("null");
    }else
    {
        print_r("have data");
    }
    $array = mysql_fetch_array($result);
    print_r($array);
//    print_r($array.ob_get_length());
}

// some code

//mysql_close($con);