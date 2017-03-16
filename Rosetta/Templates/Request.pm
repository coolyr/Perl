# These are the REQUEST acts for MeetingLine

use Rosetta::Templates::Util;

$Rosetta::Templates::act{"request"} = {

    ###########################################################################
    # A SET OF GENERIC REQUESTS FOR THE LIBRARY AGENTS
    ###########################################################################

    # requests for timeout agents
    "are_you_sti ll_there" => "Are you still there?",
    "resume_after_timeout" => "This session has been suspended. .. To restart the interaction, please say, \"Start over\".",

    # request for suspend/resume agency
    "resume_from_suspend" => "This session has been temporarily suspended. .. To restart the interaction, please say, \"Restart session\".",

    # request nothing (just wait for the user to say something)
    "nothing" => "",

    # request sure for starting over
    "sure_start_over" => 
    {
      "default" => "Are you sure you want to start over?",
      "explain_more" => "Right now I need to make sure that you indeed want to start over this session. .. Are you sure you want to start over?",
      "what_can_i_say" => "If you want to start from the beginning say 'yes', otherwise, if you want to continue the dialog from where we currently are, just say 'no'."
    },

    # request sure for quitting
    "sure_quit" => 
    {
      "default" => "Are you sure you want to terminate this session?",
      "explain_more" => "Right now I need to make sure that you indeed want to quit this session. .. Are you sure you want to quit?",
      "what_can_i_say" => "If you want to quit the session, just say 'yes', otherwise say 'no'."
    },

    # ask the user to repeat on a non-understanding
    "nonunderstanding_askrepeat" => "Can you please repeat that?",

    # ask the user to rephrase on a non-understanding
    "nonunderstanding_askrephrase" => "Could you please try to rephrase that?",

    ###########################################################################
    # THE TASK SPECIFIC REQUESTS
    ###########################################################################

    # user_pin
    "user_pin" => 
    {
      "default" => "Please say your username.",
      "explain_more" => "Before I can give you information, I need to verify your identity.",
      "what_can_i_say" => "Please say if your username is either Alex, Arthur, Bano, Dan, or David.",
      "timeout" => "Your username can be Alex, Arthur, Bano, Dan, or David."
    },

    # meeting referent
    "meeting_referent" => 
    {
      "default" => "Which meeting do you want information for?",
      "explain_more" => "Right now I need to know which meeting you'd like information about. ",
      "what_can_i_say" => "You can say something like 'my last meeting' or 'my previous meeting'.",
    },

    # meeting request
    "query" => 
    {
      "default" => sub {
        my %args = @_;
        return "What do you want to know about ".
          get_meeting_referent($args{"meeting.meeting_referent"})."?";
      },
      "what_can_i_say" => "Options are: 'when was the meeting', ".
        "'who attended the meeting', 'what did we talk about', ". 
        " or 'what did they decide'.",
    },

    # another meeting request
    "anything_else" => 
    {
      "default" => ["Anything else?", "Is there anything else?", "Anything else I can help with?"],
        
      "what_can_i_say" => "For instance, you can say 'when was the meeting', 'who attened ".
        "the meeting', or 'how about my previous meeting'. If you are done, ". 
        "simply answer 'no'.",
    },
	

};
