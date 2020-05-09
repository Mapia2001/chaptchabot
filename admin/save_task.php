<?php

include ('db.php');

if (isset($_POST['save_task'])) {
  $first_name = $_POST['firstname'];
  $last_name = $_POST['lastname'];
  $phone = $_POST['phone'];
  $email = $_POST['mail'];
  $personal_doc = $_POST['personaldoc'];

  $query = "INSERT INTO public.users (first_name, last_name, phone, email, personal_doc) VALUES ('$first_name', '$last_name', '$phone', '$email', '$personal_doc')";

  $result = pg_query($conn, $query);
  if (!$result) {
    die('Query failed');
  }

  $_SESSION['message'] = 'Usuario registrado';
  $_SESSION['message_type'] = 'success';

  header("Location: index.php");
};
