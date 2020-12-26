module PCI(Frame,AddressData,CBE,Irdy,Devsel,Trdy);
inout [31:0]AddressData;
input [3:0]CBE;
input Frame,Irdy;
output Devsel,Trdy;
reg Clock;
ClockGen clk(Clock);
wire [1:0]decoderDevsel;
addressDecoder decoder(AddressData,decoderDevsel);
devSelect dvsl(Clock, Frame,decoderDevsel,Devsel);
wire [1:0]rw;
RW readWrite(CBE,Frame,Clock,rw);
wire RE,WE;
ReadData readData(Clock,rw,Devsel,Irdy,RE,WE);
wire TrdyControl;
storage mem(AddressData,Frame,Clock,decoderDevsel,RE,WE,CBE,TrdyControl);
TRDY Tready(Clock,Devsel,Trdy,TrdyControl);
endmodule


module PCITB();
reg Frame,Irdy;
reg [31:0]AddressData;
reg [3:0]CBE;
wire Devsel,Trdy;
PCI pci(Frame,AddressData,CBE,Irdy,Devsel,Trdy);
initial
begin
Frame=1;
Irdy=1;
#10
Frame=0;
Irdy=1;
AddressData=0;
CBE=7;
#10
Frame=0;
Irdy=0;
AddressData=32'h11111111;
CBE=4'b1111;
#10
Frame=0;
Irdy=0;
AddressData=32'h22222222;
CBE=4'b1111;
#10
Frame=1;
Irdy=0;
AddressData=32'h33333333;
CBE=4'b1111;

#10
Frame=1;
Irdy=1;

#10
Frame=0;
Irdy=1;
AddressData=0;
CBE=4'b1111;

#10
Frame=0;
Irdy=0;
CBE=4'b1111;

#10
Frame=0;
Irdy=0;
CBE=4'b1111;

#10
Frame=0;
Irdy=0;
CBE=4'b1111;


#10
Frame=1;
Irdy=0;
CBE=4'b1111;

#10
Frame=1;
Irdy=1;
CBE=4'b1111;

end

endmodule 