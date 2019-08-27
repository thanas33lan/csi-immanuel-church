<?php

namespace Admin;

use Application\Model\RoleTable;
use Application\Model\ResourceTable;
use Application\Model\UserRolesTable;
use Application\Model\UserTable;
use Application\Model\CustomerTable;
use Application\Model\StateTable;

use Application\Service\CommonService;
use Application\Service\RoleService;
use Application\Service\UserService;
use Application\Service\CustomerService;

class Module {

    public function getConfig() {
        return include __DIR__ . '/config/module.config.php';
    }

    public function getAutoloaderConfig() {
        return array(
            'Zend\Loader\StandardAutoloader' => array(
                'namespaces' => array(
                    __NAMESPACE__ => __DIR__ . '/src/' . __NAMESPACE__,
                ),
            ),
        );
    }

    public function getServiceConfig() {
        return array(
            'factories' => array(
                'RoleTable' => function($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new RoleTable($dbAdapter);
                    return $table;
                },
                'ResourceTable' => function($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new ResourceTable($dbAdapter);
                    return $table;
                }, 
                'UserRolesTable' => function($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new UserRolesTable($dbAdapter);
                    return $table;
                },
                
                'UserTable' => function($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new UserTable($dbAdapter);
                    return $table;
                },
                'CustomerTable' => function($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new CustomerTable($dbAdapter);
                    return $table;
                },
                'StateTable' => function($sm) {
                    $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                    $table = new StateTable($dbAdapter);
                    return $table;
                },
                
                'CommonService' => function($sm) {
                    return new CommonService($sm);
                },
                'RoleService' => function($sm) {
                    return new RoleService($sm);
                },
                'UserService' => function($sm) {
                    return new UserService($sm);
                },
                'CustomerService' => function($sm) {
                    return new CustomerService($sm);
                },
            ),
        );
    }

}
