#define your files
scenario = "FMOV";

pcl_file = "FMOV.pcl";

#standard settings
scenario_type = trials;
         
response_logging = log_active;  #log only if response is expected
response_matching = simple_matching;

active_buttons = 5;
button_codes = 1,2,3,4,5;
default_output_port = 1; #parallel port 
response_port_output = false;
write_codes = true;
pulse_width = 100; #duration of shock

default_background_color = 0,0,0;   
default_font_size = 40;
default_text_color = 255,255,255;
default_font = "Tahoma"; 

#####################################################
begin;
#####################################################

text { caption = "XXX"; 
font_size =20;
preload = false; 
} gap; 

# RANGE OF RATING SCALE # 
array{ 
text {caption = "0";}; 
text {caption = "100";}; 
} number;

# QUESTION ABOVE RATING SCALE # 
array{ 
text { caption = "Hur attraktiv upplevde du att personen var?";}; 
text { caption = "Hur attraktiv upplevde du att personen var?";}; 
} questions; 

# RATING SCALE # 
picture { 
box { height = 10; width = 200; color = 255,255,255; }; 
x = 0; y = 0; 
box { height = 50; width = 5;color = 255,255,255; }; 
x = 0; y = 0; 
text gap; 
x = -200; y = 0; 
text gap; 
x = 200; y = 0; 
text gap; 
x=0; y=150; 
}scale; 

#Stimuli
picture {} default;
picture {text {caption = "+"; font_size=100; font_color = 255,255,255,;}; x=0;y=0;} fixation_cross;
picture {text {caption = "+"; font_size=100; font_color = 255,255,255,;}; x=0;y=0;} rest;

#Videos
array {
	video { filename = "2_happy.avi"; description = "vid1"; }vid1;
	video { filename = "3_happy.avi"; description = "vid2"; };
	video { filename = "4_happy.avi"; description = "vid3"; };
	video { filename = "5_happy.avi"; description = "vid4"; };
}videos_happy;

array {
	video { filename = "2_angry.avi"; description = "vid5"; };
	video { filename = "3_angry.avi"; description = "vid6"; };
	video { filename = "4_angry.avi"; description = "vid7"; };
	video { filename = "5_angry.avi"; description = "vid8"; };
}videos_angry;

array {
	video { filename = "2_neutral.avi"; description = "vid9"; };
	video { filename = "3_neutral.avi"; description = "vid10"; };
	video { filename = "4_neutral.avi"; description = "vid11"; };
	video { filename = "5_neutral.avi"; description = "vid12"; };
}videos_neutral;

#Trials
trial {     
   trial_duration = stimuli_length;
   trial_type = fixed;
	all_responses = true;
		
   stimulus_event{
      video vid1;
      port_code = 2;
      } ev_vid;	
} tr_vid; 

#Rest trial
trial {
	all_responses = false;
	trial_duration = stimuli_length;
   trial_type = fixed;

	stimulus_event{ 
		picture fixation_cross;
		deltat = 0;
		duration = 2000;
		code="fixation_cross";		
	} ev_fixation_cross;
} tr_rest; 