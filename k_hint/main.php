#!/usr/bin/php
<?php
/**
 * K_Hint 主文件
 * Author: auiog413 <Email:lbzqh156@gmail.com> 2012年10月21日 22时34分25秒 
 */

define('BASEPATH',dirname(__FILE__).'/');

/**
 * 开关
 * 设置一个开关，以便在不想看到消息的时候关掉，比如用投影仪演示的时候
 */
$switch_file = BASEPATH . 'switch';
if (file_exists($switch_file)) {
    $switch = file_get_contents($switch_file);
} else {
    $switch = 'on';
}

if (trim($switch) == 'off') {
    file_put_contents(BASEPATH . 'debug.log', "\nk_hint is off status, hint canceled.\n", FILE_APPEND);
    exit();
}

// 取得分类
$category = glob(BASEPATH.'db/*');
$category = substr($category[rand(0, count($category)-1)],strlen(BASEPATH)+3,-4);

// 取得提示内容
require_once(BASEPATH.'db/'.$category.'.php');
$content = $items[rand(0, count($items)-1)];

// 获取icon路径
$icon = BASEPATH.'icon/'.$category.'.png';

// 获取分类alias别名
require_once(BASEPATH.'alias.php');
$category = $alias[$category] ? $alias[$category]: $category;

// 调用shell脚本显示气泡
$cmd = BASEPATH.'x-notify-send.sh '.$category.' "'.$content.'" '.$icon;
shell_exec($cmd);
?>
