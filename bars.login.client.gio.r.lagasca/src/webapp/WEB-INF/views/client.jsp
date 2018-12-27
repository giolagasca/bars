<!doctype html>
<html lang="en">
  <head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  </head>
  <body>
    <nav class="navbar navbar-expand-xl navbar-light bg-light shadow mb-5">
        <a class="navbar-brand" href="#">Bars Client</a>
        <div class="collapse navbar-collapse" id="collapsibleNavId">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <li class="nav-item">
                    <a class="nav-link active">Account List</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/add">Add Account</a>
                </li>
            </ul>
            <div class="form-inline my-2 my-lg-0">
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdownId" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Username</a>
                        <ul class="dropdown-menu">
                            <li><a href="/logout">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
            
    <div class="container">
        <div class="row justify-content-center mt-5">
            <div class="card col-8 shadow p-3 mb-5 bg-white rounded">
                <table class="table table-hover table-bordered">
                    <thead>
                        <tr>
                        <th scope="col">ID#</th>
                        <th scope="col">Username</th>
                        <th scope="col" colspan="2">Role</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!--INSERT FOR LOOP HERE-->
                        <tr>
                            <th scope="row">1</th>
                            <td>Username</td>
                            <td>Admin</td>
                            <td class="d-flex justify-content-end">
                                <button type="button" onclick="openEdit(1,'Username','Admin');" class="btn btn-outline-success mr-2" data-toggle="modal" data-target=".bd-example-modal-lg">
                                    <i class="fas fa-pencil-alt"></i> Edit
                                </button>
                                <button type="button" class="btn btn-outline-danger" onclick="deleteAccount('{{account.id}}');">
                                    <i class="fas fa-trash"></i> Delete
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
    <div class="modal fade bd-example-modal-lg" id="edit-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Account</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <label for="basic-url">ID</label>
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Id" name="id" id="edit-id" disabled>
                        </div>
                        <label for="basic-url">Username</label>
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Username" name="username" id="edit-username">
                        </div>
                        <label for="basic-url">Role</label>
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Role" name="role" id="edit-role">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save</button>
                    </div>
                </div>
        </div>
    </div>
    <script>
        function openEdit(id,username,role){
            $("#edit-id").val(id);
            $("#edit-username").val(username);
            $("#edit-role").val(role);
        }
        function editAccount(userid,username,role){
            var id = userid;
            var username = username;
            var role = role;
            var userDetails = {
                "id" : id,
                "username" : username,
                "role" : role
            };
            $.ajax({
                type: "PUT",
                url: "/users/"+id,
                data: {"id":id, "userDetails":JSON.parse(userDetails)},
                success: function(msg){
                    alert("Data Edited: " + msg);
                }
            });
            $('#edit-modal').modal('toggle');
        }
        function deleteAccount(id){
            $.ajax({
                type: "DELETE",
                url: "/users/"+id,
                data: "id="+id,
                success: function(msg){
                    alert("Data Deleted: " + msg);
                }
            });
        }
    </script>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>