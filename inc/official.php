<?php
$xmlDoc = new DOMDocument('1.0');
$xmlDoc->formatOutput = true;
$xmlDoc->load("http://assets.minecraft.net");
//$xmlDoc->load("assets.minecraft.xml");
$xslDoc = new DomDocument;
$xslDoc->load("xsl/assets.minecraft.xsl");
$proc = new XSLTProcessor;
$proc->importStyleSheet($xslDoc);
$strxml= $proc->transformToXML($xmlDoc);
echo ($strxml);
?>
