
module sequential_alu_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17;
  wire   [15:1] carry;

  FA_X1 U2_15 ( .A(A[15]), .B(n2), .CI(carry[15]), .S(DIFF[15]) );
  FA_X1 U2_14 ( .A(A[14]), .B(n3), .CI(carry[14]), .CO(carry[15]), .S(DIFF[14]) );
  FA_X1 U2_13 ( .A(A[13]), .B(n4), .CI(carry[13]), .CO(carry[14]), .S(DIFF[13]) );
  FA_X1 U2_12 ( .A(A[12]), .B(n5), .CI(carry[12]), .CO(carry[13]), .S(DIFF[12]) );
  FA_X1 U2_11 ( .A(A[11]), .B(n6), .CI(carry[11]), .CO(carry[12]), .S(DIFF[11]) );
  FA_X1 U2_10 ( .A(A[10]), .B(n7), .CI(carry[10]), .CO(carry[11]), .S(DIFF[10]) );
  FA_X1 U2_9 ( .A(A[9]), .B(n8), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9]) );
  FA_X1 U2_8 ( .A(A[8]), .B(n9), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  FA_X1 U2_7 ( .A(A[7]), .B(n10), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  FA_X1 U2_6 ( .A(A[6]), .B(n11), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FA_X1 U2_5 ( .A(A[5]), .B(n12), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FA_X1 U2_4 ( .A(A[4]), .B(n13), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FA_X1 U2_3 ( .A(A[3]), .B(n14), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FA_X1 U2_2 ( .A(A[2]), .B(n15), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  FA_X1 U2_1 ( .A(A[1]), .B(n16), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  XNOR2_X1 U1 ( .A(n17), .B(A[0]), .ZN(DIFF[0]) );
  INV_X1 U2 ( .A(B[1]), .ZN(n16) );
  INV_X1 U3 ( .A(A[0]), .ZN(n1) );
  INV_X1 U4 ( .A(B[2]), .ZN(n15) );
  INV_X1 U5 ( .A(B[3]), .ZN(n14) );
  INV_X1 U6 ( .A(B[4]), .ZN(n13) );
  INV_X1 U7 ( .A(B[5]), .ZN(n12) );
  INV_X1 U8 ( .A(B[6]), .ZN(n11) );
  INV_X1 U9 ( .A(B[7]), .ZN(n10) );
  INV_X1 U10 ( .A(B[8]), .ZN(n9) );
  INV_X1 U11 ( .A(B[9]), .ZN(n8) );
  INV_X1 U12 ( .A(B[10]), .ZN(n7) );
  INV_X1 U13 ( .A(B[11]), .ZN(n6) );
  INV_X1 U14 ( .A(B[12]), .ZN(n5) );
  INV_X1 U15 ( .A(B[13]), .ZN(n4) );
  INV_X1 U16 ( .A(B[14]), .ZN(n3) );
  INV_X1 U17 ( .A(B[0]), .ZN(n17) );
  INV_X1 U18 ( .A(B[15]), .ZN(n2) );
  NAND2_X1 U19 ( .A1(B[0]), .A2(n1), .ZN(carry[1]) );
endmodule


module sequential_alu_DW01_add_0 ( A, B, CI, SUM, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [15:2] carry;

  FA_X1 U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .S(SUM[15]) );
  FA_X1 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  FA_X1 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  FA_X1 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  FA_X1 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  FA_X1 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  FA_X1 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  FA_X1 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  FA_X1 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  FA_X1 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  FA_X1 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  FA_X1 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  FA_X1 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  FA_X1 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  FA_X1 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  AND2_X1 U1 ( .A1(B[0]), .A2(A[0]), .ZN(n1) );
  XOR2_X1 U2 ( .A(B[0]), .B(A[0]), .Z(SUM[0]) );
endmodule


module sequential_alu_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [15:0] A;
  input [15:0] B;
  output [31:0] PRODUCT;
  input TC;
  wire   ab_15__0_, ab_14__1_, ab_14__0_, ab_13__2_, ab_13__1_, ab_13__0_,
         ab_12__3_, ab_12__2_, ab_12__1_, ab_12__0_, ab_11__4_, ab_11__3_,
         ab_11__2_, ab_11__1_, ab_11__0_, ab_10__5_, ab_10__4_, ab_10__3_,
         ab_10__2_, ab_10__1_, ab_10__0_, ab_9__6_, ab_9__5_, ab_9__4_,
         ab_9__3_, ab_9__2_, ab_9__1_, ab_9__0_, ab_8__7_, ab_8__6_, ab_8__5_,
         ab_8__4_, ab_8__3_, ab_8__2_, ab_8__1_, ab_8__0_, ab_7__8_, ab_7__7_,
         ab_7__6_, ab_7__5_, ab_7__4_, ab_7__3_, ab_7__2_, ab_7__1_, ab_7__0_,
         ab_6__9_, ab_6__8_, ab_6__7_, ab_6__6_, ab_6__5_, ab_6__4_, ab_6__3_,
         ab_6__2_, ab_6__1_, ab_6__0_, ab_5__10_, ab_5__9_, ab_5__8_, ab_5__7_,
         ab_5__6_, ab_5__5_, ab_5__4_, ab_5__3_, ab_5__2_, ab_5__1_, ab_5__0_,
         ab_4__11_, ab_4__10_, ab_4__9_, ab_4__8_, ab_4__7_, ab_4__6_,
         ab_4__5_, ab_4__4_, ab_4__3_, ab_4__2_, ab_4__1_, ab_4__0_, ab_3__12_,
         ab_3__11_, ab_3__10_, ab_3__9_, ab_3__8_, ab_3__7_, ab_3__6_,
         ab_3__5_, ab_3__4_, ab_3__3_, ab_3__2_, ab_3__1_, ab_3__0_, ab_2__13_,
         ab_2__12_, ab_2__11_, ab_2__10_, ab_2__9_, ab_2__8_, ab_2__7_,
         ab_2__6_, ab_2__5_, ab_2__4_, ab_2__3_, ab_2__2_, ab_2__1_, ab_2__0_,
         ab_1__14_, ab_1__13_, ab_1__12_, ab_1__11_, ab_1__10_, ab_1__9_,
         ab_1__8_, ab_1__7_, ab_1__6_, ab_1__5_, ab_1__4_, ab_1__3_, ab_1__2_,
         ab_1__1_, ab_1__0_, ab_0__15_, ab_0__14_, ab_0__13_, ab_0__12_,
         ab_0__11_, ab_0__10_, ab_0__9_, ab_0__8_, ab_0__7_, ab_0__6_,
         ab_0__5_, ab_0__4_, ab_0__3_, ab_0__2_, ab_0__1_, CARRYB_14__0_,
         CARRYB_13__1_, CARRYB_13__0_, CARRYB_12__2_, CARRYB_12__1_,
         CARRYB_12__0_, CARRYB_11__3_, CARRYB_11__2_, CARRYB_11__1_,
         CARRYB_11__0_, CARRYB_10__4_, CARRYB_10__3_, CARRYB_10__2_,
         CARRYB_10__1_, CARRYB_10__0_, CARRYB_9__5_, CARRYB_9__4_,
         CARRYB_9__3_, CARRYB_9__2_, CARRYB_9__1_, CARRYB_9__0_, CARRYB_8__6_,
         CARRYB_8__5_, CARRYB_8__4_, CARRYB_8__3_, CARRYB_8__2_, CARRYB_8__1_,
         CARRYB_8__0_, CARRYB_7__7_, CARRYB_7__6_, CARRYB_7__5_, CARRYB_7__4_,
         CARRYB_7__3_, CARRYB_7__2_, CARRYB_7__1_, CARRYB_7__0_, CARRYB_6__8_,
         CARRYB_6__7_, CARRYB_6__6_, CARRYB_6__5_, CARRYB_6__4_, CARRYB_6__3_,
         CARRYB_6__2_, CARRYB_6__1_, CARRYB_6__0_, CARRYB_5__9_, CARRYB_5__8_,
         CARRYB_5__7_, CARRYB_5__6_, CARRYB_5__5_, CARRYB_5__4_, CARRYB_5__3_,
         CARRYB_5__2_, CARRYB_5__1_, CARRYB_5__0_, CARRYB_4__10_, CARRYB_4__9_,
         CARRYB_4__8_, CARRYB_4__7_, CARRYB_4__6_, CARRYB_4__5_, CARRYB_4__4_,
         CARRYB_4__3_, CARRYB_4__2_, CARRYB_4__1_, CARRYB_4__0_, CARRYB_3__11_,
         CARRYB_3__10_, CARRYB_3__9_, CARRYB_3__8_, CARRYB_3__7_, CARRYB_3__6_,
         CARRYB_3__5_, CARRYB_3__4_, CARRYB_3__3_, CARRYB_3__2_, CARRYB_3__1_,
         CARRYB_3__0_, CARRYB_2__12_, CARRYB_2__11_, CARRYB_2__10_,
         CARRYB_2__9_, CARRYB_2__8_, CARRYB_2__7_, CARRYB_2__6_, CARRYB_2__5_,
         CARRYB_2__4_, CARRYB_2__3_, CARRYB_2__2_, CARRYB_2__1_, CARRYB_2__0_,
         SUMB_14__1_, SUMB_13__2_, SUMB_13__1_, SUMB_12__3_, SUMB_12__2_,
         SUMB_12__1_, SUMB_11__4_, SUMB_11__3_, SUMB_11__2_, SUMB_11__1_,
         SUMB_10__5_, SUMB_10__4_, SUMB_10__3_, SUMB_10__2_, SUMB_10__1_,
         SUMB_9__6_, SUMB_9__5_, SUMB_9__4_, SUMB_9__3_, SUMB_9__2_,
         SUMB_9__1_, SUMB_8__7_, SUMB_8__6_, SUMB_8__5_, SUMB_8__4_,
         SUMB_8__3_, SUMB_8__2_, SUMB_8__1_, SUMB_7__8_, SUMB_7__7_,
         SUMB_7__6_, SUMB_7__5_, SUMB_7__4_, SUMB_7__3_, SUMB_7__2_,
         SUMB_7__1_, SUMB_6__9_, SUMB_6__8_, SUMB_6__7_, SUMB_6__6_,
         SUMB_6__5_, SUMB_6__4_, SUMB_6__3_, SUMB_6__2_, SUMB_6__1_,
         SUMB_5__10_, SUMB_5__9_, SUMB_5__8_, SUMB_5__7_, SUMB_5__6_,
         SUMB_5__5_, SUMB_5__4_, SUMB_5__3_, SUMB_5__2_, SUMB_5__1_,
         SUMB_4__11_, SUMB_4__10_, SUMB_4__9_, SUMB_4__8_, SUMB_4__7_,
         SUMB_4__6_, SUMB_4__5_, SUMB_4__4_, SUMB_4__3_, SUMB_4__2_,
         SUMB_4__1_, SUMB_3__12_, SUMB_3__11_, SUMB_3__10_, SUMB_3__9_,
         SUMB_3__8_, SUMB_3__7_, SUMB_3__6_, SUMB_3__5_, SUMB_3__4_,
         SUMB_3__3_, SUMB_3__2_, SUMB_3__1_, SUMB_2__13_, SUMB_2__12_,
         SUMB_2__11_, SUMB_2__10_, SUMB_2__9_, SUMB_2__8_, SUMB_2__7_,
         SUMB_2__6_, SUMB_2__5_, SUMB_2__4_, SUMB_2__3_, SUMB_2__2_,
         SUMB_2__1_, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141;

  FA_X1 S4_0 ( .A(ab_15__0_), .B(CARRYB_14__0_), .CI(SUMB_14__1_), .S(
        PRODUCT[15]) );
  FA_X1 S1_14_0 ( .A(ab_14__0_), .B(CARRYB_13__0_), .CI(SUMB_13__1_), .CO(
        CARRYB_14__0_), .S(PRODUCT[14]) );
  FA_X1 S2_14_1 ( .A(ab_14__1_), .B(CARRYB_13__1_), .CI(SUMB_13__2_), .S(
        SUMB_14__1_) );
  FA_X1 S1_13_0 ( .A(ab_13__0_), .B(CARRYB_12__0_), .CI(SUMB_12__1_), .CO(
        CARRYB_13__0_), .S(PRODUCT[13]) );
  FA_X1 S2_13_1 ( .A(ab_13__1_), .B(CARRYB_12__1_), .CI(SUMB_12__2_), .CO(
        CARRYB_13__1_), .S(SUMB_13__1_) );
  FA_X1 S2_13_2 ( .A(ab_13__2_), .B(CARRYB_12__2_), .CI(SUMB_12__3_), .S(
        SUMB_13__2_) );
  FA_X1 S1_12_0 ( .A(ab_12__0_), .B(CARRYB_11__0_), .CI(SUMB_11__1_), .CO(
        CARRYB_12__0_), .S(PRODUCT[12]) );
  FA_X1 S2_12_1 ( .A(ab_12__1_), .B(CARRYB_11__1_), .CI(SUMB_11__2_), .CO(
        CARRYB_12__1_), .S(SUMB_12__1_) );
  FA_X1 S2_12_2 ( .A(ab_12__2_), .B(CARRYB_11__2_), .CI(SUMB_11__3_), .CO(
        CARRYB_12__2_), .S(SUMB_12__2_) );
  FA_X1 S2_12_3 ( .A(ab_12__3_), .B(CARRYB_11__3_), .CI(SUMB_11__4_), .S(
        SUMB_12__3_) );
  FA_X1 S1_11_0 ( .A(ab_11__0_), .B(CARRYB_10__0_), .CI(SUMB_10__1_), .CO(
        CARRYB_11__0_), .S(PRODUCT[11]) );
  FA_X1 S2_11_1 ( .A(ab_11__1_), .B(CARRYB_10__1_), .CI(SUMB_10__2_), .CO(
        CARRYB_11__1_), .S(SUMB_11__1_) );
  FA_X1 S2_11_2 ( .A(ab_11__2_), .B(CARRYB_10__2_), .CI(SUMB_10__3_), .CO(
        CARRYB_11__2_), .S(SUMB_11__2_) );
  FA_X1 S2_11_3 ( .A(ab_11__3_), .B(CARRYB_10__3_), .CI(SUMB_10__4_), .CO(
        CARRYB_11__3_), .S(SUMB_11__3_) );
  FA_X1 S2_11_4 ( .A(ab_11__4_), .B(CARRYB_10__4_), .CI(SUMB_10__5_), .S(
        SUMB_11__4_) );
  FA_X1 S1_10_0 ( .A(ab_10__0_), .B(CARRYB_9__0_), .CI(SUMB_9__1_), .CO(
        CARRYB_10__0_), .S(PRODUCT[10]) );
  FA_X1 S2_10_1 ( .A(ab_10__1_), .B(CARRYB_9__1_), .CI(SUMB_9__2_), .CO(
        CARRYB_10__1_), .S(SUMB_10__1_) );
  FA_X1 S2_10_2 ( .A(ab_10__2_), .B(CARRYB_9__2_), .CI(SUMB_9__3_), .CO(
        CARRYB_10__2_), .S(SUMB_10__2_) );
  FA_X1 S2_10_3 ( .A(ab_10__3_), .B(CARRYB_9__3_), .CI(SUMB_9__4_), .CO(
        CARRYB_10__3_), .S(SUMB_10__3_) );
  FA_X1 S2_10_4 ( .A(ab_10__4_), .B(CARRYB_9__4_), .CI(SUMB_9__5_), .CO(
        CARRYB_10__4_), .S(SUMB_10__4_) );
  FA_X1 S2_10_5 ( .A(ab_10__5_), .B(CARRYB_9__5_), .CI(SUMB_9__6_), .S(
        SUMB_10__5_) );
  FA_X1 S1_9_0 ( .A(ab_9__0_), .B(CARRYB_8__0_), .CI(SUMB_8__1_), .CO(
        CARRYB_9__0_), .S(PRODUCT[9]) );
  FA_X1 S2_9_1 ( .A(ab_9__1_), .B(CARRYB_8__1_), .CI(SUMB_8__2_), .CO(
        CARRYB_9__1_), .S(SUMB_9__1_) );
  FA_X1 S2_9_2 ( .A(ab_9__2_), .B(CARRYB_8__2_), .CI(SUMB_8__3_), .CO(
        CARRYB_9__2_), .S(SUMB_9__2_) );
  FA_X1 S2_9_3 ( .A(ab_9__3_), .B(CARRYB_8__3_), .CI(SUMB_8__4_), .CO(
        CARRYB_9__3_), .S(SUMB_9__3_) );
  FA_X1 S2_9_4 ( .A(ab_9__4_), .B(CARRYB_8__4_), .CI(SUMB_8__5_), .CO(
        CARRYB_9__4_), .S(SUMB_9__4_) );
  FA_X1 S2_9_5 ( .A(ab_9__5_), .B(CARRYB_8__5_), .CI(SUMB_8__6_), .CO(
        CARRYB_9__5_), .S(SUMB_9__5_) );
  FA_X1 S2_9_6 ( .A(ab_9__6_), .B(CARRYB_8__6_), .CI(SUMB_8__7_), .S(
        SUMB_9__6_) );
  FA_X1 S1_8_0 ( .A(ab_8__0_), .B(CARRYB_7__0_), .CI(SUMB_7__1_), .CO(
        CARRYB_8__0_), .S(PRODUCT[8]) );
  FA_X1 S2_8_1 ( .A(ab_8__1_), .B(CARRYB_7__1_), .CI(SUMB_7__2_), .CO(
        CARRYB_8__1_), .S(SUMB_8__1_) );
  FA_X1 S2_8_2 ( .A(ab_8__2_), .B(CARRYB_7__2_), .CI(SUMB_7__3_), .CO(
        CARRYB_8__2_), .S(SUMB_8__2_) );
  FA_X1 S2_8_3 ( .A(ab_8__3_), .B(CARRYB_7__3_), .CI(SUMB_7__4_), .CO(
        CARRYB_8__3_), .S(SUMB_8__3_) );
  FA_X1 S2_8_4 ( .A(ab_8__4_), .B(CARRYB_7__4_), .CI(SUMB_7__5_), .CO(
        CARRYB_8__4_), .S(SUMB_8__4_) );
  FA_X1 S2_8_5 ( .A(ab_8__5_), .B(CARRYB_7__5_), .CI(SUMB_7__6_), .CO(
        CARRYB_8__5_), .S(SUMB_8__5_) );
  FA_X1 S2_8_6 ( .A(ab_8__6_), .B(CARRYB_7__6_), .CI(SUMB_7__7_), .CO(
        CARRYB_8__6_), .S(SUMB_8__6_) );
  FA_X1 S2_8_7 ( .A(ab_8__7_), .B(CARRYB_7__7_), .CI(SUMB_7__8_), .S(
        SUMB_8__7_) );
  FA_X1 S1_7_0 ( .A(ab_7__0_), .B(CARRYB_6__0_), .CI(SUMB_6__1_), .CO(
        CARRYB_7__0_), .S(PRODUCT[7]) );
  FA_X1 S2_7_1 ( .A(ab_7__1_), .B(CARRYB_6__1_), .CI(SUMB_6__2_), .CO(
        CARRYB_7__1_), .S(SUMB_7__1_) );
  FA_X1 S2_7_2 ( .A(ab_7__2_), .B(CARRYB_6__2_), .CI(SUMB_6__3_), .CO(
        CARRYB_7__2_), .S(SUMB_7__2_) );
  FA_X1 S2_7_3 ( .A(ab_7__3_), .B(CARRYB_6__3_), .CI(SUMB_6__4_), .CO(
        CARRYB_7__3_), .S(SUMB_7__3_) );
  FA_X1 S2_7_4 ( .A(ab_7__4_), .B(CARRYB_6__4_), .CI(SUMB_6__5_), .CO(
        CARRYB_7__4_), .S(SUMB_7__4_) );
  FA_X1 S2_7_5 ( .A(ab_7__5_), .B(CARRYB_6__5_), .CI(SUMB_6__6_), .CO(
        CARRYB_7__5_), .S(SUMB_7__5_) );
  FA_X1 S2_7_6 ( .A(ab_7__6_), .B(CARRYB_6__6_), .CI(SUMB_6__7_), .CO(
        CARRYB_7__6_), .S(SUMB_7__6_) );
  FA_X1 S2_7_7 ( .A(ab_7__7_), .B(CARRYB_6__7_), .CI(SUMB_6__8_), .CO(
        CARRYB_7__7_), .S(SUMB_7__7_) );
  FA_X1 S2_7_8 ( .A(ab_7__8_), .B(CARRYB_6__8_), .CI(SUMB_6__9_), .S(
        SUMB_7__8_) );
  FA_X1 S1_6_0 ( .A(ab_6__0_), .B(CARRYB_5__0_), .CI(SUMB_5__1_), .CO(
        CARRYB_6__0_), .S(PRODUCT[6]) );
  FA_X1 S2_6_1 ( .A(ab_6__1_), .B(CARRYB_5__1_), .CI(SUMB_5__2_), .CO(
        CARRYB_6__1_), .S(SUMB_6__1_) );
  FA_X1 S2_6_2 ( .A(ab_6__2_), .B(CARRYB_5__2_), .CI(SUMB_5__3_), .CO(
        CARRYB_6__2_), .S(SUMB_6__2_) );
  FA_X1 S2_6_3 ( .A(ab_6__3_), .B(CARRYB_5__3_), .CI(SUMB_5__4_), .CO(
        CARRYB_6__3_), .S(SUMB_6__3_) );
  FA_X1 S2_6_4 ( .A(ab_6__4_), .B(CARRYB_5__4_), .CI(SUMB_5__5_), .CO(
        CARRYB_6__4_), .S(SUMB_6__4_) );
  FA_X1 S2_6_5 ( .A(ab_6__5_), .B(CARRYB_5__5_), .CI(SUMB_5__6_), .CO(
        CARRYB_6__5_), .S(SUMB_6__5_) );
  FA_X1 S2_6_6 ( .A(ab_6__6_), .B(CARRYB_5__6_), .CI(SUMB_5__7_), .CO(
        CARRYB_6__6_), .S(SUMB_6__6_) );
  FA_X1 S2_6_7 ( .A(ab_6__7_), .B(CARRYB_5__7_), .CI(SUMB_5__8_), .CO(
        CARRYB_6__7_), .S(SUMB_6__7_) );
  FA_X1 S2_6_8 ( .A(ab_6__8_), .B(CARRYB_5__8_), .CI(SUMB_5__9_), .CO(
        CARRYB_6__8_), .S(SUMB_6__8_) );
  FA_X1 S2_6_9 ( .A(ab_6__9_), .B(CARRYB_5__9_), .CI(SUMB_5__10_), .S(
        SUMB_6__9_) );
  FA_X1 S1_5_0 ( .A(ab_5__0_), .B(CARRYB_4__0_), .CI(SUMB_4__1_), .CO(
        CARRYB_5__0_), .S(PRODUCT[5]) );
  FA_X1 S2_5_1 ( .A(ab_5__1_), .B(CARRYB_4__1_), .CI(SUMB_4__2_), .CO(
        CARRYB_5__1_), .S(SUMB_5__1_) );
  FA_X1 S2_5_2 ( .A(ab_5__2_), .B(CARRYB_4__2_), .CI(SUMB_4__3_), .CO(
        CARRYB_5__2_), .S(SUMB_5__2_) );
  FA_X1 S2_5_3 ( .A(ab_5__3_), .B(CARRYB_4__3_), .CI(SUMB_4__4_), .CO(
        CARRYB_5__3_), .S(SUMB_5__3_) );
  FA_X1 S2_5_4 ( .A(ab_5__4_), .B(CARRYB_4__4_), .CI(SUMB_4__5_), .CO(
        CARRYB_5__4_), .S(SUMB_5__4_) );
  FA_X1 S2_5_5 ( .A(ab_5__5_), .B(CARRYB_4__5_), .CI(SUMB_4__6_), .CO(
        CARRYB_5__5_), .S(SUMB_5__5_) );
  FA_X1 S2_5_6 ( .A(ab_5__6_), .B(CARRYB_4__6_), .CI(SUMB_4__7_), .CO(
        CARRYB_5__6_), .S(SUMB_5__6_) );
  FA_X1 S2_5_7 ( .A(ab_5__7_), .B(CARRYB_4__7_), .CI(SUMB_4__8_), .CO(
        CARRYB_5__7_), .S(SUMB_5__7_) );
  FA_X1 S2_5_8 ( .A(ab_5__8_), .B(CARRYB_4__8_), .CI(SUMB_4__9_), .CO(
        CARRYB_5__8_), .S(SUMB_5__8_) );
  FA_X1 S2_5_9 ( .A(ab_5__9_), .B(CARRYB_4__9_), .CI(SUMB_4__10_), .CO(
        CARRYB_5__9_), .S(SUMB_5__9_) );
  FA_X1 S2_5_10 ( .A(ab_5__10_), .B(CARRYB_4__10_), .CI(SUMB_4__11_), .S(
        SUMB_5__10_) );
  FA_X1 S1_4_0 ( .A(ab_4__0_), .B(CARRYB_3__0_), .CI(SUMB_3__1_), .CO(
        CARRYB_4__0_), .S(PRODUCT[4]) );
  FA_X1 S2_4_1 ( .A(ab_4__1_), .B(CARRYB_3__1_), .CI(SUMB_3__2_), .CO(
        CARRYB_4__1_), .S(SUMB_4__1_) );
  FA_X1 S2_4_2 ( .A(ab_4__2_), .B(CARRYB_3__2_), .CI(SUMB_3__3_), .CO(
        CARRYB_4__2_), .S(SUMB_4__2_) );
  FA_X1 S2_4_3 ( .A(ab_4__3_), .B(CARRYB_3__3_), .CI(SUMB_3__4_), .CO(
        CARRYB_4__3_), .S(SUMB_4__3_) );
  FA_X1 S2_4_4 ( .A(ab_4__4_), .B(CARRYB_3__4_), .CI(SUMB_3__5_), .CO(
        CARRYB_4__4_), .S(SUMB_4__4_) );
  FA_X1 S2_4_5 ( .A(ab_4__5_), .B(CARRYB_3__5_), .CI(SUMB_3__6_), .CO(
        CARRYB_4__5_), .S(SUMB_4__5_) );
  FA_X1 S2_4_6 ( .A(ab_4__6_), .B(CARRYB_3__6_), .CI(SUMB_3__7_), .CO(
        CARRYB_4__6_), .S(SUMB_4__6_) );
  FA_X1 S2_4_7 ( .A(ab_4__7_), .B(CARRYB_3__7_), .CI(SUMB_3__8_), .CO(
        CARRYB_4__7_), .S(SUMB_4__7_) );
  FA_X1 S2_4_8 ( .A(ab_4__8_), .B(CARRYB_3__8_), .CI(SUMB_3__9_), .CO(
        CARRYB_4__8_), .S(SUMB_4__8_) );
  FA_X1 S2_4_9 ( .A(ab_4__9_), .B(CARRYB_3__9_), .CI(SUMB_3__10_), .CO(
        CARRYB_4__9_), .S(SUMB_4__9_) );
  FA_X1 S2_4_10 ( .A(ab_4__10_), .B(CARRYB_3__10_), .CI(SUMB_3__11_), .CO(
        CARRYB_4__10_), .S(SUMB_4__10_) );
  FA_X1 S2_4_11 ( .A(ab_4__11_), .B(CARRYB_3__11_), .CI(SUMB_3__12_), .S(
        SUMB_4__11_) );
  FA_X1 S1_3_0 ( .A(ab_3__0_), .B(CARRYB_2__0_), .CI(SUMB_2__1_), .CO(
        CARRYB_3__0_), .S(PRODUCT[3]) );
  FA_X1 S2_3_1 ( .A(ab_3__1_), .B(CARRYB_2__1_), .CI(SUMB_2__2_), .CO(
        CARRYB_3__1_), .S(SUMB_3__1_) );
  FA_X1 S2_3_2 ( .A(ab_3__2_), .B(CARRYB_2__2_), .CI(SUMB_2__3_), .CO(
        CARRYB_3__2_), .S(SUMB_3__2_) );
  FA_X1 S2_3_3 ( .A(ab_3__3_), .B(CARRYB_2__3_), .CI(SUMB_2__4_), .CO(
        CARRYB_3__3_), .S(SUMB_3__3_) );
  FA_X1 S2_3_4 ( .A(ab_3__4_), .B(CARRYB_2__4_), .CI(SUMB_2__5_), .CO(
        CARRYB_3__4_), .S(SUMB_3__4_) );
  FA_X1 S2_3_5 ( .A(ab_3__5_), .B(CARRYB_2__5_), .CI(SUMB_2__6_), .CO(
        CARRYB_3__5_), .S(SUMB_3__5_) );
  FA_X1 S2_3_6 ( .A(ab_3__6_), .B(CARRYB_2__6_), .CI(SUMB_2__7_), .CO(
        CARRYB_3__6_), .S(SUMB_3__6_) );
  FA_X1 S2_3_7 ( .A(ab_3__7_), .B(CARRYB_2__7_), .CI(SUMB_2__8_), .CO(
        CARRYB_3__7_), .S(SUMB_3__7_) );
  FA_X1 S2_3_8 ( .A(ab_3__8_), .B(CARRYB_2__8_), .CI(SUMB_2__9_), .CO(
        CARRYB_3__8_), .S(SUMB_3__8_) );
  FA_X1 S2_3_9 ( .A(ab_3__9_), .B(CARRYB_2__9_), .CI(SUMB_2__10_), .CO(
        CARRYB_3__9_), .S(SUMB_3__9_) );
  FA_X1 S2_3_10 ( .A(ab_3__10_), .B(CARRYB_2__10_), .CI(SUMB_2__11_), .CO(
        CARRYB_3__10_), .S(SUMB_3__10_) );
  FA_X1 S2_3_11 ( .A(ab_3__11_), .B(CARRYB_2__11_), .CI(SUMB_2__12_), .CO(
        CARRYB_3__11_), .S(SUMB_3__11_) );
  FA_X1 S2_3_12 ( .A(ab_3__12_), .B(CARRYB_2__12_), .CI(SUMB_2__13_), .S(
        SUMB_3__12_) );
  FA_X1 S1_2_0 ( .A(ab_2__0_), .B(n4), .CI(n20), .CO(CARRYB_2__0_), .S(
        PRODUCT[2]) );
  FA_X1 S2_2_1 ( .A(ab_2__1_), .B(n12), .CI(n19), .CO(CARRYB_2__1_), .S(
        SUMB_2__1_) );
  FA_X1 S2_2_2 ( .A(ab_2__2_), .B(n13), .CI(n16), .CO(CARRYB_2__2_), .S(
        SUMB_2__2_) );
  FA_X1 S2_2_3 ( .A(ab_2__3_), .B(n3), .CI(n23), .CO(CARRYB_2__3_), .S(
        SUMB_2__3_) );
  FA_X1 S2_2_4 ( .A(ab_2__4_), .B(n11), .CI(n22), .CO(CARRYB_2__4_), .S(
        SUMB_2__4_) );
  FA_X1 S2_2_5 ( .A(ab_2__5_), .B(n10), .CI(n21), .CO(CARRYB_2__5_), .S(
        SUMB_2__5_) );
  FA_X1 S2_2_6 ( .A(ab_2__6_), .B(n9), .CI(n17), .CO(CARRYB_2__6_), .S(
        SUMB_2__6_) );
  FA_X1 S2_2_7 ( .A(ab_2__7_), .B(n5), .CI(n27), .CO(CARRYB_2__7_), .S(
        SUMB_2__7_) );
  FA_X1 S2_2_8 ( .A(ab_2__8_), .B(n8), .CI(n26), .CO(CARRYB_2__8_), .S(
        SUMB_2__8_) );
  FA_X1 S2_2_9 ( .A(ab_2__9_), .B(n7), .CI(n25), .CO(CARRYB_2__9_), .S(
        SUMB_2__9_) );
  FA_X1 S2_2_10 ( .A(ab_2__10_), .B(n15), .CI(n18), .CO(CARRYB_2__10_), .S(
        SUMB_2__10_) );
  FA_X1 S2_2_11 ( .A(ab_2__11_), .B(n6), .CI(n24), .CO(CARRYB_2__11_), .S(
        SUMB_2__11_) );
  FA_X1 S2_2_12 ( .A(ab_2__12_), .B(n14), .CI(n28), .CO(CARRYB_2__12_), .S(
        SUMB_2__12_) );
  FA_X1 S2_2_13 ( .A(ab_2__13_), .B(n108), .CI(n29), .S(SUMB_2__13_) );
  AND2_X1 U2 ( .A1(ab_0__4_), .A2(ab_1__3_), .ZN(n3) );
  AND2_X1 U3 ( .A1(ab_0__1_), .A2(ab_1__0_), .ZN(n4) );
  AND2_X1 U4 ( .A1(ab_0__8_), .A2(ab_1__7_), .ZN(n5) );
  AND2_X1 U5 ( .A1(ab_0__12_), .A2(ab_1__11_), .ZN(n6) );
  AND2_X1 U6 ( .A1(ab_0__10_), .A2(ab_1__9_), .ZN(n7) );
  AND2_X1 U7 ( .A1(ab_0__9_), .A2(ab_1__8_), .ZN(n8) );
  AND2_X1 U8 ( .A1(ab_0__7_), .A2(ab_1__6_), .ZN(n9) );
  AND2_X1 U9 ( .A1(ab_0__6_), .A2(ab_1__5_), .ZN(n10) );
  AND2_X1 U10 ( .A1(ab_0__5_), .A2(ab_1__4_), .ZN(n11) );
  AND2_X1 U11 ( .A1(ab_0__2_), .A2(ab_1__1_), .ZN(n12) );
  AND2_X1 U12 ( .A1(ab_0__3_), .A2(ab_1__2_), .ZN(n13) );
  AND2_X1 U13 ( .A1(ab_0__13_), .A2(ab_1__12_), .ZN(n14) );
  AND2_X1 U14 ( .A1(ab_0__11_), .A2(ab_1__10_), .ZN(n15) );
  XOR2_X1 U15 ( .A(ab_1__3_), .B(ab_0__4_), .Z(n16) );
  XOR2_X1 U16 ( .A(ab_1__7_), .B(ab_0__8_), .Z(n17) );
  XOR2_X1 U17 ( .A(ab_1__11_), .B(ab_0__12_), .Z(n18) );
  XOR2_X1 U18 ( .A(ab_1__2_), .B(ab_0__3_), .Z(n19) );
  XOR2_X1 U19 ( .A(ab_1__1_), .B(ab_0__2_), .Z(n20) );
  XOR2_X1 U20 ( .A(ab_1__6_), .B(ab_0__7_), .Z(n21) );
  XOR2_X1 U21 ( .A(ab_1__5_), .B(ab_0__6_), .Z(n22) );
  XOR2_X1 U22 ( .A(ab_1__4_), .B(ab_0__5_), .Z(n23) );
  XOR2_X1 U23 ( .A(ab_1__12_), .B(ab_0__13_), .Z(n24) );
  XOR2_X1 U24 ( .A(ab_1__10_), .B(ab_0__11_), .Z(n25) );
  XOR2_X1 U25 ( .A(ab_1__9_), .B(ab_0__10_), .Z(n26) );
  XOR2_X1 U26 ( .A(ab_1__8_), .B(ab_0__9_), .Z(n27) );
  XOR2_X1 U27 ( .A(ab_1__13_), .B(ab_0__14_), .Z(n28) );
  XOR2_X1 U28 ( .A(ab_0__15_), .B(ab_1__14_), .Z(n29) );
  INV_X1 U29 ( .A(n130), .ZN(n30) );
  INV_X1 U30 ( .A(n30), .ZN(n31) );
  INV_X1 U31 ( .A(n114), .ZN(n32) );
  INV_X1 U32 ( .A(n32), .ZN(n33) );
  INV_X1 U33 ( .A(n131), .ZN(n34) );
  INV_X1 U34 ( .A(n34), .ZN(n35) );
  INV_X1 U35 ( .A(n115), .ZN(n36) );
  INV_X1 U36 ( .A(n36), .ZN(n37) );
  INV_X1 U37 ( .A(n132), .ZN(n38) );
  INV_X1 U38 ( .A(n38), .ZN(n39) );
  INV_X1 U39 ( .A(n116), .ZN(n40) );
  INV_X1 U40 ( .A(n40), .ZN(n41) );
  INV_X1 U41 ( .A(n133), .ZN(n42) );
  INV_X1 U42 ( .A(n42), .ZN(n43) );
  INV_X1 U43 ( .A(n42), .ZN(n44) );
  INV_X1 U44 ( .A(n117), .ZN(n45) );
  INV_X1 U45 ( .A(n45), .ZN(n46) );
  INV_X1 U46 ( .A(n45), .ZN(n47) );
  INV_X1 U47 ( .A(n134), .ZN(n48) );
  INV_X1 U48 ( .A(n48), .ZN(n49) );
  INV_X1 U49 ( .A(n48), .ZN(n50) );
  INV_X1 U50 ( .A(n118), .ZN(n51) );
  INV_X1 U51 ( .A(n51), .ZN(n52) );
  INV_X1 U52 ( .A(n51), .ZN(n53) );
  INV_X1 U53 ( .A(n135), .ZN(n54) );
  INV_X1 U54 ( .A(n54), .ZN(n55) );
  INV_X1 U55 ( .A(n54), .ZN(n56) );
  INV_X1 U56 ( .A(n119), .ZN(n57) );
  INV_X1 U57 ( .A(n57), .ZN(n58) );
  INV_X1 U58 ( .A(n57), .ZN(n59) );
  INV_X1 U59 ( .A(n136), .ZN(n60) );
  INV_X1 U60 ( .A(n60), .ZN(n61) );
  INV_X1 U61 ( .A(n60), .ZN(n62) );
  INV_X1 U62 ( .A(n120), .ZN(n63) );
  INV_X1 U63 ( .A(n63), .ZN(n64) );
  INV_X1 U64 ( .A(n63), .ZN(n65) );
  INV_X1 U65 ( .A(n137), .ZN(n66) );
  INV_X1 U66 ( .A(n66), .ZN(n67) );
  INV_X1 U67 ( .A(n66), .ZN(n68) );
  INV_X1 U68 ( .A(n66), .ZN(n69) );
  INV_X1 U69 ( .A(n121), .ZN(n70) );
  INV_X1 U70 ( .A(n70), .ZN(n71) );
  INV_X1 U71 ( .A(n70), .ZN(n72) );
  INV_X1 U72 ( .A(n70), .ZN(n73) );
  INV_X1 U73 ( .A(n138), .ZN(n74) );
  INV_X1 U74 ( .A(n74), .ZN(n75) );
  INV_X1 U75 ( .A(n74), .ZN(n76) );
  INV_X1 U76 ( .A(n74), .ZN(n77) );
  INV_X1 U77 ( .A(n122), .ZN(n78) );
  INV_X1 U78 ( .A(n78), .ZN(n79) );
  INV_X1 U79 ( .A(n78), .ZN(n80) );
  INV_X1 U80 ( .A(n78), .ZN(n81) );
  INV_X1 U81 ( .A(n139), .ZN(n82) );
  INV_X1 U82 ( .A(n82), .ZN(n83) );
  INV_X1 U83 ( .A(n82), .ZN(n84) );
  INV_X1 U84 ( .A(n82), .ZN(n85) );
  INV_X1 U85 ( .A(n123), .ZN(n86) );
  INV_X1 U86 ( .A(n86), .ZN(n87) );
  INV_X1 U87 ( .A(n86), .ZN(n88) );
  INV_X1 U88 ( .A(n86), .ZN(n89) );
  INV_X1 U89 ( .A(n140), .ZN(n90) );
  INV_X1 U90 ( .A(n90), .ZN(n91) );
  INV_X1 U91 ( .A(n90), .ZN(n92) );
  INV_X1 U92 ( .A(n90), .ZN(n93) );
  INV_X1 U93 ( .A(n124), .ZN(n94) );
  INV_X1 U94 ( .A(n94), .ZN(n95) );
  INV_X1 U95 ( .A(n94), .ZN(n96) );
  INV_X1 U96 ( .A(n94), .ZN(n97) );
  INV_X1 U97 ( .A(n141), .ZN(n98) );
  INV_X1 U98 ( .A(n98), .ZN(n99) );
  INV_X1 U99 ( .A(n98), .ZN(n100) );
  INV_X1 U100 ( .A(n98), .ZN(n101) );
  INV_X1 U101 ( .A(n98), .ZN(n102) );
  INV_X1 U102 ( .A(n125), .ZN(n103) );
  INV_X1 U103 ( .A(n103), .ZN(n104) );
  INV_X1 U104 ( .A(n103), .ZN(n105) );
  INV_X1 U105 ( .A(n103), .ZN(n106) );
  INV_X1 U106 ( .A(n103), .ZN(n107) );
  AND2_X1 U107 ( .A1(ab_0__14_), .A2(ab_1__13_), .ZN(n108) );
  XOR2_X1 U108 ( .A(ab_1__0_), .B(ab_0__1_), .Z(PRODUCT[1]) );
  INV_X1 U109 ( .A(B[0]), .ZN(n141) );
  INV_X1 U110 ( .A(A[0]), .ZN(n125) );
  INV_X1 U111 ( .A(B[1]), .ZN(n140) );
  INV_X1 U112 ( .A(A[1]), .ZN(n124) );
  INV_X1 U113 ( .A(B[2]), .ZN(n139) );
  INV_X1 U114 ( .A(A[2]), .ZN(n123) );
  INV_X1 U115 ( .A(B[3]), .ZN(n138) );
  INV_X1 U116 ( .A(A[3]), .ZN(n122) );
  INV_X1 U117 ( .A(B[4]), .ZN(n137) );
  INV_X1 U118 ( .A(A[4]), .ZN(n121) );
  INV_X1 U119 ( .A(B[5]), .ZN(n136) );
  INV_X1 U120 ( .A(A[5]), .ZN(n120) );
  INV_X1 U121 ( .A(B[6]), .ZN(n135) );
  INV_X1 U122 ( .A(A[6]), .ZN(n119) );
  INV_X1 U123 ( .A(B[7]), .ZN(n134) );
  INV_X1 U124 ( .A(A[7]), .ZN(n118) );
  INV_X1 U125 ( .A(B[8]), .ZN(n133) );
  INV_X1 U126 ( .A(A[8]), .ZN(n117) );
  INV_X1 U127 ( .A(B[9]), .ZN(n132) );
  INV_X1 U128 ( .A(A[9]), .ZN(n116) );
  INV_X1 U129 ( .A(B[15]), .ZN(n126) );
  INV_X1 U130 ( .A(B[10]), .ZN(n131) );
  INV_X1 U131 ( .A(A[10]), .ZN(n115) );
  INV_X1 U132 ( .A(B[11]), .ZN(n130) );
  INV_X1 U133 ( .A(A[11]), .ZN(n114) );
  INV_X1 U134 ( .A(B[12]), .ZN(n129) );
  INV_X1 U135 ( .A(A[12]), .ZN(n113) );
  INV_X1 U136 ( .A(B[13]), .ZN(n128) );
  INV_X1 U137 ( .A(A[13]), .ZN(n112) );
  INV_X1 U138 ( .A(B[14]), .ZN(n127) );
  INV_X1 U139 ( .A(A[14]), .ZN(n111) );
  INV_X1 U140 ( .A(A[15]), .ZN(n110) );
  NOR2_X1 U141 ( .A1(n41), .A2(n56), .ZN(ab_9__6_) );
  NOR2_X1 U142 ( .A1(n41), .A2(n62), .ZN(ab_9__5_) );
  NOR2_X1 U143 ( .A1(n41), .A2(n68), .ZN(ab_9__4_) );
  NOR2_X1 U144 ( .A1(n41), .A2(n76), .ZN(ab_9__3_) );
  NOR2_X1 U145 ( .A1(n116), .A2(n84), .ZN(ab_9__2_) );
  NOR2_X1 U146 ( .A1(n116), .A2(n91), .ZN(ab_9__1_) );
  NOR2_X1 U147 ( .A1(n116), .A2(n100), .ZN(ab_9__0_) );
  NOR2_X1 U148 ( .A1(n49), .A2(n46), .ZN(ab_8__7_) );
  NOR2_X1 U149 ( .A1(n55), .A2(n46), .ZN(ab_8__6_) );
  NOR2_X1 U150 ( .A1(n61), .A2(n46), .ZN(ab_8__5_) );
  NOR2_X1 U151 ( .A1(n67), .A2(n46), .ZN(ab_8__4_) );
  NOR2_X1 U152 ( .A1(n75), .A2(n47), .ZN(ab_8__3_) );
  NOR2_X1 U153 ( .A1(n83), .A2(n47), .ZN(ab_8__2_) );
  NOR2_X1 U154 ( .A1(n93), .A2(n47), .ZN(ab_8__1_) );
  NOR2_X1 U155 ( .A1(n99), .A2(n47), .ZN(ab_8__0_) );
  NOR2_X1 U156 ( .A1(n43), .A2(n52), .ZN(ab_7__8_) );
  NOR2_X1 U157 ( .A1(n49), .A2(n52), .ZN(ab_7__7_) );
  NOR2_X1 U158 ( .A1(n55), .A2(n52), .ZN(ab_7__6_) );
  NOR2_X1 U159 ( .A1(n61), .A2(n53), .ZN(ab_7__5_) );
  NOR2_X1 U160 ( .A1(n67), .A2(n53), .ZN(ab_7__4_) );
  NOR2_X1 U161 ( .A1(n75), .A2(n53), .ZN(ab_7__3_) );
  NOR2_X1 U162 ( .A1(n83), .A2(n118), .ZN(ab_7__2_) );
  NOR2_X1 U163 ( .A1(n140), .A2(n53), .ZN(ab_7__1_) );
  NOR2_X1 U164 ( .A1(n99), .A2(n118), .ZN(ab_7__0_) );
  NOR2_X1 U165 ( .A1(n39), .A2(n58), .ZN(ab_6__9_) );
  NOR2_X1 U166 ( .A1(n43), .A2(n58), .ZN(ab_6__8_) );
  NOR2_X1 U167 ( .A1(n49), .A2(n58), .ZN(ab_6__7_) );
  NOR2_X1 U168 ( .A1(n55), .A2(n58), .ZN(ab_6__6_) );
  NOR2_X1 U169 ( .A1(n61), .A2(n59), .ZN(ab_6__5_) );
  NOR2_X1 U170 ( .A1(n67), .A2(n59), .ZN(ab_6__4_) );
  NOR2_X1 U171 ( .A1(n75), .A2(n59), .ZN(ab_6__3_) );
  NOR2_X1 U172 ( .A1(n83), .A2(n119), .ZN(ab_6__2_) );
  NOR2_X1 U173 ( .A1(n140), .A2(n59), .ZN(ab_6__1_) );
  NOR2_X1 U174 ( .A1(n99), .A2(n119), .ZN(ab_6__0_) );
  NOR2_X1 U175 ( .A1(n39), .A2(n64), .ZN(ab_5__9_) );
  NOR2_X1 U176 ( .A1(n43), .A2(n64), .ZN(ab_5__8_) );
  NOR2_X1 U177 ( .A1(n50), .A2(n64), .ZN(ab_5__7_) );
  NOR2_X1 U178 ( .A1(n56), .A2(n64), .ZN(ab_5__6_) );
  NOR2_X1 U179 ( .A1(n61), .A2(n65), .ZN(ab_5__5_) );
  NOR2_X1 U180 ( .A1(n67), .A2(n120), .ZN(ab_5__4_) );
  NOR2_X1 U181 ( .A1(n76), .A2(n65), .ZN(ab_5__3_) );
  NOR2_X1 U182 ( .A1(n83), .A2(n120), .ZN(ab_5__2_) );
  NOR2_X1 U183 ( .A1(n140), .A2(n65), .ZN(ab_5__1_) );
  NOR2_X1 U184 ( .A1(n35), .A2(n120), .ZN(ab_5__10_) );
  NOR2_X1 U185 ( .A1(n99), .A2(n65), .ZN(ab_5__0_) );
  NOR2_X1 U186 ( .A1(n39), .A2(n71), .ZN(ab_4__9_) );
  NOR2_X1 U187 ( .A1(n43), .A2(n71), .ZN(ab_4__8_) );
  NOR2_X1 U188 ( .A1(n134), .A2(n71), .ZN(ab_4__7_) );
  NOR2_X1 U189 ( .A1(n135), .A2(n71), .ZN(ab_4__6_) );
  NOR2_X1 U190 ( .A1(n62), .A2(n73), .ZN(ab_4__5_) );
  NOR2_X1 U191 ( .A1(n69), .A2(n72), .ZN(ab_4__4_) );
  NOR2_X1 U192 ( .A1(n138), .A2(n73), .ZN(ab_4__3_) );
  NOR2_X1 U193 ( .A1(n84), .A2(n72), .ZN(ab_4__2_) );
  NOR2_X1 U194 ( .A1(n92), .A2(n73), .ZN(ab_4__1_) );
  NOR2_X1 U195 ( .A1(n31), .A2(n72), .ZN(ab_4__11_) );
  NOR2_X1 U196 ( .A1(n35), .A2(n73), .ZN(ab_4__10_) );
  NOR2_X1 U197 ( .A1(n102), .A2(n72), .ZN(ab_4__0_) );
  NOR2_X1 U198 ( .A1(n39), .A2(n79), .ZN(ab_3__9_) );
  NOR2_X1 U199 ( .A1(n44), .A2(n79), .ZN(ab_3__8_) );
  NOR2_X1 U200 ( .A1(n50), .A2(n79), .ZN(ab_3__7_) );
  NOR2_X1 U201 ( .A1(n56), .A2(n79), .ZN(ab_3__6_) );
  NOR2_X1 U202 ( .A1(n136), .A2(n81), .ZN(ab_3__5_) );
  NOR2_X1 U203 ( .A1(n68), .A2(n80), .ZN(ab_3__4_) );
  NOR2_X1 U204 ( .A1(n77), .A2(n122), .ZN(ab_3__3_) );
  NOR2_X1 U205 ( .A1(n85), .A2(n81), .ZN(ab_3__2_) );
  NOR2_X1 U206 ( .A1(n91), .A2(n80), .ZN(ab_3__1_) );
  NOR2_X1 U207 ( .A1(n129), .A2(n81), .ZN(ab_3__12_) );
  NOR2_X1 U208 ( .A1(n31), .A2(n81), .ZN(ab_3__11_) );
  NOR2_X1 U209 ( .A1(n35), .A2(n80), .ZN(ab_3__10_) );
  NOR2_X1 U210 ( .A1(n101), .A2(n122), .ZN(ab_3__0_) );
  NOR2_X1 U211 ( .A1(n132), .A2(n87), .ZN(ab_2__9_) );
  NOR2_X1 U212 ( .A1(n44), .A2(n87), .ZN(ab_2__8_) );
  NOR2_X1 U213 ( .A1(n134), .A2(n87), .ZN(ab_2__7_) );
  NOR2_X1 U214 ( .A1(n135), .A2(n87), .ZN(ab_2__6_) );
  NOR2_X1 U215 ( .A1(n62), .A2(n88), .ZN(ab_2__5_) );
  NOR2_X1 U216 ( .A1(n69), .A2(n89), .ZN(ab_2__4_) );
  NOR2_X1 U217 ( .A1(n76), .A2(n89), .ZN(ab_2__3_) );
  NOR2_X1 U218 ( .A1(n139), .A2(n88), .ZN(ab_2__2_) );
  NOR2_X1 U219 ( .A1(n93), .A2(n123), .ZN(ab_2__1_) );
  NOR2_X1 U220 ( .A1(n128), .A2(n89), .ZN(ab_2__13_) );
  NOR2_X1 U221 ( .A1(n129), .A2(n88), .ZN(ab_2__12_) );
  NOR2_X1 U222 ( .A1(n31), .A2(n123), .ZN(ab_2__11_) );
  NOR2_X1 U223 ( .A1(n131), .A2(n89), .ZN(ab_2__10_) );
  NOR2_X1 U224 ( .A1(n100), .A2(n88), .ZN(ab_2__0_) );
  NOR2_X1 U225 ( .A1(n132), .A2(n95), .ZN(ab_1__9_) );
  NOR2_X1 U226 ( .A1(n44), .A2(n95), .ZN(ab_1__8_) );
  NOR2_X1 U227 ( .A1(n50), .A2(n95), .ZN(ab_1__7_) );
  NOR2_X1 U228 ( .A1(n56), .A2(n95), .ZN(ab_1__6_) );
  NOR2_X1 U229 ( .A1(n136), .A2(n96), .ZN(ab_1__5_) );
  NOR2_X1 U230 ( .A1(n68), .A2(n124), .ZN(ab_1__4_) );
  NOR2_X1 U231 ( .A1(n138), .A2(n97), .ZN(ab_1__3_) );
  NOR2_X1 U232 ( .A1(n84), .A2(n96), .ZN(ab_1__2_) );
  NOR2_X1 U233 ( .A1(n92), .A2(n124), .ZN(ab_1__1_) );
  NOR2_X1 U234 ( .A1(n127), .A2(n97), .ZN(ab_1__14_) );
  NOR2_X1 U235 ( .A1(n128), .A2(n96), .ZN(ab_1__13_) );
  NOR2_X1 U236 ( .A1(n129), .A2(n97), .ZN(ab_1__12_) );
  NOR2_X1 U237 ( .A1(n130), .A2(n97), .ZN(ab_1__11_) );
  NOR2_X1 U238 ( .A1(n131), .A2(n96), .ZN(ab_1__10_) );
  NOR2_X1 U239 ( .A1(n102), .A2(n124), .ZN(ab_1__0_) );
  NOR2_X1 U240 ( .A1(n101), .A2(n110), .ZN(ab_15__0_) );
  NOR2_X1 U241 ( .A1(n91), .A2(n111), .ZN(ab_14__1_) );
  NOR2_X1 U242 ( .A1(n100), .A2(n111), .ZN(ab_14__0_) );
  NOR2_X1 U243 ( .A1(n85), .A2(n112), .ZN(ab_13__2_) );
  NOR2_X1 U244 ( .A1(n93), .A2(n112), .ZN(ab_13__1_) );
  NOR2_X1 U245 ( .A1(n102), .A2(n112), .ZN(ab_13__0_) );
  NOR2_X1 U246 ( .A1(n77), .A2(n113), .ZN(ab_12__3_) );
  NOR2_X1 U247 ( .A1(n139), .A2(n113), .ZN(ab_12__2_) );
  NOR2_X1 U248 ( .A1(n92), .A2(n113), .ZN(ab_12__1_) );
  NOR2_X1 U249 ( .A1(n101), .A2(n113), .ZN(ab_12__0_) );
  NOR2_X1 U250 ( .A1(n69), .A2(n33), .ZN(ab_11__4_) );
  NOR2_X1 U251 ( .A1(n76), .A2(n33), .ZN(ab_11__3_) );
  NOR2_X1 U252 ( .A1(n84), .A2(n33), .ZN(ab_11__2_) );
  NOR2_X1 U253 ( .A1(n91), .A2(n114), .ZN(ab_11__1_) );
  NOR2_X1 U254 ( .A1(n100), .A2(n114), .ZN(ab_11__0_) );
  NOR2_X1 U255 ( .A1(n62), .A2(n37), .ZN(ab_10__5_) );
  NOR2_X1 U256 ( .A1(n68), .A2(n37), .ZN(ab_10__4_) );
  NOR2_X1 U257 ( .A1(n138), .A2(n37), .ZN(ab_10__3_) );
  NOR2_X1 U258 ( .A1(n85), .A2(n115), .ZN(ab_10__2_) );
  NOR2_X1 U259 ( .A1(n93), .A2(n37), .ZN(ab_10__1_) );
  NOR2_X1 U260 ( .A1(n102), .A2(n115), .ZN(ab_10__0_) );
  NOR2_X1 U261 ( .A1(n132), .A2(n104), .ZN(ab_0__9_) );
  NOR2_X1 U262 ( .A1(n44), .A2(n104), .ZN(ab_0__8_) );
  NOR2_X1 U263 ( .A1(n134), .A2(n104), .ZN(ab_0__7_) );
  NOR2_X1 U264 ( .A1(n135), .A2(n104), .ZN(ab_0__6_) );
  NOR2_X1 U265 ( .A1(n136), .A2(n107), .ZN(ab_0__5_) );
  NOR2_X1 U266 ( .A1(n69), .A2(n106), .ZN(ab_0__4_) );
  NOR2_X1 U267 ( .A1(n77), .A2(n105), .ZN(ab_0__3_) );
  NOR2_X1 U268 ( .A1(n139), .A2(n107), .ZN(ab_0__2_) );
  NOR2_X1 U269 ( .A1(n92), .A2(n106), .ZN(ab_0__1_) );
  NOR2_X1 U270 ( .A1(n126), .A2(n105), .ZN(ab_0__15_) );
  NOR2_X1 U271 ( .A1(n127), .A2(n107), .ZN(ab_0__14_) );
  NOR2_X1 U272 ( .A1(n128), .A2(n106), .ZN(ab_0__13_) );
  NOR2_X1 U273 ( .A1(n129), .A2(n105), .ZN(ab_0__12_) );
  NOR2_X1 U274 ( .A1(n130), .A2(n107), .ZN(ab_0__11_) );
  NOR2_X1 U275 ( .A1(n131), .A2(n106), .ZN(ab_0__10_) );
  NOR2_X1 U276 ( .A1(n101), .A2(n105), .ZN(PRODUCT[0]) );
endmodule


module sequential_alu ( clk, rst, op1, op2, operation, result );
  input [15:0] op1;
  input [15:0] op2;
  input [1:0] operation;
  output [15:0] result;
  input clk, rst;
  wire   N14, N15, N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27,
         N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41,
         N42, N43, N44, N45, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71,
         N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85,
         N86, N87, N88, N89, N90, N91, N92, N93, n240, n250, n260, n270, n280,
         n290, n300, n310, n320, n330, n340, n350, n360, n370, n380, n390,
         n400, n410, n420, n430, n440, n450, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n620, n630, n640, n650,
         n660, n670, n680, n690, n700, n710, n720, n730, n740, n750, n760,
         n770, n780, n790, n800, n810, n820, n830, n840, n850, n860, n870,
         n880, n890, n900, n910, n920, n930, n94, n95, n96, n97, n98, n99,
         n100, SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4,
         SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6,
         SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8,
         SYNOPSYS_UNCONNECTED_9, SYNOPSYS_UNCONNECTED_10,
         SYNOPSYS_UNCONNECTED_11, SYNOPSYS_UNCONNECTED_12,
         SYNOPSYS_UNCONNECTED_13, SYNOPSYS_UNCONNECTED_14,
         SYNOPSYS_UNCONNECTED_15, SYNOPSYS_UNCONNECTED_16;

  DFFR_X1 accumulator_reg_15_ ( .D(N93), .CK(clk), .RN(n800), .Q(result[15])
         );
  DFFR_X1 accumulator_reg_14_ ( .D(N92), .CK(clk), .RN(n800), .Q(result[14])
         );
  DFFR_X1 accumulator_reg_13_ ( .D(N91), .CK(clk), .RN(n800), .Q(result[13])
         );
  DFFR_X1 accumulator_reg_12_ ( .D(N90), .CK(clk), .RN(n800), .Q(result[12])
         );
  DFFR_X1 accumulator_reg_11_ ( .D(N89), .CK(clk), .RN(n830), .Q(result[11])
         );
  DFFR_X1 accumulator_reg_10_ ( .D(N88), .CK(clk), .RN(n820), .Q(result[10])
         );
  DFFR_X1 accumulator_reg_9_ ( .D(N87), .CK(clk), .RN(n810), .Q(result[9]) );
  DFFR_X1 accumulator_reg_8_ ( .D(N86), .CK(clk), .RN(n830), .Q(result[8]) );
  DFFR_X1 accumulator_reg_7_ ( .D(N85), .CK(clk), .RN(n820), .Q(result[7]) );
  DFFR_X1 accumulator_reg_6_ ( .D(N84), .CK(clk), .RN(n810), .Q(result[6]) );
  DFFR_X1 accumulator_reg_5_ ( .D(N83), .CK(clk), .RN(n830), .Q(result[5]) );
  DFFR_X1 accumulator_reg_4_ ( .D(N82), .CK(clk), .RN(n820), .Q(result[4]) );
  DFFR_X1 accumulator_reg_3_ ( .D(N81), .CK(clk), .RN(n810), .Q(result[3]) );
  DFFR_X1 accumulator_reg_2_ ( .D(N80), .CK(clk), .RN(n830), .Q(result[2]) );
  DFFR_X1 accumulator_reg_1_ ( .D(N79), .CK(clk), .RN(n820), .Q(result[1]) );
  DFFR_X1 accumulator_reg_0_ ( .D(N78), .CK(clk), .RN(n810), .Q(result[0]) );
  sequential_alu_DW01_sub_0 sub_20 ( .A({op1[15:1], n630}), .B({op2[15:1], n61}), .CI(1'b0), .DIFF({N45, N44, N43, N42, N41, N40, N39, N38, N37, N36, N35, 
        N34, N33, N32, N31, N30}) );
  sequential_alu_DW01_add_0 add_18 ( .A(op1), .B({op2[15:1], n61}), .CI(1'b0), 
        .SUM({N29, N28, N27, N26, N25, N24, N23, N22, N21, N20, N19, N18, N17, 
        N16, N15, N14}) );
  sequential_alu_DW02_mult_0 mult_24 ( .A({op1[15:1], n630}), .B(op2), .TC(
        1'b0), .PRODUCT({SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2, 
        SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5, 
        SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8, 
        SYNOPSYS_UNCONNECTED_9, SYNOPSYS_UNCONNECTED_10, 
        SYNOPSYS_UNCONNECTED_11, SYNOPSYS_UNCONNECTED_12, 
        SYNOPSYS_UNCONNECTED_13, SYNOPSYS_UNCONNECTED_14, 
        SYNOPSYS_UNCONNECTED_15, SYNOPSYS_UNCONNECTED_16, N77, N76, N75, N74, 
        N73, N72, N71, N70, N69, N68, N67, N66, N65, N64, N63, N62}) );
  INV_X1 U75 ( .A(op2[0]), .ZN(n60) );
  INV_X1 U76 ( .A(n60), .ZN(n61) );
  INV_X1 U77 ( .A(op1[0]), .ZN(n620) );
  INV_X1 U78 ( .A(n620), .ZN(n630) );
  AND2_X1 U79 ( .A1(operation[1]), .A2(n100), .ZN(n260) );
  INV_X1 U80 ( .A(n260), .ZN(n640) );
  INV_X1 U81 ( .A(n260), .ZN(n650) );
  INV_X1 U82 ( .A(n260), .ZN(n660) );
  INV_X1 U83 ( .A(n260), .ZN(n670) );
  AND2_X1 U84 ( .A1(operation[1]), .A2(operation[0]), .ZN(n240) );
  INV_X1 U85 ( .A(n240), .ZN(n680) );
  INV_X1 U86 ( .A(n240), .ZN(n690) );
  INV_X1 U87 ( .A(n240), .ZN(n700) );
  INV_X1 U88 ( .A(n240), .ZN(n710) );
  OR2_X1 U89 ( .A1(operation[0]), .A2(operation[1]), .ZN(n290) );
  INV_X1 U90 ( .A(n290), .ZN(n720) );
  INV_X1 U91 ( .A(n290), .ZN(n730) );
  INV_X1 U92 ( .A(n290), .ZN(n740) );
  INV_X1 U93 ( .A(n290), .ZN(n750) );
  OR2_X1 U94 ( .A1(n100), .A2(operation[1]), .ZN(n280) );
  INV_X1 U95 ( .A(n280), .ZN(n760) );
  INV_X1 U96 ( .A(n280), .ZN(n770) );
  INV_X1 U97 ( .A(n280), .ZN(n780) );
  INV_X1 U98 ( .A(n280), .ZN(n790) );
  INV_X1 U99 ( .A(rst), .ZN(n800) );
  INV_X1 U100 ( .A(rst), .ZN(n810) );
  INV_X1 U101 ( .A(rst), .ZN(n820) );
  INV_X1 U102 ( .A(rst), .ZN(n830) );
  OAI221_X1 U103 ( .B1(n680), .B2(n99), .C1(n58), .C2(n640), .A(n59), .ZN(N78)
         );
  INV_X1 U104 ( .A(N62), .ZN(n99) );
  XNOR2_X1 U105 ( .A(op2[0]), .B(op1[0]), .ZN(n58) );
  AOI22_X1 U106 ( .A1(N30), .A2(n760), .B1(N14), .B2(n720), .ZN(n59) );
  OAI221_X1 U107 ( .B1(n680), .B2(n98), .C1(n56), .C2(n640), .A(n57), .ZN(N79)
         );
  INV_X1 U108 ( .A(N63), .ZN(n98) );
  XNOR2_X1 U109 ( .A(op2[1]), .B(op1[1]), .ZN(n56) );
  AOI22_X1 U110 ( .A1(N31), .A2(n760), .B1(N15), .B2(n720), .ZN(n57) );
  OAI221_X1 U111 ( .B1(n680), .B2(n97), .C1(n54), .C2(n640), .A(n55), .ZN(N80)
         );
  INV_X1 U112 ( .A(N64), .ZN(n97) );
  XNOR2_X1 U113 ( .A(op2[2]), .B(op1[2]), .ZN(n54) );
  AOI22_X1 U114 ( .A1(N32), .A2(n760), .B1(N16), .B2(n720), .ZN(n55) );
  OAI221_X1 U115 ( .B1(n680), .B2(n96), .C1(n52), .C2(n640), .A(n53), .ZN(N81)
         );
  INV_X1 U116 ( .A(N65), .ZN(n96) );
  XNOR2_X1 U117 ( .A(op2[3]), .B(op1[3]), .ZN(n52) );
  AOI22_X1 U118 ( .A1(N33), .A2(n760), .B1(N17), .B2(n720), .ZN(n53) );
  OAI221_X1 U119 ( .B1(n710), .B2(n95), .C1(n50), .C2(n670), .A(n51), .ZN(N82)
         );
  INV_X1 U120 ( .A(N66), .ZN(n95) );
  XNOR2_X1 U121 ( .A(op2[4]), .B(op1[4]), .ZN(n50) );
  AOI22_X1 U122 ( .A1(N34), .A2(n790), .B1(N18), .B2(n750), .ZN(n51) );
  OAI221_X1 U123 ( .B1(n700), .B2(n94), .C1(n48), .C2(n660), .A(n49), .ZN(N83)
         );
  INV_X1 U124 ( .A(N67), .ZN(n94) );
  XNOR2_X1 U125 ( .A(op2[5]), .B(op1[5]), .ZN(n48) );
  AOI22_X1 U126 ( .A1(N35), .A2(n780), .B1(N19), .B2(n740), .ZN(n49) );
  OAI221_X1 U127 ( .B1(n690), .B2(n930), .C1(n46), .C2(n650), .A(n47), .ZN(N84) );
  INV_X1 U128 ( .A(N68), .ZN(n930) );
  XNOR2_X1 U129 ( .A(op2[6]), .B(op1[6]), .ZN(n46) );
  AOI22_X1 U130 ( .A1(N36), .A2(n770), .B1(N20), .B2(n730), .ZN(n47) );
  OAI221_X1 U131 ( .B1(n710), .B2(n920), .C1(n440), .C2(n670), .A(n450), .ZN(
        N85) );
  INV_X1 U132 ( .A(N69), .ZN(n920) );
  XNOR2_X1 U133 ( .A(op2[7]), .B(op1[7]), .ZN(n440) );
  AOI22_X1 U134 ( .A1(N37), .A2(n790), .B1(N21), .B2(n750), .ZN(n450) );
  OAI221_X1 U135 ( .B1(n700), .B2(n910), .C1(n420), .C2(n660), .A(n430), .ZN(
        N86) );
  INV_X1 U136 ( .A(N70), .ZN(n910) );
  XNOR2_X1 U137 ( .A(op2[8]), .B(op1[8]), .ZN(n420) );
  AOI22_X1 U138 ( .A1(N38), .A2(n780), .B1(N22), .B2(n740), .ZN(n430) );
  OAI221_X1 U139 ( .B1(n690), .B2(n900), .C1(n400), .C2(n650), .A(n410), .ZN(
        N87) );
  INV_X1 U140 ( .A(N71), .ZN(n900) );
  XNOR2_X1 U141 ( .A(op2[9]), .B(op1[9]), .ZN(n400) );
  AOI22_X1 U142 ( .A1(N39), .A2(n770), .B1(N23), .B2(n730), .ZN(n410) );
  OAI221_X1 U143 ( .B1(n710), .B2(n890), .C1(n380), .C2(n670), .A(n390), .ZN(
        N88) );
  INV_X1 U144 ( .A(N72), .ZN(n890) );
  XNOR2_X1 U145 ( .A(op2[10]), .B(op1[10]), .ZN(n380) );
  AOI22_X1 U146 ( .A1(N40), .A2(n790), .B1(N24), .B2(n750), .ZN(n390) );
  OAI221_X1 U147 ( .B1(n700), .B2(n880), .C1(n360), .C2(n660), .A(n370), .ZN(
        N89) );
  INV_X1 U148 ( .A(N73), .ZN(n880) );
  XNOR2_X1 U149 ( .A(op2[11]), .B(op1[11]), .ZN(n360) );
  AOI22_X1 U150 ( .A1(N41), .A2(n780), .B1(N25), .B2(n740), .ZN(n370) );
  OAI221_X1 U151 ( .B1(n690), .B2(n870), .C1(n340), .C2(n650), .A(n350), .ZN(
        N90) );
  INV_X1 U152 ( .A(N74), .ZN(n870) );
  XNOR2_X1 U153 ( .A(op2[12]), .B(op1[12]), .ZN(n340) );
  AOI22_X1 U154 ( .A1(N42), .A2(n770), .B1(N26), .B2(n730), .ZN(n350) );
  OAI221_X1 U155 ( .B1(n710), .B2(n860), .C1(n320), .C2(n670), .A(n330), .ZN(
        N91) );
  INV_X1 U156 ( .A(N75), .ZN(n860) );
  XNOR2_X1 U157 ( .A(op2[13]), .B(op1[13]), .ZN(n320) );
  AOI22_X1 U158 ( .A1(N43), .A2(n790), .B1(N27), .B2(n750), .ZN(n330) );
  OAI221_X1 U159 ( .B1(n700), .B2(n850), .C1(n300), .C2(n660), .A(n310), .ZN(
        N92) );
  INV_X1 U160 ( .A(N76), .ZN(n850) );
  XNOR2_X1 U161 ( .A(op2[14]), .B(op1[14]), .ZN(n300) );
  AOI22_X1 U162 ( .A1(N44), .A2(n780), .B1(N28), .B2(n740), .ZN(n310) );
  OAI221_X1 U163 ( .B1(n690), .B2(n840), .C1(n250), .C2(n650), .A(n270), .ZN(
        N93) );
  INV_X1 U164 ( .A(N77), .ZN(n840) );
  XNOR2_X1 U165 ( .A(op2[15]), .B(op1[15]), .ZN(n250) );
  AOI22_X1 U166 ( .A1(N45), .A2(n770), .B1(N29), .B2(n730), .ZN(n270) );
  INV_X1 U167 ( .A(operation[0]), .ZN(n100) );
endmodule

