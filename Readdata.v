module ReadData(RW,Devsel,Iready,RE,WE);
input wire Devsel,Iready;
input wire [1:0] RW;
output reg RE,WE;
 
always@(RW,Iready,Devsel)
begin
if(Devsel==0 && Iready==0)
begin
case(RW)
0: begin RE=0;WE=0; end
1: begin RE=1;WE=0; end
2: begin RE=0;WE=1; end
default:begin RE=0;WE=0; end
endcase
end
else
begin 
RE=0;
WE=0;
end
end
endmodule 

module ReadDatatest ();
reg clk,Devsel,Iready;
reg [1:0] RW;
wire [1:0] RE,WE;
initial
begin
$monitor($time ,,,"Devsel=%b RW=%d Iready=%b RE=%d WE=%d",Devsel,RW ,Iready,RE,WE);
Devsel=1;
Iready=1; 
RW=0;

#10
Devsel=1;
Iready=0;
RW=2;

#10
Devsel=1;
Iready=1;
RW=2;

/*
#10
Devsel=0;
Iready=0;
RW=1;
#10
Devsel=0;
Iready=0;
RW=3;
#10
Devsel=0;
Iready=0;
RW=0;
#10
Devsel=0;
Iready=1;
RW=1;
#10
Devsel=0;
Iready=0;
RW=2;
#10
Devsel=1;
Iready=0;
RW=1;
*/
end
ReadData R1(RW,Devsel,Iready,RE,WE);
endmodule
