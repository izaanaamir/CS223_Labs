module and4(input logic a,b,c,d,output logic y);

    assign y = a&b&c&d;
endmodule

module and3(input logic a,b,c,output logic y);
    assign y = a&b&c;
endmodule

module and2(input logic a,b,output logic y);

    assign y = a&b;
endmodule

module or4(input logic a,b,c,d,output logic y);

    assign y = a|b|c|d;
endmodule

module or3(input logic a,b,c,output logic y);

    assign y = a|b|c;
endmodule

module or2(input logic a,b,output logic y);

    assign y = a|b;
endmodule

module syncflipflop(
    input logic d,reset,clock, output logic q
    );
    always_ff @(posedge clock)
    begin
        if (reset)
            q<=0;
        else q<=d;
    end
endmodule

module ttfdecoder(
    input logic a,b, output logic o1,o2,o3,o4);
    assign o1=~a&~b;
    assign o2=~a&b;
    assign o3=a&~b;
    assign o4=a&b;
endmodule

module fsm(input logic SA,SB,reset,clock, output logic LA1,LA2,LA3,LA4,LB1,LB2,LB3,LB4
    );
    logic L1a,L2a,L1b,L2b,s0,s1,s2,ns0,ns1,ns2;
    logic p1,p2;
    
    
    and2 dut3(s2,~s1,p1);
    and4 dut4(~SA,SB,~s1,~s0,p2);
    or2 def1(p1,p2,ns2);
    
    logic n1,n2,n3;
    and3 dut5(~s2,s1,~s0,n1);
    and3 dut6(~SB,~s1,s0,n2);
    and3 dut7(~s2,~s1,s0,n3);
    or3 def2(n1,n2,n3,ns1);
    
    logic m1,m2,m3,m4;
    and4 dut8(~SA,~s2,s1,~s0,m1);
    and3 dut9(s2,s1,~s0,m2);
    and3 dut10(SB,s2,s1,m3);
    and3 dut11(SA,~s1,~s0,m4);
    or4 def3(m1,m2,m3,m4,ns2);
    
   syncflipflop prod1(ns2,reset,clock,s2);
   syncflipflop prod2(ns1,reset,clock,s1);
   syncflipflop prod3(ns0,reset,clock,s0);
    
    always_ff @(posedge clock)
  	ýf
            s0<=0;
            s1<=0;
            s2<=0;
        else begin
            L2a<=~s2+(~s0&~s1);
            L1a<=~s2&s0;
            L2b<=~s2;
            L1b<=s2&~s0; 
         end
    end
endmodule


module fsm_tb();
logic SA,SB,reset,clock, LA1,LA2,LA3,LA4,LB1,LB2,LB3,LB4;
fsm dut(SA,SB,reset,clock, LA1,LA2,LA3,LA4,LB1,LB2,LB3,LB4);

always #3000 clock = ~clock;
initial begin
reset = 1; #50;
SA = 1; SB = 0;#50;
reset = 0;#50;
SA = 0; SB = 0;#50;
SA = 1; SB = 1;#50;
end
endmodule





