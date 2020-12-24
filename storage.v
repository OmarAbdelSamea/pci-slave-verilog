module storage(Data,F,clk,Address,RE,WE,BE,TrdyControl);
inout wire [31:0]Data;
wire [31:0]DataOut;
input [1:0]Address;
input RE,WE,clk,F;
input [3:0]BE;
output reg TrdyControl = 1;


//reg [31:0]Regtest = 15;

reg[31:0] mem[0:2];
reg [1:0]addressReg = 3;
reg Frame,re,we,be;


assign Data = (RE) ? mem[addressReg] : 32'bzzzzzzzzzzzzzzzz;
assign DataOut = (WE)? Data: 32'bzzzzzzzzzzzzzzzz; //a is in input mode

always@(posedge clk)
begin
Frame<=F;
re<=RE;
we<=WE;
be<=BE;
end

always@(negedge clk)
begin
if(Frame)
begin
addressReg<=3;
end
else if(TrdyControl==0)
begin
TrdyControl<=1;
addressReg<=0;
end
else if(!Frame && addressReg == 3)
begin
addressReg<=Address;
end
else
begin
if(WE)
begin
mem[addressReg] <= DataOut;
case(addressReg)
0 : addressReg <= 1;
1 : addressReg <= 2;
2 : TrdyControl <= 0;
endcase
end
else if(RE)
begin
case(addressReg)
0 : addressReg <= 1;
1 : addressReg <= 2;
2 : addressReg <= 0;
endcase
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

assign Data = (WE)? DataRegTest: 32'bzzzzzzzzzzzzzzzz; //a is in input mode
assign DataOut = (RE)? Data: 32'bzzzzzzzzzzzzzzzz; //a is in input mode
storage s(Data,F,clk,Address,RE,WE,BE,TrdyControl);
initial 
begin
clk = 0;
F=1;
$monitor("Data = %b , TrdyControl = %b ",DataOut,TrdyControl);
#20
F = 0;
WE = 1;
RE = 0;
Address = 0;
DataRegTest = 1;

#20
F = 0;
WE = 1;
RE = 0;
Address = 0;
DataRegTest = 2;

#20
F = 0;
WE = 1;
RE = 0;
Address = 0;
DataRegTest = 3;

#20
F = 0;
WE = 1;
RE = 0;
Address = 0;
DataRegTest = 4;

#20
F = 1;
WE = 0;
RE = 0;
Address = 0;

#20
F = 0;
WE = 0;
RE = 1;
Address = 0;

#20
F = 0;
WE = 0;
RE = 1;
Address = 0;

#20
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
