
module devSelect(clk, frame,decoderInput, devSelect);

input wire clk, frame, decoderInput;
output reg devSelect = 1;
reg delayReg =1;
reg delayReg2=1;

always@(negedge clk)
begin 
if (decoderInput)
begin
if(!frame)
begin
    delayReg <= frame;
    delayReg2 <= delayReg;
    devSelect <= delayReg2; 
end
end
if(frame)
begin 
    delayReg <= 1;
    devSelect <= delayReg;
end
end


endmodule


module devSelectTB();

reg clk, frame, decoderInput;
wire devSelect ;
initial 
begin
clk = 0;
$monitor($time ,,,"Devsel=%d frame=%d decoderInput=%d clk=%d",devSelect,frame ,decoderInput,clk);
    

    frame = 1;
    decoderInput = 0;

    #20
    frame = 0;
    decoderInput = 1;

    #50
    decoderInput = 0;

    #210
    frame = 1;

end


always 
begin
     #10 clk=~clk;
end
devSelect d1(clk,frame,decoderInput,devSelect);

endmodule