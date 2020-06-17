
/*--------------------------------------------------------------------------------
  Project: Stopwatch
  Module: Trigger_Detection Testbench
  Author:Pengfei He
  Date:June/16/2020
  Module Description:
  Testbench for Trigger_Detection circuit
---------------------------------------------------------------------------------*/




module rtc_trigger_detection_tb;
  reg i_sclk;
  reg i_reset_n;
  reg i_trigger;        
  wire o_countinit;
  wire o_countenb;
  wire o_latchcount;

 rtc_trigger_detection uut (
   .i_sclk(i_sclk),
   .i_reset_n(i_reset_n),
   .i_trigger(i_trigger),     
   .o_countinit(o_countinit),
   .o_countenb (o_countenb),
   .o_latchcount(o_latchcount));

always
#5 i_sclk = !i_sclk;

initial
begin
i_sclk=0;
i_trigger=0;                
i_reset_n=0;

fork
//---------------------------------TRIGGER_TC_01 BEGIN----------------------------//
begin: TC_01
#5
i_trigger=0;                
i_reset_n=0;

if(o_countenb == 1'b0 && o_latchcount == 1'b0) begin
      $display("Time=>%0d, i_reset_n=>%b, o_countenb=>%b, o_latchcount=>%b  [TRIGGER_TC_01 PASS] "
      ,$time,i_reset_n,o_countenb,o_latchcount); 
 end else begin
      $display("Time=>%0d, i_reset_n=>%b, o_countenb=>%b, o_latchcount=>%b  [TRIGGER_TC_01 FAIL] "
      ,$time,i_reset_n,o_countenb,o_latchcount); 
 end
end:TC_01
//---------------------------------TRIGGER_TC_01 END----------------------------//


//---------------------------------TRIGGER_TC_02 BEGIN----------------------------//
begin:TC_02
#5
if(o_countinit==1'b1)begin
      $display("Time=>%0d, i_reset_n=>%b, o_countinit=>%b  [TRIGGER_TC_02 PASS] "
      ,$time,i_reset_n,o_countinit); 
 end else begin
      $display("Time=>%0d, i_reset_n=>%b, o_countenb=>%b   [TRIGGER_TC_02 FAIL]"
      ,$time,i_reset_n,o_countinit); 
 end 

end:TC_02   
//---------------------------------TRIGGER_TC_02 END----------------------------//

//---------------------------------TRIGGER_TC_03_1 BEGIN----------------------------//

begin:TC_03_DATA_1   
#10 
i_reset_n=1;
end:TC_03_DATA_1

begin:TC_03_1
#25
if(o_countinit == 0)begin
     $display("Time=>%0d ,i_reset_n=>%b, o_countinit=>%b [TRIGGER_TC_03 PASS]"
     ,$time,i_reset_n,o_countinit); 
  end else begin
     $display("Time=>%0d ,i_reset_n=>%b, o_countinit=>%b [TRIGGER_TC_03 FAIL]"
     ,$time,i_reset_n,o_countinit); 
end
end:TC_03_1
//---------------------------------TRIGGER_TC_03_1 END----------------------------//

//---------------------------------TRIGGER_TC_04_1 BEGIN----------------------------//
begin:TC_04_DATA_1  
#10 
i_trigger=1;   
i_reset_n=1;
end:TC_04_DATA_1

begin:TC_04_1
#35
if(o_countenb == 1)begin
      $display("Time=>%0d ,i_trigger=>%b,o_countenb=>%b, o_latchcount=>%b [TRIGGER_TC_04 PASS]"
      ,$time,i_trigger,o_countenb,o_latchcount); 
end else begin
      $display("Time=>%0d ,i_trigger=>%b,o_countenb=>%b, o_latchcount=>%b [TRIGGER_TC_04 FAIL] "
      ,$time ,i_trigger,o_countenb,o_latchcount); 
end

end: TC_04_1

begin:TC_04_DATA_2  
#35 
i_trigger=0;   
i_reset_n=1;
end:TC_04_DATA_2
//---------------------------------TRIGGER_TC_04_1 END----------------------------//


//---------------------------------TRIGGER_TC_04_2 BEGIN----------------------------//
begin:TC_04_DATA_3  
#50 
i_trigger=1;   
i_reset_n=1;
end:TC_04_DATA_3

begin:TC_04_2
#75
if(o_countenb == 0)begin
      $display("Time=>%0d ,i_trigger=>%b,o_countenb=>%b, o_latchcount=>%b [TRIGGER_TC_04 PASS]"
      ,$time,i_trigger,o_countenb,o_latchcount); 
end else begin
      $display("Time=>%0d ,i_trigger=>%b,o_countenb=>%b, o_latchcount=>%b [TRIGGER_TC_04 FAIL] "
      ,$time ,i_trigger,o_countenb,o_latchcount); 
end

end: TC_04_2

begin:TC_04_DATA_4  
#75 
i_trigger=0;   
i_reset_n=1;
end:TC_04_DATA_4
//---------------------------------TRIGGER_TC_04_2 END----------------------------//


//---------------------------------TRIGGER_TC_04_3 BEGIN----------------------------//
begin:TC_04_DATA_5  
#120 
i_trigger=1;   
i_reset_n=1;
end:TC_04_DATA_5

begin:TC_04_3
#145
if(o_countenb == 1)begin
      $display("Time=>%0d ,i_trigger=>%b,o_countenb=>%b, o_latchcount=>%b [TRIGGER_TC_04 PASS]"
      ,$time,i_trigger,o_countenb,o_latchcount); 
end else begin
      $display("Time=>%0d ,i_trigger=>%b,o_countenb=>%b, o_latchcount=>%b [TRIGGER_TC_04 FAIL] "
      ,$time ,i_trigger,o_countenb,o_latchcount); 
end

end: TC_04_3

begin:TC_04_DATA_6  
#145 
i_trigger=0;   
i_reset_n=1;
end:TC_04_DATA_6
//---------------------------------TRIGGER_TC_04_3 END----------------------------//


//---------------------------------TRIGGER_TC_04_4 BEGIN----------------------------//
begin:TC_04_DATA_7  
#180 
i_trigger=1;   
i_reset_n=1;
end:TC_04_DATA_7

begin:TC_04_4
#205
if(o_countenb == 0)begin
      $display("Time=>%0d ,i_trigger=>%b,o_countenb=>%b, o_latchcount=>%b [TRIGGER_TC_04 PASS]"
      ,$time,i_trigger,o_countenb,o_latchcount); 
end else begin
      $display("Time=>%0d ,i_trigger=>%b,o_countenb=>%b, o_latchcount=>%b [TRIGGER_TC_04 FAIL] "
      ,$time ,i_trigger,o_countenb,o_latchcount); 
end

end: TC_04_4

begin:TC_04_DATA_8  
#205 
i_trigger=0;   
i_reset_n=1;
end:TC_04_DATA_8
//---------------------------------TRIGGER_TC_04_4 END----------------------------//

join
 $display ("Simulation Finished");
 $finish;
end

endmodule