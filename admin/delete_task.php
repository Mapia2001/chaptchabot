<?php

include('db.php');

if (isset($_GET['id'])) {
  $id = $_GET['id'];
  $query = "DELETE FROM ticket.submission_tbl WHERE id = $id";
  $result = pg_query($conn, $query);
  if (!$result) {
    die('Query failed');
  }

  $_SESSION['message'] = 'deleted';
  $_SESSION['message_type'] = 'danger';
  header("Location: index.php");
}