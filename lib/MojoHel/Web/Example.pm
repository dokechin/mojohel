package MojoHel::Web::Example;
use Mojo::Base 'Mojolicious::Controller';
use File::Temp qw/tempfile/;
use HTML::Entities;


sub welcom {
  my $self = shift;
  $self


}
# This action will render a template
sub convert {
  my $self = shift;

  my $html = File::Temp->new ( UNLINK => 0, SUFFIX => '.html' );
  my $xml = File::Temp->new( UNLINK => 0, SUFFIX => '.xml' );
  my $ep = File::Temp->new( UNLINK => 0, SUFFIX => '.ep' );

  my $decodeHTML =  decode_entities($self->param("html"));

  print $html $decodeHTML;
  
  print $html->filename ;
  print $xml->filename ;
  print $ep->filename ;
  
  close $html;
  close $xml;
  close $ep;

  my $ret = system("tidyp -o $xml --doctype -asxhtml -wrap 0 $html");
  $ret = system("xsltproc mojohel.xsl $xml > $ep");
# $ret = system("cp  $xml  $ep");

  my $fh_ep;
  open ($fh_ep , "<" , $ep);
  my $ep_text = '';
    while(my $line = <$fh_ep>) {
    chomp $line;
    $ep_text = $ep_text . encode_entities($line). "<br/>";
  }
  close($fh_ep);

  system("/bin/rm -f $html");
  system("/bin/rm -f $xml");
  system("/bin/rm -f $ep");

  # Render template "example/welcome.html.ep" with message
  $self->render_json({
    ep => $ep_text});

}
1;
