<?php
$xmlDoc = new DOMDocument('1.0');
$xmlDoc->formatOutput = true;
$xmlDoc->load("assets.minecraft.xml");
$xslDoc = new DomDocument;
$xslDoc->load("xsl/local.assets.minecraft.xsl");
$proc = new XSLTProcessor;
$proc->importStyleSheet($xslDoc);
$strxml= $proc->transformToXML($xmlDoc);
echo ($strxml);
?>
