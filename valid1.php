<?php 
	session_start();

	if (isset($_POST['username'])) {
		// is set?
		$username = $_POST['username'];
		$password = md5($_POST['password']);
		$koneksi = mysqli_connect("localhost", "root", "", "online_shop");
		$sql = "select * from seller where username='$username' and password='$password'";
		$result = mysqli_query($koneksi, $sql);
		$jumlah = mysqli_num_rows($result);

		if ($jumlah == 0) {
			// login gagal
			$_SESSION["message"] = array(
			"type" => "danger",
			"message" => "Username/Password Salah"
		);
			header("location:login_admin.php?error");
		}else {
			// login berhasil
			// membuat var session
			$_SESSION["session_admin"] = mysqli_fetch_array($result);
			header("location:page_admin.php");
		}
	}

	if (isset($_GET["logout"])) {
		// hapus session 
		session_destroy();
		header("location:login_admin.php");
	}
 ?>