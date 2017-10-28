<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xqxuf="http://www.w3.org/2007/xquery-update-10"
                xmlns:xqx="http://www.w3.org/2005/XQueryX">

<!-- Initial creation                  2006-08-17: Jim Melton -->
<!-- Added revalidationDecl            2006-08-21: Jim Melton -->
<!-- Bring up to date with spec        2007-08-07: Jim Melton -->
<!-- Surround updating exprs w/parens  2007-09-13: Jim Melton -->
<!-- Added copyModifyExpr as alias for
       transformExpr                   2014-11-06: Jim Melton -->
<!-- Added transformWithExpr           2014-11-06: Jim Melton -->
<!-- Added updatingFunctionCall        2014-11-06: Jim Melton -->


<!-- TEMPORARY CHANGE to import the underlying stylesheet from a local file instead of the web -->
<xsl:import href="file:///e:/w3ccvs/WWW/XML/Group/qtspecs/specifications/xqueryx-30/src/xqueryx.xsl"/>
<!-- TEMPORARY CHANGE to import the underlying stylesheet from a local file instead of the web
<xsl:import href="http://www.w3.org/2005/XQueryX/xqueryx.xsl"/>
END OF TEMPORARY CHANGE to import the underlying stylesheet from a local file instead of the web -->


<!-- revalidationDecl                                         -->
<xsl:template match="xqxuf:revalidationDecl">
  <xsl:text>declare revalidation </xsl:text>
  <xsl:apply-templates/>
</xsl:template>


<!-- insertExpr                                               -->
<xsl:template match="xqxuf:insertExpr">
  <xsl:value-of select="$LPAREN"/>
  <xsl:text>insert nodes </xsl:text>
  <xsl:value-of select="$NEWLINE"/>
  <xsl:apply-templates select="xqxuf:sourceExpr"/>
  <xsl:value-of select="$NEWLINE"/>
  <xsl:apply-templates select="xqxuf:insertInto |
                               xqxuf:insertBefore |
                               xqxuf:insertAfter"/>
  <xsl:value-of select="$NEWLINE"/>
  <xsl:apply-templates select="xqxuf:targetExpr"/>
  <xsl:value-of select="$RPAREN"/>
</xsl:template>


<!-- sourceExpr                                               -->
<xsl:template match="xqxuf:sourceExpr">
  <xsl:apply-templates/>
</xsl:template>


<!-- insertInto                                               -->
<xsl:template match="xqxuf:insertInto">
  <xsl:if test="child::node()">
    <xsl:text>as </xsl:text>
  </xsl:if>
  <xsl:apply-templates/>
  <xsl:text>into </xsl:text>
</xsl:template>


<!-- insertAsFirst                                            -->
<xsl:template match="xqxuf:insertAsFirst">
  <xsl:text>first </xsl:text>
</xsl:template>


<!-- insertAsLast                                             -->
<xsl:template match="xqxuf:insertAsLast">
  <xsl:text>last </xsl:text>
</xsl:template>


<!-- insertAfter                                              -->
<xsl:template match="xqxuf:insertAfter">
  <xsl:text>after </xsl:text>
</xsl:template>


<!-- insertBefore                                             -->
<xsl:template match="xqxuf:insertBefore">
  <xsl:text>before </xsl:text>
</xsl:template>


<!-- targetExpr                                               -->
<xsl:template match="xqxuf:targetExpr">
  <xsl:apply-templates/>
</xsl:template>


<!-- deleteExpr                                               -->
<xsl:template match="xqxuf:deleteExpr">
  <xsl:value-of select="$LPAREN"/>
  <xsl:text>delete nodes </xsl:text>
  <xsl:apply-templates/>
  <xsl:value-of select="$RPAREN"/>
</xsl:template>


<!-- replaceExpr                                              -->
<xsl:template match="xqxuf:replaceExpr">
  <xsl:value-of select="$LPAREN"/>
  <xsl:text>replace </xsl:text>
  <xsl:if test="xqxuf:replaceValue">
    <xsl:text>value of </xsl:text>
  </xsl:if>
  <xsl:text>node </xsl:text>
  <xsl:apply-templates select="xqxuf:targetExpr"/>
  <xsl:text> with </xsl:text>
  <xsl:apply-templates select="xqxuf:replacementExpr"/>
  <xsl:value-of select="$RPAREN"/>
</xsl:template>


<!-- replacementExpr                                          -->
<xsl:template match="xqxuf:replacementExpr">
  <xsl:apply-templates/>
</xsl:template>


<!-- renameExpr                                               -->
<xsl:template match="xqxuf:renameExpr">
  <xsl:value-of select="$LPAREN"/>
  <xsl:text>rename node </xsl:text>
  <xsl:apply-templates select="xqxuf:targetExpr"/>
  <xsl:text> as </xsl:text>
  <xsl:apply-templates select="xqxuf:newNameExpr"/>
  <xsl:value-of select="$RPAREN"/>
</xsl:template>


<!-- newNameExpr                                              -->
<xsl:template match="xqxuf:newNameExpr">
  <xsl:apply-templates/>
</xsl:template>


<!-- transformExpr/copyModifyExpr                             -->
<xsl:template match="xqxuf:transformExpr | xqxuf:copyModifyExpr">
  <xsl:value-of select="$LPAREN"/>
  <xsl:text>copy </xsl:text>
  <xsl:apply-templates select="xqxuf:transformCopies"/>
  <xsl:value-of select="$NEWLINE"/>
  <xsl:text>  modify </xsl:text>
  <xsl:apply-templates select="xqxuf:modifyExpr"/>
  <xsl:value-of select="$NEWLINE"/>
  <xsl:text>  return </xsl:text>
  <xsl:apply-templates select="xqxuf:returnExpr"/>
  <xsl:value-of select="$RPAREN"/>
</xsl:template>


<!-- Part of transformExpr                                    -->
<xsl:template match="xqxuf:transformCopies">
  <xsl:call-template name="commaSeparatedList"/>
</xsl:template>


<!-- Part of transformExpr                                    -->
<xsl:template match="xqxuf:transformCopy">
  <xsl:apply-templates select="xqx:varRef"/>
  <xsl:text> := </xsl:text>
  <xsl:apply-templates select="xqxuf:copySource"/>
</xsl:template>

<!-- Part of transformExpr                                    -->
<xsl:template match="xqxuf:copySource">
  <xsl:apply-templates/>
</xsl:template>

<!-- Part of transformExpr                                    -->
<xsl:template match="xqxuf:modifyExpr">
  <xsl:apply-templates/>
</xsl:template>


<!-- Part of transformExpr                                    -->
<xsl:template match="xqxuf:returnExpr">
  <xsl:apply-templates/>
</xsl:template>


<!-- Over-ride the template for functionDecl in XQueryX.xsd   -->
<!-- [33]   	FunctionDecl	   ::=   	"function" EQName "(" ParamList? ")" ("as" SequenceType)? (FunctionBody | "external") -->
  <xsl:template match="xqx:functionDecl" priority="100">
    <xsl:text>declare</xsl:text>
    <xsl:apply-templates select="xqx:annotation"/>
    <xsl:if test="@xqx:updatingFunction and
                  @xqx:updatingFunction = 'true'">
      <xsl:text>updating </xsl:text>
    </xsl:if>
    <xsl:text> function </xsl:text>
    <xsl:apply-templates select="xqx:functionName"/>
    <xsl:apply-templates select="xqx:paramList"/>
    <xsl:apply-templates select="xqx:typeDeclaration"/>
    <xsl:choose>
      <xsl:when test="xqx:externalDefinition">
        <xsl:text> external </xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="xqx:functionBody"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


<!-- transformWithExpr                                        -->
  <xsl:template match="xqx:transformWithExpr">
    <xsl:text>transform with</xsl:text>
    <xsl:value-of select="$SPACE"/>
    <xsl:value-of select="$LBRACE"/>
    <xsl:value-of select="$SPACE"/>
    <xsl:apply-templates select="."/>
    <xsl:value-of select="$SPACE"/>
    <xsl:value-of select="$RBRACE"/>
    <xsl:value-of select="$NEWLINE"/>
  </xsl:template>


<!-- updatingFunctionCall                                     -->
  <xsl:template match="xqx:updatingFunctionCall">
    <xsl:if test="(xqx:functionName = 'node' or
                   xqx:functionName = 'document-node' or
                   xqx:functionName = 'element' or
                   xqx:functionName = 'attribute' or
                   xqx:functionName = 'schema-element' or
                   xqx:functionName = 'schema-attribute' or
                   xqx:functionName = 'processing-instruction' or
                   xqx:functionName = 'comment' or
                   xqx:functionName = 'text' or
                   xqx:functionName = 'function' or
                   xqx:functionName = 'namespace-node' or
                   xqx:functionName = 'item' or
                   xqx:functionName = 'if' or
                   xqx:functionName = 'switch' or
                   xqx:functionName = 'typeswitch' or
                   xqx:functionName = 'empty-sequence') and
                   ((not(xqx:functionName/@xqx:prefix) and not(xqx:functionName/@xqx:URI)) or
                    xqx:functionName/@xqx:prefix = '' or
                    xqx:functionName/@xqx:URI = '')">
      <xsl:variable name="message"><xsl:text>Incorrect XQueryX: function calls must not use unqualified "reserved" name "</xsl:text><xsl:value-of select="xqx:functionName"/><xsl:text>"</xsl:text></xsl:variable>
      <xsl:message terminate="yes"><xsl:value-of select="$message"/></xsl:message>
    </xsl:if>
    <xsl:text>invoke updating </xsl:text>
    <xsl:apply-templates select="xqx:functionName"/>
    <xsl:choose>
      <xsl:when test="xqx:arguments">
        <xsl:for-each select="xqx:arguments">
          <xsl:call-template name="parenthesizedList"/>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$LPAREN"/>
        <xsl:value-of select="$RPAREN"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>




</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2008. Progress Software Corporation. All rights reserved.

<metaInformation>
  <scenarios/>
  <MapperMetaTag>
    <MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
    <MapperBlockPosition></MapperBlockPosition>
    <TemplateContext></TemplateContext>
    <MapperFilter side="source"></MapperFilter>
  </MapperMetaTag>
</metaInformation>
-->