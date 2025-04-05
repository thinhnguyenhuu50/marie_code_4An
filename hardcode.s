// Main program loop
Load 025      // Load value from address 025 into AC
Store 009     // Store AC value into address 009
Jump 005      // Jump to address 005
HEX 0000      // Empty space (not an instruction)
HEX 0000      // Empty space (not an instruction)
LoadI 009     // Indirect load from address pointed by 009
SkipCond 400  // Skip next instruction if AC == 0
Jump 00B      // Jump to address 00B
Jump 022      // Jump to address 022 (Halt)
HEX 0000      // Data storage (modified by program)
HEX 0000      // Empty space
DEC 17        // Constant value 17 (used in calculations)
Output        // Output AC value
Load 009      // Load value from address 009
Add 024       // Add value from address 024 to AC
Store 009     // Store result back to address 009
Jump 005      // Jump back to main loop
HEX 0000      // Empty space
SkipCond 000  // Skip next instruction if AC < 0
Jump 018      // Jump to address 018
Add 023       // Add value from address 023 to AC
SkipCond 000  // Skip next instruction if AC < 0
Jump 01D      // Jump to address 01D
Jump 014      // Jump back to address 014
Subt 023      // Subtract value at address 023 from AC
SkipCond 000  // Skip next instruction if AC < 0
Jump 018      // Jump back to address 018
Add 023       // Add value from address 23 to AC
JumpI 011     // Indirect jump to address stored in 011
SkipCond 400  // Skip next instruction if AC == 0
Subt 023      // Subtract value at address 023 from AC
JumpI 011     // Indirect jump to address stored in 011
HEX 0000      // Empty space
HEX 0000      // Empty space
Halt          // Terminate program

// DATA SECTION (after Halt)
DEC 14        // Constant value 14
DEC 1         // Constant value 1 (increment)
DEC 38        // Constant value 38
DEC 182       // Constant value 182
DEC 189       // Constant value 189
HEX FF9C      // Special value (-100 in two's complement)
HEX 063F      // Special value (1599 in hexadecimal)
HEX FDE7      // Special value (-537 in two's complement)
HEX FEAF      // Special value (-337 in two's complement)
HEX 0000      // Empty memory locations (can be omitted)
