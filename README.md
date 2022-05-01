# Teaching myself Digital Hardware Design
Playing around with hardware description languages

## 2022-05-01
### Trying to get MAX II dev board to run
again programming didn't work. I will ask for Roberts Cyclone V Eval board, or I will just buy myself a Cyclone 5 GX Starter Kit or a DE board.

### implementing an i2c slave
I implemented the state machine, it currently switches to the next state after each clock.
I simulated it by "forcing" a clock unto i_clk. I should look into how clk needs to be implemented in fpga design, wheter I need PLL, etc.
also i should start writing my testbench

need to implement way to wait for half a bit, to sample in the middle of the bit.


## 2022-05-08
### 

## TODO
### Making a state machine
I want to learn how to implement state machines. I think almost every design I will want to make will need some kind of FSM.
As a first example I want to implement a i2c module, because I know the protocol and I think it will teach me a lot.

### Block Diagram for Processor from scratch
Eventually I want to design a simple processor, similar to the "Processor from Scratch" Assignment from MIT OCW.

### Utilizing RAM
The applications that interest me are handling high throughput data. For signal processing I think it might often be neccessary to store intermediate data in a flash.

