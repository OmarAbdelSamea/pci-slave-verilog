module devSelect(clk, frame,decoderInput, devSelect);

input wire clk, frame, decoderInput;
output reg devSelect = 1;
reg delayReg =0;
reg delayReg2=0 ;

always@(negedge clk)
begin 
if(negedge frame)
begin
    delayReg <= decoderInput;
    delayReg2 <= delayReg;
    devSelect <= delayReg2; 
end
else if(posedge frame)
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

    #10
    frame = 0;
    decoderInput = 1;

    #30
    decoderInput = 0;

    #200
    frame = 0;

end


always 
begin
     #10 clk=~clk;
end
devSelect d1(clk,frame,decoderInput,devSelect);

endmodule