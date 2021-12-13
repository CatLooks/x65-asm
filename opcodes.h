// -- opcode data -- //

//// argument types
//#define ARG_A     0
//#define ARG_B     1
//#define ARG_X     2
//#define ARG_Y     3
//#define ARG_REL   4
//
//#define ARG_BYTE  0x10
//#define ARG_WORD  0x18
//#define ARG_STR   0x20
//#define ARG_VAR   0x28
//
//#define ARG_CONST 0x01
//#define ARG_HIGH  0x02
//#define ARG_LOW   0x04

// argument combinations
struct addr_t {
    enum names {
        // opcodes
        IMP = 0, ACC, BUF, IMM, DIM, REL,
        DIR, DRX, DRY, ZPG, ZPX, ZPY,
        IND,

        // misc
        Invalid
    };
};
typedef addr_t::names AddrMode;

// special arguments
//struct arguments_t {
//    enum names {
//        None = 0, A, B, X, Y
//    };
//};
//typedef arguments_t::names SpcArg;

// instructions
struct instruction_t {
    enum names {
        // opcodes
        NOP = 0,
        WAI, JAM,
        PHP, PLP, PHA, PLA, PHB, PLB, PHX, PLX, PHY, PLY, PHD, PLD,
        TAB, TAX, TAY, TBA, TXA, TXY, TYA, TYX, TXS, TSX, THD, TDH,
        CLC, SEC, CLI, SEI, CLF, SEF, CLV,
        INX, INY, INS, DEX, DEY, DES,
        ASL, LSR, ROL, ROR, CMP, CPX, CPY, CMD,
        AND, ORA, XOR, LTA, LTB, LTX, LTY, LTD,
        ADC, SBC, STZ, STA, STB, STX, STY, STD,
        BPL, BMI, BVC, BVS, BCC, BCS, BNE, BEQ, BRA,
        INC, DEC, BIT, MUL, DIV, MOD, LTV,
        JMP, JSR, RTS, RTI,
        Count,

        // macros
        Byte, Word, Fill, Align, Set, Def, Del, Spos, Fpos, Vpos, File, Lib, Size,

        // invalid
        Invalid
    };
};
typedef instruction_t::names Int;

// assembly object
struct asm_t {
    vec<arg_t> data;
    Int opcode;
    mt label;
    bool valid;
    bool rel;
    dt line;

    // constructor
    asm_t () {
        opcode = Int::Invalid;
        label = null;
        valid = false;
        rel = false;
        line = 0;
    };
};

// addressing mode strings
st addrModeNames[] {
    "Implied", "Accumulator", "Buffer", "Immediate Byte", "Immediate Word", "Relative",
    "Direct", "Direct X", "Direct Y", "Zeropage", "Zeropage X", "Zeropage Y", "Indirect",
    "Invalid"
};

// arguments strings
st registerNames[] {
    "None", "A", "B", "X", "Y"
};

// instruction strings
st instructionNames[] {
    // opcodes
    "nop",
    "wai", "jam",
    "php", "plp", "pha", "pla", "phb", "plb", "phx", "plx", "phy", "ply", "phd", "pld",
    "tab", "tax", "tay", "tba", "txa", "txy", "tya", "tyx", "txs", "tsx", "thd", "tdh",
    "clc", "sec", "cli", "sei", "clf", "sef", "clv",
    "inx", "iny", "ins", "dex", "dey", "des",
    "asl", "lsr", "rol", "ror", "cmp", "cpx", "cpy", "cmd",
    "and", "ora", "xor", "lta", "ltb", "ltx", "lty", "ltd",
    "adc", "sbc", "stz", "sta", "stb", "stx", "sty", "std",
    "bpl", "bmi", "bvc", "bvs", "bcc", "bcs", "bne", "beq", "bra",
    "inc", "dec", "bit", "mul", "div", "mod", "ltv",
    "jmp", "jsr", "rts", "rti",
    null,

    // macros
    ".byte", ".word", ".fill", ".align", ".set", ".def", ".del", ".spos", ".fpos", ".vpos", ".file", ".lib", ".size",

    // invalid
    "???"
};

// opcode decode matrix
const bt NOPC = 0x03;
const bt opcodeMatrix[Int::Count][AddrMode::Invalid] {
    //IMP   ACC   BUF   IMM   DIM   REL   DIR   DRX   DRY   ZPG   ZPX   ZPY   IND
    {0x00, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // NOP
    {0x18, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // WAI
    {0x08, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // JAM
    {0x48, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // PHP
    {0x58, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // PLP
    {0x68, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // PHA
    {0x78, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // PLA
    {0x88, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // PHB
    {0x98, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // PLB
    {0xA8, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // PHX
    {0xB8, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // PLX
    {0xC8, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // PHY
    {0xD8, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // PLY
    {0xE8, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // PHD
    {0xF8, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // PLD
    {0x0F, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // TAB
    {0x1F, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // TAX
    {0x2F, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // TAY
    {0x3F, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // TBA
    {0x4F, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // TXA
    {0x5F, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // TXY
    {0x6F, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // TYA
    {0x7F, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // TYX
    {0x8F, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // TXS
    {0x9F, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // TSX
    {0xAF, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // THD
    {0xBF, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // TDH
    {0x07, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // CLC
    {0x17, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // SEC
    {0x27, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // CLI
    {0x37, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // SEI
    {0x47, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // CLF
    {0x57, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // SEF
    {0x80, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // CLV
    {0x42, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // INX
    {0x52, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // INY
    {0x28, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // INS
    {0x62, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // DEX
    {0x72, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // DEY
    {0x38, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // DES
    {0x14, 0x14, NOPC, NOPC, NOPC, NOPC, 0x04, 0x0C, 0x1C, NOPC, NOPC, NOPC, NOPC}, // ASL
    {0x34, 0x34, NOPC, NOPC, NOPC, NOPC, 0x24, 0x2C, 0x3C, NOPC, NOPC, NOPC, NOPC}, // LSR
    {0x54, 0x54, NOPC, NOPC, NOPC, NOPC, 0x44, 0x4C, 0x5C, NOPC, NOPC, NOPC, NOPC}, // ROL
    {0x74, 0x74, NOPC, NOPC, NOPC, NOPC, 0x64, 0x6C, 0x7C, NOPC, NOPC, NOPC, NOPC}, // ROR
    {0xD2, NOPC, 0xD2, NOPC, 0x94, NOPC, 0x84, 0x8C, 0x9C, NOPC, NOPC, NOPC, NOPC}, // CMP
    {0xE2, NOPC, 0xE2, NOPC, 0xB4, NOPC, 0xA4, NOPC, 0xBC, NOPC, NOPC, NOPC, NOPC}, // CPX
    {0xF2, NOPC, 0xF2, NOPC, 0xD4, NOPC, 0xC4, 0xCC, NOPC, NOPC, NOPC, NOPC, NOPC}, // CPY
    {NOPC, NOPC, NOPC, 0xF4, NOPC, NOPC, 0xE4, 0xEC, 0xFC, NOPC, NOPC, NOPC, NOPC}, // CMD
    {0xA2, NOPC, 0xA2, 0x11, 0x01, NOPC, 0x05, 0x09, 0x0D, 0x15, 0x19, 0x1D, NOPC}, // AND
    {0xB2, NOPC, 0xB2, 0x31, 0x21, NOPC, 0x25, 0x29, 0x2D, 0x35, 0x39, 0x3D, NOPC}, // ORA
    {0xC2, NOPC, 0xC2, 0x51, 0x41, NOPC, 0x45, 0x49, 0x4D, 0x55, 0x59, 0x5D, NOPC}, // XOR
    {NOPC, NOPC, NOPC, 0x71, 0x61, NOPC, 0x65, 0x69, 0x6D, 0x75, 0x79, 0x7D, NOPC}, // LTA
    {NOPC, NOPC, NOPC, 0x91, 0x81, NOPC, 0x85, 0x89, 0x8D, 0x95, 0x99, 0x9D, NOPC}, // LTB
    {NOPC, NOPC, NOPC, 0xB1, 0xA1, NOPC, 0xA5, 0xA9, 0xAD, 0xB5, 0xB9, 0xBD, NOPC}, // LTX
    {NOPC, NOPC, NOPC, 0xD1, 0xC1, NOPC, 0xC5, 0xC9, 0xCD, 0xD5, 0xD9, 0xDD, NOPC}, // LTY
    {NOPC, NOPC, NOPC, 0xF1, NOPC, NOPC, 0xE5, 0xE9, 0xED, 0xF5, 0xF9, 0xFD, NOPC}, // LTD
    {0x82, NOPC, 0x82, 0x12, 0x02, NOPC, 0x06, 0x0A, 0x0E, 0x16, 0x1A, 0x1E, NOPC}, // ADC
    {0x92, NOPC, 0x92, 0x32, 0x22, NOPC, 0x26, 0x2A, 0x2E, 0x36, 0x3A, 0x3E, NOPC}, // SBC
    {NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, 0x46, 0x4A, 0x4E, 0x56, 0x5A, 0x5E, NOPC}, // STZ
    {NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, 0x66, 0x6A, 0x6E, 0x76, 0x7A, 0x7E, NOPC}, // STA
    {NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, 0x86, 0x8A, 0x8E, 0x96, 0x9A, 0x9E, NOPC}, // STB
    {NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, 0xA6, NOPC, 0xAE, 0xB6, NOPC, 0xBE, NOPC}, // STX
    {NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, 0xC6, 0xCA, NOPC, 0xD6, 0xDA, NOPC, NOPC}, // STY
    {NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, 0xE6, 0xEA, 0xEE, 0xF6, 0xFA, 0xFE, NOPC}, // STD
    {NOPC, NOPC, NOPC, NOPC, NOPC, 0x10, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // BPL
    {NOPC, NOPC, NOPC, NOPC, NOPC, 0x30, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // BMI
    {NOPC, NOPC, NOPC, NOPC, NOPC, 0x50, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // BVC
    {NOPC, NOPC, NOPC, NOPC, NOPC, 0x70, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // BVS
    {NOPC, NOPC, NOPC, NOPC, NOPC, 0x90, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // BCC
    {NOPC, NOPC, NOPC, NOPC, NOPC, 0xB0, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // BCS
    {NOPC, NOPC, NOPC, NOPC, NOPC, 0xD0, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // BNE
    {NOPC, NOPC, NOPC, NOPC, NOPC, 0xF0, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // BEQ
    {NOPC, NOPC, NOPC, NOPC, NOPC, 0xCF, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // BEQ
    {0x67, 0x67, NOPC, NOPC, NOPC, NOPC, 0xAA, NOPC, NOPC, 0xBA, NOPC, NOPC, NOPC}, // INC
    {0x77, 0x77, NOPC, NOPC, NOPC, NOPC, 0xCE, NOPC, NOPC, 0xDE, NOPC, NOPC, NOPC}, // DEC
    {NOPC, 0xAC, 0xDC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // BIT
    {0xA0, NOPC, 0xA0, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // MUL
    {0xC0, NOPC, 0xC0, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // DIV
    {0xE0, NOPC, 0xE0, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // MOD
    {NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, 0xE1}, // LTV
    {NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, 0xDF, NOPC, NOPC, NOPC, NOPC, NOPC, 0xEF}, // JMP
    {NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, 0x20, NOPC, NOPC, NOPC, NOPC, NOPC, 0xFF}, // JSR
    {0x60, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // RTS
    {0x40, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC, NOPC}, // RTI
};
