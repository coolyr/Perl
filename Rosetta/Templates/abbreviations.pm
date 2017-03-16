# 

sub Rosetta::Templates::finalFilter 
{
  # this filter is applied at the end on the utterance. It contains
  # various regexp replaces which do abbreviations mostly

  my $self = shift;
  my $arg  = shift;

  return $arg;
}
