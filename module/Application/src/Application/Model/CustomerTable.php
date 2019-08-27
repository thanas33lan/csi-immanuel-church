<?php

namespace Application\Model;

use Zend\Session\Container;
use Zend\Db\Adapter\Adapter;
use Zend\Db\TableGateway\AbstractTableGateway;
use Zend\Db\Sql\Sql;
use Application\Service\CommonService;

class CustomerTable extends AbstractTableGateway
{

    protected $table = 'customer';

    public function __construct(Adapter $adapter)
    {
        $this->adapter = $adapter;
    }

    public function addCustomer($param)
    {
        $logincontainer = new Container('user');
        $common = new CommonService();
        $data = array(
            'first_name'        => $param['firstName'],
            'last_name'         => $param['lastName'],
            'gender'            => $param['gender'],
            'email'             => $param['email'],
            'phone'             => $param['mobileNumber'],
            'alternate_phone'   => $param['alternateNumber'],
            'church_name'       => $param['churchName'],
            'street_address'    => $param['address'],
            'address_line2'     => $param['address2'],
            'city'              => $param['city'],
            'state'             => base64_decode($param['state']),
            'pincode'           => $param['pincode'],
            'recceiver_name'    => $param['receiverName'],
            'payment_status'    => $param['paymentStatus'],
            'customer_status'   => $param['customerStatus'],
            'added_by'          => $logincontainer->userId,
            'added_on'          => $common->getDateTime()
        );
        // \Zend\Debug\Debug::dump($data);die;

        $this->insert($data);
        return $this->lastInsertValue;
    }

    public function updateCustomer($param)
    {
        $customerId = base64_decode($param['customerId']);
        $data = array(
            'first_name'        => $param['firstName'],
            'last_name'         => $param['lastName'],
            'gender'            => $param['gender'],
            'email'             => $param['email'],
            'phone'             => $param['mobileNumber'],
            'alternate_phone'   => $param['alternateNumber'],
            'church_name'       => $param['churchName'],
            'street_address'    => $param['address'],
            'address_line2'     => $param['address2'],
            'city'              => $param['city'],
            'state'             => base64_decode($param['state']),
            'pincode'           => $param['pincode'],
            'recceiver_name'    => $param['receiverName'],
            'payment_status'    => $param['paymentStatus'],
            'customer_status'   => $param['customerStatus']
        );
        return $this->update($data, array("customer_id" => $customerId));
    }

    public function fetchCustomerList($parameters, $acl)
    {
        /* Array of database columns which should be read and sent back to DataTables. Use a space where
         * you want to insert a non-database field (for example a counter or static image)
         */
        $aColumns = array('first_name', 'email', 'phone', 'church_name','recceiver_name','payment_status','user_name',"DATE_FORMAT(added_on,%y-%b-%d)");
        $orderColumns = array('first_name', 'email', 'phone', 'church_name','recceiver_name','payment_status','user_name','added_on');
        /*
         * Paging
         */
        $sLimit = "";
        if (isset($parameters['iDisplayStart']) && $parameters['iDisplayLength'] != '-1') {
            $sOffset = $parameters['iDisplayStart'];
            $sLimit = $parameters['iDisplayLength'];
        }

        /*
         * Ordering
         */

        $sOrder = "";
        if (isset($parameters['iSortCol_0'])) {
            for ($i = 0; $i < intval($parameters['iSortingCols']); $i++) {
                if ($parameters['bSortable_' . intval($parameters['iSortCol_' . $i])] == "true") {
                    $sOrder .= $orderColumns[intval($parameters['iSortCol_' . $i])] . " " . ($parameters['sSortDir_' . $i]) . ",";
                }
            }
            $sOrder = substr_replace($sOrder, "", -1);
        }

        /*
         * Filtering
         * NOTE this does not match the built-in DataTables filtering which does it
         * word by word on any field. It's possible to do here, but concerned about efficiency
         * on very large tables, and MySQL's regex functionality is very limited
         */

        $sWhere = "";
        if (isset($parameters['sSearch']) && $parameters['sSearch'] != "") {
            $searchArray = explode(" ", $parameters['sSearch']);
            $sWhereSub = "";
            foreach ($searchArray as $search) {
                if ($sWhereSub == "") {
                    $sWhereSub .= "(";
                } else {
                    $sWhereSub .= " AND (";
                }
                $colSize = count($aColumns);

                for ($i = 0; $i < $colSize; $i++) {
                    if ($i < $colSize - 1) {
                        $sWhereSub .= $aColumns[$i] . " LIKE '%" . ($search) . "%' OR ";
                    } else {
                        $sWhereSub .= $aColumns[$i] . " LIKE '%" . ($search) . "%' ";
                    }
                }
                $sWhereSub .= ")";
            }
            $sWhere .= $sWhereSub;
        }

        /* Individual column filtering */
        for ($i = 0; $i < count($aColumns); $i++) {
            if (isset($parameters['bSearchable_' . $i]) && $parameters['bSearchable_' . $i] == "true" && $parameters['sSearch_' . $i] != '') {
                if ($sWhere == "") {
                    $sWhere .= $aColumns[$i] . " LIKE '%" . ($parameters['sSearch_' . $i]) . "%' ";
                } else {
                    $sWhere .= " AND " . $aColumns[$i] . " LIKE '%" . ($parameters['sSearch_' . $i]) . "%' ";
                }
            }
        }

        /*
         * SQL queries
         * Get data to display
         */
        $dbAdapter = $this->adapter;
        $sql = new Sql($dbAdapter);
        $sQuery = $sql->select()->from(array('c' => 'customer'))
        ->join(array('u' => 'user'), 'c.added_by=u.role', array('user_name'));

        if (isset($sWhere) && $sWhere != "") {
            $sQuery->where($sWhere);
        }

        if (isset($sOrder) && $sOrder != "") {
            $sQuery->order($sOrder);
        }

        if (isset($sLimit) && isset($sOffset)) {
            $sQuery->limit($sLimit);
            $sQuery->offset($sOffset);
        }

        $sQueryStr = $sql->getSqlStringForSqlObject($sQuery); // Get the string of the Sql, instead of the Select-instance 
        $rResult = $dbAdapter->query($sQueryStr, $dbAdapter::QUERY_MODE_EXECUTE);
        /* Data set length after filtering */
        $sQuery->reset('limit');
        $sQuery->reset('offset');
        $fQuery = $sql->getSqlStringForSqlObject($sQuery);
        $aResultFilterTotal = $dbAdapter->query($fQuery, $dbAdapter::QUERY_MODE_EXECUTE);
        $iFilteredTotal = count($aResultFilterTotal);

        /* Total data set length */
        $iTotal = $this->select()->count();


        $output = array(
            "sEcho" => intval($parameters['sEcho']),
            "iTotalRecords" => $iTotal,
            "iTotalDisplayRecords" => $iFilteredTotal,
            "aaData" => array()
        );
        $sessionLogin = new Container('user');
        $role = $sessionLogin->roleCode;
        if ($acl->isAllowed($role, 'Admin\Controller\Customer', 'edit')) {
            $update = true;
        } else {
            $update = false;
        }

        foreach ($rResult as $aRow) {
            $row = array();
            $row[] = ucwords($aRow['first_name']) .' '.  ucwords($aRow['last_name']);
            $row[] = $aRow['email'];
            $row[] = $aRow['phone'];
            $row[] = ucwords($aRow['church_name']);
            $row[] = ucwords($aRow['recceiver_name']);
            $row[] = ucwords($aRow['payment_status']);
            $row[] = ucwords($aRow['user_name']);
            $row[] = date('d-M-Y H:s A',strtotime($aRow['added_on']));

            if($update){
                $row[] = '<a href="/admin/customer/edit/' . base64_encode($aRow['customer_id']) . '" class="btn btn-default" style="margin-right: 2px;" title="Edit"><i class="far fa-edit"></i> Edit</a>';
            }
            $output['aaData'][] = $row;
        }
        return $output;
    }

    public function fetchCustomerById($customerId)
    {
        return $this->select(array('customer_id'=>$customerId))->current();
    }
}
