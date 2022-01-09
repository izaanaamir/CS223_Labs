module ttfdecoder(input logic i1,i2, 
output logic o1,o2,o3,o4

    );
    
    assign o1 = i1 & i2;
    assign o2 = i1 & ~i2;
    assign o3 = ~i1 & i2;
    assign o4 = ~i1 & ~i2;
endmodule

module ttfdecoder_tb();
    logic i1,i2,o1,o2,o3,o4;
    ttfdecoder dut(i1,i2,o1,o2,o3,o4);
    initial begin
        i1 = 0; i2=0; #10;
        i1 = 0; i2 = 1; #10;
        i1 = 1; i2 = 0; #10;
        i1= 1; i2=1; #10;
    end
endmodule

module tto1multiplexer (input logic i1,i2,S, output logic y);
always@*
    if (S)
        y = i1;
    else
        y = i2;
endmodule


module struct4to1multiplexer(input logic i1,i2,i3,i4,s0,s1,output logic y);
    logic n1,n2;
    ttomultiplexer mux1(i1,i2,s0, n1);
    ttomultiplexer mux2(i3,i4,s0,n2);
    ttomultiplexer mux3(n1,n2,s1,y);
endmodule


module struct4to1multiplexer_tb();
    logic s0,s1,i1,i2,i3,i4,y;
    struct4to1multiplexer dut(i1,i2,i3,i4,s0,s1,y);
    initial begin 
        s0 = 0; s1=0; 
        i1=0;i2=0;i3=0;i4=0; #10;
        i1=0;i2=0;i3=0;i4=1; #10;
        i1=0;i2=0;i3=1;i4=0; #10;
        i1=0;i2=0;i3=1;i4=1; #10;
        i1=0;i2=1;i3=0;i4=0; #10;
        i1=0;i2=1;i3=0;i4=1; #10;
        i1=0;i2=1;i3=1;i4=0; #10;
        i1=0;i2=1;i3=1;i4=1; #10;
        i1=1;i2=0;i3=0;i4=0; #10;
        i1=1;i2=0;i3=0;i4=1; #10;
        i1=1;i2=0;i3=1;i4=0; #10;
        i1=1;i2=0;i3=1;i4=1; #10;
        i1=1;i2=1;i3=0;i4=0; #10;
        i1=1;i2=1;i3=0;i4=1; #10;
        i1=1;i2=1;i3=1;i4=0; #10;
        i1=1;i2=1;i3=1;i4=1; #10;
        
        s0 = 1; s1=0;
        i1=0;i2=0;i3=0;i4=0; #10;
        i1=0;i2=0;i3=0;i4=1; #10;
        i1=0;i2=0;i3=1;i4=0; #10;
        i1=0;i2=0;i3=1;i4=1; #10;
        i1=0;i2=1;i3=0;i4=0; #10;
        i1=0;i2=1;i3=0;i4=1; #10;
        i1=0;i2=1;i3=1;i4=0; #10;
        i1=0;i2=1;i3=1;i4=1; #10;
        i1=1;i2=0;i3=0;i4=0; #10;
        i1=1;i2=0;i3=0;i4=1; #10;
        i1=1;i2=0;i3=1;i4=0; #10;
        i1=1;i2=0;i3=1;i4=1; #10;
        i1=1;i2=1;i3=0;i4=0; #10;
        i1=1;i2=1;i3=0;i4=1; #10;
        i1=1;i2=1;i3=1;i4=0; #10;
        i1=1;i2=1;i3=1;i4=1; #10;
        
        s0=0; s1 = 1;
        i1=0;i2=0;i3=0;i4=0; #10;
        i1=0;i2=0;i3=0;i4=1; #10;
        i1=0;i2=0;i3=1;i4=0; #10;
        i1=0;i2=0;i3=1;i4=1; #10;
        i1=0;i2=1;i3=0;i4=0; #10;
        i1=0;i2=1;i3=0;i4=1; #10;
        i1=0;i2=1;i3=1;i4=0; #10;
        i1=0;i2=1;i3=1;i4=1; #10;
        i1=1;i2=0;i3=0;i4=0; #10;
        i1=1;i2=0;i3=0;i4=1; #10;
        i1=1;i2=0;i3=1;i4=0; #10;
        i1=1;i2=0;i3=1;i4=1; #10;
        i1=1;i2=1;i3=0;i4=0; #10;
        i1=1;i2=1;i3=0;i4=1; #10;
        i1=1;i2=1;i3=1;i4=0; #10;
        i1=1;i2=1;i3=1;i4=1; #10;

        s0=1;s1=1;
        i1=0;i2=0;i3=0;i4=0; #10;
        i1=0;i2=0;i3=0;i4=1; #10;
        i1=0;i2=0;i3=1;i4=0; #10;
        i1=0;i2=0;i3=1;i4=1; #10;
        i1=0;i2=1;i3=0;i4=0; #10;
        i1=0;i2=1;i3=0;i4=1; #10;
        i1=0;i2=1;i3=1;i4=0; #10;
        i1=0;i2=1;i3=1;i4=1; #10;
        i1=1;i2=0;i3=0;i4=0; #10;
        i1=1;i2=0;i3=0;i4=1; #10;
        i1=1;i2=0;i3=1;i4=0; #10;
        i1=1;i2=0;i3=1;i4=1; #10;
        i1=1;i2=1;i3=0;i4=0; #10;
        i1=1;i2=1;i3=0;i4=1; #10;
        i1=1;i2=1;i3=1;i4=0; #10;
        i1=1;i2=1;i3=1;i4=1; #10;
      end
endmodule

module and2(input logic a,b, output logic y);
    assign y = a & b;
endmodule

module inverter(input logic a, output logic y);
    assign y = ~a;
endmodule

module or2(input logic a,b, output logic y);
    assign y = a | b;
endmodule


module struct8to1multiplexer(input logic i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2,output logic y);

    logic n1,n2,n3,n4,n5;
    struct4to1multiplexer mux1(i0,i1,i2,i3,s0,s1,n1);
    struct4to1multiplexer mux2(i4,i5,i6,i7,s0,s1,n2);
    inverter inverter1(s2,n3);
    and2 def1(n1,n3,n4);
    and2 def2(s2,n2,n5);
    or2 def3(n4,n5,y);
endmodule

module logic_function(input logic a,b,c,d, output logic y);
    logic n1;
    inverter inv1(a,n1);
    struct8to1multiplexer mux(0,n1,d,1,0,n1,1,d,a,b,c,y);
endmodule
