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

module tto1multiplexer (input logic i1,i2,S, output logic y);
always@*
    if (S)
        y = i1;
    else
        y = i2;
endmodule

module fto1multiplexer(input logic i1,i2,i3,i4,s0,s1,output logic y);
    logic n1,n2;
    ttomultiplexer mux1(i1,i2,s0, n1);
    ttomultiplexer mux2(i3,i4,s0,n2);
    ttomultiplexer mux3(n1,n2,s1,y);
endmodule

module mfregister(input logic d0,d1,d2,d3,s1,s0,clock,reset,shr_in,shl_in,
output logic y0,y1,y2,y3);
logic n1,n2,n3,n4;
    fto1multiplexer mux1(y2,shr_in,d3,y3,s0,s1,n4);
    fto1multiplexer mux2(y1,y3,d2,y2,s0,s1,n3);
    fto1multiplexer mux3(y0,y2,d1,y1,s0,s1,n2);
    fto1multiplexer mux4(shl_in,y1,d0,y0,s0,s1,n1);
    syncflipflop ff1(n4,reset,clock,y3);
    syncflipflop ff2(n3,reset,clock,y2);
    syncflipflop ff3(n2,reset,clock,y1);
    syncflipflop ff4(n1,reset,clock,y0);
endmodule

module mfregister_tb();
    logic clock,reset,shr_in,shl_in, s0,s1, d0,d1,d2,d3, y0,y1,y2,y3;
    mfregister def(d0,d1,d2,d3,s1,s0,clock,reset,shr_in,shl_in,y0,y1,y2,y3);
    always #50 clock = ~clock;
     
    initial begin
    reset = 1; clock = 1; #10;
    s0 = 0; s1=0; 
    d0=0;d1=0;d2=0;d3=0; #10;
    d0=0;d1=0;d2=0;d3=1; #10;
    d0=0;d1=0;d2=1;d3=0; #10;
    d0=0;d1=0;d2=1;d3=1; #10;
    d0=0;d1=1;d2=0;d3=0; #10;
    d0=0;d1=1;d2=0;d3=1; #10;
    d0=0;d1=1;d2=1;d3=0; #10;
    d0=0;d1=1;d2=1;d3=1; #10;
    d0=1;d1=0;d2=0;d3=0; #10;
    d0=1;d1=0;d2=0;d3=1; #10;
    d0=1;d1=0;d2=1;d3=0; #10;
    d0=1;d1=0;d2=1;d3=1; #10;
    d0=1;d1=1;d2=0;d3=0; #10;
    d0=1;d1=1;d2=0;d3=1; #10;
    d0=1;d1=1;d2=1;d3=0; #10;
    d0=1;d1=1;d2=1;d3=1; #10;
    reset = 0;
    s0 = 1; s1=0;
    d0=0;d1=0;d2=0;d3=0; #10;
    d0=0;d1=0;d2=0;d3=1; #10;
    d0=0;d1=0;d2=1;d3=0; #10;
    d0=0;d1=0;d2=1;d3=1; #10;
    d0=0;d1=1;d2=0;d3=0; #10;
    d0=0;d1=1;d2=0;d3=1; #10;
    d0=0;d1=1;d2=1;d3=0; #10;
    d0=0;d1=1;d2=1;d3=1; #10;
    d0=1;d1=0;d2=0;d3=0; #10;
    d0=1;d1=0;d2=0;d3=1; #10;
    d0=1;d1=0;d2=1;d3=0; #10;
    d0=1;d1=0;d2=1;d3=1; #10;
    d0=1;d1=1;d2=0;d3=0; #10;
    d0=1;d1=1;d2=0;d3=1; #10;
    d0=1;d1=1;d2=1;d3=0; #10;
    d0=1;d1=1;d2=1;d3=1; #10;
    
    s0=0; s1 = 1;
    d0=0;d1=0;d2=0;d3=0; #10;
    d0=0;d1=0;d2=0;d3=1; #10;
    d0=0;d1=0;d2=1;d3=0; #10;
    d0=0;d1=0;d2=1;d3=1; #10;
    d0=0;d1=1;d2=0;d3=0; #10;
    d0=0;d1=1;d2=0;d3=1; #10;
    d0=0;d1=1;d2=1;d3=0; #10;
    d0=0;d1=1;d2=1;d3=1; #10;
    d0=1;d1=0;d2=0;d3=0; #10;
    d0=1;d1=0;d2=0;d3=1; #10;
    d0=1;d1=0;d2=1;d3=0; #10;
    d0=1;d1=0;d2=1;d3=1; #10;
    d0=1;d1=1;d2=0;d3=0; #10;
    d0=1;d1=1;d2=0;d3=1; #10;
    d0=1;d1=1;d2=1;d3=0; #10;
    d0=1;d1=1;d2=1;d3=1; #10;

    s0=1;s1=1;
    d0=0;d1=0;d2=0;d3=0; #10;
    d0=0;d1=0;d2=0;d3=1; #10;
    d0=0;d1=0;d2=1;d3=0; #10;
    d0=0;d1=0;d2=1;d3=1; #10;
    d0=0;d1=1;d2=0;d3=0; #10;
    d0=0;d1=1;d2=0;d3=1; #10;
    d0=0;d1=1;d2=1;d3=0; #10;
    d0=0;d1=1;d2=1;d3=1; #10;
    d0=1;d1=0;d2=0;d3=0; #10;
    d0=1;d1=0;d2=0;d3=1; #10;
    d0=1;d1=0;d2=1;d3=0; #10;
    d0=1;d1=0;d2=1;d3=1; #10;
    d0=1;d1=1;d2=0;d3=0; #10;
    d0=1;d1=1;d2=0;d3=1; #10;
    d0=1;d1=1;d2=1;d3=0; #10;
    d0=1;d1=1;d2=1;d3=1; #10;
      end
endmodule
