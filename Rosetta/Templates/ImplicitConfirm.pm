# These are the IMPLICIT_CONFIRM acts for MeetingLine

use Rosetta::Templates::Util;

$Rosetta::Templates::act{"implicit_confirm"} = {

    ###########################################################################
    # A SET OF GENERIC IMPLICIT CONFIRMS FOR THE LIBRARY AGENTS
    ###########################################################################

    ###########################################################################
    # THE TASK SPECIFIC IMPLICIT CONFIRMS
    ###########################################################################

    # explicitly confirm the meeting_referent
    "meeting_referent" => sub 
    {
      my %args = @_;
      my $mref = get_meeting_referent($args{"meeting_referent"}, 0);
      return "<meeting_referent $mref> ... ";
    },


    # implicitly confirm the user name
    "user_name" => sub 
    {
      my %args = @_;
      if($args{"user_name"} eq "guest") 
      {
	return "hello <user_name guest user> .. ";
      } 
      else 
      {
	return "hi <user_name> .. ";
      }
    }
};
