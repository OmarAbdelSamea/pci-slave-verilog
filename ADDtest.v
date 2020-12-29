module PCITB(AddressData);
reg Frame,Irdy;
inout [31:0]AddressData;
reg RST;
reg [31:0]AddressDataIn;
wire [31:0]AddressDataOut;

reg in,out;

assign AddressData = (in)? AddressDataIn: 32'bzzzzzzzzzzzzzzzz;
assign AddressDataOut = (out)? AddressData: 32'bzzzzzzzzzzzzzzzz;

reg [3:0]CBE;
wire Devsel,Trdy;
PCI pci(Frame,AddressData,CBE,Irdy,Devsel,Trdy,RST);
wire Clock;
ClockGen clk(Clock);
initial
begin
Frame=1;//0
Irdy=1;
in = 1;
out = 0;
RST=1;

#10//10
Frame=0;
Irdy=1;
AddressDataIn=23;
CBE=7;

#10//20
Frame=0;
Irdy=0;
AddressDataIn=32'h11111111;
CBE=4'b1111;

#10//30
AddressDataIn=32'h11111111;

#10//40
Frame=0;
Irdy=0;
AddressDataIn=32'h22222222;
CBE=4'b1111;

#10//40
Frame=0;
Irdy=0;
AddressDataIn=32'h33333333;
CBE=4'b1111;


#10//50
Frame=1;
Irdy=0;
AddressDataIn=32'h33333333;
CBE=4'b1111;

#10//60
Frame=1;
Irdy=1;
AddressDataIn=32'hzzzzzzzz;

#10//70
Frame=0;
Irdy=1;
in = 1;
AddressDataIn=21;
CBE=6;

#10//80
Frame=0;
Irdy=0;
in=0;
out = 1;
CBE=4'b1111;

#10//80
Frame=0;
Irdy=0;
in=0;
out = 1;
CBE=4'b1111;

#10//90
Frame=0;
Irdy=0;
out = 1;
CBE=4'b1111;

#10//100
Frame=0;
Irdy=0;
out = 1;
CBE=4'b1111;

#10//110
Frame=1;
Irdy=0;
CBE=4'b1111;

#10//120
Frame=1;
Irdy=1;
CBE=4'b1111;

end

endmodule 