module ReadData(clk, RW,Devsel,Iready,RD);
input wire Devsel,Iready,clk;
input wire [1:0] RW;
output reg[1:0] RD;
 
always@(negedge clk)
begin
if(Devsel==0 && Iready==0)
begin
 case(RW)
 0: RD=0; 
 1: RD=1;
 2: RD=2;
 3: RD=0;
endcase
end
end
endmodule 

module ReadDatatest ();
reg clk,Devsel,Iready;
reg [1:0] RW;
wire [1:0] RD;
initial
begin
$monitor($time ,,,"Devsel=%b RW=%d Iready=%b RD=%d",Devsel,RW ,Iready,RD);
clk=0;
Devsel=1;
Iready=1; 
RW=2;
#10
Devsel=1;
Iready=1;
RW=1;
#10
Devsel=1;
Iready=1;
RW=3;
#10
Devsel=1;
Iready=1;
RW=0;
#10
Devsel=1;
Iready=0;
RW=1;
#10
Devsel=0;
Iready=1;
RW=1;
end 
always
begin 
#5 clk=~clk;
end
ReadData R1(clk,RW,Devsel,Iready,RD);
endmodule
