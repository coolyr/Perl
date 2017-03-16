package Rosetta::Templates::Util;#创建一个 Util 类

# Various auxiliary subroutines

use Time::Local;

# (dbohus): this hash stores a mapping from user_names to names. This should not
# be hardcoded in here, but rather available in a file
my %user_name_to_name = (
  "dbohus" => "dan",
  "air" => "alex",
  "banerjee" => "bano",
  "dhuggins" => "david",
  "archan" => "arthur",
  "yitao" => "yitao"
);

# (dbohus): this hash stores a mapping from names to user_names. This should not
# be hardcoded in here, but rather available in a file
my %name_to_user_name = (
  "dan" => "dbohus",
  "alex" => "air",
  "bano" => "banerjee",
  "david" => "dhuggins",
  "yitao" => "yitao"
);

# store the last meeting referent used in the NLG
my $last_meeting_referent = "";



# (dbohus): reset the meeting referent
sub Rosetta::Templates::reset_last_meeting_referent {
  $last_meeting_referent = "";
}

# (dbohus): gemerate a meeting referent
sub Rosetta::Templates::get_meeting_referent {
  # get the meeting referent as a parameter
  my $meeting_referent = shift;
  my $update_last_referent = shift;
  
  # store the result
  my $result; 

  if($meeting_referent eq $last_meeting_referent) {
    # if we've already expliticly refered to this meeting, return this meeting
    # or the meeting
    $result = "this meeting";
  } else {
    # if we haven't already refered to it, just use a referent
    if($meeting_referent eq "last_meeting") {
      $result = "your last meeting";
    } elsif($meeting_referent eq "previous_meeting") {
      $result = "your previous meeting";
    }
  }
  
  # set the last_meeting_referent
  if($update_last_referent) {
    $last_meeting_referent = $meeting_referent;
  } else {
    $last_meeting_referent = "";
  }
  
  # finally, return the constructed string
  return $result;
}

# (dbohus): generate a user referent
sub Rosetta::Templates::get_user_referent {
  my $user_name = lc(shift);
  my $current_user_name = lc(shift);
  
  # check that this is an actual user_name as opposed to a name
  if(!exists($user_name_to_name{$user_name}) &&
     exists($name_to_user_name{$user_name})) {
    $user_name = $name_to_user_name{$user_name};
  }
  
  printf "---> $user_name $current_user_name\n";
  
  if($user_name eq $current_user_name) {
    return "you";
  } else {
    if(exists($user_name_to_name{$user_name})) {
      return $user_name_to_name{$user_name};
    } else {
      return $user_name;
    }
  }
}

# (dbohus): returns true if 2 user_names are equal (accounts for the fact 
# that there might be an "I" or "Me" reference
sub Rosetta::Templates::user_equals {
  my $user_name_1 = lc(shift);
  my $user_name_2 = lc(shift);
  my $current_user_name = lc(shift);
  
  # check that we have an "I" referent
  if(($user_name_1 eq "i") || ($user_name_1 eq "me")) { 
    $user_name_1 = $current_user_name; 
  }
  # check that this is an actual user_name as opposed to a name
  if(!exists($user_name_to_name{$user_name_1}) &&
     exists($name_to_user_name{$user_name_1})) {
    $user_name_1 = $name_to_user_name{$user_name_1};
  }
  # check that we have an "I" referent
  if(($user_name_2 eq "i") || ($user_name_2 eq "me")) { 
    $user_name_2 = $current_user_name; 
  }
  # check that this is an actual user_name as opposed to a name
  if(!exists($user_name_to_name{$user_name_2}) &&
     exists($name_to_user_name{$user_name_2})) {
    $user_name_2 = $name_to_user_name{$user_name_2};
  }
  
  # finally, compare
  return ($user_name_1 eq $user_name_2);
}

# (dbohus): takes a date (year, month, day), and returns a string
# describing that date: i.e. on January 17th.
sub Rosetta::Templates::get_date_as_string {
  # extract the parameters

  # extract the year, month and day_num from the frame
  my $year = shift;
  my $month = shift;
  my $day = shift;

  # transform this into epochs
  my $epochs = timelocal(0, 0, 0, $day, $month-1, $year-1900);
  my $day_of_week = (localtime $epochs)[6];

  # extract the weekday
  my $weekday = ('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday',
		 'Friday', 'Saturday')[$day_of_week];

  # extract the month name
  $month_name = ('January', 'February', 'March', 
		 'April', 'May', 'June', 'July',
		 'August', 'September', 'October',
		 'November', 'December')[$month-1];

  # extract the day name
  my $day_name = ('first', 'second', 'third', 'fourth', 'fifth',
		  'sixth', 'seventh', 'eighth', 'ninth', 'tenth',
		  'eleventh', 'twelfth', 'thirteenth', 'fourteenth',
		  'fifteenth', 'sixteenth', 'seventeenth',
		  'eighteenth', 'nineteenth', 'twentieth', 'twenty first',
		  'twenty second', 'twenty third', 'twenty fourth',
		  'twenty fifth', 'twenty sixth', 'twenty seventh',
		  'twenty eighth', 'twenty ninth', 'thirtieth', 
		  'thirty first')[$day-1];

  # now start generating the answer
  my $answer;

  # scalar(localtime()) returns a string like for example
  # Fri Jan 15 19:59:15 1999
  my $now = scalar(localtime());

  # identify the pieces
  $now =~ s/^([^ ]+) +([^ ]+) +([^ ]+) +([^ ]+) +([^ ]+)//;
  $now_day = $3;
  $today = $now_day;
  $tomorrow = $now_day + 1;
  $yesterday = $now_day - 1;
  $now_month = $2;
  $now_year = $5;

  # analyze now depending o the date in the relation to now
  if ($year ne $now_year) {
    # if the years are not the same
    $answer = " $weekday, $month_name $day_name, $year";
  } elsif ($month_name !~ /^$now_month/i) {
    # if the months are not the same 
    $answer = " $weekday, $month_name $day_name";
  } else {
    # o/w if it's in the same month/year
    if ($day == $today) {
      # if it's today
      $answer = " today";
    } elsif ($day == $yesterday) {
      # if it's yesterday
      $answer = " yesterday";
    } elsif ($day == $tomorrow) {
      # if it's tomorrow
      $answer = " tomorrow";
    } else {
      # o/w it's some day in the future in this month
      $answer = " $weekday, $month_name $day_name";
    }
  }
  return $answer;
}

# convert numbers into strings
sub Rosetta::Templates::number_to_string {
  my $number = shift;
  my %conv = ("1" => "one",
	      "2" => "two",
	      "3" => "three",
	      "4" => "four",
	      "5" => "five",
	      "6" => "six",
	      "7" => "seven",
	      "8" => "eight",
	      "9" => "nine",
	      "10" => "ten",
	      "11" => "eleven",
	      "12" => "twelve",
	      "13" => "thirteen",
	      "14" => "fourteen",
	      "15" => "fifteen",
	      "16" => "sixteen",
	      "17" => "seventeen",
	      "18" => "eighteen",
	      "19" => "nineteen",
	      "20" => "twenty",
	      "25" => "twenty five",
	      "30" => "thirty",
	      "35" => "thirty five",
	      "40" => "forty",
	      "45" => "forty five",
	      "50" => "fifty",
	      "60" => "sixty",
	      "70" => "seventy",
	      "80" => "eighty");

  # go through the conversion hash if the entry exists
  if(exists($conv{$number})) {
    return $conv{$number};
  } else {
    return $number;
  }Z
}

1; # since it's a package and it needs to return a value


$NLG::Templates::act{"inform"} = {
 
  # 通知用户正在查询
  "look_up_database_first" => "请稍等！正在问您导航···",
  # 查询到多个信息，对用户进行展示
  "mutil_result_choice" => sub
  {
    my %args = @_;#取得输入参数
    my @keys = keys %args;#取得所有key值
    my $size = @keys#取得结果的个数
    # 返回对话模板
    my @locations = get_locations(%args);#取得所有地点的slot名
    return "为您查询到 $size 个结果信息，分别是:".
      foreach $loc (@locations)
	   print "$loc、".
  }
}
