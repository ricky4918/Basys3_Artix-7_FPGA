module PWM_Generator_Verilog
 (
 input clk, 
 input inc_duty, //increase duty by 10%
 input dec_duty, //decrease dyty by 10%
 output PWM_OUT 
    );
 

 wire slow_clk_enable; 
 reg[27:0] counter=0;
 wire Q1;
 wire Q2;
 wire Q3;
 wire Q4;
 wire duty_inc;
 wire duty_dec;
 reg[3:0] PWM_counter = 0;
 //reg[3:0] DUTY_CYCLE = 1;//30MHZ
 reg[3:0] DUTY_CYCLE = 5;//10MHZ 
 
 //4HZ clock for slow clock
 always @(posedge clk)
 begin
   counter <= counter + 1;
   if(counter>=25000000)   
    counter <= 0;
 end
 assign slow_clk_enable = counter == 25000000 ?1:0;
 
 
 
 DFF_PWM PWM_DFF1(clk, slow_clk_enable, inc_duty, Q1);
 DFF_PWM PWM_DFF2(clk, slow_clk_enable, Q1, Q2); 
 assign duty_inc =  Q1 & (~ Q2) & slow_clk_enable;

 
 DFF_PWM PWM_DFF3(clk,slow_clk_enable,decrease_duty, Q3);
 DFF_PWM PWM_DFF4(clk,slow_clk_enable,Q3, Q4); 
 assign duty_dec =  Q3 & (~ Q4) & slow_clk_enable;
 
 
 always @(posedge clk)
 begin
   //if(duty_inc==1 && DUTY_CYCLE <= 2)//30MHZ
   if(duty_inc==1 && DUTY_CYCLE <= 9)//10MHZ 
    DUTY_CYCLE <= DUTY_CYCLE + 1;
   else if(duty_dec==1 && DUTY_CYCLE>=1) 
    DUTY_CYCLE <= DUTY_CYCLE - 1;
 end 
 

 always @(posedge clk)
 begin
   PWM_counter <= PWM_counter + 1;
   //if(PWM_counter>=2)//30MHZ
   if(PWM_counter>=5)//10MHZ  
    PWM_counter <= 0;
 end
 assign PWM_OUT = PWM_counter < DUTY_CYCLE ? 1:0;
endmodule

 