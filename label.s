// Main program loop
Start,      Load    DataStart      // Address 000: Load initial value (address of data) into AC
            Store   Pointer        // Address 001: Store AC into pointer variable
            Jump    MainLoop       // Address 002: Jump to the main loop
            HEX     0000           // Address 003: Empty space (not an instruction)
            HEX     0000           // Address 004: Empty space (not an instruction)

MainLoop,   LoadI   Pointer        // Address 005: Load value indirectly via address in Pointer
            SkipCond 400           // Address 006: Skip next instruction if AC == 0
            Jump    ProcessValue   // Address 007: Jump to processing section (address 00B)
            Jump    EndProgram     // Address 008: Jump to halt if AC == 0

Pointer,    HEX     0000           // Address 009: Pointer variable, initialized to 0
            HEX     0000           // Address 00A: Empty space

ProcessValue, DEC   17             // Address 00B: Constant value 17 (data, not executed)

Output,     Output                 / Address 00C: Output current AC value
            Load    Pointer        // Address 00D: Reload pointer value into AC
            Add     Increment      // Address 00E: Increment pointer by 1
            Store   Pointer        // Address 00F: Store updated pointer
            Jump    MainLoop       // Address 010: Loop back to MainLoop

ReturnAddr, HEX     0000           // Address 011: Storage for return address (used in JumpI)

AdjustStart, SkipCond 000          // Address 012: Skip if AC < 0 (subroutine entry)
            Jump    SubLoop        // Address 013: Jump to subtraction loop

AddLoop,    Add     Constant14     // Address 014: Add 14 to AC
            SkipCond 000           // Address 015: Skip if AC < 0
            Jump    AdjustEnd      // Address 016: Jump to end adjustment
            Jump    AddLoop        // Address 017: Loop back to add more

SubLoop,    Subt    Constant14     // Address 018: Subtract 14 from AC
            SkipCond 000           // Address 019: Skip if AC < 0
            Jump    SubLoop        // Address 01A: Loop back to subtract more
            Add     Constant14     // Address 01B: Add 14 back to AC
            JumpI   ReturnAddr     // Address 01C: Indirect jump to address in ReturnAddr

AdjustEnd,  SkipCond 400           // Address 01D: Skip if AC == 0
            Subt    Constant14     // Address 01E: Subtract 14 from AC
            JumpI   ReturnAddr     // Address 01F: Indirect jump to address in ReturnAddr
            HEX     0000           // Address 020: Empty space
            HEX     0000           // Address 021: Empty space

EndProgram, Halt                   / Address 022: Terminate program

// Data section
Constant14, DEC     14             // Address 023: Constant value 14 (used in adjustments)
Increment,  DEC     1              // Address 024: Constant value 1 (pointer increment)
DataStart,  DEC     38             // Address 025: Starting address of data (points to 026)
Data1,      DEC     182            // Address 026: First data value
Data2,      DEC     189            // Address 027: Second data value
Data3,      HEX     FF9C           // Address 028: Value -100 (two's complement)
Data4,      HEX     063F           // Address 029: Value 1599
Data5,      HEX     FDE7           // Address 02A: Value -537 (two's complement)
Data6,      HEX     FEAF           // Address 02B: Value -337 (two's complement)
            HEX     0000           // Address 02C-03F: Remaining empty memory locations
