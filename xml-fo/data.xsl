<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:output method="xml" indent="yes"/>
  <xsl:template match="/">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <fo:layout-master-set>
        <fo:simple-page-master master-name="main-page" margin="2cm" page-width="210mm" page-height="297mm">
          <fo:region-body margin-top="1cm" margin-bottom="1cm"/>
          <fo:region-before extent="0.5cm"/>
          <fo:region-after extent="0.5cm"/>
        </fo:simple-page-master>
        <fo:simple-page-master master-name="normal-page" margin="2cm" page-width="210mm" page-height="297mm">
          <fo:region-body margin-top="1cm" margin-bottom="1.2cm"/>
          <fo:region-before extent="0.5cm"/>
          <fo:region-after extent="0.5cm"/>
        </fo:simple-page-master>
        <fo:simple-page-master master-name="last-page" margin="2cm" page-width="210mm" page-height="297mm">
          <fo:region-body margin-top="1cm" margin-bottom="1.3cm"/>
          <fo:region-before extent="0.5cm"/>
          <fo:region-after extent="0.5cm"/>
        </fo:simple-page-master>
        <fo:page-sequence-master master-name="page-list">
          <fo:repeatable-page-master-alternatives>
            <fo:conditional-page-master-reference master-reference="main-page" page-position="first"/>
            <fo:conditional-page-master-reference master-reference="normal-page" page-position="rest"/>
            <fo:conditional-page-master-reference master-reference="last-page" page-position="last"/>
          </fo:repeatable-page-master-alternatives>
        </fo:page-sequence-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="main-page">
        <fo:static-content flow-name="xsl-region-before">
          <xsl:apply-templates select="data/person[@id='author']"/>
        </fo:static-content>
        <fo:static-content flow-name="xsl-region-after">
          <fo:block text-align="center">
            <fo:inline font-family="Helvetica" font-size="10pt">
              <xsl:text>Page </xsl:text>
              <fo:page-number/>
            </fo:inline>
          </fo:block>
        </fo:static-content>
        <fo:flow flow-name="xsl-region-body">
          <fo:block text-align="center" margin-top="10cm">
            <fo:inline font-family="Helvetica" font-size="14pt">This is the PDF version of my XML file. It has been made using the Formatting Objects language and the XSL Transformations</fo:inline>
          </fo:block>
        </fo:flow>
      </fo:page-sequence>
      <fo:page-sequence master-reference="normal-page">
        <fo:static-content flow-name="xsl-region-before">
          <xsl:apply-templates select="data/person[@id='author']"/>
        </fo:static-content>
        <fo:static-content flow-name="xsl-region-after">
          <fo:block text-align="center">
            <xsl:text>Page </xsl:text>
            <fo:page-number/>
          </fo:block>
        </fo:static-content>
        <fo:flow flow-name="xsl-region-body">
          <xsl:apply-templates select="data/languages/lang"/>
        </fo:flow>
      </fo:page-sequence>
      <fo:page-sequence master-reference="last-page">
        <fo:static-content flow-name="xsl-region-before">
          <xsl:apply-templates select="data/person[@id='author']"/>
        </fo:static-content>
        <fo:static-content flow-name="xsl-region-after">
          <fo:block text-align="center">
            <xsl:text>Page number: </xsl:text>
            <fo:page-number/>
          </fo:block>
        </fo:static-content>
        <fo:flow flow-name="xsl-region-body">
          <fo:block text-align="left" font-size="12.5pt">
            <xsl:text>A list of well-known IDEs</xsl:text>
          </fo:block>
          <fo:block margin-left="15mm" margin-top="20mm">
            <fo:table>
              <fo:table-column column-width="65mm"/>
              <fo:table-column column-width="45mm"/>
              <fo:table-header>
                <fo:table-row>
                  <fo:table-cell padding="5mm">
                    <fo:block font-weight="bold" font-size="15pt" text-align="center">IDE name</fo:block>
                  </fo:table-cell>
                  <fo:table-cell padding="5mm">
                    <fo:block font-weight="bold" font-size="15pt" text-align="center">Vendor</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>
              <fo:table-body>
                <xsl:apply-templates select="data/ides/ide"/>
              </fo:table-body>
            </fo:table>
          </fo:block>
          <fo:block text-align="left" font-size="12.5pt" margin-top="15mm">
            <xsl:text>A list of well-known web development tools</xsl:text>
          </fo:block>
          <fo:block margin-left="10mm" margin-top="3mm">
            <fo:list-block>
              <xsl:apply-templates select="data/tools/tool"/>
            </fo:list-block>
          </fo:block>
          <fo:block text-align="center" margin-top="30mm">
            <fo:instream-foreign-object>
              <svg
                 xmlns:dc="http://purl.org/dc/elements/1.1/"
                 xmlns:cc="http://creativecommons.org/ns#"
                 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                 xmlns:svg="http://www.w3.org/2000/svg"
                 xmlns="http://www.w3.org/2000/svg"
                 xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
                 xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
                 width="113.35728mm"
                 height="41.599094mm"
                 viewBox="0 0 401.65964 147.39837"
                 id="svg2"
                 version="1.1"
                 inkscape:version="0.91 r13725"
                 sodipodi:docname="drawing.svg">
                <defs
                   id="defs4" />
                <sodipodi:namedview
                   id="base"
                   pagecolor="#ffffff"
                   bordercolor="#666666"
                   borderopacity="1.0"
                   inkscape:pageopacity="0.0"
                   inkscape:pageshadow="2"
                   inkscape:zoom="1.4"
                   inkscape:cx="227.39494"
                   inkscape:cy="12.581058"
                   inkscape:document-units="px"
                   inkscape:current-layer="layer1"
                   showgrid="false"
                   fit-margin-top="0"
                   fit-margin-left="0"
                   fit-margin-right="0"
                   fit-margin-bottom="0"
                   inkscape:window-width="1920"
                   inkscape:window-height="1146"
                   inkscape:window-x="0"
                   inkscape:window-y="0"
                   inkscape:window-maximized="1" />
                <metadata
                   id="metadata7">
                  <rdf:RDF>
                    <cc:Work
                       rdf:about="">
                      <dc:format>image/svg+xml</dc:format>
                      <dc:type
                         rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
                      <dc:title></dc:title>
                    </cc:Work>
                  </rdf:RDF>
                </metadata>
                <g
                   inkscape:label="Layer 1"
                   inkscape:groupmode="layer"
                   id="layer1"
                   transform="translate(-104.64286,-407.94873)">
                  <g
                     id="g4140"
                     transform="matrix(0.21785714,0,0,0.21785714,104.64286,440.80467)">
                    <circle
                       id="ellipse4142"
                       cy="200"
                       cx="200"
                       r="200"
                       style="fill:#1c1c20" />
                    <g
                       transform="matrix(0.6363961,-0.6363961,0.6363961,0.6363961,-20.506097,208.5965)"
                       id="Logo"
                       style="fill:#d7d7d7">
                      <path
                         d="m 247,225 0,-35 46,-28 -46,-29 0,-34 105,63 -105,63 z m 0,0"
                         id="Tip"
                         inkscape:connector-curvature="0"
                         style="fill:#baffa9" />
                      <path
                         d="m 102,312 0,-300 105,63 0,34 -75,-45 0,68 49,30 -49,29 0,68 75,-45 0,35 -105,63 z m 0,0"
                         id="Base"
                         inkscape:connector-curvature="0"
                         style="fill:#7acb16" />
                    </g>
                  </g>
                  <path
                     id="path4160"
                     d="m 441.54127,447.47621 c 1.05,11.05315 2.09162,22.04403 3.15719,33.28155 1.73723,-2.98717 2.99435,-5.85222 4.89082,-8.19886 1.76596,-2.18621 3.99168,-4.2036 6.41374,-5.6008 3.16198,-1.82463 7.3081,-0.10656 8.33296,3.12965 0.27537,0.86801 -0.38193,2.03175 -0.6118,3.0602 -0.77343,-0.40826 -1.77075,-0.63335 -2.276,-1.25832 -2.14669,-2.65434 -3.43974,-2.96802 -5.81391,-0.67406 -4.42868,4.28142 -6.91899,9.64516 -7.86962,15.67338 -0.18318,1.16614 0.54595,2.47475 0.85365,3.71751 1.21043,-0.41665 2.61602,-0.5699 3.59419,-1.29784 3.17993,-2.36699 5.15063,-5.58643 6.23774,-9.43444 0.23586,-0.83329 1.51454,-1.37086 2.31431,-2.04492 0.38313,0.7878 1.25713,1.71568 1.07395,2.33945 -1.68455,5.79476 -3.51277,11.5524 -5.43079,17.27532 -0.19396,0.57948 -1.25833,0.86802 -1.92041,1.29185 -0.26699,-0.76146 -0.82851,-1.55884 -0.73871,-2.276 0.20114,-1.62588 0.72434,-3.21226 1.08951,-4.70165 l -8.6682,3.99048 c 0.4849,5.53375 0.98775,11.74157 1.58398,17.941 0.45736,4.73398 1.23199,5.95998 5.89414,6.85793 5.44036,1.04761 10.9825,1.71688 16.51266,2.12395 8.17133,0.60222 16.27082,-0.14248 24.22066,-2.27959 2.95963,-0.79499 4.14014,-2.74174 4.35205,-5.6475 0.19396,-2.67588 0.62737,-5.33501 0.92788,-8.00371 0.59025,-5.25719 1.16374,-10.51557 1.76716,-15.99305 -1.99584,1.26431 -3.56545,2.67947 -5.40086,3.2793 -1.33614,0.437 -3.02189,-0.20233 -4.55319,-0.36277 0.29333,-1.40559 0.27537,-2.98957 0.95302,-4.17486 1.10388,-1.93717 2.66272,-3.61693 4.0276,-5.40565 l -0.58786,-0.70758 c -0.97816,0.57828 -2.19339,0.95781 -2.889,1.77794 -1.41516,1.66898 -2.8004,3.4553 -3.74743,5.41163 -1.58518,3.27452 -2.79322,6.73102 -4.21198,10.08815 -0.61659,1.45587 -1.14818,3.68278 -3.21346,2.83273 -2.20895,-0.91112 -0.6549,-2.85668 -0.13648,-4.24071 0.82491,-2.20776 1.91442,-4.31734 2.65194,-5.94083 -2.09043,0.24903 -4.20959,0.54955 -6.33832,0.73512 -0.90034,0.0766 -1.9707,-0.41665 -2.70702,-0.0838 -2.4484,1.10628 -4.00005,0.66209 -4.50889,-2.04851 -1.13381,0.73631 -2.09402,1.73363 -3.22543,2.00182 -1.37326,0.32685 -3.23621,0.54116 -4.24191,-0.14487 -0.80576,-0.54954 -1.09909,-2.61482 -0.82372,-3.82645 0.54715,-2.4089 1.56962,-4.72441 2.5406,-7.01478 0.60102,-1.41875 1.20564,-3.68398 3.23381,-2.69743 2.00422,0.97337 0.18438,2.61602 -0.27777,3.93421 -0.71716,2.03774 -1.44749,4.07189 -2.17064,6.10724 l 1.14938,0.69442 c 1.0943,-0.95063 2.45798,-1.72526 3.22423,-2.8914 1.25473,-1.90604 2.0126,-4.13295 3.20029,-6.08928 0.49207,-0.81055 1.55165,-1.27509 2.35502,-1.89647 0.16282,1.03204 0.55313,2.09282 0.42383,3.08894 -0.12811,1.0069 -0.83569,1.9276 -1.17452,2.92372 -0.50884,1.49179 -0.9195,3.01711 -1.43672,4.75194 2.44601,0.0934 3.49362,-0.93626 4.18444,-2.75251 2.18621,-5.73848 4.39636,-11.47098 6.79927,-17.12087 0.41066,-0.96739 1.80667,-1.51335 2.74891,-2.25565 0.10895,1.16614 0.62857,2.48792 0.25861,3.47087 -1.9695,5.2069 -4.18084,10.32042 -6.25929,15.48661 -0.3508,0.87041 -0.46335,1.8366 -0.68484,2.7585 3.66243,-1.64624 6.71905,-3.46608 7.8349,-7.35839 0.27297,-0.94584 1.39122,-1.64863 2.12035,-2.46397 l 1.69533,1.7959 c 0.51482,-0.43341 0.98654,-0.92668 1.54567,-1.28706 1.75997,-1.13381 3.65524,-2.13353 5.511,-0.37714 1.92041,1.81625 0.46694,3.58581 -0.53637,5.15662 -1.09191,1.71328 -2.42925,3.26853 -3.66004,4.89202 2.76808,-1.78392 6.54784,-2.5837 7.05069,-6.43889 1.226,-9.41648 2.30354,-18.85212 3.39664,-28.28536 0.32446,-2.79202 0.49806,-5.602 0.75068,-8.51135 -21.80218,5.27873 -43.13623,5.31106 -64.75762,-0.0826 z m 9.35782,73.47491 c 1.05,2.77406 2.64475,5.49903 3.0626,8.39402 0.88238,6.16232 1.10627,12.41802 1.73124,18.62225 0.091,0.90393 0.67646,2.14549 1.40679,2.54298 10.75143,5.84265 21.60702,6.85554 32.57636,0.46574 1.63666,-0.95302 1.93957,-2.21135 2.15148,-3.9809 1.02606,-8.59756 -1.25832,-17.71712 4.23832,-25.81302 -15.39203,3.81808 -30.4141,3.93661 -45.16679,-0.23107 z m 37.10441,-71.93163 c 5.22247,-0.50405 10.38148,-1.73005 15.54648,-2.74293 0.97337,-0.19037 1.8378,-0.93148 2.75251,-1.41876 -1.20565,-1.05958 -2.24847,-1.56962 -3.33798,-1.69772 -5.4236,-0.64054 -10.86637,-1.13381 -16.28638,-1.80548 -0.81893,-0.10176 -2.28079,-1.11226 -2.21973,-1.29663 1.58159,-4.76512 1.50376,-10.15879 5.09316,-14.17441 4.53644,-5.0764 9.11956,-10.10851 13.66797,-15.143 -3.38347,-3.63968 -3.42896,-3.64447 -6.49516,-0.45855 -1.73364,1.80068 -3.31762,3.77138 -5.19852,5.40205 -6.9597,6.03182 -11.84812,13.17589 -12.80115,22.59477 -0.2191,2.16106 -1.40559,2.94168 -3.6744,2.9752 -7.49009,0.10895 -14.98855,0.31488 -22.46187,0.80696 -3.70314,0.24304 -7.36078,1.19367 -11.03998,1.82343 l -0.0335,1.37566 c 2.30234,0.70998 4.56038,1.64265 6.91181,2.09401 13.10286,2.51186 26.32903,2.94288 39.57676,1.6654 z m -4.18564,-3.29008 c -2.96562,2.39452 -5.41642,2.39452 -7.78341,0 l 7.78341,0 z"
                     inkscape:connector-curvature="0"
                     style="clip-rule:evenodd;fill:#cf4647;fill-rule:evenodd" />
                  <g
                     id="g4181"
                     transform="matrix(6.4365079,0,0,6.4365079,253.13296,464.57648)">
                    <path
                       id="path4171"
                       d="M 0,0 0,6 5,6 5,7 9,7 9,6 18,6 18,0"
                       inkscape:connector-curvature="0"
                       style="fill:#cb3837" />
                    <path
                       id="path4173"
                       d="M 1,1 1,5 3,5 3,2 4,2 4,5 5,5 5,1 6,1 6,6 8,6 8,2 9,2 9,4 8,4 l 0,1 2,0 0,-4 1,0 0,4 2,0 0,-3 1,0 0,3 1,0 0,-3 1,0 0,3 1,0 0,-4"
                       inkscape:connector-curvature="0"
                       style="fill:#ffffff" />
                  </g>
                </g>
              </svg>
            </fo:instream-foreign-object>
          </fo:block>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
  <xsl:template match="person">
    <fo:block>
      <fo:inline font-family="Helvetica" font-size="10pt">
        <xsl:text>Created by </xsl:text>
        <xsl:value-of select="name"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="surname"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="translate(city, 'ń', 'n')"/>
      </fo:inline>
    </fo:block>
  </xsl:template>
  <xsl:template match="lang">
    <fo:block page-break-after="always">
      <fo:block text-align="left" font-size="13pt">
        <xsl:value-of select="fullname"/>
        <xsl:text>,</xsl:text>
        <xsl:if test="@typing != ''">
          <xsl:value-of select="concat(' ', @typing)"/>
          <xsl:text> typed,</xsl:text>
        </xsl:if>
        <xsl:text> </xsl:text>
        <xsl:value-of select="usage"/>
        <xsl:text> used</xsl:text>
      </fo:block>
      <fo:block margin-top="7cm" text-align="center" font-size="60pt">
        <xsl:value-of select="name"/>
      </fo:block>
    </fo:block>
  </xsl:template>
  <xsl:template match="ide">
    <fo:table-row>
      <fo:table-cell padding-top="2.5mm" padding-bottom="2.5mm" padding-left="5mm" padding-right="5mm">
        <fo:block text-align="center">
          <xsl:value-of select="name"/>
        </fo:block>
      </fo:table-cell>
      <fo:table-cell padding-top="2.5mm" padding-bottom="2.5mm" padding-left="5mm" padding-right="5mm">
        <fo:block text-align="center">
          <xsl:value-of select="vendor"/>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>
  <xsl:template match="tool">
    <fo:list-item>
      <fo:list-item-label>
        <fo:block>
          ->
        </fo:block>
      </fo:list-item-label>
      <fo:list-item-body>
        <fo:block margin-left="10mm">
          <xsl:value-of select="name/full/short"/>
          <xsl:text>, </xsl:text>
          <xsl:value-of select="name/full/text()"/>
        </fo:block>
      </fo:list-item-body>
    </fo:list-item>
  </xsl:template>















  <!--<xsl:template match="boutme">
    <fo:block text-align="center">
      <xsl:value-of select="title"/>
    </fo:block>
    <fo:block text-align="center">
      <xsl:value-of select="author/name"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="author/surname"/>
    </fo:block>
  </xsl:template>
  <xsl:template match="text/text()">
    <fo:block font-size="20pt">
      <xsl:value-of select="."/>
    </fo:block>
  </xsl:template>
  <xsl:template match="player">
    <fo:block page-break-after="always">
      <fo:list-block>
        <xsl:apply-templates select="*"/>
      </fo:list-block>
    </fo:block>
  </xsl:template>
  <xsl:template match="player/*">
    <fo:list-item>
      <fo:list-item-label>
        <fo:block>*</fo:block>
      </fo:list-item-label>
      <fo:list-item-body>
        <fo:block font-size="10pt" margin-left="1cm">
          <xsl:value-of select="."/>
        </fo:block>
      </fo:list-item-body>
    </fo:list-item>
  </xsl:template>
  <xsl:template match="facts">
    <fo:table-row>
      <fo:table-cell>
        <fo:block>Rok</fo:block>
      </fo:table-cell>
      <fo:table-cell>
        <fo:block>
          <xsl:value-of select="year"/>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row>
      <fo:table-cell>
        <fo:block>Dyscyplina</fo:block>
      </fo:table-cell>
      <fo:table-cell>
        <fo:block>
          <xsl:value-of select="dyscypline"/>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
    <fo:table-row>
      <fo:table-cell>
        <fo:block>Medal</fo:block>
      </fo:table-cell>
      <fo:table-cell>
        <fo:block>
          <xsl:value-of select="medal"/>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>-->



</xsl:stylesheet>
