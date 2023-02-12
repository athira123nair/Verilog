//--------------BEHAVIOURAL - Conditionals----------------
module mux2_1 (input a,
               input b,
               input sel,
               output y);
  assign y = sel ? b : a;
endmodule
//--------------BEHAVIOURAL - Case----------------
module mux2_1 (input a,
module mux2_1 (input a,
               input b,
               input sel,
               output reg y);
  always@(a or b or sel)
    begin
    case(sel)
      0 : y <= a;
      1 : y <= b;
    endcase
  end
endmodule
//--------------SCHEMATICS ------------------------
module mux2_1 (input a,
module mux2_1 (input a,
               input b,
               input sel,
               output y);
  assign y = (~sel&a)|(sel&b);
endmodule
//--------------BEHAVIOURAL - If-else ----------------
module mux2_1 (input a,
module mux2_1 (input a,
               input b,
               input sel,
               output reg y);
  always@(a or b or sel)
    begin
      if(!sel)
        y <= a;
      else
        y <= b;
    end
endmodule
//--------------GATE LEVEL-----------------------------
               module mux2_1 (input a,
               input b,
               input sel,
               output y);
  wire y1,y2,y3;
  
  not n1(y1,sel);
  and n2(y2,y1,a);
  and n3(y3,sel,b);
  or n4 (y,y2,y3);
endmodule
