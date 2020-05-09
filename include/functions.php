<?php


class Functions {

    private $conn;

        function __construct() {
        require_once $_SERVER['DOCUMENT_ROOT'].'/include/connect.php';//require_once $_SERVER['DOCUMENT_ROOT'].'/rubichat/include/connect.php';
    
        $db = new Connect();
        $this->conn = $db->connect();
    }

    // destructor
    function __destruct() {

    }



    ###################################################################
    ##               Fetch All               ##
    ###################################################################
    public function fetchAllUserResponse(){
    $result =  $this->conn->prepare("SELECT `id`,`full_name`,`email`,`phone`,`created_date` FROM `submission_tbl`");
    $result->execute();
    $response["userresponses"] = array();
    $result->bind_result($id, $full_name,$email,$phone,$created_date);
        while($result->fetch()) 
        {
            $userresponse = array();
            $userresponse["id"] =  $id;  
            $userresponse["full_name"] = $full_name;
            $userresponse["email"] =  $email;  
            $userresponse["phone"] = $phone;
            $userresponse["created_date"] = $created_date;
            $response["userresponses"][] =  $userresponse;

        }
    return $response;
    }







 

}

?>