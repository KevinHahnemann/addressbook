<?php
/**
 * No frameworks or vendor plugins
 * (except smarty)
 */

session_start();
if(!$_SESSION || !$_SESSION['login']) {
    $_SESSION['login'] = false;
}

require_once 'controller/routingController.php';

$controller = new routingController();

$controller->routing();
