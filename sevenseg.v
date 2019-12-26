`timescale 1ms / 1us

module sevenseg(
    input CLK, RST, 
    input [3:0] I0, 
    input [3:0] I1, 
    input [3:0] I2, 
    input [3:0] I3, 
    input [3:0] I4, 
    input [3:0] I5,
    input [3:0] I6, 
    input [3:0] I7,
    output sA, sB, sC, sD, sE, sF, sG, DP,
    output [7:0] AN
    );
    
    reg [3:0] sseg;
    reg [6:0] seg_temp;
    reg [7:0] an_temp;
    
    reg [2:0] count;
        
        always @(posedge CLK or posedge RST)
            begin
                if(RST) begin
                    count <= 3'b0;
                end
                
                else begin
                    count = count + 1;
                end
            end
            
    always@(*)
      begin
        case (count)
            3'h0: 
             begin
                sseg = I0;
                an_temp = 8'b11111110;
             end
             
             3'h1:
              begin
                sseg = I1;
                an_temp = 8'b11111101;
              end
             
             3'h2:
              begin
                sseg = I2;
                an_temp = 8'b11111011;
              end
              
             3'h3:
              begin
                sseg = I3;
                an_temp = 8'b11110111;
              end
             
             3'h4:
              begin
                sseg = I4;
                an_temp = 8'b11101111;
              end
             
             3'h5:
              begin
                sseg = I5;
                an_temp = 8'b11011111;
              end
             
             3'h6:
              begin
                sseg = I6;
                an_temp = 8'b10111111;
              end
             
             3'h7:
              begin
                sseg = I7;
                an_temp = 8'b01111111;
              end
          endcase
      end
      
    assign AN = an_temp;

    
    always@(*)   
        case (sseg)
            4'h0: seg_temp = 7'b0000001;  //Display 0
            4'h1: seg_temp = 7'b1001111;  //Display 1
            4'h2: seg_temp = 7'b0010010;  //Display 2
            4'h3: seg_temp = 7'b0000110;  //Display 3
            4'h4: seg_temp = 7'b1001100;  //Display 4
            4'h5: seg_temp = 7'b0100100;  //Display 5 
            4'h6: seg_temp = 7'b0100000;  //Display 6
            4'h7: seg_temp = 7'b0001111;  //Display 7
            4'h8: seg_temp = 7'b0000000;  //Display 8
            4'h9: seg_temp = 7'b0001100;  //Display 9
            4'ha: seg_temp = 7'b0001000;  //Display A
            4'hb: seg_temp = 7'b1100000;  //Display b
            4'hc: seg_temp = 7'b0110001;  //Display C
            4'hd: seg_temp = 7'b1000010;  //Display d
            4'he: seg_temp = 7'b0110000;  //Display E
            4'hf: seg_temp = 7'b0111000;  //Display F
            
            default: seg_temp = 7'b1111110; //Disables Display
            
        endcase
    
    assign {sA, sB, sC, sD, sE, sF, sG} = seg_temp;
    
    assign DP = 1'b1;
    
    
endmodule
