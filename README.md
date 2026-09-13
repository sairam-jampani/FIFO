# Synchronous FIFO Design & Verification

<p align="left">
  <img src="https://img.shields.io/badge/Design-Verilog-blue.svg" alt="Design Language">
  <img src="https://img.shields.io/badge/Verification-SystemVerilog-blueviolet.svg" alt="Verification Language">
  <img src="https://img.shields.io/badge/Tool-Xilinx%20Vivado%202020.1-orange.svg" alt="Tool">
  <img src="https://img.shields.io/badge/Design%20Flow-Front--End-brightgreen.svg" alt="Flow">
</p>

---

## 📖 Project Description
This project implements and verifies a Synchronous First-In-First-Out (FIFO) memory buffer. The core hardware module is designed in **Verilog HDL**, while the robust verification environment is built using **SystemVerilog**. FIFOs are critical components in digital systems, used for data buffering, flow control, and safely crossing clock domains. This repository focuses heavily on the verification aspect, ensuring the FIFO behaves correctly under various corner cases like memory overflow (writing when full) and underflow (reading when empty).

---

## ⚙️ Target Hardware & Device Specifications

* **Target FPGA Device:** `xc7a100tcsg324-1`

| Component | Nomenclature | Technical Meaning |
| :--- | :--- | :--- |
| **`xc7a`** | Family Architecture | **Xilinx Artix-7 Series** (Optimized for low power and high performance). |
| **`100t`** | Logic Capacity | **100K Logic Cells** (~101,440 logic cells). |
| **`csg324`** | Package Type | **Chip Scale BGA (CSG) Package with 324 Pins**. |
| **`-1`** | Speed Grade | **Speed Grade -1** (Standard performance grade). |

---

## 🚀 Features
The FIFO design includes circular pointer logic and essential status flags to manage data flow:

| Signal / Flag | Functionality |
| :--- | :--- |
| `wr_en` | **Write Enable:** Stores `data_in` at the write pointer location if the FIFO is not full. |
| `rd_en` | **Read Enable:** Retrieves data to `data_out` from the read pointer location if not empty. |
| `full` | Asserts when the memory buffer has reached maximum capacity. Prevents data overwrite. |
| `empty` | Asserts when the memory buffer contains no valid data. Prevents invalid reads. |
| `wr_ptr` / `rd_ptr` | Internal circular counters that track the current memory address for operations. |

---

## 📂 Project Files

* **`fifo.v`** → Synchronous FIFO Design Module (Verilog)
* **`fifo_tb.sv`** → Comprehensive Testbench for Verification (SystemVerilog)

---

## 🛠️ Tools Used
* **Verilog HDL** (Design)
* **SystemVerilog** (Verification)
* **Xilinx Vivado 2020.1**
* **Behavioral Simulation** (Vivado XSim)

---

## 🔄 Design & Verification Flow
1. **Design Code (RTL):** Development of the memory array, pointer logic, and flag evaluation conditions using Verilog.
2. **Testbench Code:** Creation of a robust verification environment in SystemVerilog that injects constrained and edge-case stimuli.
3. **RTL Synthesis & Schematic:** Compiling the RTL code in Xilinx Vivado to generate a hardware schematic showing memory block allocation.
4. **Simulation Waveform:** Executing the testbench to visualize memory writes, reads, and flag transitions over time.

---

## 🧪 Simulation Results

The testbench systematically applies scenarios to verify pointer arithmetic and flag boundaries:

| Test Scenario | Expected Result | Verification Status |
| :--- | :--- | :--- |
| **Normal Write** | Data stored, `empty` flag deasserts (0). | Pass |
| **Normal Read** | Data retrieved in FIFO order, `full` flag deasserts (0). | Pass |
| **Write on Full (Overflow)** | Write ignored, `wr_ptr` does not increment, data protected. | Pass |
| **Read on Empty (Underflow)** | Read ignored, `rd_ptr` does not increment, `data_out` holds. | Pass |
| **Simultaneous Read/Write** | Both operations execute if not fully empty/full. | Pass |

**All corner cases were successfully verified through behavioral simulation.**

### RTL Schematic
<img width="1920" height="1080" alt="Schematic" src="https://github.com/user-attachments/assets/aca42c3b-7c8b-4531-857c-47f6f8323733" />

### Waveform Analysis
<img width="1920" height="1080" alt="Simulation" src="https://github.com/user-attachments/assets/024f5e21-425d-4433-9015-005d2aea2715" />

**Understanding the Waveform:**
The simulation waveform visually confirms the FIFO's memory management and state flags synchronized to the clock. 
* **`clk`:** The global clock driving the synchronous operations.
* **`wr_en` & `rd_en`:** Control signals dictating memory access.
* **`full` & `empty`:** Status flags preventing data corruption.

*Example:* As shown in the simulation, when the FIFO is subjected to consecutive writes without any reads, the internal `wr_ptr` increments until it catches up to the `rd_ptr`. At this exact clock cycle, the `full` flag transitions to `1`, and any subsequent `wr_en` commands are safely ignored by the hardware.

### TCL Console Output
<img width="1560" height="358" alt="TCLconsole" src="https://github.com/user-attachments/assets/758bf98d-d3d9-4f96-af22-5b093907b90f" />

**Understanding the TCL Console:**
The Vivado TCL console captures the real-time execution logs of the SystemVerilog testbench during simulation.
* **Verification Logs:** Displays the output of `$display` or `$monitor` statements used in the testbench to track specific data transactions.
* **Automated Status:** Provides a clear, text-based validation of edge cases (like overflow and underflow) without needing to manually count clock cycles in the waveform.

---

## 🎯 Learning Objectives
* Implementing circular buffer pointer logic in Verilog HDL.
* Designing reliable state flags (`full`, `empty`) based on pointer comparison.
* Developing robust verification testbenches using SystemVerilog focused on corner-case testing (overflow/underflow prevention).
* Generating, navigating, and analyzing RTL schematics and timing waveforms using the Xilinx Vivado Design Suite.

---

## 📫 Connect with Me
- **GitHub:** [github.com/sairam-jampani](https://github.com/sairam-jampani)
- **LinkedIn:** [linkedin.com/in/sai-ram-jampani04](https://www.linkedin.com/in/sai-ram-jampani04/)

<br>

⭐ *If you found this project useful, consider giving it a star.*
