<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:variable name="clicker">
    <a class="clicker" href="#"/>
  </xsl:variable>
  <xsl:template match="/">
    <html>
      <head>
        <meta charset="utf-8"/>
        <title>XSLT</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700"/>
        <link rel="stylesheet" href="style.css"/>
      </head>
      <body>
        <table>
          <thead>
            <tr>
              <th>Name</th>
              <th>Full name</th>
              <th>Usage</th>
            </tr>
          </thead>
          <tbody>
            <xsl:apply-templates select="data/languages/lang"/>
          </tbody>
        </table>
        <xsl:copy-of select="$clicker"/>
        <table>
          <thead>
            <tr>
              <th>#</th>
              <th>Name</th>
              <th>Language</th>
              <th>Plugins</th>
              <th>CLI</th>
              <th>CDN</th>
            </tr>
          </thead>
          <tbody>
            <xsl:apply-templates select="data/libs/lib"/>
          </tbody>
        </table>
        <xsl:copy-of select="$clicker"/>
        <div class="cards">
          <xsl:apply-templates select="data/tools"/>
        </div>
        <xsl:copy-of select="$clicker"/>
        <div class="gallery">
          <xsl:apply-templates select="data/browsers/browser"/>
        </div>
        <table>
          <thead>
            <tr>
              <th>UNIQID</th>
              <th>Name</th>
              <th>Vendor</th>
              <th>Version</th>
              <th>Languages</th>
            </tr>
          </thead>
          <tbody>
            <xsl:apply-templates select="data/ides/ide[@used='yes']"/>
          </tbody>
        </table>
        <table>
          <thead>
            <tr>
              <th>First lang</th>
            </tr>
          </thead>
          <tbody>
            <xsl:apply-templates select="data/languages/lang[1]"/>
          </tbody>
        </table>
        <table>
          <thead>
            <tr>
              <th>First lib</th>
            </tr>
          </thead>
          <tbody>
            <xsl:apply-templates select="data/libs/lib[1]"/>
          </tbody>
        </table>
        <table>
          <thead>
            <tr>
              <th>First ide</th>
            </tr>
          </thead>
          <tbody>
            <xsl:apply-templates select="data/ides/ide[1]"/>
          </tbody>
        </table>
        <xsl:apply-templates select="data/person[@id='author']"/>
        <xsl:call-template name="message"/>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="lang">
    <tr>
      <xsl:attribute name="class">
        <xsl:choose>
          <xsl:when test="@typing = 'static'">static</xsl:when>
          <xsl:when test="@typing = 'dynamic'">dynamic</xsl:when>
          <xsl:otherwise>none</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
      <td><xsl:value-of select="name"/></td>
      <td><xsl:value-of select="fullname"/></td>
      <td><xsl:value-of select="usage"/></td>
    </tr>
  </xsl:template>
  <xsl:template match="lib">
    <tr>
      <td><xsl:number value="position()" format="a"/></td>
      <td><xsl:value-of select="name"/></td>
      <td><xsl:value-of select="@lang"/></td>
      <xsl:apply-templates select="features"/>
    </tr>
  </xsl:template>
  <xsl:template match="features">
    <td>
      <xsl:if test="plugins = 'yes'">
        <xsl:attribute name="class">green</xsl:attribute>
      </xsl:if>
      <xsl:value-of select="plugins"/>
    </td>
    <td>
      <xsl:if test="cli = 'yes'">
        <xsl:attribute name="class">green</xsl:attribute>
      </xsl:if>
      <xsl:value-of select="cli"/>
    </td>
    <td>
      <xsl:if test="cdn = 'yes'">
        <xsl:attribute name="class">green</xsl:attribute>
      </xsl:if>
      <xsl:value-of select="cdn"/>
    </td>
  </xsl:template>
  <xsl:template match="tools">
    <xsl:for-each select="tool">
      <xsl:sort data-type="number" select="@usability"/>
      <div class="tool">
        <div class="position">
          <xsl:number value="position()" format="1"/>
        </div>
        <xsl:apply-templates select="name"/>
        <div class="uav">
          <div class="usab">
          <div>
            <xsl:value-of select="@usability"/>
          </div>
        </div>
          <xsl:apply-templates select="version/@vr"/>
        </div>
      </div>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="name">
    <img>
      <xsl:attribute name="src">
        <xsl:value-of select="logo/@src"/>
      </xsl:attribute>
      <xsl:attribute name="alt">an image</xsl:attribute>
    </img>
    <div class="name">
      <div>
        <xsl:value-of select="full/short"/>
      </div>
      <div>
        <xsl:value-of select="full/text()"/>
      </div>
    </div>
  </xsl:template>
  <xsl:template match="@vr">
    <span>
      <xsl:value-of select="translate(., ' ', ':')"/>
    </span>
  </xsl:template>
  <xsl:template match="browser">
    <div class="img">
      <div>
        <div class="im">
          <xsl:apply-templates select="@engine"/>
        </div>
        <h1>
          <xsl:value-of select="title"/>
        </h1>
        <p>
          <xsl:apply-templates select="date-and-version"/>
          <xsl:apply-templates select="number-of-users"/>
        </p>
        <div class="link">
          <a>
            <xsl:attribute name="href">
              <xsl:value-of select="website/@link"/>
            </xsl:attribute>
            <xsl:value-of select="website"/>
          </a>
        </div>
      </div>
    </div>
  </xsl:template>
  <xsl:template match="date-and-version">
    <xsl:text>version: </xsl:text>
    <xsl:value-of select="translate(., ' ', '.')"/>
    <br/>
    <xsl:text>release date: </xsl:text>
    <xsl:value-of select="@date"/>
  </xsl:template>
  <xsl:template match="number-of-users">
    <br/>
    <xsl:text>number of users: </xsl:text>
    <xsl:value-of select="format-number(., '###,###')"/>
  </xsl:template>
  <xsl:template match="@engine">
    <img alt="an image">
      <xsl:attribute name="src">
        <xsl:value-of select="concat('img/', ., '.png')"/>
      </xsl:attribute>
    </img>
  </xsl:template>
  <xsl:template name="message">
    <p class="msg">Created by Mateusz Wasik</p>
  </xsl:template>
  <xsl:template match="ide">
    <tr>
      <td>
        <xsl:value-of select="generate-id()"/>
      </td>
      <td>
        <xsl:value-of select="name"/>
      </td>
      <td>
        <xsl:value-of select="vendor"/>
      </td>
      <td>
        <xsl:value-of select="concat('version: ', format-number(version, '000'))"/>
      </td>
      <td>
        <xsl:apply-templates select="lngs"/>
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="lngs">
    <xsl:value-of select="translate(., ' ', ',')"/>
  </xsl:template>
  <xsl:template match="person[@id='author']">
    <div class="author">
      <xsl:text>Author of document: </xsl:text>
      <xsl:for-each select="*">
        <xsl:value-of select="."/>
        <xsl:text> </xsl:text>
      </xsl:for-each>
    </div>
  </xsl:template>



























</xsl:stylesheet>
