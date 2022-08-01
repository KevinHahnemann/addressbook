<?php

require_once 'models/DBConnect.php';
require_once 'models/UserTable.php';
require_once 'contactController.php';

class loginController extends DBConnect {

    /* -----------------------------------------------------------------------------------------------------------------
     * Action Functions
     * -----------------------------------------------------------------------------------------------------------------
     */

    /**
     * @param $request
     *
     * handling login
     */
    public function login($request) {
        $userTable = new UserTable();
        $user = $userTable->getUser($request['user_email']);

        $message = 'ERROR: Wrong Username or E-Mail.';
        $error = true;

        if($user && (password_verify($request['password'], $user[0]['password']))) {
            $_SESSION['login'] = true;
            $_SESSION['user'] = $user[0];

            $message = 'SUCCESS: redirecting in';
            $error = false;
        }

        $this->loginForm($message, $error);
    }

    /**
     * handling logout
     */
    public function logout() {
        $_SESSION['login'] = false;

        $contactController = new contactController();
        $contactController->displayLandingpage();
    }


    /* -----------------------------------------------------------------------------------------------------------------
     * Display Functions
     * -----------------------------------------------------------------------------------------------------------------
     */



    /**
     * @param string $message
     * @param bool $error
     * @throws SmartyException
     *
     * preparation and displaying login Form
     */
    public function loginForm(string $message = '', bool $error = false) {

        $view = new Smarty();

        $view->assign('message', $message);
        $view->assign('error', $error);
        $view->display('login.tpl');

        exit;
    }
}