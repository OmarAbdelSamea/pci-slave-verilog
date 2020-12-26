module TRDY (clk,devsel,Trdy,storageControl);
input clk,devsel,storageControl;
output reg Trdy;
reg storageControlTemp;
always@(posedge clk)
begin
storageControlTemp<=storageControl;
end
always@(negedge clk)
begin
if(storageControlTemp==1)
begin
	case (devsel)
	0: Trdy<=0;
	1: Trdy<=1;
	default:Trdy<=1;
endcase
end

else
begin 
Trdy<=1;
end
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
#50
devsel=0;
storageControl=0;
#50
devsel=0;
storageControl=0;
#50
devsel=0;
storageControl=0;
#50
devsel=1;
storageControl=0;
#50
devsel=0;
storageControl=0;
#50
devsel=0;
storageControl=1;
#50
devsel=0;
storageControl=0;
end
TRDY R1(clk,devsel,Trdy,storageControl);
always
begin 
#10 clk=~clk;
end
endmodule
