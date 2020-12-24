
module devSelect(clk, frame,decoderInput, devSelect);

input wire clk, frame;
input wire [1:0] decoderInput;
output reg devSelect;
reg delayReg=1 ;
reg delayReg2=1;
reg onChange=1;
 
always@(posedge clk)
begin 
if (frame == 0)
begin
 if(decoderInput < 3)
 	begin
    	delayReg <= frame;
    	onChange <= delayReg; 
	end

end
else
begin 
  onChange<=1;
end
end
always@(negedge clk)
begin
    devSelect <= onChange;
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
