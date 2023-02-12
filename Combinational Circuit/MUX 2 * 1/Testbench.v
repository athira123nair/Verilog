module tb;
  reg a;
  reg b;
  reg sel;
  wire y;
  
  mux2_1 DUT(.a(a),.b(b),.sel(sel),.y(y));
  
  initial begin
    a = 1; b = 0;
    sel = 0;
    #5 sel = 1;
  end
  
  initial begin
    $monitor("Value of Y = %0d, for sel = %0d, a = %0d, b = %0d",y,sel,a,b);
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
endmodule
