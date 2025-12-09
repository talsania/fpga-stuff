# FPGA Designs

Covering digital logic design and control concepts using Verilog HDL on FPGA hardware.

**Board used:** [Nexys A7](https://digilent.com/reference/programmable-logic/nexys-a7/reference-manual) (Artix-7 100T)  
**Language:** Verilog HDL  
**Tool:** Vivado Design Suite

## Projects

### 01 - Blinking LED

Implementation of a simple LED blinker operating at ~3Hz using a clock divider chain.

**Architecture:**
```
100MHz CLK → [DFF Chain: 24 stages] → clkdiv[23] → LED (toggle at ~1/3 sec)
                  ↑
            feedback: ~clkdiv
```

**Sim screenshot:**  
<img width="1402" height="672" alt="Screenshot 2025-12-06 132235" src="https://github.com/user-attachments/assets/16dc0720-e782-45c2-a35b-10acff7126ab" />

### 02 - Button Toggle with Debounce

Push-button controlled LED toggle using a finite state machine and parametric timer for debouncing. It eliminates mechanical switch bounce by requiring stable input for 20ms before state transition.

**State Diagram:**
```
s0 (LED OFF) → s1 (waiting) → s2 (LED ON) → s3 (waiting) → s0
     ↑              ↓              ↑              ↓           ↑
   timer      button held    timer done    button held  timer done
```

**Sim screenshot:**  
<img width="2390" height="394" alt="Screenshot 2025-12-06 220613" src="https://github.com/user-attachments/assets/1f5158d5-ee39-4591-ab83-1d2e72d07b99" />

### 03 - 7-Segment Display using Time-Multiplexing

Hexadecimal counter (0-F) displayed on a single 7-segment digit using switch inputs using combinational logic for segment encoding and time-division multiplexing for multi-digit scanning.

**Encoding Example:**
```
Input: 4'b0000 → Output: 8'b11000000 (segments A-F on, G off = "0")
Input: 4'b1111 → Output: 8'b10001110 (segments A,E,F,G on = "f")
```

**0111 -> 7 demo:**
![PXL_20251209_153947069 MP](https://github.com/user-attachments/assets/509f1ec5-7064-4fe5-aac9-09e8cc4c6426)

## Resources

- [Aleksandar Haber](https://www.aleksandarhaber.com/)
- [FPGA4Student](https://www.fpga4student.com/)
- [Nandland](https://www.nandland.com/)
