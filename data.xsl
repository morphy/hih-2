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
        <xsl:apply-templates select="data/tools"/>
        <xsl:apply-templates select="data/browsers/browser"/>
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
    <xsl:for-each select="tool">
      <xsl:sort data-type="number" select="@usability"/>
      <div>
        <xsl:number value="position()" format="1"/><br/>
        <xsl:value-of select="@usability"/>
        <xsl:apply-templates select="name"/>
        <xsl:apply-templates select="version/@vr"/>
      </div>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="name">
    <xsl:value-of select="full/text()"/>
    <xsl:value-of select="full/short"/>
    <img>
      <xsl:attribute name="src">
        <xsl:value-of select="logo/@src"/>
      </xsl:attribute>
      <xsl:attribute name="alt">an image</xsl:attribute>
    </img>
  </xsl:template>

  <xsl:template match="@vr">
    <span>
      <xsl:value-of select="translate(., ' ', ':')"/>
    </span>
  </xsl:template>

  <xsl:template match="browser">
    <div>
      <xsl:value-of select="title"/>
      <a>
        <xsl:attribute name="href">
          <xsl:value-of select="website/@link"/>
        </xsl:attribute>
        <xsl:value-of select="website"/>
      </a>
      <xsl:apply-templates select="date-and-version"/>
      <xsl:apply-templates select="@engine"/>
    </div>
  </xsl:template>

  <xsl:template match="date-and-version">
    <xsl:value-of select="."/>
    <xsl:text>release date: </xsl:text>
    <xsl:value-of select="@date"/>
  </xsl:template>

  <xsl:template match="@engine">
    <img alt="an image">
      <xsl:attribute name="src">
        <xsl:value-of select="concat('img/', ., '.png')"/>
      </xsl:attribute>
    </img>
  </xsl:template>



























</xsl:stylesheet>
