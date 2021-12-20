// -- error handler -- //

// message name
st errorName[2] {
    "Warning", "Error"
};
st errorNameColor[2] {
    "\e[38;5;220mWarning\e[0m", "\e[38;5;196mError\e[0m"
};

// error messages
st errorMessage[] {
    "no input",                             // 00
    "flag -%c requires a string",           // 01
    "flag must be only 1 character long",   // 02
    "empty flag",                           // 03
    "invalid flag -%c",                     // 04
    "input file is not specified",          // 05
    "failed to open file <%s>",             // 06
    "invalid character '%c' (%02X)",        // 07
    "invalid opening parenthesis",          // 08
    "invalid closing parenthesis",          // 09
    "empty parentheses",                    // 10
    "not closed string",                    // 11
    "not closed parentheses",               // 12
    "expected <%s>, but got <%s>",          // 13
    "too much arguments",                   // 14
    "repeated label sign ':'",              // 15
    "repeated equal sign '='",              // 16
    "invalid label operator \"%s\"",        // 17
    "argument cannot be <%s>",              // 18
    "invalid hex number \"%s\"",            // 19
    "invalid bin number \"%s\"",            // 20
    "invalid dec number \"%s\"",            // 21
    "number 0x%X is too big",               // 22
    "conflicting number types",             // 23
    "term is already constant",             // 24
    "invalid operand type <%s>",            // 25
    "left operand is missing",              // 26
    "right operand is missing",             // 27
    "invalid operator \"%s\"",              // 28
    "assertion error 0x%02X",               // 29
    "redundant <number type>",              // 30
    "<%s> cannot be constant",              // 31
    "unused <number type>",                 // 32
    "unused constant",                      // 33
    "invalid escape character \\%c",        // 34
    "branch offset is one directional",     // 35
    "invalid branch character \"%c\"",      // 36
    "branch offset is too long (+%d)",      // 37
    "branch offset is too long (%d)",       // 38
    "zero-offset anonymous branch",         // 39
    "<%s> is unsupported",                  // 40
    "variable name must be <name>",         // 41
    "argument must be <numeric type>",      // 42
    "addressing mode is already %s",        // 43
    "%s mode cannot be indexed",            // 44
    "\"%s\" does not support %s mode",      // 45
    "undefined names are not supported",    // 46
    "instruction requires arguments",       // 47
    "anonymous branch was not found",       // 48
    "<%s> is not requestable",              // 49
    "label \"%s\" is not defined",          // 50
    "instruction requires 2 arguments",     // 51
    "alignment size cannot be zero",        // 52
    "argument must be <string>",            // 53
    "unknown type <%s>",                    // 54
    "cannot redefine variable type",        // 55
    "label \"%s\" is already defined",      // 56
};

// error coloring
bool colored = false;

// raise error
void raise(error_t& error) {
    if (error.file) {
        if (colored)
            printf("%s at \e[38;5;129m<%s>\e[0m \e[38;5;245m(line %d)\e[0m:\n ", errorNameColor[error.type], error.file->name, error.line);
        else
            printf("%s at <%s> (line %d):\n ", errorName[error.type], error.file->name, error.line);
        dt lineno = 1;
        dt index = 0;

        // find line in file
        while (index++ < (dt)error.file->data.size()) {
            char c = error.file->data[index];

            // print character
            if (lineno == error.line)
                putchar(c);
            else if (lineno > error.line)
                break;

            // update line number
            if (error.file->data[index] == '\n')
                lineno++;
        };

        // print error string
        if (colored)
            printf(" = \e[38;5;41m%s\e[0m\n", error.data);
        else
            printf(" = %s\n", error.data);

    } else {
        if (colored)
            printf("%s at \e[38;5;129m<core>\e[0m:\n = \e[38;5;41m%s\e[0m\n", errorNameColor[error.type], error.data);
        else
            printf("%s at <core>:\n = %s\n", errorName[error.type], error.data);
    };

    // exit program
    if (error.type)
        exit(1);
};

// global error
error_t glerr;
