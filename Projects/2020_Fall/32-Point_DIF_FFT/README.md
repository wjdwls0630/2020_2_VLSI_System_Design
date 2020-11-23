<h1 align="center"> 32-Point_DIF_FFT </h1>

---
In DSP, the FFT is one of the most fundamental and essential systems. The Cooley-Tukey algorithm enables decrease in the computational effort of the DFT. Also, hardware implementation of the FFT is important since the hardware FFT performs its task in parallel, so high throughput can be achieved, and of course, it is useful for high-speed real-time DSP. Here is a 32-Point-DIF-R2SDF-FFT implementation.
---
### Background
This is a course exercise of EE714, System Design in VLSI, at Kyung Hee University, lectured by Prof. Kim, Jinsang.

**All RTL verilog files are copyrighted by [jasonlin316](https://github.com/jasonlin316/A-Single-Path-Delay-32-Point-FFT-Processor)**

This exercise project's purpose is to understand the overall mathematical algorithm of the FFT and the behavior of the code. Finally, through a synthesis of the code, to experience the hardware design flow.

### Report [pdf]()

### 32-Point_DIF_FFT Schematic
<img src="./03_Physical_Synthesis/pictures/08_chip_finish.png" alt="32-Point_DIF_FFT" width="600" height="600"/>

#### Design Specification

|  Spec    |   Value  |
|----------|----------|
| Technology | S65nm |
| Operating Condition | SS 1.08V 125°C (Worst)|
| Main Clock | 185 MHz |
| Design Area |  93007.58 µm^2  |
| Power | 3.0130 mW |

### Reference
[1] S. M. Khare, M. Z. Alam, "FPGA Based Design and Simulation of 32-Point FFT Through Radix-2 DIT Algorithm", *IJERT*, vol. 5, issue. 2, Feb. 2016.

[2] Gao, Y. (2015). *Hardware Implementation of a 32-point Radix-2 FFT Architecture* [Master's thesis, Lund University]

[3] Slade, G. (2013). The Fast Fourier Transform in Hardware: A Tutorial Based on an FPGA Implementation

[4] jasonlin316 2019, A-Single-Path-Delay-32-Point-FFT-Processor, GitHub, viewed 20 Nov 2020, <https://github.com/jasonlin316/A-Single-Path-Delay-32-Point-FFT-Processor>
