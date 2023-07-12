module not_1b_test;
reg A;
wire C;
not_1b n0 (C, A);

initial begin
    A = 0;
 #1 A = 0;
 #1 A = 1;
end

initial begin
    $monitor ("%t | A = %d | C = %d", $time, A, C);
    $dumpfile("not_1b.vcd");
    $dumpvars();
end
endmodule 
