
module addressDecoder(address,devsel);

input wire[31:0] address;
output reg devsel;

always@(address)
begin
if(address>20 && address<25)
begin
devsel <= 1;
end

else
begin 
devsel <= 0;
end

end
endmodule

module addressDecoderTB();
reg [31:0]address;
wire devsel;
addressDecoder decoder(address,devsel);
initial 
begin 
$monitor("address=%d,,%d",address,devsel);
address = 21;
#5
address = 26;
#5
address = 24;
end
endmodule