module tb;
  reg a;
  reg b;
  reg c;
  reg sel1;
  reg sel2;
  wire y;
  
  mux3_1 DUT(.a(a),.b(b),.c(c),.sel1(sel1),.sel2(sel2),.y(y));
  
  initial begin
    a = 1; b = 0; c = 0;
    sel1 = 0; sel2 = 0;
    #5 a = 0; b = 1; c = 0;
    sel1 = 0; sel2 = 1;
    #5 a = 0; b = 0; c = 1;
    sel1 = 1; sel2 = 0;
    #5 a = 1; b = 1; c = 1;
    sel1 = 1; sel2 = 1;
  end
  
  initial begin
    $monitor("Value of Y = %0d, for sel1 = %0d,sel2 = %0d, a = %0d, b = %0d c= %0d",y,sel1,sel2,a,b,c);
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
endmodule
