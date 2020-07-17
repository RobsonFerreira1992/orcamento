<?php
include('conexao.php');
?>

<!DOCTYPE html>
<html>
<head>
  <title>Clientes</title>


<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
 
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>



</head>


<body>



  <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="painel_funcionario.php"><big><big><i class="fa fa-arrow-left"></i></big></big></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
    <ul class="navbar-nav mr-auto">
      
    </ul>
    <form class="form-inline my-2 my-lg-0 mr-5">
      <input name="txtpesquisarcpf" id="txtcpf" class="form-control mr-sm-2" type="search" placeholder="Buscar pelo CPF" aria-label="Pesquisar">
      <button name="buttonPesquisarCPF" class="btn btn-outline-success my-2 my-sm-0" type="submit"><i class="fa fa-search"></i></button>
    </form>

    <form class="form-inline my-2 my-lg-0">
      <input name="txtpesquisar" class="form-control mr-sm-2" type="search" placeholder="Buscar pelo Nome" aria-label="Pesquisar">
      <button name="buttonPesquisar" class="btn btn-outline-success my-2 my-sm-0" type="submit"><i class="fa fa-search"></i></button>
    </form>
  </div>
</nav>





<div class="container">


    

      <br>


         <div class="row">
           <div class="col-sm-12">
            <button type="button" class="btn btn-success mb-3" data-toggle="modal" data-target="#modalExemplo">Inserir Novo </button>

           </div>

          
        </div>


          <div class="content">
            <div class="row">
              <div class="col-md-12">
                <div class="card">
                  <div class="card-header">
                    <h4 class="card-title"> Tabela de Clientes</h4>
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
                    <!-- Listar clientes -->
                    <?php
                            if(isset($_GET['buttonPesquisar']) and $_GET['txtpesquisar']!= ''){
                              $nome = $_GET['txtpesquisar'].'%';
                              $query = "SELECT * from clientes where nome LIKE '$nome' order by nome asc";

                            }else if(isset($_GET['buttonPesquisarCPF']) and $_GET['txtpesquisar']!= ''){
                              $nome = $_GET['txtpesquisarcpf'];
                              $query = "SELECT * from clientes where cpf = '$nome' order by nome asc";
                              
                            }else{
                              $query = " SELECT * from clientes  order by nome asc";
                            
                            }
                            
                        

                          
                            
                            
                            
                            $result = mysqli_query($conexao,$query);
                           
                            $row = mysqli_num_rows($result);

                            if($row == ""){

                              echo "<h3>Não existe dados cadastrados!</h3>";

                            }else{

                      ?>
                      <table class="table">
                        <thead class=" text-primary">
                          
                          <th>
                            Nome
                          </th>
                          <th>
                            Telefone
                          </th>
                          <th>
                            Endereço
                          </th>
                           <th>
                            Email
                          </th>
                            <th>
                            CPF
                          </th>
                           </th>
                            <th>
                            Data
                          </th>
                          <th>
                            Ações
                          </th>

                        </thead>
                        <tbody>
                            <?php

                              while($res_1 = mysqli_fetch_array($result)){

                                $nome = $res_1["nome"];
                                $telefone = $res_1["telefone"];
                                $endereco = $res_1["endereco"];
                                $email = $res_1["email"];
                                $cpf = $res_1["cpf"];
                                $data = $res_1["data"];
                                $id =  $res_1["id"];
                            ?>

                            <tr>
                                <td><?php echo $nome;?></td>
                                <td><?php echo $telefone;?></td>
                                <td><?php echo $endereco;?></td>
                                <td><?php echo $email;?></td>
                                <td><?php echo $cpf;?></td>
                                <td><?php echo $data;?></td>
                                <td>
                                  <a  class="btn btn-info" href="clientes.php?func=editar&id=<?php echo $id; ?>"><i class="fa fa-pencil-square-o"></i></a>
                                  <a  class="btn btn-danger" href="clientes.php?func=deletar&id=<?php echo $id; ?>"><i class="fa fa-minus-square"></i></a>
                                </td>
                            </tr>
                              <?php } ?>
 
                        </tbody>
                      </table>
                            <?php } ?>
                            

                    </div>
                  </div>
                </div>
              </div>

</div>




 <!-- Modal -->
      <div id="modalExemplo" class="modal fade" role="dialog">
        <div class="modal-dialog">
         <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              
              <h4 class="modal-title">Clientes</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
              <form method="POST" action="">
              <div class="form-group">
                <label for="id_produto">Nome</label>
                <input type="text" class="form-control mr-2" name="txtnome" placeholder="Nome" required>
              </div>
              <div class="form-group">
                <label for="id_produto">Telefone</label>
                <input type="text" class="form-control mr-2" name="txttelefone" id="txttelefone" placeholder="Telefone" required>
              </div>
              <div class="form-group">
                <label for="quantidade">Endereço</label>
                <input type="text" class="form-control mr-2" name="txtendereco" placeholder="Endereço" required>
              </div>
               <div class="form-group">
                <label for="fornecedor">Email</label>
                 <input type="email" class="form-control mr-2" name="txtemail" placeholder="Email" required>
              </div>
              <div class="form-group">
                <label for="fornecedor">CPF</label>
                 <input type="text" class="form-control mr-2" name="txtcpf" id="txtcpf" placeholder="CPF" required>
              </div>
            </div>
                   
            <div class="modal-footer">
               <button type="submit" class="btn btn-success mb-3" name="button">Salvar </button>


                <button type="button" class="btn btn-danger mb-3" data-dismiss="modal">Cancelar </button>
            </form>
            </div>
          </div>
        </div>
      </div>    




</body>
</html>




<!--CADASTRAR -->
<?php
if(isset($_POST['button'])){

  $nome = $_POST['txtnome'];
  $telefone = $_POST['txttelefone'];
  $endereco = $_POST['txtendereco'];
  $email = $_POST['txtemail'];
  $cpf = $_POST['txtcpf'];
  $data = date('Y-m-d');
  
  $query_verificar = " SELECT * FROM `clientes` WHERE `cpf` = '$cpf'";
  
  $result_verificar = mysqli_query($conexao,$query_verificar);
  $row_verificar = mysqli_num_rows($result_verificar);
  
  if($row_verificar > 0){
    echo "<script language='javascript'> window.alert('CPF cadastrado!');</script>";
    exit();

  }

  $query = "INSERT INTO `clientes` (`nome`,`telefone`,`endereco`,`email`,`cpf`,data) VALUES ('$nome','$telefone','$endereco','$email','$cpf','$data')";

  $result= mysqli_query($conexao,$query);

  if($result == ''){
    echo "<script language='javascript'> window.alert('Ocorreu um erro ao cadastrar!');</script>";
    
  }else{
    echo "<script language='javascript'> window.alert('Salvo com sucesso!');</script>";
    echo "<script language='javascript'>window.location='clientes.php';</script>";
  }

}
?>


<!--EXCLUIR -->
<?php 
if(@$_GET['func']=='deletar'){
  $id = $_GET['id'];
  $query = "DELETE FROM `clientes` WHERE id = '$id'";

  mysqli_query($conexao, $query);
  echo "<script language='javascript'> alert('Excluido com sucesso!');</script>";
  echo "<script language='javascript'>window.location='clientes.php';</script>";
}


?>


<!--EDITAR -->
<?php 
if(@$_GET['func'] == 'editar'){
  $id = $_GET['id'];
  $query = "SELECT * FROM `clientes` WHERE id = '$id' ";
  $result =mysqli_query($conexao,$query);

  while($res_1 = mysqli_fetch_array($result)){   

?>

 <!-- Modal -->
 <div id="modalEditar" class="modal fade" role="dialog">
        <div class="modal-dialog">
         <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              
              <h4 class="modal-title">Clientes</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
              <form method="POST" action="">
              <div class="form-group">
                <label for="id_produto">Nome</label>
                <input type="text" class="form-control mr-2" name="txtnome" placeholder="Nome" value="<?= $res_1["nome"]; ?>" required>
              </div>
              <div class="form-group">
                <label for="id_produto">Telefone</label>
                <input type="text" class="form-control mr-2" name="txttelefone" id="txttelefone" placeholder="Telefone" value="<?= $res_1["telefone"]; ?>" required>
              </div>
              <div class="form-group">
                <label for="quantidade">Endereço</label>
                <input type="text" class="form-control mr-2" name="txtendereco" placeholder="Endereço" value="<?= $res_1["endereco"]; ?>" required>
              </div>
               <div class="form-group">
                <label for="fornecedor">Email</label>
                 <input type="email" class="form-control mr-2" name="txtemail" placeholder="Email" value="<?= $res_1["email"]; ?>" required>
              </div>
              <div class="form-group">
                <label for="fornecedor">CPF</label>
                 <input type="text" class="form-control mr-2" name="txtcpf" id="txtcpf" placeholder="CPF" value="<?= $res_1["cpf"]; ?>" required>
              </div>
            </div>
                   
            <div class="modal-footer">
               <button type="submit" class="btn btn-success mb-3" name="buttonEditar">Salvar </button>


                <button type="button" class="btn btn-danger mb-3" data-dismiss="modal">Cancelar </button>
            </form>
            </div>
          </div>
        </div>
      </div>    

 




<script> $("#modalEditar").modal("show");</script>
<?php
  if(isset($_POST['buttonEditar'])){

  $nome = $_POST['txtnome'];
  $telefone = $_POST['txttelefone'];
  $endereco = $_POST['txtendereco'];
  $email = $_POST['txtemail'];
  $cpf = $_POST['txtcpf'];

 if($res_1['cpf']!= $cpf){
    $query_verificar = " SELECT * FROM `clientes` WHERE `cpf` = '$cpf'";

    $result_verificar = mysqli_query($conexao,$query_verificar);
    $row_verificar = mysqli_num_rows($result_verificar);

    if($row_verificar > 0){
      echo "<script language='javascript'> window.alert('CPF cadastrado!');</script>";
      exit();

    }

 }


  $query_editar = "UPDATE clientes set nome = '$nome',telefone = '$telefone',endereco ='$endereco',email='$email', cpf='$cpf' where id = '$id'";

  $result= mysqli_query($conexao,$query_editar);

  if($result == ''){
    echo "<script language='javascript'> window.alert('Erro de Edição!');</script>";
    
  }else{
    echo "<script language='javascript'> window.alert('Editado com  sucesso!');</script>";
    echo "<script language='javascript'>window.location='clientes.php';</script>";
  }

  }
?>

<?php } ?>
  
<?php } ?>
<!--MASCARAS -->

<script type="text/javascript">
    $(document).ready(function(){
      $('#txttelefone').mask('(00) 00000-0000');
      $('#txtcpf').mask('000.000.000-00');
    });
</script>



   