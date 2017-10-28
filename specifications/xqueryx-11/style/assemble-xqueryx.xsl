<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:g="http://www.w3.org/2001/03/XPath/grammar"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    exclude-result-prefixes="g xlink">

<!-- 
     This stylesheet does nothing at all (except for importing
     assemble-joint-spec.xsl).  It exists for one purpose only:
     to provide symmetry between XQueryX and various other specifications
     (e.g., Full Text, Update Facility, XQuery 1.1). 
-->

  <xsl:import href="../../../style/assemble-joint-spec.xsl"/>

  <xsl:output method="xml" indent="yes"
              doctype-system="../../../schema/xsl-query.dtd" />

<!-- Generate a comment that identifies as much as we can about the XSLT processor being used -->
  <xsl:template match="/">
    <xsl:variable name="XSLTprocessor">
      <xsl:text>XSLT Processor: </xsl:text>
      <xsl:value-of select="system-property('xsl:vendor')"/>
      <xsl:if test="system-property('xsl:version') = '2.0'">
        <xsl:text> </xsl:text>
        <xsl:value-of select="system-property('xsl:product-name')"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="system-property('xsl:product-version')"/>
      </xsl:if>
    </xsl:variable>
    <xsl:message><xsl:value-of select="$XSLTprocessor"/></xsl:message>
    <xsl:comment><xsl:value-of select="$XSLTprocessor"/></xsl:comment>
    <xsl:apply-templates/>
  </xsl:template> 

</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2006. Progress Software Corporation. All rights reserved.
<metaInformation>
<scenarios/><MapperMetaTag><MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/><MapperBlockPosition></MapperBlockPosition><TemplateContext></TemplateContext><MapperFilter side="source"></MapperFilter></MapperMetaTag>
</metaInformation>
-->