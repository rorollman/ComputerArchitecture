module nor_1b_test;
reg A, B;
wire C;
nor_1b n0 (C, A, B);

initial begin
    A = 0; B = 0;
 #1 A = 0; B = 1;
 #1 A = 1; B = 0;
 #1 A = 1; B = 1;
end

initial begin
    $monitor ("%t | A = %d | B = %d | C = %d", $time, A, B, C);
    $dumpfile("nor_1b.vcd");
    $dumpvars();
end
endmodule 
