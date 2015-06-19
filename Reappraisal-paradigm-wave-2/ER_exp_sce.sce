scenario = "ER_exp_sce";

pcl_file = "ER_exp_pcl.pcl";

scenario_type = trials;
         
active_buttons = 5;
button_codes = 1,2,3,4,5;
response_logging = log_active;  #log only if response is expected
response_matching = simple_matching;

default_output_port = 1;
response_port_output = false;
write_codes = true;
pulse_width = 100; 

default_background_color = 0,0,0;   
default_font_size = 40;
default_text_color = 255,255,255;
default_font = "Tahoma";                                    

#######################################
begin;
#######################################

text { caption = "XXX"; 
font_size =20;
preload = false; 
} gap; 

# FIXATION CROSS #
picture {text {caption = "+"; font_size=100; font_color = 255,255,255,;}; x=0;y=0;} fixation_cross;

# RANGE OF RATING SCALE # 
array{ 
text {caption = "0";}; 
text {caption = "100";}; 
} number;

# QUESTION ABOVE RATING SCALE # 
array{ 
text { caption = "Skatta ditt upplevda obehag";}; 
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

picture {} default;

# TEMPLATE #
TEMPLATE "ERresp_temp.tem";

# TRIALS #
trial {     
   trial_duration = forever;
   trial_type = first_response;
	all_responses = true;
	
      stimulus_event{
      picture {
         bitmap {filename = "rest.jpg";}; x = 0; y = 0;
         } pic_rest;
		time=0;
		target_button=2;      
		code = "rest";
      } ev_rest;
                 
}tr_rest;  

trial {     
   trial_duration = stimuli_length;
   trial_type = fixed;
	all_responses = false;
	
   stimulus_event{ 
      picture {
         text {caption = "Instruction";}; x = 0; y = 0;
         } pic_inst;
		deltat=0;  
		duration = 2000;
      code = "Inst";
      } ev_inst;
      
   stimulus_event{ 
      picture {
         text {caption = "Pic";}; x = 0; y = 0;
         } pic_pic;  
      deltat= 2000;
		duration = 1000;
      code = "Pic";
      port_code = 99;
      } ev_pic;
      
   stimulus_event{  #interval to rating
		picture {
         bitmap {filename = "black.jpg";}; x = 0; y = 0;
         } pic_interval;
      deltat= 3000;
		duration = 4000; #will be redefined in PCL
      code = "Interval";
      } ev_interval;   
      
}tr_instpic;

trial {     
   trial_duration = stimuli_length;
   trial_type = fixed;
	all_responses = false;
	
      stimulus_event{  #intertrial interval, fixation cross
      picture fixation_cross;
		time = 0;		
		duration = 2000; #will be redefined in PCL
      code = "ITI";
      } ev_iti;
                 
}tr_iti; 

# RATING SCALE #
trial {
	all_responses = true;
	trial_duration = stimuli_length;
   trial_type = fixed;
} tr_rate;   