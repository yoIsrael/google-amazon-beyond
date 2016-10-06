<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:SE="http://schemas.xmlsoap.org/soap/envelope/"
   xmlns:ns1="urn:GoogleSearch"
                version="1.0">
<xsl:output method="html" />
      
<!-- top-level match -->

<xsl:template match="/">
  <html><head><title>googleSearch.xsl</title>
<script language="javascript">
  function unescapeAll(){
    var spans=document.getElementsByTagName("span");
    for(var i=0;i &lt; spans.length;i++){ 
      var span=spans.item(i);
      if(span.className=="escData" &amp;&amp; span.firstChild)
        span.innerHTML=span.firstChild.nodeValue;
     }
  }
</script>
    </head>
    <body onload="unescapeAll()">
      <xsl:apply-templates
        select="SE:Envelope/SE:Body/ns1:doGoogleSearchResponse/return" />
    </body>
  </html>
</xsl:template>
<xsl:template match="return">
  <h3>Searched for: <xsl:value-of select="searchQuery"/></h3>
  <p>results 
    <xsl:value-of select="startIndex"/>..<xsl:value-of select="endIndex"/>
    of
    <xsl:if test="'false'=string(estimateIsExact)"> approximately </xsl:if>
    <xsl:value-of select="estimatedTotalResultsCount"/>
  </p>
  <xsl:apply-templates select="resultElements"/>
</xsl:template>


<xsl:template match="item">
  <div>
    <a href="{URL}">
      <span class="escData"><xsl:value-of select="title"/></span>
    </a>
  <xsl:text>&#160;</xsl:text>
  <span class="escData"><xsl:value-of select="snippet"/></span>
</div>
</xsl:template>    


</xsl:stylesheet>

