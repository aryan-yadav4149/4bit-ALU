module tb_alu_4bit;
reg [3:0] a, b;
reg [2:0] sel;
wire [3:0] y;
wire cout;
integer i;

alu_4bit uut(a, b, sel, y, cout);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_alu_4bit);

    a = 4'b0101; // 5
    b = 4'b0011; // 3

    $display("Time sel a b y cout");
    for(i = 0; i < 8; i = i + 1) begin
        sel = i;
        #10;
        $display("%0t %b %d %d %d %b", $time, sel, a, b, y, cout);
    end

    $finish;
end
endmodule
