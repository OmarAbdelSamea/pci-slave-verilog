module RW(CBE,F,clk,rw);
input wire F;
input wire clk;
input wire [3:0] CBE;
output reg [1:0] rw=2'b00;
reg Frame;
reg [3:0]CBEreg;
reg [1:0]rwreg;
always@(posedge clk)
begin
Frame<=F;
CBEreg<=CBE;
rwreg<=rw;
end

always@(negedge clk)
begin
if(Frame)
begin
rw<=0;
end
if(!Frame && rwreg == 0 && CBEreg == 6)
begin
rw <= 1;
end

if(!Frame && rwreg == 0 && CBEreg == 7)
begin
rw <= 2;
end
end

endmodule 



module RWTB();
reg [3:0]CBE;
reg F;
wire [1:0]rw;
wire Clock;
ClockGen clk(Clock);
RW TS(CBE,F,Clock,rw);

initial 
begin 
$monitor("rw=%b,",rw);
CBE = 0;
F = 1;
#10
CBE = 6;
F = 0;
#10
CBE = 7;
F = 0;
#10
CBE = 0;
F = 0;
#10
CBE = 7;
F = 1;
#10
CBE = 7;
F = 0;
end

endmodule 