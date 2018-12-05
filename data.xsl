<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <meta charset="utf-8"/>
        <title></title>
      </head>
      <body>
        <xsl:apply-templates select="data/languages/lang"/>
        <xsl:apply-templates select="data/libs/lib"/>
        <xsl:apply-templates select="data/libs/tools"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="lang">
    <div>
      <xsl:attribute name="class">
        <xsl:choose>
          <xsl:when test="@typing = 'static'">static</xsl:when>
          <xsl:when test="@typing = 'dynamic'">dynamic</xsl:when>
          <xsl:otherwise>none</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <xsl:value-of select="name"/>
      <xsl:value-of select="fullname"/>
      <xsl:value-of select="usage"/>
    </div>
  </xsl:template>

  <xsl:template match="lib">
    <div>
      <xsl:number value="position()" format="1"/>
      <xsl:value-of select="name"/>
      <xsl:value-of select="@lang"/>
      <xsl:apply-templates select="features"/>
    </div>
  </xsl:template>

  <xsl:template match="features">
    <li>
      <xsl:if test="plugins = 'yes'">
        <xsl:attribute name="class">green</xsl:attribute>
      </xsl:if>
      <xsl:value-of select="plugins"/>
    </li>
    <li>
      <xsl:if test="cli = 'yes'">
        <xsl:attribute name="class">green</xsl:attribute>
      </xsl:if>
      <xsl:value-of select="cli"/>
    </li>
    <li>
      <xsl:if test="cdn = 'yes'">
        <xsl:attribute name="class">green</xsl:attribute>
      </xsl:if>
      <xsl:value-of select="cdn"/>
    </li>
  </xsl:template>

  <xsl:template match="tools">



  </xsl:template>


























</xsl:stylesheet>
