        ORG 000         / Start at address 000
Main,   LOAD StartVal   / Load value from address 025 into AC
        STORE Temp      / Store AC value into address 009
        JUMP Loop       / Jump to address 005 (main loop)

        HEX 0000        / Empty space at 003
        HEX 0000        / Empty space at 004

Loop,   LOADI Temp      / Indirect load from address stored in Temp
        SKIPCOND 400    / Skip next instruction if AC == 0
        JUMP Calc       / Jump to address 00B
        JUMP Halt       / Jump to address 022 (end program)

Temp,   HEX 0000        / Data storage (modified by program)
        HEX 0000        / Empty space at 00A

Calc,   DEC 17          / Constant value 17
        OUTPUT          / Output AC value
        LOAD Temp       / Load value from Temp
        ADD Increment   / Add value from address 024 (1) to AC
        STORE Temp      / Store result back to Temp
        JUMP Loop       / Jump back to main loop

Check1, SKIPCOND 000    / Skip next instruction if AC < 0
        HEX 0000        / Empty space at 011

        JUMP SubLoop    / Jump to address 018
AddLp,  ADD Const14     / Add value from address 023 (14) to AC
        SKIPCOND 000    / Skip next instruction if AC < 0
        JUMP EndJmp     / Jump to address 01D
        JUMP AddLp      / Jump back to address 014

SubLoop,SUBT Const14    / Subtract value at address 023 (14) from AC
        SKIPCOND 000    / Skip next instruction if AC < 0
        JUMP SubLoop    / Jump back to address 018
        ADD Const14     / Add value from address 023 (14) to AC
        JUMPI Check1    / Indirect jump to address stored in 011

EndJmp, SKIPCOND 400    / Skip next instruction if AC == 0
        SUBT Const14    / Subtract value at address 023 (14) from AC
        JUMPI Check1    / Indirect jump to address stored in 011

        HEX 0000        / Empty space at 020
        HEX 0000        / Empty space at 021

Halt,   HALT            / Terminate program

/ Data Section
Const14,DEC 14          / Constant value 14
Increment,DEC 1         / Constant value 1 (increment)
StartVal,DEC 38         / Constant value 38 (initial value)
        DEC 182         / Constant value 182
        DEC 189         / Constant value 189
        HEX FF9C        / Special value (-100 in two's complement)
        HEX 063F        / Special value (1599 in hexadecimal)
        HEX FDE7        / Special value (-537 in two's complement)
        HEX FEAF        / Special value (-337 in two's complement)
        HEX 0000        / Empty memory locations (02C-03F)
