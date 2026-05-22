module alu_1bit(a, b, cin, sel, y, cout);
input a, b, cin;
input [2:0] sel;
output reg y, cout;

always @(*) begin
    case(sel)
        3'b000: {cout, y} = a + b + cin; // 0: ADD
        3'b001: {cout, y} = a - b - cin; // 1: SUB
        3'b010: {cout, y} = a & b; // 2: AND
        3'b011: {cout, y} = a | b; // 3: OR
        3'b100: {cout, y} = a ^ b; // 4: XOR
        3'b101: {cout, y} = ~(a | b); // 5: NOR
        3'b110: {cout, y} = ~(a & b); // 6: NAND
        3'b111: {cout, y} = ~(a ^ b); // 7: XNOR
        default: {cout, y} = 2'b00;
    endcase
end
endmodule

module alu_4bit(a, b, sel, y, cout);
input [3:0] a, b;
input [2:0] sel;
output [3:0] y;
output cout;

wire c1, c2, c3;

alu_1bit m0(a[0], b[0], 1'b0, sel, y[0], c1);
alu_1bit m1(a[1], b[1], c1, sel, y[1], c2);
alu_1bit m2(a[2], b[2], c2, sel, y[2], c3);
alu_1bit m3(a[3], b[3], c3, sel, y[3], cout);

endmodule
