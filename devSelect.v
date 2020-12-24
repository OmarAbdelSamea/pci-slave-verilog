
module devSelect(clk, frame,decoderInput, devSelect);

input wire clk, frame;
input wire [2:0]decoderInput;
output reg devSelect = 1;
reg delayReg =1;
reg delayReg2=1;
reg onChange =1;

always@(posedge clk)
begin 
if (decoderInput > -1 && decoderInput < 4)
begin
if(!frame)
begin
    delayReg <= 0;
    delayReg2 <= delayReg;
    onChange <= delayReg2; 
end
end
if(frame)
begin 
    delayReg <= 1;
    onChange <= delayReg;
end
end

always@(negedge clk)
begin
    devSelect <= onChange;

end


endmodule


module devSelectTB();

reg clk, frame;
reg [2:0]decoderInput;
wire devSelect ;
initial 
begin
clk = 0;
$monitor($time ,,,"Devsel=%d frame=%d decoderInput=%d clk=%d",onChange,frame ,decoderInput,clk);
    

    frame = 1;
    decoderInput = 6;

#10
decoderInput = 1;
    #20
    frame = 0;
    

    #50
    decoderInput = 7;

    #210
    frame = 1;

end


always 
begin
     #10 clk=~clk;
end
devSelect d1(clk,frame,decoderInput,devSelect);

endmodule