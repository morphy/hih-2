<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <html>
      <head>
        <meta charset="utf-8"/>
        <title>XSLT 2</title>
        <link rel="stylesheet" href="font.css"/>
        <link rel="stylesheet" href="style.css"/>
      </head>
      <body>
        <ul>
          <xsl:apply-templates select="data/languages/lang"/>
        </ul>
        <ul>
          <xsl:apply-templates select="data/libs/lib"/>
        </ul>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="lang">
    <li>
      <ul>
        <li>
          <xsl:value-of select="name"/>
        </li>
        <li>
          <xsl:value-of select="fullname"/>
        </li>
        <li>
          <xsl:value-of select="usage"/>
        </li>
      </ul>
    </li>
  </xsl:template>
  <xsl:template match="lib">
    <li>
      <ul>
        <li>
          <xsl:value-of select="name"/>
          <xsl:text>-</xsl:text>
          <xsl:value-of select="@lang"/>
          <xsl:text>-</xsl:text>
          <xsl:value-of select="@usability"/>
        </li>
        <li>
          <xsl:attribute name="class">
            <xsl:value-of select="features/plugins"/>
          </xsl:attribute>
          <xsl:text>plugins</xsl:text>
        </li>
        <li>
          <xsl:attribute name="class">
            <xsl:value-of select="features/cli"/>
          </xsl:attribute>
          <xsl:text>cli</xsl:text>
        </li>
        <li>
          <xsl:attribute name="class">
            <xsl:value-of select="features/cdn"/>
          </xsl:attribute>
          <xsl:text>cdn</xsl:text>
        </li>
      </ul>
    </li>
  </xsl:template>
</xsl:stylesheet>
