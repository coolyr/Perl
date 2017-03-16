
# These are the ESTABLISH_CONTEXT acts for MeetingLine

use Rosetta::Templates::Util;

$Rosetta::Templates::act{"establish_context"} = 
{

    # establish context during the login
    "login" => "I am trying to log you into the system.",
   
    # estalish context during the how_may_i_help you prompt
    "how_may_i_help_you" => "I am an automated spoken dialogue system that can help you find out about past meetinngs.",

    # establish context during the logout phase
    "logout" => "We are now in the final phase of the conversation. "

};
