<?php

require_once 'loginController.php';
require_once 'contactController.php';

require_once 'libs/Smarty.class.php';

class routingController
{
    /**
     * simple routing
     * @throws SmartyException
     */
    public function routing() {
        $request = $_POST;

        $contactController = new contactController();
        $loginController = new loginController();

        if($request && $request['action']) {
            switch ($request['action']) {
                case 'login_form':
                    $loginController->loginForm();
                    break;
                case 'login':
                    $loginController->login($request);
                    break;
                case 'logout':
                    $loginController->logout();
                    break;
                case 'edit':
                    $contactController->editContact($request);
                    break;
                case 'add':
                    $contactController->addContact($request);
                    break;
                case 'delete':
                    $contactController->deleteContact($request['id']);
                    break;
            }
        } else {
            $contactController->displayLandingpage();
        }
    }

}