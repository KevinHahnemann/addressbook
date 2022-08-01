<?php

require_once 'models/DBConnect.php';
require_once 'models/ContactTable.php';

class contactController extends DBConnect {

    /**
     * @throws SmartyException
     *
     * preparation and displaying index/desktop
     */
    public function displayLandingpage() {

        $contactTable = new ContactTable();
        $view = new Smarty();

        $view->assign('entries', $contactTable->getAllEntries($_SESSION['user']['id']));
        $view->display('addressbook.tpl');

        exit;
    }

    public function addContact($request) {

        $contactTable = new ContactTable();
        $contactTable->add($request);

        $this->displayLandingpage();
    }

    public function editContact($request) {

        $contactTable = new ContactTable();
        $contactTable->edit($request);

        $this->displayLandingpage();
    }

    public function deleteContact($id) {

        $contactTable = new ContactTable();
        $contactTable->delete($id);

        $this->displayLandingpage();
    }

}