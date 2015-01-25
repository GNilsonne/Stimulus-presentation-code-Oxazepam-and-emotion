#define your files
scenario = "EP";

pcl_file = "EP.pcl";

#standard settings
scenario_type = trials;
         
active_buttons = 5;
button_codes = 1,2,3,4,5;
response_logging = log_active;  #log only if response is expected
response_matching = simple_matching;

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

#Stimuli
picture {} default;
picture {text {caption = "+"; font_size=100; font_color = 255,255,255,;}; x=0;y=0;} fixation_cross;
TEMPLATE "template.tem";

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
text { caption = "Skatta din upplevda smärtintensitet";}; 
text { caption = "Skatta ditt upplevda obehag";}; 
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

#######################################################
#Define trialtypes
#######################################################

# FIXATION CROSS #
trial {
	all_responses = false;
	trial_duration = stimuli_length;
   trial_type = fixed;
	stimulus_event{ 
		picture fixation_cross;
		time = 0;
		duration = 4000;
		code="fixation_cross";		
	} ev_fixation_cross;
} tr_fixation_cross;   

		
# CONDITION TRIAL #
trial {     
   trial_duration = stimuli_length;
   trial_type = fixed;
	all_responses = false;
	
   stimulus_event{  #condition
      picture {
         text {caption = "condition";}; x = 0; y = 0;
         } pic_condition;  
		time=0;
		duration = 	4000; #This will later be defined in the pcl
      code = "condition";
      } ev_condition;	
      
}tr_condition;

# PORT OUTPUT #

trial{
   trial_duration = stimuli_length;
   trial_type = fixed;
	all_responses = false;
	
	stimulus_event{
		nothing {};
      port_code = 99;
      code = "port_output";
      } ev_port_output;
}tr_port_output;

# SHOCK #
trial {     
   trial_duration = stimuli_length;
   trial_type = fixed;
	all_responses = false;
   stimulus_event{  #shock picture
         picture {
         text {caption = "condition";}; x = 0; y = 0;
         } pic_shock;  
         time=0;
		duration = 2000; 
      code = "shockpic";
      } ev_shockpic;
	
  stimulus_event{  
		nothing {};
		code = "Shock";
		deltat = 0;
		port_code = 1;
		} ev_shock;		
		
	} tr_shock;

# RATING SCALE #
trial {
	all_responses = true;
	trial_duration = stimuli_length;
   trial_type = fixed;
} tr_rate;   

#########################