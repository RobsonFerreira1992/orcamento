<?php

//carregar o dompdf
 require_once '../dompdf/autoload.inc.php';
 use Dompdf\Dompdf;

 $id = $_GET['id'];
 $email = $_GET['email'];

 $html = utf8_encode(file_get_contents('http://localhost//cursos-projetos/orcamentos/rel/rel_orcamento.php?id='.$id));
 
 
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
     'relatorioOrcamento.pdf',
     array('Attachment' => false)
 );

 $to = 'rob_chop@hotmail.com';
 $subject = 'Systec Orçamento';
 $message = file_get_contents("http://localhost/orcamento/rel/rel_orcamento.php");
 $dest = $email;
 $headers = 'Content-type: text/html; charset=utf-8;';
 mail($to,$subject,$message,$headers);
?>

<?php 
//Alimentando o Relatório








?>