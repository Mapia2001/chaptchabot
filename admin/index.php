<?php
ini_set('display_errors', 1);
include('../include/connect.php');
include('includes/header.php');
include('includes/nav.php');
?>
<?php
    include("../include/functions.php");   
    $db = new Functions();  
    $result = $db->fetchAllUserResponse();
    $userresponses = $result['userresponses']; 
?>
<!-- Body Start -->
  <div class="container p-4">
    <div class="row">

    <!-- User form -->
      <div class="col-md-3">

     

        <div class="card card-body">
          Admin panel
        </div>
      </div>

      <!-- Users list -->
      <div class="col-md-9">
        <table class="table table-bordered">
          <thead>
            <tr>
              <th>Doc ID</th>
              <th>Name</th>
              <th>Email</th>
              <th>Phone</th>
              <th>Date Created</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($userresponses as $userresponse) {?>
              <tr>
                <td><?php echo $userresponse['id']; ?></td>
                <td><?php echo $userresponse['full_name']; ?></td>
                <td><?php echo $userresponse['email']; ?></td>
                <td><?php echo $userresponse['phone']; ?></td>
                <td><?php echo $userresponse['created_date'];?></td>
                <td>
                  <a href="#"  class="btn btn-sm btn-info"><i class="fas fa-pen-square"></i></a>
                  <a href="#" class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i></a>
                </td>
              </tr>
            <?php }?>
          </tbody>
        </table>
      </div>
    </div>
  </div>

<?php
include('includes/footer.php');
?>
