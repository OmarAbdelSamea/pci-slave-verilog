module PCI_TB_RST(AddressData);
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
in = 1;
out = 0;
Frame = 1;
Irdy =  1;
RST = 1;

#10//10
Frame = 0;
CBE = 7;
AddressDataIn = 21 ;
Irdy =  1;
RST = 1;

#10//20
Frame = 0;
CBE = 4'b1111;
AddressDataIn = 32'h11111111 ;
Irdy =  0;
RST = 1;

#5//25
Frame = 1'bz;
CBE = 4'bzzzz;
AddressDataIn = 32'hz ;
Irdy =  1'bz;
RST = 0;

#5//30
Frame = 1'bz;
CBE = 4'bzzzz;
AddressDataIn = 32'hz ;
Irdy =  1'bz;
RST = 0;

#5//35
Frame = 1;
CBE = 0;
AddressDataIn = 32'hz ;
Irdy =  1;
RST = 1;

#5//40
Frame = 1;
CBE = 0;
AddressDataIn = 32'hz ;
Irdy =  1;
RST = 1;

#10//50
Frame = 0;
CBE = 7;
AddressDataIn = 21 ;
Irdy =  1;
RST = 1;

#10//50
Frame = 0;
CBE = 4'b1111;
AddressDataIn = 32'h11111111 ;
Irdy =  0;
RST = 1;

#10//60
Frame = 0;
CBE = 4'b1111;
AddressDataIn = 32'h11111111 ;
Irdy =  0;
RST = 1;

#10//70
Frame = 0;
CBE = 4'b1111;
AddressDataIn = 32'h22222222 ;
Irdy =  0;
RST = 1;

#10//90
Frame = 0;
CBE = 4'b1111;
AddressDataIn = 32'h33333333 ;
Irdy =  0;
RST = 1;

#10//100
Frame = 1'bz;
CBE = 4'bzzzz;
AddressDataIn = 32'hzzzzzzzz ;
Irdy =  1'bz;
RST = 0;


#10//110
Frame = 1'bz;
CBE = 4'bzzzz;
AddressDataIn = 32'hzzzzzzzz ;
Irdy =  1'bz;
RST = 0;

#5//115
Frame = 1;
CBE = 0;
AddressDataIn = 32'hzzzzzzzz ;
Irdy =  1;
RST = 1;

#5//120
Frame = 1;
CBE = 0;
AddressDataIn = 32'hzzzzzzzz ;
Irdy =  1;

#10//130
Frame = 0;
CBE = 6;
AddressDataIn = 21 ;
Irdy =  1;

#10//140
Frame = 0;
in = 0; 
CBE = 4'b1111;
AddressDataIn = 32'hzzzzzzzz ;
Irdy =  0;

#10//150
Frame = 0;
out = 1;
CBE = 4'b1111;

#20//170
Frame = 1;

#10//180
CBE = 0;
Irdy =  1;
end
endmodule




module PCI_TB_BE(AddressData);
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
AddressDataIn=32'hzzzzzzzz;
CBE = 4'bzzzz;

#10//10
Frame=0;
Irdy=1;
AddressDataIn=21;
CBE=7;

#10//20
Frame=0;
Irdy=0;
AddressDataIn=32'h33333333;
CBE=4'b1000;

#10//30
AddressDataIn=32'h33333333;

#10//40
Frame=0;
Irdy=0;
AddressDataIn=32'h33333333;
CBE=4'b0001;

#10//40
Frame=0;
Irdy=0;
AddressDataIn=32'h33333333;
CBE=4'b0010;


#10//50
Frame=1;
Irdy=0;
AddressDataIn=32'h33333333;
CBE=4'b0010;

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




module PCI_TB_DATAONE(AddressData);
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
CBE=4'bzzzz;
AddressDataIn=32'bzzzzzzzzzzzzzzzz;

#10//10
Frame=0;
Irdy=1;
AddressDataIn=21;
CBE=7;


#10 
Frame =0;
AddressDataIn=32'h33333333;

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

#10//90
Frame=0;
Irdy=0;
out = 1;
CBE=4'b1111;



#10//120
Frame=1;
Irdy=1;
CBE=4'b1111;



end

endmodule
