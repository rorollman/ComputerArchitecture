This folder contains the verilog code, testbench, and print out of the gtkwave for the 4 bit full adder. There are 2 implementations of this:
* 4 bit Full Adder
* 4 1 bit Adders

### Steps to compile in iverilog
```
iverilog -o anyName test_file.v og_file.v
vvp anyName
```
This will produce a vcd file. To run gtkwave on the vcd file, use the following command:
```
gtkwave file.vcd
```
Where "file" is the name of your vcd file.

### Steps to view gtkwave
Once you run the above command, it will bring up the gtkwave application.
![Screenshot 2023-07-12 at 10 15 07 AM](https://github.com/rorollman/ComputerArchitecture/assets/81531492/a5b23dd7-a426-4719-a138-1b57afe43423)
Select the file name at the top left, then the variable under it.
![Screenshot 2023-07-12 at 10 15 13 AM](https://github.com/rorollman/ComputerArchitecture/assets/81531492/e2ce2eae-91d4-4396-b6b4-54ab6caeada3)
In the bottom left, select the wire variables. Once these are selected, you will see the wave display.
![Screenshot 2023-07-12 at 10 15 22 AM](https://github.com/rorollman/ComputerArchitecture/assets/81531492/708a58bb-0039-4e36-bb97-714919ab492f)
