module nand_1b(output C, input A, B);
    wire Cd;
    and(Cd, A, B);
    not(C, Cd);
endmodule
