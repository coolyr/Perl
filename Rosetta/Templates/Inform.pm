# These are the INFORM acts for MeetingLine

use Rosetta::Templates::Util;

$Rosetta::Templates::act{"inform"} = {

  ###########################################################################
  # A SET OF GENERIC REQUESTS FOR THE LIBRARY AGENTS
  ###########################################################################

  # informs for help agencies
  "no_help_available" => "I'm sorry, there is no help available for the current topic.",

  "confirm_okay" => 
    ["Right. ",
     "Okay. "], 

  "generic_tips" => sub {
    my %args = @_;
    my $answer = "";
    printf $args{"_tips_counter"}."\n";
    printf ($args{"_tips_counter"} % 3)."\n";
    if(($args{"_tips_counter"} % 3) == 0) {
    	$answer .= " Here are some tips for a smooth interaction .. ";
    	$answer .= "Please speak clearly and naturally .. ";
    	$answer .= "Do not speak too quickly or too slow ... ";
    	$answer .= "You can interrupt the system at any time ";
    	$answer .= "by saying anything you wish .... ";
    	$answer .= "If you need to make a correction, ";
    	$answer .= "just restate the new information ... ";
    	$answer .= "For example, if you'd like a room in the afternoon instead of morning, ";
    	$answer .= "you can simply say, 'i'd like a room in the afternoon' ... ";
    	$answer .= "For more hints on how to interact with the system, say ";
    	$answer .= "'interaction tips'.";	
    } elsif(($args{"_tips_counter"} % 3) == 1) {
    	$answer .= "Here are some commands you could use ... ";
    	$answer .= "To get help at any time, please say 'help' ... ";
    	$answer .= "To hear what your options are at any point, say, ";
    	$answer .= "'what can i say' ... ";
    	$answer .= "To hear a summary of the system's state, say, ";
    	$answer .= "'where are we' ... ";
    	$answer .= "To hear even more commands you could use, say 'interaction tips'.";	
    } elsif(($args{"_tips_counter"} % 3 ) == 2) {
    	$answer .= "Here are some other commands you could use ... ";
    	$answer .= "To hear the last system response again, say, ";
    	$answer .= "'repeat' ... ";
    	$answer .= "To erase everything and start from the beginning, say, ";
    	$answer .= "'start over' ... ";
    	$answer .= "To end the call, say, ";
    	$answer .= "'good bye' ... ";
    	$answer .= "To pause the dialogue momentarily, say, ";
    	$answer .= "'suspend' ... ";
    	$answer .= "To hear details about the system's capabilities, say, ";
    	$answer .= "'what can you do'";
    }
    $answer .= (" Now, moving back to where we were ... ",
	  " Now, let's see .. ",
	  " Now, back to where we were ... ")[rand(3)];
    return $answer;
  },

  # informs for timeout agents
  "you_not_there" => "I assume you are no longer there .. ",
  "sorry_i_will_shutdown" => "I will hang up now ... Have a nice day.",

  # informs about resuming the dialog from suspend
  "resuming_from_suspend" => "Okay, we are now resuming the dialog.",

  # informs the user about restarting the dialog
  "starting_over" => "Okay, Let's restart ... ",

  # informs the user about quitting
  "quitting" => "Okay, thank you for calling. .. Have a nice day.",

  # informs the user that there was a non-understanding
  "nonunderstanding" =>
  	["Sorry, I'm not sure I understood what you said.",
  	 "Sorry, I didn't catch that.",
  	 "I'm sorry, I don't think I understood you correctly."],

  # informs the user that there was a subsequent non-understanding
  "subsequent_nonunderstanding" =>
    ["I apologize, but I still did not understand you.",
	   "I'm still having trouble understanding you.",
     "Sorry, I'm still having trouble understanding you."],

  # informs the user that a request just failed
  "nonunderstanding_failrequest" => "Sorry, I didn't catch that.",

  # informs the user that a request has failed (after a number of nonunderstandings
  "nonunderstanding_subsequent_failrequest" => "Sorry, I still didn't catch that.",

  # just issues a pause prompt
  "nothing" => " .. ",

  # mirrors the given prompt to the output
  "say" => sub {
    my %args = @_;
    return $args{"value"};
  },

  ###########################################################################
  # THE TASK SPECIFIC INFORMS
  ###########################################################################

  # give information about the system
  "system_capabilities" =>
	  "I can assist you in finding out about your last meeting. ".
	  "Now, moving back to where we were .. ",

  # welcome to the system
  "welcome" => sub {
    # first do a reset on the meeting referent since we're in a new dialog
    # session
    reset_last_meeting_referent();
    # then return the welcome
    return "This is MeetingLine.";
  },

  # greet the user
  "greet_user" => "Hi <user_profile.name>. ",
  
  # greet an unknown user
  "unknown_user" => "I'm sorry but that PIN is not in my database. If you are ".
    "not registered with the system, please contact dbohus@cs.cmu.edu ",
    
  # give information about when a meeting happened
  "when" => sub 
  {
    my %args = @_;
    # extract the date from the meeting name
    $args{"meeting.meetingName"} =~ /(\d\d\d\d)\_(\d\d)\_(\d\d)/;
    # return the information
    return get_meeting_referent($args{"meeting.meeting_referent"}, 1).
      " was held on ".get_date_as_string($1, $2, $3).".";
  },
  
  # give information about who participated in the meeting
  "who" => sub {
    my %args = @_;
    $args{"meeting.participants"} =~ /ARRAY\[(.+?)\]/;
    my $num_participants = $1;
    my $result = get_meeting_referent($args{"meeting.meeting_referent"}, 1).
      " was attended by $num_participants people: ";
    for(my $i = 0; $i < $num_participants; $i++) {
      $result .= get_user_referent($args{"meeting.participants.$i"}, 
        $args{"user_profile.user_name"});
      if($i < $num_participants - 2) { $result .= ", "; }
      elsif($i == $num_participants - 2) { $result .= " and "; }
    }
    $result .= ".";
    return $result;
  },

  # give information about the contents of the agenda
  "agenda" => sub 
  {
    my %args = @_;
    # now go through the agendas and accumulate the agenda items
    my $agendaItems = 0;
    my @agendaItemKeys;
    $args{"meeting.agendas"} =~ /ARRAY\[(.+?)\]/;
    my $num_agendas = $1;
    for(my $a = 0; $a < $num_agendas; $a++) 
    {
      if($args{"meeting.agendas.$a.text"} ne "Non agenda notes") 
      {
        $agendaItems++;
        push @agendaItemKeys, "meeting.agendas.$a.text";
      }
    }
    
    # now, depending on how many agenda items we found
    my $result;
    if($agendaItems == 0) 
    {
      $result = "There were no agenda items defined for ".
        get_meeting_referent($args{"meeting.meeting_referent"}, 1).".";
    } 
    elsif($agendaItems == 1) 
    {    
      $result = "There was one agenda item in ".
        get_meeting_referent($args{"meeting.meeting_referent"}, 1).
        ": ".$args{$agendaItemKeys[0]}." .";
    } 
    else 
    {
      $result = "$agendaItems agenda items were discussed in ".
        get_meeting_referent($args{"meeting.meeting_referent"}, 1).
        ": ";
      for($a = 0; $a < $agendaItems; $a++) 
      {
        my $item_no = $a+1;
        if($a == $agendaItems - 1) 
          { $result .= " and $item_no ... "; }
        elsif($a > 0) 
          { $result .= " ... $item_no ... "; }
        else 
          { $result .= $item_no." ... "; }
        $result .= $args{$agendaItemKeys[$a]};
      }
      $result .= " .";
    }
    
    # finally, return the result
    return $result;
  },

  # give information about the action items
  "action_items" => sub {
    my %args = @_;
   
    # see if we need the action items for a certain user
    my $action_items_for_user = 
      $args{"action_items_for_user"} ne "<UNDEFINED>";
   
    # now go through the agendas and accumulate all the action items 
    my $actionItems = 0;
    my @actionItemKeys;
    $args{"meeting.agendas"} =~ /ARRAY\[(.+?)\]/;
    my $num_agendas = $1;
    for(my $a = 0; $a < $num_agendas; $a++) {
      $args{"meeting.agendas.$a.notes"} =~ /ARRAY\[(.+?)\]/;
      my $num_notes = $1;
      for(my $n = 0; $n < $num_notes; $n++) {
        if(($args{"meeting.agendas.$a.notes.$n.type"} eq "actionItem") && 
           (!$action_items_for_user || 
            user_equals($args{"action_items_for_user"},  
                        $args{"meeting.agendas.$a.notes.$n.whoResponsible"}, 
                        $args{"user_profile.user_name"}))) {
          $actionItems++;
          push @actionItemKeys, "meeting.agendas.$a.notes.$n";             
        }
      }
    }
    # now, depending on how many action items we found
    my $result;
    if($actionItems == 0) {
      if($action_items_for_user) {
        $result = "No action items were assigned to ".
          get_user_referent($args{"action_items_for_user"}, 
            $args{"user_profile.user_name"}).
          " during ".get_meeting_referent($args{"meeting.meeting_referent"}, 1).".";
      } else {
        $result = "No action items were assigned during ".
          get_meeting_referent($args{"meeting.meeting_referent"}, 1).".";
      }
    } elsif($actionItems == 1) {    
      my $key = $actionItemKeys[0];
      $result = "One action item was assigned to ".
        get_user_referent($args{"$key.whoResponsible"}, 
         $args{"user_profile.user_name"}).
        ": ".$args{"$key.text"}.". This action item was assigned by ".
        get_user_referent($args{"$key.author"}, 
         $args{"user_profile.user_name"}).".";
    } else {
      $result = "There were $actionItems action items. ";
      # no go through these by who is Responsible
      my %whos;
      foreach $key (@actionItemKeys) {
        $whos{lc($args{"$key.whoResponsible"})} = 1;
      }
      # now go through each who
      foreach $who (keys %whos) {
        printf "----- $who\n";
        # collect the action items for this person
        my @actionItemsForWho;
        foreach $key (@actionItemKeys) {
          if(lc($args{"$key.whoResponsible"}) eq lc($who)) {
            push @actionItemsForWho, $args{"$key.text"};
          }
        }
        # now generate the text
        for(my $a=0; $a < scalar(@actionItemsForWho); $a++) {
          if(($a == scalar(@actionItemsForWho)-1) && ($a > 0)) { $result .= " ... and "; }
          elsif($a > 0) { $result .= " ... "; }
          $result .= $actionItemsForWho[$a];
        }
        # now concatenate with the user
        $result .= ((scalar(@actionItemsForWho)>1)?" were":" was").
          " assigned to ".
          get_user_referent($who, $args{"user_profile.user_name"}).". ";
      }
    }
    # finally, return the result
    return $result;
    },
	
    # bid goodbye
    "logout" => "Thank you for using the MeetingLine system. .. Have a nice day.",
	
	"vad_error" => "An error occured while processing your speech. Please repeat what you said."
};
