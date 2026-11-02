`timescale 1ns/1ps 
module tb_mux4to1;
   reg I0, I1, I2, I3, S1, S0;
   wire Y; 

  mux4to1 uut (.I0(I0),.I1(I1),.I2(I2),.I3(I3), 
               .S1(S1),.S0(S0),.Y(Y));

  initial begin 
     $d
    mpfile("mux4to1.vcd"); 
     $dumpvars(0, tb_mux4to1);
     {I0,I1,I2,I3} = 4'b0101; 
     {S1,S0}=2'b00; #10;
     {S1,S0}=2'b01;
     {S1,S0}=2'b10;
     {S1,S0}=2'b11;
     {I0,I1,I2,I3}=4'b1010;
     {S1,S0}=2'b00; #10;
     {S1,S0}=2'b01;
     {S1,S0}=2'b10;
     {S1,S0}=2'b11;
     $finish; 
  end 

   initial $monitor("t=%0t S=%b%b I=%b%b%b%b Y=%b",
                    $time,S1,S0,I3,I2,I1,I0,Y);
endmodule 
   
    
