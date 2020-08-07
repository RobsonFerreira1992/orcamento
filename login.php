<?php
include('conexao.php');
session_start();



$query = "SELECT * FROM orcamento where `status` ='Aguardando'";
$result = mysqli_query($conexao, $query);

 while($res_1 = mysqli_fetch_array($result)){
    $data_geracao = $res_1['data_geracao'];
    $data_cancelamento = date('d/m/y', strtotime("-7 days", strtotime(date('Y/m/d'))));

    $query_editar = "UPDATE orcamento set `status` = 'Cancelado' where `data_geracao` = '$data_cancelamento' and `status` = 'Aguardando'";
    $result_editar = mysqli_query($conexao,$query_editar);
 }

 


if(empty($_POST['usuario']) || empty($_POST['senha'])){
    header('location:index.php');
    exit();
}

$usuario = mysqli_real_escape_string($conexao,$_POST['usuario']);
$senha = mysqli_real_escape_string($conexao,$_POST['senha']);

$query = " SELECT * from usuarios where usuario = '{$usuario}' and senha = '{$senha}'";

$result = mysqli_query($conexao,$query);

$dado = mysqli_fetch_array($result);

$row = mysqli_num_rows($result);

if($row > 0){
    $_SESSION['usuario'] = $usuario;
    $_SESSION['nome_usuario'] = $dado['nome'];
    $_SESSION['cargo_usuario'] = $dado['cargo'];

    if($_SESSION['cargo_usuario'] == 'Administrador' || $_SESSION['cargo_usuario'] == 'Gerente'){
        header('location:painel_admin.php');
        exit();
    }
    if($_SESSION['cargo_usuario'] == 'Tesoureiro'){
        header('location:painel_tesouraria.php');
        exit();
    }
    if($_SESSION['cargo_usuario'] == 'Funcionário'){
        header('location:painel_funcionario.php');
        exit();
    }


   
    exit();
}else{
    $_SESSION['nao_autenticado'] = true;
    header('location:index.php');
    exit();
}

?>