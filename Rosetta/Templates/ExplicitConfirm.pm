# These are the EXPLICIT_CONFIRM acts for MeetingLine

use Rosetta::Templates::Util;
use Time::Local;

$Rosetta::Templates::act{"explicit_confirm"} = 
{

    ###########################################################################
    # A SET OF GENERIC EXPLICIT CONFIRMS FOR THE LIBRARY AGENTS
    ###########################################################################

    # explicitly confirm the suspend
    "_Suspend_trigger" => 
    {
      "default" => "Did you say you wanted to suspend the conversation?",
      "explain_more" => "I think you said you wanted to pause the conversation. ".
					 "Is this correct?",
      "what_can_i_say" => "Please answer 'yes' or 'no'."
    },

    ###########################################################################
    # THE TASK SPECIFIC EXPLICIT CONFIRMS
    ###########################################################################

    # explicitly confirm the meeting_referent
    "meeting_referent" => sub 
    {
      my %args = @_;
      my $mref = get_meeting_referent($args{"meeting_referent"}, 0);

      my %results = (
        "default" => "Did you say you wanted to know about <meeting_referent $mref>?", 
        "explain_more" => "I think you said you wanted to know about <meeting_referent $mref>. Is that correct?",
	"what_can_i_say" => "Please answer 'yes' or 'no'.");
	    
      return \%results;
    },

    # explicitly confirm the query type
    "query" => sub {
      my %args = @_;

      if($args{"query"} eq "when") 
      {
        %results = (
        "default" => "Did you say you wanted to know when the meeting was held?", 
        "explain_more" => "I think you wanted to know when the meeting was held. Is that correct?",
        "what_can_i_say" => "Please answer 'yes' or 'no'.");
      } 
      elsif($args{"query"} eq "who") 
      {
        %results = (
        "default" => "Did you say you wanted to know who attended the meeting?", 
        "explain_more" => "I think you wanted to know who attended the meeting. Is that correct?",
        "what_can_i_say" => "Please answer 'yes' or 'no'.");
      } 
      elsif($args{"query"} eq "agenda") 
      {
        %results = (
        "default" => "Did you say you wanted to hear the agenda for the meeting?", 
        "explain_more" => "I think you wanted to hear the agenda for the meeting. Is that correct?",
        "what_can_i_say" => "Please answer 'yes' or 'no'.");
      } 
      elsif($args{"query"} eq "action_items") 
      {
        %results = (
        "default" => "Did you say you wanted to hear the action items?", 
        "explain_more" => "I think you wanted to hear the action items. Is that correct?",
        "what_can_i_say" => "Please answer 'yes' or 'no'.");
      }
      return \%results;
    },

    # explicitly confirm the query type
    "action_items_for_user" => 
    {
      "default" => "Did you say you wanted to hear the action items assigned to <action_items_for_user>?",
      "explain_more" => "I think you said you wanted to hear the action items for <action_items_for_user>. Is that correct?",
      "what_can_i_say" => "Please answer 'yes' or 'no'."
    },
	
    # explicitly confirm the user name
    "user_name" => sub 
    {
      my %args = @_;
      %results1 =
	("default" => "Did you say you were a <user_name guest user>?",
	 "explain_more" => "I think you said you were a <user_name guest user>. Is that correct?",
	 "what_can_i_say" => "Please answer 'yes' or 'no'.");
      %results2 =
	("default" => "Did you say your name was <user_name>?",
	 "explain_more" => "I think you said your name was <user_name>. Is that correct?",
	 "what_can_i_say" => "Please answer 'yes' or 'no'.");
      if($args{"user_name"} eq "guest") 
      {
	return \%results1;
      } 
      else 
      {
	return \%results2;
      }
    },

    # explicitly confirm anything else
    "anything_else" => 
    {
      "default" => sub {
	my %args = @_;
	if($args{"anything_else"} eq "false") 
	{
	  return "I think you said <anything_else you did not need> any other assistance.  Is that correct?";
	} 
	else 
	{
	  return "I think you said that <anything_else there was something else> I could help with. Is that correct?";
	}	
      },
      "what_can_i_say" => "Please answer 'yes' or 'no'."
    }
};
