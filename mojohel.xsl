<?xml version="1.0" encoding="utf8"?>
<xsl:stylesheet version="1.0"
       xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
              xmlns:h="http://www.w3.org/1999/xhtml" >

<xsl:template match="/" priority="1.0">
   <xsl:apply-templates />
</xsl:template>

<xsl:template match="h:html" priority="1.0">
   <xsl:apply-templates />
</xsl:template>

<xsl:template match="h:head" priority="1.0">
   <xsl:apply-templates />
</xsl:template>

<xsl:template match="h:body" priority="1.0">
   <xsl:apply-templates />
</xsl:template>

<xsl:template match="h:form" priority="1.0">
  <xsl:text disable-output-escaping = "yes" >&lt;%= form_for '/newentry' => (method => "post") => (class => "</xsl:text><xsl:value-of select="@class" /><xsl:text disable-output-escaping = "yes" >") => begin %&gt;</xsl:text>
          <xsl:apply-templates />
<xsl:text disable-output-escaping = "yes" >&lt;% end %&gt;
% if ($self->stash->{error_messages}) {
&lt;ul&gt;
% for my $message ( @{$self->stash->{error_messages}} ) {
&lt;li&gt;&lt;%= $message %&gt;&lt;/li&gt;
% }
&lt;/ul&gt;
% }</xsl:text>
</xsl:template>

<xsl:template match="h:div[@class='control-group']">
  <xsl:text disable-output-escaping = "yes" >&lt;div class ="</xsl:text><xsl:value-of select="@class" /><xsl:text disable-output-escaping = "yes"> &lt;% if ($self->stash->{errors} &amp;&amp; $self-&gt;stash-&gt;{errors}-&gt;{"</xsl:text><xsl:value-of select="controls/input/@name" /><xsl:text disable-output-escaping = "yes">"}) {%&gt;&lt;%= "error" %&gt;&lt;% } %&gt;"></xsl:text>
  <xsl:apply-templates />
  <xsl:text disable-output-escaping = "yes" >&lt;/div&gt;</xsl:text>
</xsl:template>

<xsl:template match="h:input[@type='text']">
  <xsl:text disable-output-escaping = "yes" >&lt;%= text_field '</xsl:text><xsl:value-of select="@name" /><xsl:text disable-output-escaping = "yes" >' => (class => "</xsl:text><xsl:value-of select="@class" /><xsl:text disable-output-escaping = "yes" >") => (placeholder => "</xsl:text><xsl:value-of select="@placeholder" /><xsl:text disable-output-escaping = "yes" >") %&gt; </xsl:text>
  </xsl:template>

<xsl:template match="h:input[@type='checkbox']">
  <xsl:text disable-output-escaping = "yes" >&lt;%= check_box '</xsl:text><xsl:value-of select="@name" /><xsl:text disable-output-escaping = "yes" >' => (value => "</xsl:text><xsl:value-of select="@value" /><xsl:text disable-output-escaping = "yes" >") %&gt; </xsl:text>
  </xsl:template>

<xsl:template match="h:input[@type='radio']">
  <xsl:text disable-output-escaping = "yes" >&lt;%= radio_button '</xsl:text><xsl:value-of select="@name" /><xsl:text disable-output-escaping = "yes" >' => "</xsl:text><xsl:value-of select="@value" /><xsl:text disable-output-escaping = "yes" >" %&gt; </xsl:text>
  </xsl:template>

<xsl:template match="h:textarea">
  <xsl:text disable-output-escaping = "yes" >&lt;%= text_area '</xsl:text><xsl:value-of select="@name" /><xsl:text disable-output-escaping = "yes" >' => (class => "</xsl:text><xsl:value-of select="@class" /><xsl:text disable-output-escaping = "yes" >") => (type => "</xsl:text><xsl:value-of select="@type" /><xsl:text disable-output-escaping = "yes" >") %&gt; </xsl:text>
  </xsl:template>

<xsl:template match="h:select">
  <xsl:text disable-output-escaping = "yes" >&lt;%= select_field '</xsl:text><xsl:value-of select="@name" /><xsl:text disable-output-escaping = "yes" >' => [ qw/ </xsl:text><xsl:for-each select="h:option"><xsl:value-of select="." /><xsl:text> </xsl:text></xsl:for-each><xsl:text disable-output-escaping = "yes" > / ]  => (class => "</xsl:text><xsl:value-of select="@class" /><xsl:text disable-output-escaping = "yes" >") %&gt; </xsl:text>
  </xsl:template>

<xsl:template match="@*|node()" priority="-0.5">
  <xsl:copy>
      <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
        </xsl:template>

</xsl:stylesheet>
