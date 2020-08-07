
<?php 
$dataInicial = $_GET['dataInicial'];
$dataFinal = $_GET['dataFinal'];
$status = $_GET['status'];

$dataIni = implode('/', array_reverse(explode('-', $dataInicial)));
$dataFin = implode('/', array_reverse(explode('-', $dataFinal)));

include('../conexao.php');

//$query = "";
//$result = mysqli_query($conexao, $query);

// while($res_1 = mysqli_fetch_array($result)){

//$data2 = implode('/', array_reverse(explode('-', $res_1['data_geracao'])));



 ?>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<style>

 @page {
            margin: 0px;

        }

.footer {
    position:absolute;
    bottom:0;
    width:100%;
    background-color: #ebebeb;
    padding:10px;
}

.cabecalho {    
    background-color: #ebebeb;
    padding-top:15px;
    margin-bottom:30px;
}

.titulo{
	margin:0;
}

.areaTotais{
	border : 0.5px solid #bcbcbc;
	padding: 15px;
	border-radius: 5px;
	margin-right:25px;
}

.areaTotal{
	border : 0.5px solid #bcbcbc;
	padding: 15px;
	border-radius: 5px;
	margin-right:25px;
	background-color: #f9f9f9;
	margin-top:2px;
}

.pgto{
	margin:1px;
}



</style>


<div class="cabecalho">
	
		<div class="row">
			<div class="col-sm-5">	
			  <img src="../img/logo.png" width="250px">
			</div>
			<div class="col-sm-7">	
			 <h3 class="titulo"><b>SysTec Freitas - Assistência Técnica</b></h3>
			 <h6 class="titulo">Rua da Q-Cursos Networks Nº 1000, Centro - BH - MG - CEP 30555-555</h6>
			</div>
		</div>
	

</div>

<div class="container">

		
			<div class="row">
				<div class="col-sm-6">	
				   <big><big> RELATÓRIO DE ORDEM   </big> </big> 
				</div>
				<div class="col-sm-6">	
				<small><?php 
					if($status == 'Todos'){
						echo 'Todos as Ordens de serviços';
					}else{
						echo 'Orçamentos com Status de: '.$status;
					}
				 ?></small>
				</div>
				
			</div>

			<div class="row">
				<div class="col-sm-6">	
				 
				</div>
				<div class="col-sm-6">	
				<small><b> Data Inicial:</b> <?php echo $dataIni; ?> <b> Data Final:</b> <?php echo $dataFin; ?> </small>
				</div>
				
			</div>
		
		<hr>

			

						
		<br><br>

		<?php
		  $total_orc = 0;
		  $quant = 0;
		  $quant_aberto = 0;
		  $quant_fechado = 0;
		  $quant_cancelado = 0;
					  

		 if($status != 'Todos'){
                          
            $query = "select * from os where (data_abertura >= '$dataInicial' and data_abertura <= '$dataFinal') and status = '$status' order by data_abertura asc";
            }
            else{
            $query = "select * from os where data_abertura >= '$dataInicial' and data_abertura <= '$dataFinal'  order by data_abertura asc";
            }

                

            $result = mysqli_query($conexao, $query);
            //$dado = mysqli_fetch_array($result);
            $row = mysqli_num_rows($result);

            if($row == ''){

                echo "<h3> Não existem dados cadastrados no banco </h3>";

            }else{

             ?>


		<table class="table">
			<tr bgcolor="#f9f9f9">
				<td style="font-size:12px"> <b>Técnico</b> </td>
				<td style="font-size:12px"> <b>Valor Total</b> </td>
				<td style="font-size:12px"> <b> Data Abertura</b> </td>
				<td style="font-size:12px"> <b> Data Fechamento</b> </td>
				<td style="font-size:12px"> <b> Status</b> </td>
				
			</tr>
			

                 <?php 
                          

                          while($res_1 = mysqli_fetch_array($result)){
                            $tecnico = $res_1["tecnico"];
                            $total = $res_1["total"];
                            $data_abertura = $res_1["data_abertura"];
                            $data_fechamento = $res_1["data_fechamento"];
                            $status_os = $res_1["status"];

                            $query_tecnico = "select * from funcionarios where id = '$tecnico'";
                              
                            $result_tecnico = mysqli_query($conexao, $query_tecnico);

                            while($res_tecnico = mysqli_fetch_array($result_tecnico)){
        
                              $nome_tecnico = $res_tecnico['nome'];

                            $data_ab = implode('/', array_reverse(explode('-', $data_abertura)));
							$data_fec = implode('/', array_reverse(explode('-', $data_fechamento)));
							
                           
                            $total_os = $total_os + $total;
                            $quant = $quant + 1;

                            if($status_os == 'Aberto'){
                            	$quant_aberto = $quant_aberto + 1;
                            }

                            if($status_os == 'Fechado'){
                            	$quant_fechado = $quant_fechado + 1;
                            }
                         
                         	if($status_os == 'Cancelado'){
                            	$quant_cancelado = $quant_cancelado + 1;
                            }
                         
                         
                         
                            ?>

                <tr>
                    <td style="font-size:12px"> <?php echo $nome_tecnico; ?> </td>
                    <td style="font-size:12px"> R$<?php echo $total; ?> </td>
                    <td style="font-size:12px"> <?php echo $data_ab; ?> </td>
                    <td style="font-size:12px"> <?php echo $data_fec; ?> </td>
                    <td style="font-size:12px"> <?php echo $status_os; ?> </td>
				
				</tr>

			<?php } } ?>
		</table>

	<?php } ?>


		<hr>
		

		<hr>

		<?php
		if($status == 'Todos'){

			?>

			<div class="row">
				<div class="col-md-12">	
				 <p style="font-size:12px">
				 	 <b>Ordem de serviço Aberto</b>  <?php echo $quant_aberto; ?> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 	  <b>Ordem de serviço fechado:</b>  <?php echo $quant_fechado; ?> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 	   <b>Ordem de serviço cancelado:</b>  <?php echo $quant_cancelado; ?> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 	   

				  </p>
				</div>
				
			</div>

		<?php }else{

			?>

			<div class="row">
				<div class="col-sm-8">	
				 <small><b> Quantidade de Ordem de serviços:</b> <?php echo $quant; ?> </small>
				</div>
				<div class="col-sm-4">	
				 <small><b>  Total OS:</b> R$<?php echo $total_orc; ?>,00 </small>
				</div>
				
			</div>

			<?php
		}

			?>
		

			
			

	
</div>


<div class="footer">
 <p style="font-size:12px" align="center">Desenvolvido por Hugo Vasconcelos - Q-Cursos Networks</p> 
</div>


