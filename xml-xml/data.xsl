<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes"/>
  <xsl:template match="/">
    <database>
      <lngs>
        <xsl:apply-templates select="data/languages/lang"/>
      </lngs>
      <ls>
        <xsl:apply-templates select="data/libs/lib"/>
      </ls>
      <xsl:copy-of select="data/tools"/>
      <is>
        <xsl:apply-templates select="data/ides/ide"/>
      </is>
      <xsl:copy-of select="data/browsers"/>
      <persons>
        <xsl:apply-templates select="data/person"/>
      </persons>
    </database>
  </xsl:template>
  <xsl:template match="lang">
    <lng>
      <xsl:attribute name="{translate(usage, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')}">
        <xsl:text>true</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="name">
        <xsl:value-of select="name"/>
      </xsl:attribute>
      <xsl:attribute name="fullname">
        <xsl:value-of select="fullname"/>
      </xsl:attribute>
    </lng>
  </xsl:template>
  <xsl:template match="lib">
    <l>
      <params>
        <p>
          <n>
            name
          </n>
          <v>
            <xsl:value-of select="name"/>
          </v>
        </p>
        <p>
          <n>
            lang
          </n>
          <v>
            <xsl:value-of select="@lang"/>
          </v>
        </p>
        <p>
          <n>
            usability
          </n>
          <v>
            <xsl:value-of select="@usability"/>
          </v>
        </p>
      </params>
      <xsl:apply-templates select="features/*"/>
    </l>
  </xsl:template>
  <xsl:template match="features/*">
    <xsl:element name="{.}">
      <xsl:value-of select="local-name()"/>
    </xsl:element>
  </xsl:template>
  <xsl:template match="ide">
    <xsl:copy>
      <params>
        <xsl:apply-templates select="*"/>
      </params>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="ide/*">
    <param>
      <xsl:attribute name="{local-name()}">
        <xsl:value-of select="."/>
      </xsl:attribute>
    </param>
  </xsl:template>
  <xsl:template match="person">
    <xsl:element name="{@id}">
      <xsl:attribute name="name">
        <xsl:value-of select="name"/>
      </xsl:attribute>
      <xsl:attribute name="surname">
        <xsl:value-of select="surname"/>
      </xsl:attribute>
      <xsl:attribute name="city">
        <xsl:value-of select="city"/>
      </xsl:attribute>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
