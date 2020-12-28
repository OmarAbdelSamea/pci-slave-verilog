module devSelect(clk, frame,decoderInput,RST,devSelect);

input wire clk, frame,RST;
input wire [1:0] decoderInput;
output reg devSelect;
reg F;
reg [1:0]DI;

reg delayReg=1;

reg [2:0]devselReg=4;


always@(negedge RST)
begin 
devSelect <= 1'bz;
end
always@(posedge clk && RST)
begin 
F <= frame;
DI <= decoderInput;
end
always@(negedge clk && RST)
begin
if(F)
begin 
devselReg <= 4;
end
else if(F == 0 && devselReg == 4)
begin 
devselReg <= DI;
end
else
begin
 if(devselReg < 3)
 	begin
	delayReg<=0;
	devSelect<=delayReg;
	end
 else
	begin 	
	delayReg<=1;
	devSelect<=1;
	end 
end
end
endmodule


module devSelectTB();

reg clk, frame;
reg [1:0]decoderInput;
wire devSelect ;
initial 
begin

$monitor($time ,,,"Devsel=%d frame=%d decoderInput=%d clk=%d",devSelect,frame ,decoderInput,clk);
    
    clk = 0;
    frame = 1;
    decoderInput = 1;
    #20
    frame = 0;
    decoderInput = 1;
    #50
    decoderInput = 3;
    frame =0;
    #50
    decoderInput = 5;
    frame =0;
    #50
    decoderInput = 7;

    #210
    frame = 1;

end


always 
begin
     #10 clk=~clk;
end
devSelect d1(clk, frame,decoderInput, devSelect);

endmodule
