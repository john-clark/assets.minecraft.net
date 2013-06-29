<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	        xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	        xmlns:s3="http://s3.amazonaws.com/doc/2006-03-01/" 
		exclude-result-prefixes="xsl s3">
<xsl:output 	method="xml" 
		omit-xml-declaration="no" 
		indent="yes"/>
<xsl:variable 	name="ns" 
		select="'http://s3.amazonaws.com/doc/2006-03-01/'"/>

<xsl:template match="/">
	<html>
	<head>
	<title>Minecraft Assets</title>
	<link rel="stylesheet" type="text/css" href="assets.minecraft.css"/>
	</head>
	<body>
	<xsl:apply-templates select="s3:ListBucketResult"/> 
	</body>
	</html>
</xsl:template>

<xsl:template match="s3:ListBucketResult">
    <xsl:variable name="bucket-name" select="s3:Name"/>
    <table><tr>
    <th class="name">File</th>
    <th class="size">Size</th>
    <th class="last">Date</th>
    <th class="md5e">Md5e</th>
    </tr>
    <xsl:for-each select="s3:Contents">
	<xsl:sort select="s3:LastModified" order="descending" />

    <xsl:if test="s3:Size = 0">
      <tr>
        <td colspan="4" class="vers">
	<table><tr><th>Version</th>
        <td><xsl:value-of select="s3:Key"/></td></tr>
	</table>
	</td>
      </tr>
    </xsl:if>
    <xsl:if test="s3:Size != 0">
      <tr>
	<td class="name">
	<a class="name" href="http://s3.amazonaws.com/{$bucket-name}/{s3:Key}"><xsl:value-of select="substring-after(s3:Key, '/')"/></a></td>
        
	<td class="size">
	<xsl:value-of select="format-number(s3:Size div 1048576, '###,###.0')"/> MB</td>
	<td class="last">
	<xsl:value-of select="substring(s3:LastModified,1,10)"/></td>

	<td class="md5e">
	<xsl:value-of select="s3:ETag"/></td>
      </tr>
    </xsl:if>
    </xsl:for-each>
    </table>
</xsl:template>

</xsl:stylesheet>
