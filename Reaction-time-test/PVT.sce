#define your files

scenario = "PVT";


pcl_file = "PVT.pcl";



#standard settings

scenario_type = trials;
         

response_logging = log_active;  #log only if response is expected

response_matching = simple_matching;


active_buttons = 1;



#####################################################

begin;

#####################################################



#Stimuli


box {
	height = 200;
	width = 200;
	color = 255, 255, 255;
} box1;

box {
	height = 200;
	width = 200;
	color = 0, 0, 0;
} box2;


#Trials

trial {
	trial_duration = 1000;
   
	trial_type = first_response;
	
	all_responses = true;
		
   
	stimulus_event{
      
		picture{
		box box1;
		x = 0; 
		y = 0;
      
		}pic1;
	target_button = 1;
	}ev_box;	

} tr_box; 

trial {     
	trial_duration = 4000;
	trial_type = fixed;
	all_responses = false;	
	stimulus_event{
		picture{
		box box2;
		x = 0; 
		y = 0;
		}pic2;
	}ev_box2;
} tr_interval; 