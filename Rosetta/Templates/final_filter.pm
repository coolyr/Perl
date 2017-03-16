# This is the final filter applied on the utterances in Rosetta

sub Rosetta::Templates::finalFilter 
{
  # this filter is applied at the end on the utterance. It contains
  # various regexp replaces which do abbreviations mostly

  my $self = shift;
  my $arg  = shift;

  my $short_break = "{break time=\"400ms\"/}";
  $arg =~ s/.../$short_break/g;

  return $arg;
}
