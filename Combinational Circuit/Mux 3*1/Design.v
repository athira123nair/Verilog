//-------------BEHAVIOURAL MODELLING - case-----------------------------------
module mux3_1 (input a,
               input b,
               input c,
               input sel1,
               input sel2,
               output reg y);
  always@(a or b or c or sel1 or sel2)
    begin
      case({sel1,sel2})
        2'b00 : y = a;
        2'b01 : y = b;
        2'b10 : y = c;
        default : y = 1'bx; 
      endcase
    end
endmodule
//-------------SCHEMATICS LEVEL MODELLING-------------------------------------
module mux3_1 (input a,
               input b,
               input c,
               input sel1,
               input sel2,
               output y);
  
  assign y = (~sel1&~sel2&a)|(~sel1&sel2&b) | (sel1&~sel2&c);
endmodule
//-------------BEHAVIOURAL MODELLING - if-else-----------------------------------
module mux3_1 (input a,
               input b,
               input c,
               input sel1,
               input sel2,
               output reg y);
  always@(a or b or c or sel1 or sel2)
    begin
  if(!sel1 & !sel2)
    y <= a;
  else if (!sel1 & sel2)
    y <= b;
  else if(sel1 & !sel2)
    y <= c;
  else
    y <= 1'bx;
    end
endmodule
//-------------BOTTOM UP APPROACH-----------------------------------
module mux3_1 (input a,
               input b,
               input c,
               input sel1,
               input sel2,
               output reg y);
  wire y1;
  
  mux2_1(a,b,sel2,y1);
  mux2_1(y1,c,sel1,y);
endmodule
module mux2_1 (input a,
               input b,
               input sel,
               output y);
  assign y = sel ? b : a;
endmodule
