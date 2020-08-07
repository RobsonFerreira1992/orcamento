<?php

//carregar o dompdf
 require_once '../dompdf/autoload.inc.php';
 use Dompdf\Dompdf;

 $id = $_GET['id'];
 $id_orc = $_GET['id_orc'];
 $email = $_GET['email'];

 $html = utf8_encode(file_get_contents('http://localhost/cursos-projetos/orcamentos/rel/rel_os.php?id='.$id.'&id_orc='.$id_orc));
 
 
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

 $to = 'rob_chop@hotmail.com';
 $subject = 'Systec Ordem de serviço';
 $message = file_get_contents("http://localhost/orcamento/rel/rel_os.php");
 $dest = $email;
 $headers = 'Content-type: text/html; charset=utf-8;';
 mail($to,$subject,$message,$headers);
?>

<?php 
//Alimentando o Relatório








?>