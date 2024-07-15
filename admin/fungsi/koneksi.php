<?php
    // fungsi/koneksi.php
    // Pastikan file koneksi.php sudah memuat informasi koneksi ke database
    $servername = "localhost";  // Ganti dengan hostname database Anda
    $username = "root";         // Ganti dengan username database Anda
    $password = "";             // Ganti dengan password database Anda
    $dbname = "sisfohotel";  // Ganti dengan nama database Anda

    // Buat koneksi
    $koneksi = new mysqli($servername, $username, $password, $dbname);

    // Periksa koneksi
    if ($koneksi->connect_error) {
        die("Koneksi database gagal: " . $koneksi->connect_error);
    }
	try {
        $pdo = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
        // Set mode error untuk PDO ke exception
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch(PDOException $e) {
        die("Koneksi database gagal: " . $e->getMessage());
    }
?>


