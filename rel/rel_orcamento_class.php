<?php

//carregar o dompdf
 require_once '../dompdf/autoload.inc.php';
 use Dompdf\Dompdf;

 $html = utf8_encode(file_get_contents('rel_orcamento.php'));


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

 

?>