<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet version="1.0"
       xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
       xmlns:h="http://www.w3.org/1999/xhtml" >

<!--xsl:template match="/">
  <xsl:apply-templates />
</xsl:template-->

<xsl:template match="h:form" priority="1.0">
  <xsl:text disable-output-escaping = "yes" >
      &lt;%= form_for '/newentry' => (method => "post") => (class => "</xsl:text><xsl:value-of select="@class" /><xsl:text disable-output-escaping = "yes" >") => begin %&gt;</xsl:text>
  <xsl:apply-templates />
  <xsl:text disable-output-escaping = "yes" >
      &lt;% end %&gt;
  </xsl:text>
</xsl:template>

<xsl:template match="h:input[@type='text']">
  <xsl:text disable-output-escaping = "yes" >&lt;%= text_field 'name' => (class => "</xsl:text><xsl:value-of select="@class" /><xsl:text disable-output-escaping = "yes" >") => (placeholder => "</xsl:text><xsl:value-of select="@placeholder" /><xsl:text disable-output-escaping = "yes" >") %&gt; </xsl:text>
</xsl:template>

<xsl:template match="h:input[@type='checkbox']">
  <xsl:text disable-output-escaping = "yes" >&lt;%= check_box 'name' => (value => "</xsl:text><xsl:value-of select="@value" /><xsl:text disable-output-escaping = "yes" >") %&gt; </xsl:text>
</xsl:template>

<xsl:template match="h:input[@type='radio']">
  <xsl:text disable-output-escaping = "yes" >&lt;%= radio_button 'name' => "</xsl:text><xsl:value-of select="@value" /><xsl:text disable-output-escaping = "yes" >" %&gt; </xsl:text>
</xsl:template>

<xsl:template match="h:textarea">
  <xsl:text disable-output-escaping = "yes" >&lt;%= text_area 'name' => (class => "</xsl:text><xsl:value-of select="@class" /><xsl:text disable-output-escaping = "yes" >") => (type => "</xsl:text><xsl:value-of select="@type" /><xsl:text disable-output-escaping = "yes" >") %&gt; </xsl:text>
</xsl:template>

<xsl:template match="h:select">
  <xsl:text disable-output-escaping = "yes" >&lt;%= select_field 'name' => (class => "</xsl:text><xsl:value-of select="@class" /><xsl:text disable-output-escaping = "yes" >") => [ qw/ </xsl:text><xsl:for-each select="h:option"><xsl:value-of select="." /><xsl:text> </xsl:text></xsl:for-each><xsl:text disable-output-escaping = "yes" > / ] %&gt; </xsl:text>
</xsl:template>

<xsl:template match="@*|node()" priority="-0.5">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()" />
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>