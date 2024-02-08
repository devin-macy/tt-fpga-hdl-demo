//_\TLV_version 1d: tl-x.org, generated by SandPiper(TM) 1.14-2022/10/10-beta-Pro
//_\source top.tlv 38

//_\SV
   // Include Tiny Tapeout Lab.
   // Included URL: "https://raw.githubusercontent.com/os-fpga/Virtual-FPGA-Lab/35e36bd144fddd75495d4cbc01c4fc50ac5bde6f/tlv_lib/tiny_tapeout_lib.tlv"// Included URL: "https://raw.githubusercontent.com/os-fpga/Virtual-FPGA-Lab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlv_lib/fpga_includes.tlv"
//_\source top.tlv 121

//_\SV

// ================================================
// A simple Makerchip Verilog test bench driving random stimulus.
// Modify the module contents to your needs.
// ================================================

module top(input logic clk, input logic reset, input logic [31:0] cyc_cnt, output logic passed, output logic failed);
   // Tiny tapeout I/O signals.
   logic [7:0] ui_in, uo_out;
   
   logic [31:0] r;
   always @(posedge clk) r <= 0;
   //assign ui_in = r[7:0];
   
   logic ena = 1'b0;
   logic rst_n = ! reset;


   // Or, to provide specific inputs at specific times (as for lab C-TB) ...
   // BE SURE TO COMMENT THE ASSIGNMENT OF INPUTS ABOVE.
   // BE SURE TO DRIVE THESE ON THE B-PHASE OF THE CLOCK (ODD STEPS).
   // Driving on the rising clock edge creates a race with the clock that has unpredictable simulation behavior.
   initial begin
      #1  // Drive inputs on the B-phase.
         ui_in = 8'h55;
      #20 // Step 5 cycles, past reset.
         ui_in = 8'h01;
      #6
      	ui_in = 8'h81;
      #10
      	ui_in = 8'h01;
      #10
      	ui_in = 8'h24;
      #10
      	ui_in = 8'ha4;
      // ...etc.
   end


   // Instantiate the Tiny Tapeout module.
   tt_um_template tt(.*);

   assign passed = top.cyc_cnt > 60;
   assign failed = 1'b0;
endmodule


// Provide a wrapper module to debounce input signals if requested.

//_\SV



// =======================
// The Tiny Tapeout module
// =======================

module tt_um_template (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    /*   // The FPGA is based on TinyTapeout 3 which has no bidirectional I/Os (vs. TT6 for the ASIC).
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    */
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
   wire reset = ! rst_n;

// ---------- Generated Code Inlined Here (before 1st \TLV) ----------
// Generated by SandPiper(TM) 1.14-2022/10/10-beta-Pro from Redwood EDA, LLC.
// (Installed here: /usr/local/mono/sandpiper/distro.)
// Redwood EDA, LLC does not claim intellectual property rights to this file and provides no warranty regarding its correctness or quality.


// For silencing unused signal messages.
`define BOGUS_USE(ignore)


genvar digit, input_label, leds, switch;


//
// Signals declared top-level.
//

// For $slideswitch.
logic [7:0] L0_slideswitch_a0;

// For $sseg_decimal_point_n.
logic L0_sseg_decimal_point_n_a0;

// For $sseg_digit_n.
logic [7:0] L0_sseg_digit_n_a0;

// For $sseg_segment_n.
logic [6:0] L0_sseg_segment_n_a0;

// For /fpga_pins/fpga|calc$diff.
logic [7:0] FpgaPins_Fpga_CALC_diff_a1,
            FpgaPins_Fpga_CALC_diff_a2;

// For /fpga_pins/fpga|calc$digit.
logic [3:0] FpgaPins_Fpga_CALC_digit_a3;

// For /fpga_pins/fpga|calc$equals_in.
logic FpgaPins_Fpga_CALC_equals_in_a0,
      FpgaPins_Fpga_CALC_equals_in_a1,
      FpgaPins_Fpga_CALC_equals_in_a2;

// For /fpga_pins/fpga|calc$mem.
logic [7:0] FpgaPins_Fpga_CALC_mem_a2,
            FpgaPins_Fpga_CALC_mem_a3,
            FpgaPins_Fpga_CALC_mem_a4;

// For /fpga_pins/fpga|calc$op.
logic [2:0] FpgaPins_Fpga_CALC_op_a0,
            FpgaPins_Fpga_CALC_op_a1,
            FpgaPins_Fpga_CALC_op_a2;

// For /fpga_pins/fpga|calc$out.
logic [7:0] FpgaPins_Fpga_CALC_out_a2,
            FpgaPins_Fpga_CALC_out_a3,
            FpgaPins_Fpga_CALC_out_a4;

// For /fpga_pins/fpga|calc$prod.
logic [7:0] FpgaPins_Fpga_CALC_prod_a1,
            FpgaPins_Fpga_CALC_prod_a2;

// For /fpga_pins/fpga|calc$quot.
logic [7:0] FpgaPins_Fpga_CALC_quot_a1,
            FpgaPins_Fpga_CALC_quot_a2;

// For /fpga_pins/fpga|calc$reset.
logic FpgaPins_Fpga_CALC_reset_a0,
      FpgaPins_Fpga_CALC_reset_a1,
      FpgaPins_Fpga_CALC_reset_a2;

// For /fpga_pins/fpga|calc$sum.
logic [7:0] FpgaPins_Fpga_CALC_sum_a1,
            FpgaPins_Fpga_CALC_sum_a2;

// For /fpga_pins/fpga|calc$val1.
logic [7:0] FpgaPins_Fpga_CALC_val1_a1;

// For /fpga_pins/fpga|calc$val2.
logic [3:0] FpgaPins_Fpga_CALC_val2_a0,
            FpgaPins_Fpga_CALC_val2_a1;

// For /fpga_pins/fpga|calc$valid.
logic FpgaPins_Fpga_CALC_valid_a1,
      FpgaPins_Fpga_CALC_valid_a2;

// For /fpga_pins/fpga|calc$valid_or_reset.
logic FpgaPins_Fpga_CALC_valid_or_reset_a1;




   //
   // Scope: /fpga_pins
   //


      //
      // Scope: /fpga
      //


         //
         // Scope: |calc
         //

            // Staging of $diff.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_diff_a2[7:0] <= FpgaPins_Fpga_CALC_diff_a1[7:0];

            // Staging of $equals_in.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_equals_in_a1 <= FpgaPins_Fpga_CALC_equals_in_a0;
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_equals_in_a2 <= FpgaPins_Fpga_CALC_equals_in_a1;

            // Staging of $mem.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_mem_a3[7:0] <= FpgaPins_Fpga_CALC_mem_a2[7:0];
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_mem_a4[7:0] <= FpgaPins_Fpga_CALC_mem_a3[7:0];

            // Staging of $op.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_op_a1[2:0] <= FpgaPins_Fpga_CALC_op_a0[2:0];
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_op_a2[2:0] <= FpgaPins_Fpga_CALC_op_a1[2:0];

            // Staging of $out.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_out_a3[7:0] <= FpgaPins_Fpga_CALC_out_a2[7:0];
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_out_a4[7:0] <= FpgaPins_Fpga_CALC_out_a3[7:0];

            // Staging of $prod.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_prod_a2[7:0] <= FpgaPins_Fpga_CALC_prod_a1[7:0];

            // Staging of $quot.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_quot_a2[7:0] <= FpgaPins_Fpga_CALC_quot_a1[7:0];

            // Staging of $reset.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_reset_a1 <= FpgaPins_Fpga_CALC_reset_a0;
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_reset_a2 <= FpgaPins_Fpga_CALC_reset_a1;

            // Staging of $sum.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_sum_a2[7:0] <= FpgaPins_Fpga_CALC_sum_a1[7:0];

            // Staging of $val2.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_val2_a1[3:0] <= FpgaPins_Fpga_CALC_val2_a0[3:0];

            // Staging of $valid.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_valid_a2 <= FpgaPins_Fpga_CALC_valid_a1;








//
// Debug Signals
//

   if (1) begin : DEBUG_SIGS_GTKWAVE

      (* keep *) logic [7:0] \@0$slideswitch ;
      assign \@0$slideswitch = L0_slideswitch_a0;
      (* keep *) logic  \@0$sseg_decimal_point_n ;
      assign \@0$sseg_decimal_point_n = L0_sseg_decimal_point_n_a0;
      (* keep *) logic [7:0] \@0$sseg_digit_n ;
      assign \@0$sseg_digit_n = L0_sseg_digit_n_a0;
      (* keep *) logic [6:0] \@0$sseg_segment_n ;
      assign \@0$sseg_segment_n = L0_sseg_segment_n_a0;

      //
      // Scope: /digit[0:0]
      //
      for (digit = 0; digit <= 0; digit++) begin : \/digit 

         //
         // Scope: /leds[7:0]
         //
         for (leds = 0; leds <= 7; leds++) begin : \/leds 
            (* keep *) logic  \//@0$viz_lit ;
            assign \//@0$viz_lit = L1_Digit[digit].L2_Leds[leds].L2_viz_lit_a0;
         end
      end

      //
      // Scope: /fpga_pins
      //
      if (1) begin : \/fpga_pins 

         //
         // Scope: /fpga
         //
         if (1) begin : \/fpga 

            //
            // Scope: |calc
            //
            if (1) begin : P_calc
               (* keep *) logic [7:0] \///?$valid_or_reset@1$diff ;
               assign \///?$valid_or_reset@1$diff = FpgaPins_Fpga_CALC_diff_a1;
               (* keep *) logic [3:0] \///@3$digit ;
               assign \///@3$digit = FpgaPins_Fpga_CALC_digit_a3;
               (* keep *) logic  \///@0$equals_in ;
               assign \///@0$equals_in = FpgaPins_Fpga_CALC_equals_in_a0;
               (* keep *) logic [7:0] \///@2$mem ;
               assign \///@2$mem = FpgaPins_Fpga_CALC_mem_a2;
               (* keep *) logic [2:0] \///@0$op ;
               assign \///@0$op = FpgaPins_Fpga_CALC_op_a0;
               (* keep *) logic [7:0] \///@2$out ;
               assign \///@2$out = FpgaPins_Fpga_CALC_out_a2;
               (* keep *) logic [7:0] \///?$valid_or_reset@1$prod ;
               assign \///?$valid_or_reset@1$prod = FpgaPins_Fpga_CALC_prod_a1;
               (* keep *) logic [7:0] \///?$valid_or_reset@1$quot ;
               assign \///?$valid_or_reset@1$quot = FpgaPins_Fpga_CALC_quot_a1;
               (* keep *) logic  \///@0$reset ;
               assign \///@0$reset = FpgaPins_Fpga_CALC_reset_a0;
               (* keep *) logic [7:0] \///?$valid_or_reset@1$sum ;
               assign \///?$valid_or_reset@1$sum = FpgaPins_Fpga_CALC_sum_a1;
               (* keep *) logic [7:0] \///@1$val1 ;
               assign \///@1$val1 = FpgaPins_Fpga_CALC_val1_a1;
               (* keep *) logic [3:0] \///@0$val2 ;
               assign \///@0$val2 = FpgaPins_Fpga_CALC_val2_a0;
               (* keep *) logic  \///@1$valid ;
               assign \///@1$valid = FpgaPins_Fpga_CALC_valid_a1;
               (* keep *) logic  \///@1$valid_or_reset ;
               assign \///@1$valid_or_reset = FpgaPins_Fpga_CALC_valid_or_reset_a1;
            end
         end
      end

      //
      // Scope: /switch[7:0]
      //
      for (switch = 0; switch <= 7; switch++) begin : \/switch 
         (* keep *) logic  \/@0$viz_switch ;
         assign \/@0$viz_switch = L1_Switch[switch].L1_viz_switch_a0;
      end


   end

// ---------- Generated Code Ends ----------
//_\TLV
   /* verilator lint_off UNOPTFLAT */
   // Connect Tiny Tapeout I/Os to Virtual FPGA Lab.
   //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/35e36bd144fddd75495d4cbc01c4fc50ac5bde6f/tlvlib/tinytapeoutlib.tlv 76   // Instantiated from top.tlv, 198 as: m5+tt_connections()
      assign L0_slideswitch_a0[7:0] = ui_in;
      assign L0_sseg_segment_n_a0[6:0] = ~ uo_out[6:0];
      assign L0_sseg_decimal_point_n_a0 = ~ uo_out[7];
      assign L0_sseg_digit_n_a0[7:0] = 8'b11111110;
   //_\end_source

   // Instantiate the Virtual FPGA Lab.
   //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv 307   // Instantiated from top.tlv, 201 as: m5+board(/top, /fpga, 7, $, , calc)
      
      //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv 355   // Instantiated from /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv, 309 as: m4+thanks(m5__l(309)m5_eval(m5_get(BOARD_THANKS_ARGS)))
         //_/thanks
            
      //_\end_source
      
   
      // Board VIZ.
   
      // Board Image.
      
      //_/fpga_pins
         
         //_/fpga
            //_\source top.tlv 45   // Instantiated from /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv, 340 as: m4+calc.
            
            
            
               // ==================
               // |                |
               // | YOUR CODE HERE |
               // |                |
               // ==================
            
               // Note that pipesignals assigned here can be found under /fpga_pins/fpga.
               //_|calc
                  //_@0
                     assign FpgaPins_Fpga_CALC_reset_a0 = reset;
                     assign FpgaPins_Fpga_CALC_val2_a0[3:0] = {4'b0, ui_in[3:0]};
                     assign FpgaPins_Fpga_CALC_op_a0[2:0] = ui_in[6:4];
                     assign FpgaPins_Fpga_CALC_equals_in_a0 = ui_in[7];
                  //_@1
                     assign FpgaPins_Fpga_CALC_val1_a1[7:0] = FpgaPins_Fpga_CALC_out_a3[7:0];
            
                     assign FpgaPins_Fpga_CALC_valid_a1 = FpgaPins_Fpga_CALC_reset_a1 ? 1'b0 : FpgaPins_Fpga_CALC_equals_in_a1 && !FpgaPins_Fpga_CALC_equals_in_a2;
            
                     assign FpgaPins_Fpga_CALC_valid_or_reset_a1 = FpgaPins_Fpga_CALC_valid_a1 || FpgaPins_Fpga_CALC_reset_a1;
            
                     //_?$valid_or_reset
                        assign FpgaPins_Fpga_CALC_sum_a1[7:0] = FpgaPins_Fpga_CALC_val1_a1 + FpgaPins_Fpga_CALC_val2_a1;
                        assign FpgaPins_Fpga_CALC_diff_a1[7:0] = FpgaPins_Fpga_CALC_val1_a1 - FpgaPins_Fpga_CALC_val2_a1;
                        assign FpgaPins_Fpga_CALC_prod_a1[7:0] = FpgaPins_Fpga_CALC_val1_a1 * FpgaPins_Fpga_CALC_val2_a1;
                        assign FpgaPins_Fpga_CALC_quot_a1[7:0] = FpgaPins_Fpga_CALC_val1_a1 / FpgaPins_Fpga_CALC_val2_a1;
            
                  //_@2
                     assign FpgaPins_Fpga_CALC_mem_a2[7:0] = (FpgaPins_Fpga_CALC_reset_a2)  ? 8'd0 :
                                 (!FpgaPins_Fpga_CALC_valid_a2) ? FpgaPins_Fpga_CALC_mem_a3 :
                                 (FpgaPins_Fpga_CALC_valid_a2 && FpgaPins_Fpga_CALC_op_a2 == 3'd5) ? FpgaPins_Fpga_CALC_out_a4 :
                                                           FpgaPins_Fpga_CALC_mem_a3;
            
                     assign FpgaPins_Fpga_CALC_out_a2[7:0] = (FpgaPins_Fpga_CALC_reset_a2)      ? 8'b0 :
                                 (!FpgaPins_Fpga_CALC_valid_a2)     ? FpgaPins_Fpga_CALC_out_a3 :
                                 (FpgaPins_Fpga_CALC_op_a2 == 3'd0) ? FpgaPins_Fpga_CALC_sum_a2 :
                                 (FpgaPins_Fpga_CALC_op_a2 == 3'd1) ? FpgaPins_Fpga_CALC_diff_a2 :
                                 (FpgaPins_Fpga_CALC_op_a2 == 3'd2) ? FpgaPins_Fpga_CALC_prod_a2 :
                                 (FpgaPins_Fpga_CALC_op_a2 == 3'd3) ? FpgaPins_Fpga_CALC_quot_a2 :
                                 (FpgaPins_Fpga_CALC_op_a2 == 3'd4) ? FpgaPins_Fpga_CALC_mem_a4 :
                                                 FpgaPins_Fpga_CALC_out_a3;
            
            
            
            
            
                   //_@3
                     assign FpgaPins_Fpga_CALC_digit_a3[3:0] = FpgaPins_Fpga_CALC_out_a3[3:0];
                     assign uo_out = (FpgaPins_Fpga_CALC_digit_a3 == 'h0) ? 8'b0011_1111 :
                               (FpgaPins_Fpga_CALC_digit_a3 == 'h1) ? 8'b0000_0110 :
                               (FpgaPins_Fpga_CALC_digit_a3 == 'h2) ? 8'b0101_1011 :
                               (FpgaPins_Fpga_CALC_digit_a3 == 'h3) ? 8'b0100_1111 :
                               (FpgaPins_Fpga_CALC_digit_a3 == 'h4) ? 8'b0110_0110 :
                               (FpgaPins_Fpga_CALC_digit_a3 == 'h5) ? 8'b0110_1101 :
                               (FpgaPins_Fpga_CALC_digit_a3 == 'h6) ? 8'b0111_1101 :
                               (FpgaPins_Fpga_CALC_digit_a3 == 'h7) ? 8'b0000_0111 :
                               (FpgaPins_Fpga_CALC_digit_a3 == 'h8) ? 8'b0111_1111 :
                               (FpgaPins_Fpga_CALC_digit_a3 == 'h9) ? 8'b0110_1111 :
                               (FpgaPins_Fpga_CALC_digit_a3 == 'ha) ? 8'b0111_0111 :
                               (FpgaPins_Fpga_CALC_digit_a3 == 'hb) ? 8'b0111_1100 :
                               (FpgaPins_Fpga_CALC_digit_a3 == 'hc) ? 8'b0011_1001 :
                               (FpgaPins_Fpga_CALC_digit_a3 == 'hd) ? 8'b0101_1110 :
                               (FpgaPins_Fpga_CALC_digit_a3 == 'he) ? 8'b0111_1001 :
                               (FpgaPins_Fpga_CALC_digit_a3 == 'hf) ? 8'b0111_0001 :
                               //default
                               8'b1111_1111;
            
            
            
            
               // Connect Tiny Tapeout outputs. Note that uio_ outputs are not available in the Tiny-Tapeout-3-based FPGA boards.
               assign uo_out = 8'b0;
               
               
            //_\end_source
   
      // LEDs.
      
   
      // 7-Segment
      //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv 395   // Instantiated from /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv, 346 as: m4+fpga_sseg.
         for (digit = 0; digit <= 0; digit++) begin : L1_Digit //_/digit
            
            for (leds = 0; leds <= 7; leds++) begin : L2_Leds //_/leds

               // For $viz_lit.
               logic L2_viz_lit_a0;

               assign L2_viz_lit_a0 = (! L0_sseg_digit_n_a0[digit]) && ! ((leds == 7) ? L0_sseg_decimal_point_n_a0 : L0_sseg_segment_n_a0[leds % 7]);
               
            end
         end
      //_\end_source
   
      // slideswitches
      //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv 454   // Instantiated from /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv, 349 as: m4+fpga_switch.
         for (switch = 0; switch <= 7; switch++) begin : L1_Switch //_/switch

            // For $viz_switch.
            logic L1_viz_switch_a0;

            assign L1_viz_switch_a0 = L0_slideswitch_a0[switch];
            
         end
      //_\end_source
   
      // pushbuttons
      
   //_\end_source
   // Label the switch inputs [0..7] (1..8 on the physical switch panel) (top-to-bottom).
   //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/35e36bd144fddd75495d4cbc01c4fc50ac5bde6f/tlvlib/tinytapeoutlib.tlv 82   // Instantiated from top.tlv, 203 as: m5+tt_input_labels_viz(⌈"Value[0]", "Value[1]", "Value[2]", "Value[3]", "Op[0]", "Op[1]", "Op[2]", "="⌉)
      for (input_label = 0; input_label <= 7; input_label++) begin : L1_InputLabel //_/input_label
         
      end
   //_\end_source

//_\SV
endmodule


// Undefine macros defined by SandPiper.
`undef BOGUS_USE
