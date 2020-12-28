module addressDecoder(address,devsel);

input wire[31:0] address;
output reg [1:0]devsel;

always@(address)
begin
case(address)
21 : devsel <= 0;
22 : devsel <= 1;
23 : devsel <= 2; 
default : devsel <= 3;
endcase
end
endmodule

module addressDecoderTB();
reg [31:0]address;
wire [1:0]devsel;
addressDecoder decoder(address,devsel);
initial 
begin 
$monitor("address=%b,,%b",address,devsel);
address = 21;
#5
address = 26;
#5
address = 24;
#5
address = 22;
#5
address = 26;
#5
address = 23;
#5
address = 26;
end
endmodule