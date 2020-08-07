<?php
include('conexao.php');
session_start();
error_reporting(E_ALL);
ini_set("display_errors", 1);
?>

<!DOCTYPE html>
<html>
<head>
  <title>Compras</title>


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
  <a class="navbar-brand" href="painel_tesouraria.php"><big><big><i class="fa fa-arrow-left"></i></big></big></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
    <ul class="navbar-nav mr-auto">
      
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input name="txtpesquisar" class="form-control mr-sm-2" type="date" placeholder="Pesquisar" aria-label="Pesquisar">
      <button name="buttonPesquisar" class="btn btn-outline-success my-2 my-sm-0" type="submit"><i class="fa fa-search"></i></button>
    </form>
  </div>
</nav>





<div class="container">


    

      <br>


         <div class="row">
           <div class="col-sm-12">
            <button type="button" class="btn btn-success mb-3" data-toggle="modal" data-target="#modalExemplo">Inserir Venda </button>

           </div>

          
        </div>


          <div class="content">
            <div class="row">
              <div class="col-md-12">
                <div class="card">
                  <div class="card-header">
                    <h4 class="card-title"> Tabela de Compras</h4>
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">

                      <!--LISTAR TODOS OS CLIENTES -->

                      <?php


                        if(isset($_GET['buttonPesquisar']) and $_GET['txtpesquisar'] != ''){
                          $data = $_GET['txtpesquisar'];
                           $query = "select * from compras where data = '$data'  order by id asc"; 
                           
                        }else{
                         $query = "select * from compras where data = curDate()  order by id asc"; 
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
                            Valor
                          </th>
                          <th>
                            Peça
                          </th>
                          <th>
                            Funcionário
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
                            $valor = $res_1["valor"];
                            $peca = $res_1["peca"];
                            $funcionario = $res_1["funcionario"];
                            $data = $res_1["data"];
                            
                           
                            $id = $res_1["id"];

                            $data2 = implode('/', array_reverse(explode('-', $data)));

                            ?>

                            <tr>

                             <td><?php echo $valor; ?></td>
                             <td><?php echo $peca; ?></td> 
                             <td><?php echo $funcionario; ?></td>
                             <td><?php echo $data2; ?></td>
                            
                           
                             <td>
                            

                             <a class="btn btn-danger" href="compras.php?func=deleta&id=<?php echo $id; ?>"><i class="fa fa-minus-square"></i></a>

                             </td>
                            </tr>

                            <?php 
                              }                        
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
        <div class="modal-dialog">
         <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              
              <h4 class="modal-title">Compras</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
              <form method="POST" action="">
              <div class="form-group">
                <label for="id_produto">Valor</label>
                <input type="text" class="form-control mr-2" name="txtvalor" placeholder="Valor" required>
              </div>
              <div class="form-group">
                <label for="id_produto">Peça</label>
                <input type="text" class="form-control mr-2" name="txtpeca" placeholder="Peça" required>
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
            
          </p>
        </div>
      </div>   




</body>
</html>




<!--CADASTRAR -->

<?php
if(isset($_POST['button'])){
  $valor = $_POST['txtvalor'];
  $peca = $_POST['txtpeca'];
  $funcionario = $_SESSION['nome_usuario'];


$query = "INSERT into compras (valor, peca, funcionario, data) VALUES ('$valor', '$peca', '$funcionario', curDate())";

$result = mysqli_query($conexao, $query);


//RECUPERAR O ULTIMO ID LANÇADO
$query_id = "select * from compras order by id desc limit 1";
$result_id = mysqli_query($conexao, $query_id);
while($res_id = mysqli_fetch_array($result_id)){
  $id_ultimo = $res_id['id'];
  }

//INSERIR OS DADOS NA TABELA DE MOVIMENTAÇÕES
$query_mov = "INSERT into movimentacoes (tipo, movimento, valor, funcionario, data, id_movimento) VALUES ('Saida', 'Compra', '$valor', '$funcionario',  curDate(), '$id_ultimo' )";
mysqli_query($conexao, $query_mov);


$query_pro = "DELETE FROM produtos where produto = '$produto' ";
mysqli_query($conexao, $query_pro);


if($result == ''){
  echo "<script language='javascript'> window.alert('Ocorreu um erro ao Cadastrar!'); </script>";
}else{
    echo "<script language='javascript'> window.alert('Salvo com Sucesso!'); </script>";
    echo "<script language='javascript'> window.location='compras.php'; </script>";
}

}
?>


<!--EXCLUIR -->
<?php
if(@$_GET['func'] == 'deleta'){
  $id = $_GET['id'];
  
  $funcionario = $_SESSION['nome_usuario'];
  $query = "DELETE FROM compras where id = '$id'";

  $query = "DELETE FROM movimentacoes where movimento = 'Compra' and id_movimento = '$id'";
  mysqli_query($conexao, $query);


  //DEVOLVER O PRODUTO PARA AS VENDAS - NA TABELA PRODUTOS
  $query_produto = "INSERT INTO produtos (produto) values ('$produto') ";

  mysqli_query($conexao, $query_produto);


  echo "<script language='javascript'> window.location='compras.php'; </script>";
}
?>




   