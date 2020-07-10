<?php
include('conexao.php');
session_start();
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