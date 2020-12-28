module TRDY (clk,devsel,Trdy,storageControl);
input clk,devsel,storageControl;
output reg Trdy = 1;


always@(devsel or storageControl)
begin
case (storageControl)
	0: Trdy<=1;
	1: Trdy<=devsel;
	default:Trdy<=1;
endcase
end
endmodule

module TRDYtst();
reg clk,devsel,storageControl;
wire Trdy;
initial
begin 
$monitor($time ,,,"Devsel=%b  Trdy=%b storageControl=%b",devsel,Trdy,storageControl);
clk=0;
devsel=0;
storageControl=1;
#60
devsel=0;
storageControl=1;
#60
devsel=1;
storageControl=1;
#60
devsel=0;
storageControl=1;
#60
devsel=0;
storageControl=1;
#60
devsel=1;
storageControl=1;
#60
devsel=0;
storageControl=1;
#60
devsel=0;
storageControl=1;
#60
devsel=0;
storageControl=0;
#60
devsel=0;
storageControl=0;
#60
devsel=0;
storageControl=1;
end
TRDY R1(clk,devsel,Trdy,storageControl);
always
begin 
#10 clk=~clk;
end
endmodule
