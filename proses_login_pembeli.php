<?php
session_start();

if (isset($_POST["username"])) {
  $username =$_POST["username"];
  $password =md5($_POST["password"]);
  $koneksi = mysqli_connect("localhost", "root", "", "online_shop");
  $sql = "select * from pembeli where username='$username' and password='$password'";
  $result = mysqli_query($koneksi, $sql);
  $jumlah = mysqli_num_rows($result);
  if ($jumlah == 0) {
    // login gagal
    $_SESSION["message"] = array(
     "type" => "danger",
      "message" => "Username/Password Salah"
    );
    header("location : login_pembeli.php");
  } else {
    // login berasil
    // membuat variabel session
    $_SESSION["session_pembeli"]=mysqli_fetch_array($result);
    $_SESSION["session_beli"] = array();
    // untuk menampung data buku yang dipinjam / keranjang belanja
    header("location:template_pembeli.php");
  }

}
if (isset($_GET["logout"])) {
  // hapus session
  session_destroy();
  header("location:login_pembeli.php");
}
 ?>
