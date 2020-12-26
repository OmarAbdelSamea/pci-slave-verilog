module storage(Data,F,clk,Address,RE,WE,BE,TrdyControl,addressReg);
inout wire [31:0]Data;
wire [31:0]DataOut;
input [1:0]Address;
input RE,WE,clk,F;
input [3:0]BE;
output reg TrdyControl = 1;
reg [31:0]regBuffer;
reg[31:0] mem[0:2];
output reg [1:0]addressReg = 3;
reg [1:0] address;
reg Frame,re,we;
reg [3:0] be;

reg {31:0} buffer[0:5];
reg [2:0]bufferAddress = 0;

assign Data = (RE) ? mem[addressReg] : 32'bzzzzzzzzzzzzzzzz;
assign DataOut = (WE)? Data: 32'bzzzzzzzzzzzzzzzz; //a is in input mode

always@(posedge clk)
begin
Frame<=F;
re<=RE;
we<=WE;
be<=BE;
address <= Address;
fixedaddress <= Address;
if(we)
begin
regBuffer <= DataOut;
end
end

always@(negedge clk)
begin
if(Frame)
begin
bufferAddress = 0;
addressReg<=3;
end

else if(TrdyControl==0)
begin
buffer[bufferAddress]<=mem[0];
buffer[bufferAddress+1]<=mem[1];
buffer[bufferAddress+2]<=mem[2];
if(bufferAddress == 0)
begin
bufferAddress <= bufferAddress + 3;
end
else
begin
bufferAddress <= 0;
end
TrdyControl<=1;
end

else if(!Frame && addressReg == 3)
begin
addressReg<=address;
end
else
begin
if(we)
begin
if(be[0])
mem[addressReg][7:0] <= regBuffer[7:0];
if(be[1])
mem[addressReg][15:8] <= regBuffer[15:8];
if(be[2])
mem[addressReg][23:16] <= regBuffer[23:16];
if(be[3])
mem[addressReg][31:24] <= regBuffer[31:24];
if(addressReg == 2)
begin
TrdyControl <= 0;
addressReg<=0;
end
addressReg <= addressReg + 1;
end
else if(re)
begin
addressReg <= addressReg + 1;
if(addressReg == 2)
addressReg <= 0;
end
end
end
endmodule



module storageTB(Data);
inout wire [31:0]Data;
wire [31:0]DataOut;
reg [31:0] DataRegTest = 0;
reg F =1;
reg [1:0]Address = 0;
reg RE = 0;
reg WE = 0;
reg [3:0]BE = 0;
reg clk;
wire TrdyControl;
wire [1:0]addressReg;

assign Data = (WE)? DataRegTest: 32'bzzzzzzzzzzzzzzzz; //a is in input mode
assign DataOut = (RE)? Data: 32'bzzzzzzzzzzzzzzzz; //a is in input mode
storage s(Data,F,clk,Address,RE,WE,BE,TrdyControl,addressReg);
initial 
begin
clk = 0;
F=1;
$monitor("Data = %b , TrdyControl = %b ",DataOut,TrdyControl);
#10
F = 0;
WE = 1;
RE = 0;
Address = 0;

#10
F = 0;
WE = 1;
RE = 0;
Address = 0;
BE = 4'b1111;
DataRegTest = 2;

#10
F = 0;
WE = 1;
RE = 0;
BE = 4'b0010;
Address = 0;
DataRegTest = 32'h0000ff00;

#10
F = 0;
WE = 1;
RE = 0;
Address = 0;
BE = 4'b1111;
DataRegTest = 4;

/*
#10
F = 0;
WE = 1;
RE = 0;
Address = 0;
DataRegTest = 5;
*/

#10
F = 1;
WE = 0;
RE = 0;
Address = 0;

#10
F = 0;
WE = 0;
RE = 1;
Address = 0;

#10
F = 0;
WE = 0;
RE = 1;
Address = 0;

#10
F = 0;
WE = 0;
RE = 1;
Address = 0;
end
always 
begin
     #5 clk=~clk;
end
endmodule