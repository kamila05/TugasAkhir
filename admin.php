
      <script type="text/javascript">
      function Tambah(){
        document.getElementById("action").value = "insert";
        document.getElementById("id_admin").value="";
        document.getElementById("nama").value="";
        document.getElementById("username").value="";
        document.getElementById("password").value="";
      }
      function Edit(index){
        //set action update
        document.getElementById("action").value = "update";
        //ambil data dari table
        var table = document.getElementById("table_penjual");
        var id_penjual = table.rows[index].cells[0].innerHTML;
        var nama = table.rows[index].cells[1].innerHTML;
        var username = table.rows[index].cells[2].innerHTML;
        var password = table.rows[index].cells[3].innerHTML;

        //set inputan berdasarkan data
        document.getElementById("id_penjual").value=id_penjual;
        document.getElementById("nama").value=nama;
        document.getElementById("username").value=username;
        document.getElementById("password").value=password;
      }
      </script>
      <div class="card col-sm-12">
        <div class="card-header bg-primary text-white">
          <h4>Data Admin</h4>
        </div>
        <div class="card-body">
          <?php
          $koneksi = mysqli_connect("localhost","root","","online_shop");
          if (mysqli_connect_errno()) {
            echo mysqli_connect_error();

          }
          $sql = "select * from admin";
          $result = mysqli_query($koneksi,$sql);
          $count = mysqli_num_rows($result);
          ?>

          <?php if ($count == 0): ?>
            <div class="alert alert-info">
              Data is Empty
            </div>
          <?php else: ?>
            <table class = "table" id="table_admin">
              <thead>
                <tr>
                  <td>ID</td>
                  <td>Nama</td>
                  <td>Username</td>
                  <td>Password</td>
                  <td>Opsi</td>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($result as $hasil ): ?>
                  <tr>
                    <td><?php echo $hasil["id_penjual"]; ?></td>
                    <td><?php echo $hasil["nama"]; ?></td>
                    <td><?php echo $hasil["username"]; ?></td>
                    <td><?php echo $hasil["password"]; ?></td>
                    <td>
                      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal" onclick="Edit(this.parentElement.parentElement.rowIndex)">
                        Edit
                      </button>
                      <a href="database_penjual.php?hapus=penjual&id_penjual=<?php echo $hasil["id_penjual"];?>"
                        onclick="return confirm ('apakah anda yakin ingin menghapus data ini?')">
                        <button type="button " class="btn btn-danger">
                        Hapus
                        </button>
                      </a>
                    </td>
                  </tr>
                <?php endforeach; ?>
              </tbody>
            </table>
          <?php endif; ?>
        </div>
        <div class="card-footer">
          <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modal" onclick="Tambah()">
            Tambah Data
          </button>
        </div>
      </div>
    </div>
    <div class="modal" id="modal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <form action="database_penjual.php" method="post" enctype="multipart/form-data">
            <div class="modal-header">
              <h4>Form Admin</h4>
              <span class="close" data-dismiss="modal">&times;</span>
            </div>
            <div class="modal-body">
              <input type="hidden" name="action" id="action">
              ID
              <input type="text" name="id_penjual" id="id_penjual" class="form-control">
              Nama
              <input type="text" name="nama" id="nama" class="form-control">
              Username
              <input type="text" name="username" id="username" class="form-control">
              Password
              <input type="password" name="password" id="password" class="form-control">
            </div>
            <div class="modal-footer">
              <button type="submit" class="btn btn-success">Simpan</button>
            </div>
          </form>
        </div>
      </div>
    </div>
