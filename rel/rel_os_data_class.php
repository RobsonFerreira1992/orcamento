<?php
include("../conexao.php");
//carregar o dompdf
 require_once '../dompdf/autoload.inc.php';
 use Dompdf\Dompdf;

$dataInicial = $_POST['txtdataInicial'];
$dataFinal = $_POST['txtdataFinal'];
$status  =   $_POST['status'];



 $html = utf8_encode(file_get_contents($url."rel_os_data.php?dataInicial=".$dataInicial."&dataFinal=".$dataFinal."&status=".$status));
 
 
 // inicializador a classe do dompdf
 $pdf = new DOMPDF();

 //definir o tamanho do papel e orientação da página
 
 $pdf -> set_paper('A4', 'portrait');

 //carregar o conteúdo html

 $pdf->load_html(utf8_decode($html));

 //reiderizar o pdf

 $pdf -> render();

 //nomear o pdf gerado

 $pdf->stream(
     'relatorioOs.pdf',
     array('Attachment' => false)
 );
?>

<?php 
//Alimentando o Relatório








?>