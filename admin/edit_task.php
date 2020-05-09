<?php

include('db.php');

if (isset($_GET['id'])) {
  $id = $_GET['id'];
  $query = "SELECT * FROM submission_tbl WHERE id = $id";
  $result = pg_query($conn, $query);

  if (pg_num_rows($result) == 1) {
    $row = pg_fetch_array($result);
    $first_name = $row['full_name'];
    $phone = $row['phone'];
    $email = $row['email'];
  }
};

if (isset($_POST['update'])) {
  $id = $_GET['id'];
  $first_name = $_POST['fullname'];
  $phone = $_POST['phone'];
  $email = $_POST['mail'];
  $personal_doc = $_POST['personaldoc'];

  $query = "UPDATE ticket.submission_tbl set full_name = '$first_name', phone = '$phone', email = '$email' WHERE id = $id";
  pg_query($conn, $query);

  $_SESSION['message'] = 'Usuario actualizado';
  $_SESSION['message_type'] = 'info';
  header("Location: index.php");
};

include('includes/header.php');
include('includes/nav.php');
?>
  <!-- Body Start -->
  <div class="container p-4">
    <div class="row">
      <div class="col-md-4 mx-auto">
        <div class="card card-body">
          <form action="edit_task.php?id=<?= $_GET['id']; ?>" method="POST">
            <!-- Nombre -->
            <div class="form-group">
              <input type="text" name="firstname" value="<?php echo $full_name?>" class="form-control" placeholder="name">
            </div>
            <!-- Telefono -->
            <div class="form-group">
              <input type="text" name="phone" value="<?php echo $phone?>" class="form-control" placeholder="phone">
            </div>
            <!-- Correo -->
            <div class="form-group">
              <input type="email" name="mail" value="<?php echo $email?>" class="form-control" placeholder="email">
            </div>
            <!-- Doc Identidad
            <div class="form-group">
              <input type="text" name="personaldoc" value="<?php echo $personal_doc?>" class="form-control" placeholder="Documento de Identidad">
            </div> -->
            <button type="submit" class="btn btn-block btn-primary" name="update">Editar</button>
          </form>
        </div>
      </div>
    </div>
  </div>

<?php
include('includes/footer.php');
?>