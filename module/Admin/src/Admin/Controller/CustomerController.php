<?php

namespace Admin\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Zend\Json\Json;

class CustomerController extends AbstractActionController
{

    public function indexAction()
    {
        $request = $this->getRequest();
        if ($request->isPost()) {
            $parameters = $request->getPost();
            $customerService = $this->getServiceLocator()->get('CustomerService');
            $result = $customerService->getCustomerList($parameters);
            return $this->getResponse()->setContent(Json::encode($result));
        }
    }

    public function addAction()
    {
        $customerService = $this->getServiceLocator()->get('CustomerService');
        $commonService = $this->getServiceLocator()->get('CommonService');
        if ($this->getRequest()->isPost()) {
            $params = $this->getRequest()->getPost();
            $customerService->addCustomerData($params);
            return $this->_redirect()->toRoute('admin-customer');
        } else {
            $stateResult = $commonService->getStateList();
            return new ViewModel(array(
                'stateResult' => $stateResult
            ));
        }
    }

    public function editAction()
    {
        $customerService = $this->getServiceLocator()->get('CustomerService');
        $commonService = $this->getServiceLocator()->get('CommonService');
        if ($this->getRequest()->isPost()) {
            $param = $this->getRequest()->getPost();
            $customerService->updateCustomerDetails($param);
            return $this->redirect()->toRoute('admin-customer');
        } else {
            $customerId = base64_decode($this->params()->fromRoute('id'));
            $customerResult = $customerService->getCustomerDetailsById($customerId);
            $stateResult = $commonService->getStateList();
            return new ViewModel(array(
                'stateResult' => $stateResult,
                'customerResult' => $customerResult
            ));
        }
    }
}
