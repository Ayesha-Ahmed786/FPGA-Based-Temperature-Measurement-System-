# FPGA-Based Temperature Measurement System


## Project Overview

This project implements an **FPGA-based temperature sensing system** using the **Nexys A7** development board. The system reads temperature data from an **ADT7420 digital temperature sensor** via the **I²C protocol** and displays it on **onboard LEDs** and **7-segment displays**.  

The design demonstrates modular FPGA development, including:  
- Clock generation for I²C timing  
- I²C communication handling  
- Binary and human-readable temperature display  
- Efficient resource usage for real-time applications  

---

## Hardware Used

- **Nexys A7 FPGA Board** – main processing and display platform  
- **ADT7420 Temperature Sensor** – digital I²C sensor with 16-bit resolution, ±0.25 °C accuracy, and operating range -40 °C to +150 °C  

---

## Design Highlights

- **Top-Level Integration:** Coordinates all submodules and data flow between sensor, LEDs, and 7-segment displays  
- **Clock Generator:** Divides 100 MHz system clock to generate 200 kHz reference clock for I²C  
- **I²C Master Module:** Implements FSM for sending sensor addresses, reading data, and handling acknowledgments  
- **7-Segment Display Module:** Converts binary temperature data to BCD and drives displays with flicker-free multiplexing  
- **Simulation:** Testbench validates correct I²C communication and temperature data reception  

---

## Results

- Accurate room temperature measurement (~28 °C)  
- Responsive to temperature changes (e.g., 31 °C with slight heating)  
- Verified both on simulation and hardware  

---

## Resource Utilization

- Slice LUTs: 142 / 63,400 (0.22%)  
- Slice Registers: 74 / 126,800 (0.06%)  
- IOBs: 27 / 210 (12.86%)  
- No memory required  

---

## References

- [Mastering I²C on FPGA: Reading Temperature Data from ADT7420 in Verilog](https://medium.com/@roshik789/mastering-i%C2%B2c-on-fpga-reading-temperature-data-from-the-adt7420-in-verilog-45b01927d0e9)  
- [i2c_master_TB.v on GitHub](https://github.com/FPGADude/DigitalDesign/blob/main/FPGA%20Projects/NexysA7_Temp_Sensor_I2C/i2c_master_TB.v)
