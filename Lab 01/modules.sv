module behavioralfulladder(
input a,b,cin,
output s, cout
);
    assign s = a^b^cin;
    assign cout = a&b | a&cin | b&cin;    
endmodule

module behavioralfulladder_testbench();
    reg a,b,cin;
    wire s,cout;

    behaviouralfulladder def(a,b,c,s,cin);

    initial begin
        a=0;b=0;cin=0; #10;
        a=0;b=0;cin=1; #10;
        a=0;b=1;cin=0; #10;
        a=0;b=1;cin=1; #10;
        a=1;b=0;cin=0; #10;
        a=1;b=0;cin=1; #10;
        a=1;b=1;cin=0; #10;
        a=1;b=1;cin=1; #10;
    end
endmodule

module halfadder(
input a,b,
output s,cout
);
    assign s = a^b;
    assign cout = a&b;
endmodule

module halfsubtractor(
input a,b,
output s,cout
);

    assign s = a^b;
    assign cout = ~a&b;
endmodule

module structuralfulladder(
input a,b,cin,
output s, cout
);
    wire v1,v2,v3;
    halfadder ha1(a,b, v1,v2);
    halfadder ha2(v1,cin,s,v3 );
    assign cout= v3|v2;
endmodule


module structuralfulladder_tb();
    reg a,b,cin;
    wire s,cout;

    structuralfulladder def(a,b,c,s,cin);

    initial begin
        a=0;b=0;cin=0; #10;
        a=0;b=0;cin=1; #10;
        a=0;b=1;cin=0; #10;
        a=0;b=1;cin=1; #10;
        a=1;b=0;cin=0; #10;
        a=1;b=0;cin=1; #10;
        a=1;b=1;cin=0; #10;
        a=1;b=1;cin=1; #10;
    end
endmodule

module twobitadder(
input logic a,b,c,d,cin,
output logic s0,s1,cout
);
logic n1;

    structuralfulladder fa1(a,c,cin,s0,n1);
    structuralfulladder fa2(b,d,n1,s1,cout);
endmodule

module twobitadder_tb();
    logic a,b,c,d, cin;
    logic s0,s1,cout;

     twobitadder dut(a,b,c,d,cin,s0,s1,cout);

    initial begin
    a = 0; b = 0; c = 0; d = 0; cin = 0; #10;
    a = 0; b = 0; c = 0; d = 0; cin = 1; #10;
    a = 0; b= 0; c = 0; d = 1; cin = 0; #10;
    a = 0; b = 0; c = 0; d = 1; cin = 1; #10;
    a = 0; b = 0; c = 1; d = 0; cin = 0; #10;
    a = 0; b = 0; c = 1; d = 0; cin = 1; #10;
    a = 0; b = 0; c = 1; d = 1; cin = 0; #10;
    a = 0; b = 0; c = 1; d = 1; cin = 1; #10;
    a = 0; b = 1; c = 0; d = 0; cin = 0; #10;
    a = 0; b = 1; c = 0; d = 0; cin = 1; #10;
    a = 0; b = 1; c = 0; d = 1; cin = 0; #10;
    a = 0; b = 1; c = 0; d = 1; cin = 1; #10;
    a = 0; b = 1; c = 1; d = 0; cin = 0; #10;
    a = 0; b = 1; c = 1; d = 0; cin = 1; #10;
    a = 0; b = 1; c = 1; d = 1; cin = 0; #10;
    a = 0; b = 1; c = 1; d = 1; cin = 1; #10;
    a = 1; b = 0; c = 0; d = 0; cin = 0; #10;
    a = 1; b = 0; c = 0; d = 0; cin = 1; #10;
    a = 1; b = 0; c = 0; d = 1; cin = 0; #10;
    a = 1; b = 0; c = 0; d = 1; cin = 1; #10;
    a = 1; b = 0; c = 1; d = 0; cin = 0; #10;
    a = 1; b = 0; c = 1; d = 0; cin = 1; #10;
    a = 1; b = 0; c = 1; d = 1; cin = 0; #10;
    a = 1; b = 0; c = 1; d = 1; cin = 1; #10;
    a = 1; b = 1; c = 0; d = 0; cin = 0; #10;
    a = 1; b = 1; c = 0; d = 0; cin = 1; #10;
    a = 1; b = 1; c = 0; d = 1; cin = 0; #10;
    a = 1; b = 1; c = 0; d = 1; cin = 1; #10;
    a = 1; b = 1; c = 1; d = 0; cin = 0; #10;
    a = 1; b = 1; c = 1; d = 0; cin = 1; #10;
    a = 1; b = 1; c = 1; d = 1; cin = 0; #10;
    a = 1; b = 1; c = 1; d = 1; cin = 1; #10;

    end
endmodule

module labcalculator(
input logic a,b,c,d,
output logic y,z
);
always @*
begin
        if(c==0)
            if(d==0)
                 y = a&b;
            else
                 y= ~(a|b);
        else 
            if(d==0) begin
                 y = a^b;
                 z = a&b;
            end
            else begin
                 y = a^b;
                 z = ~a&b;
            end
        end
endmodule

module labcalculator_tb();
    reg a,b,c,d;
    wire y,z;

    labcalculator def(a,b,c,d,y,z);

    initial begin
        a=0;b=0;c=0;d=0; #10;
        a=0;b=0;c=0;d=1; #10;
        a=0;b=0;c=1;d=0; #10;
        a=0;b=0;c=1;d=1; #10;
        a=0;b=1;c=0;d=0; #10;
        a=0;b=1;c=0;d=1; #10;
        a=0;b=1;c=1;d=0; #10;
        a=0;b=1;c=1;d=1; #10;
        a=1;b=0;c=0;d=0; #10;
        a=1;b=0;c=0;d=1; #10;
        a=1;b=0;c=1;d=0; #10;
        a=1;b=0;c=1;d=1; #10;
        a=1;b=1;c=0;d=0; #10;
        a=1;b=1;c=0;d=1; #10;
        a=1;b=1;c=1;d=0; #10;
        a=1;b=1;c=1;d=1; #10;
    end
endmodule


