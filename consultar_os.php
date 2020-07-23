<?php
include('conexao.php');

?>

<!DOCTYPE html>
<html>
<head>
  <title>Consultar OS</title>


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
    <form class="form-inline my-2 my-lg-0">
      <select class="form-control mr-2" id="category" name="status">
        <option value="Todos">Todos</option>
        <option value="Aberto">Aberto</option>
        <option value="Fechado">Fechado</option>
        <option value="Cancelado">Cancelado</option>

      </select>

      <input name="txtpesquisar" class="form-control mr-sm-2" type="date" placeholder="Pesquisar" aria-label="Pesquisar">
      <button name="buttonPesquisar" class="btn btn-outline-success my-2 my-sm-0" type="submit"><i class="fa fa-search"></i></button>
    </form>
  </div>
</nav>





<div class="container">

      <br>
         <div class="row">

        </div>

          <div class="content">
            <div class="row">
              <div class="col-md-12">
                <div class="card">
                  <div class="card-header">
                    <h4 class="card-title"> Ordem de Serviço</h4>
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">

                      <!--LISTAR TODOS OS CLIENTES -->

                      <?php
                              if(isset($_GET['buttonPesquisar']) and $_GET['txtpesquisar'] != '' and $_GET['status'] != 'Todos'){
                                $data = $_GET['txtpesquisar'] . '%';
                                $statusOrc = $_GET['status'];
                                $data2 = date("Y-m-d");

                                $query = "select * from os  where data_abertura = '$data' and status = '$statusOrc' order by id asc";

                              }else if(isset($_GET['buttonPesquisar']) and $_GET['txtpesquisar'] == '' and $_GET['status'] != 'Todos'){
                                $statusOrc = $_GET['status'];
                                $query = "select * from os where data_abertura = '$data2' and status = '$statusOrc' order by id asc"; 

                              }else if(isset($_GET['buttonPesquisar']) and $_GET['txtpesquisar']!= '' and $_GET['status'] == 'Todos'){
                                $data = $_GET['txtpesquisar'] . '%';
                                $query = "select * from os where data_abertura = '$data' order by id asc"; 


                              }else{
                                  $query = "select * from os where data_abertura = '$data2'  order by id asc"; 
                              }

                        

                        $result = mysqli_query($conexao, $query);
                        //$dado = mysqli_fetch_array($result);
                        $row = mysqli_num_rows($result);

                        if($row == ''){

                            echo "<h3> Não existem dados cadastrados no banco </h3>";

                        }else{

                           ?>                         

                    <table class="table">
                        <thead class=" text-primary">
                          <th>
                            Cliente
                          </th>
                          <th>
                            Produto
                          </th>
                          <th>
                            Técnico
                          </th>
                           <th>
                            Valor Total
                          </th>
                            <th>
                            Data abertura
                          </th>
                          <th>
                            Data fechamento
                          </th>
                          <th>
                            Status
                          </th>
                          <th>
                            Ações
                          </th>
                        </thead>
                        <tbody>
                         
                         <?php 

                          while($res_1 = mysqli_fetch_array($result)){
                            $cliente = $res_1["cliente"];
                            $tecnico = $res_1["tecnico"];
                            $produto = $res_1["produto"];
                            $valor_total = $res_1["total"];
                            $status = $res_1["status"];
                            $data_abertura = $res_1["data_abertura"];
                            $data_fechamento = $res_1["data_fechamento"];
                            $data2 = implode('/', array_reverse(explode('-', $data_abertura)));
                            $data3 = implode('/', array_reverse(explode('-', $data_fechamento)));


                            $id = $res_1["id"];

                            $query_cliente = "select * from clientes where cpf = '$cliente'";

                            $result_cliente = mysqli_query($conexao, $query_cliente);

                            while($res_cliente = mysqli_fetch_array($result_cliente)){

                                    $nome_cliente = $res_cliente['nome'];

                            
                            $query_tecnico = "select * from funcionarios where id = '$tecnico'";
                            
                            $result_tecnico = mysqli_query($conexao, $query_tecnico);

                            while($res_tecnico = mysqli_fetch_array($result_tecnico)){
        
                                    $nome_tecnico = $res_tecnico['tecnico'];

                            
                        
                            ?>

                            <tr>

                             <td><?php echo $nome_cliente; ?></td>
                             <td><?php echo $produto; ?></td>
                             <td><?php echo $nome_tecnico; ?></td> 
                             <td><?php echo $valor_total; ?></td>
                             <td><?php echo $data2; ?></td> 
                             <td><?php echo $data3; ?></td> 
                             <td><?php echo $status; ?></td>  
                             <td>
                             <a class="btn btn-info" href="abrir_orcamentos.php?func=edita&id=<?php echo $id; ?>"><i class="fa fa-pencil-square-o"></i></a>

                             <a class="btn btn-danger" href="abrir_orcamentos.php?func=deleta&id=<?php echo $id; ?>"><i class="fa fa-minus-square"></i></a>

                             </td>
                            </tr>

                            <?php 
                              }  }  }                    
                            ?>
                            

                        </tbody>
                    </table>
                          <?php 
                              }                        
                            ?>
                    </div>
                  </div>
                </div>
              </div>

</div>




 <!-- Modal -->
      <div id="modalExemplo" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
         <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              
              <h4 class="modal-title">Novo Orçamento</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
              <form method="POST" action="">
               <div class="form-group">
                <label for="fornecedor">CPF</label>
                 <input type="text" class="form-control mr-2" name="txtcpf" id="txtcpf" placeholder="CPF" required>
              </div>
              <div class="form-group">
                <label for="fornecedor">Técnico</label>
                  
                  <select class="form-control mr-2" id="category" name="funcionario">
                  <?php
                  
                  $query = "SELECT * FROM funcionarios where cargo ='Funcionário' ORDER BY nome asc";
                  $result = mysqli_query($conexao, $query);

                  if(count($result)){
                    while($res_1 = mysqli_fetch_array($result)){
                        ?>                                             
                    <option value="<?php echo $res_1['id']; ?>"><?php echo $res_1['nome']; ?></option> 
                        <?php      
                      }
                  }
                  ?>
                  </select>
              </div>
              <div class="form-group">
                <label for="quantidade">Produto</label>
                <input type="text" class="form-control mr-2" name="txtproduto" placeholder="Produto" required>
              </div>
              <div class="form-group">
                <label for="quantidade">Num Série</label>
                <input type="text" class="form-control mr-2" name="txtserie" placeholder="serie" required>
              </div>
              <div class="form-group">
                <label for="quantidade">Defeito</label>
                <input type="text" class="form-control mr-2" name="txtdefeito" placeholder="Defeito" required>
              </div>
              <div class="form-group">
                <label for="quantidade">Observações</label>
                <input type="text" class="form-control mr-2" name="txtobs" placeholder="Obeservação" required>
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
  $nome = $_POST['txtcpf'];
  $tecnico= $_POST['funcionario'];
  $produto= $_POST['txtproduto'];
  $serie = $_POST['txtserie'];
  $defeito = $_POST['txtdefeito'];
  $obs = $_POST['txtobs'];
  $data = date('Y-m-d');


 //VERIFICAR SE O CPF JÁ ESTÁ CADASTRADO
 $query_verificar = "select * from clientes where cpf = '$nome' ";

 $result_verificar = mysqli_query($conexao, $query_verificar);
 $row_verificar = mysqli_num_rows($result_verificar);

 if($row_verificar <= 0){
 echo "<script language='javascript'> window.alert('Cliente não cadastrado!'); </script>";
 exit();
 }
 


$query = "INSERT into orcamento (`cliente`, `tecnico`, `produto`, `serie`, `problema`, `obs`,`valor_total`,`data_abertura`,`status`) VALUES ('$nome', '$tecnico', '$produto', '$serie', '$defeito','$obs',0,'$data', 'Aberto' )";

$result = mysqli_query($conexao, $query);

if($result == ''){
  echo "<script language='javascript'> window.alert('Ocorreu um erro ao Cadastrar!'); </script>";
}else{
    echo "<script language='javascript'> window.alert('Salvo com Sucesso!'); </script>";
    echo "<script language='javascript'> window.location='abrir_orcamentos.php'; </script>";
}

}
?>


<!--EXCLUIR -->
<?php
if(@$_GET['func'] == 'deleta'){
  $id = $_GET['id'];
  $query = "DELETE FROM orcamento where id = '$id'";
  mysqli_query($conexao, $query);
  echo "<script language='javascript'> window.location='abrir_orcamentos.php'; </script>";
}
?>



<!--EDITAR -->
<?php
if(@$_GET['func'] == 'edita'){  
$id = $_GET['id'];
$query = "select * from orcamento where id = '$id'";
$result = mysqli_query($conexao, $query);

 while($res_1 = mysqli_fetch_array($result)){


?>

  <!-- Modal -->
  <div id="modalEditar" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
         <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              
              <h4 class="modal-title">Editar Orçamento</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
              <form method="POST" action="">
               
              <div class="form-group">
                <label for="fornecedor">Técnico</label>
                  
                  <select class="form-control mr-2" id="category" name="funcionario">
                  <?php
                  
                  $query = "SELECT * FROM funcionarios where cargo ='Funcionário' ORDER BY nome asc";
                  $result = mysqli_query($conexao, $query);

                  if(count($result)){
                    while($res_2 = mysqli_fetch_array($result)){
                        ?>                                             
                    <option value="<?php echo $res_2['id']; ?>"><?php echo $res_2['nome']; ?></option> 
                        <?php      
                      }
                  }
                  ?>
                  </select>
              </div>
              <div class="form-group">
                <label for="quantidade">Produto</label>
                <input type="text" class="form-control mr-2" name="txtproduto" value="<?php echo $res_1['produto']; ?>" placeholder="Produto" required>
              </div>
              <div class="form-group">
                <label for="quantidade">Num Série</label>
                <input type="text" class="form-control mr-2" name="txtserie"  value="<?php echo $res_1['serie']; ?>" placeholder="serie" required>
              </div>
              <div class="form-group">
                <label for="quantidade">Defeito</label>
                <input type="text" class="form-control mr-2" name="txtdefeito" value="<?php echo $res_1['problema']; ?>"  placeholder="Defeito" required>
              </div>
              <div class="form-group">
                <label for="quantidade">Observações</label>
                <input type="text" class="form-control mr-2" name="txtobs" value="<?php echo $res_1['obs']; ?>" placeholder="Obeservação" required>
              </div>
               
             
            </div>
                   
            <div class="modal-footer">
               <button type="submit" class="btn btn-success mb-3" name="buttonEditar">Editar</button>


                <button type="button" class="btn btn-danger mb-3" data-dismiss="modal">Cancelar </button>
            </form>
            </div>
          </div>
        </div>
      </div>    
 

 <script> $("#modalEditar").modal("show"); </script> 

<!--Comando para editar os dados UPDATE -->
<?php
if(isset($_POST['buttonEditar'])){
  
  $tecnico = $_POST['funcionario'];
  $produto = $_POST['txtproduto'];
  $serie   = $_POST['txtserie'];
  $defeito = $_POST['txtdefeito'];
  $obs     = $_POST['txtobs'];


 
 


$query_editar = "UPDATE orcamento set `tecnico` = '$tecnico', `produto` = '$produto', `serie` = '$serie', `problema` = '$defeito', `obs` = '$obs' where id = '$id' ";

$result_editar = mysqli_query($conexao, $query_editar);

if($result_editar == ''){
  echo "<script language='javascript'> window.alert('Ocorreu um erro ao Editar!'); </script>";
}else{
    echo "<script language='javascript'> window.alert('Editado com Sucesso!'); </script>";
    echo "<script language='javascript'> window.location='abrir_orcamentos.php'; </script>";
}

}
?>


<?php } }  ?>


<!--MASCARAS -->

<!-- <script type="text/javascript">
    $(document).ready(function(){
      $('#txttelefone').mask('(00) 00000-0000');
      $('#txtcpf').mask('000.000.000-00');
      });
</script> -->



   