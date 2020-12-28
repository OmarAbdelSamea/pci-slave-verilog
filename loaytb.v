
// BE TB
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

#10//20
Frame=0;
Irdy=0;
AddressDataIn=32'h11111111;
CBE=4'b1000;

#10//30
AddressDataIn=32'h11111111;

#10//40
Frame=0;
Irdy=0;
AddressDataIn=32'h22222222;
CBE=4'b1000;

#10//40
Frame=0;
Irdy=0;
AddressDataIn=32'h33333333;
CBE=4'b1000;


#10//50
Frame=1;
Irdy=0;
AddressDataIn=32'h33333333;
CBE=4'b1000;

#10//60
Frame=1;
Irdy=1;
AddressDataIn=32'hzzzzzzzz;


#10
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

#10//20
Frame=0;
Irdy=0;
AddressDataIn=32'h11111111;
CBE=4'b0010;

#10//30
AddressDataIn=32'h11111111;

#10//40
Frame=0;
Irdy=0;
AddressDataIn=32'h22222222;
CBE=4'b0010;

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

#10
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

#10//20
Frame=0;
Irdy=0;
AddressDataIn=32'h11111111;
CBE=4'b0001;

#10//30
AddressDataIn=32'h11111111;

#10//40
Frame=0;
Irdy=0;
AddressDataIn=32'h22222222;
CBE=4'b0001;

#10//40
Frame=0;
Irdy=0;
AddressDataIn=32'h33333333;
CBE=4'b0001;


#10//50
Frame=1;
Irdy=0;
AddressDataIn=32'h33333333;
CBE=4'b0001;

#10//60
Frame=1;
Irdy=1;
AddressDataIn=32'hzzzzzzzz;

end



// ONE DATA TB 
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


#10
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
AddressDataIn=22;
CBE=7;


#10 
Frame =0;
AddressDataIn=32'h33332222;

#10//50
Frame=1;
Irdy=0;
AddressDataIn=32'h33332222;
CBE=4'b1111;

#10//60
Frame=1;
Irdy=1;
AddressDataIn=32'hzzzzzzzz;

#10//70
Frame=0;
Irdy=1;
in = 1;
AddressDataIn=22;
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


#10
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
AddressDataIn=23;
CBE=7;


#10 
Frame =0;
AddressDataIn=32'h44442222;

#10//50
Frame=1;
Irdy=0;
AddressDataIn=32'h44442222;
CBE=4'b1111;

#10//60
Frame=1;
Irdy=1;
AddressDataIn=32'hzzzzzzzz;

#10//70
Frame=0;
Irdy=1;
in = 1;
AddressDataIn=23;
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