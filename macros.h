// -- macro functions -- //

// transform input filename into output
mt transformFilename(mt input, bool assembly) {
    // find last dot in string
    int pos = (int)strlen(input) - 1;
    while (pos >= 0) {
        if (input[pos] == '.') {
            break;
        };
        pos--;
    };
    if (pos == -1)
        pos = (int)strlen(input);

    // create name
    mt output = new char[pos + 5];
    int i;

    for (i = 0; i < pos; i++)
        output[i] = input[i];

    // add extension
    output[i++] = '.';
    if (assembly) {
        output[i++] = 'd';
        output[i++] = 'a';
        output[i++] = 't';
    } else {
        output[i++] = 'a';
        output[i++] = 's';
        output[i++] = 'm';
    };
    output[i] = 0;
    return output;
};

// create a string copy
mt createString(vec<char> data) {
    mt res = new char[data.size()];

    // check if allocate failed
    if (res == null)
        return null;

    // copy string
    for (dt i = 0; i < (dt)data.size(); i++)
        res[i] = data[i];

    // return string
    return res;
};

// transform character to escape
char transformEscape(char c) {
    switch (c) {
        case '\\': return '\\';
        case '\'': return '\'';
        case '\"': return '\"';
        case '0': return '\0';
        case 'a': return '\a';
        case 'b': return '\b';
        case 'e': return '\e';
        case 'f': return '\f';
        case 'n': return '\n';
        case 'r': return '\r';
        case 't': return '\t';
        case 'v': return '\v';
    };
    return 0;
};

// validate character
bool isValid(char c) {
    return (c >= 0x20 && c <= 0x7E) || (c == '\n' || c == '\t');
};

// check for binary digits
inline bool isBinary(char c) {
    return c == '0' || c == '1';
};

// check for digits
inline bool isDigit(char c) {
    return c >= '0' && c <= '9';
};

// check for uppercase hex digits
inline bool isHexU(char c) {
    return c >= 'A' && c <= 'F';
};

// check for lowercase hex digits
inline bool isHexL(char c) {
    return c >= 'a' && c <= 'f';
};

// character type
bt characterType[128] {
 // 0  1  2  3  4  5  6  7  8  9  A  B  C  D  E  F
    0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    1, 0, 0, 6, 2, 2, 3, 0, 0, 0, 3, 3, 1, 3, 4, 3,
    4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 0, 3, 8, 3, 0,
    0, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
    4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 3, 4,
    0, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
    4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 0, 3, 0, 0, 0
};

// type strings
st typeName[] {
    "array", "whitespace", "number type", "operator",
    "name", "branch", "constant", "string", "assignment"
};

// get opcode id
Int transformOpcode(st data) {
    for (int i = 0; i < Int::Invalid; i++) {
        if (strcmpi(data, instructionNames[i]) == 0) {
            return static_cast<Int>(i);
        };
    };
    return Int::Invalid;
};

// get operator id
Operator transformOperator(mt data) {
    for (int i = 0; i < Operator::Count; i++) {
        if (strcmpi(data, operatorName[i]) == 0) {
            return static_cast<Operator>(i);
        };
    };
    return Operator::None;
};

// check if opcode has relative addressing mode
bool isBranch(Int opcode) {
    return opcode >= Int::BPL && opcode <= Int::BRA;
};

// check if opcode has indirect addressing mode
bool isIndirect(Int opcode) {
    return opcode >= Int::LTV && opcode <= Int::JSR;
};

// parse number types
void parseType(token_t& token, bool& hex, bool& bin) {
    dt i = 0;
    while (true) {
        char c = token.str[i++];
        if (c == 0x00)
            break;

        // check for hex sign
        if (c == '$') {
            // check for conflict
            if (hex || bin) {
                glerr.data = (mt)errorMessage[23];
                glerr.line = token.line;
                raise(glerr);
            };
            hex = true;
        };

        // check for hex sign
        if (c == '%') {
            // check for conflict
            if (hex || bin) {
                glerr.data = (mt)errorMessage[23];
                glerr.line = token.line;
                raise(glerr);
            };
            bin = true;
        };
    };
};

// get type of strings
data_t parseString(token_t& token, bool hex, bool bin) {
    data_t data;

    // validate token
    if (token.type != 4) {
        char text[256];
        sprintf(text, errorMessage[13], typeName[4], typeName[token.type]);

        glerr.data = text;
        glerr.line = token.line;
        raise(glerr);
    };

    // parse hexadecimal number
    if (hex) {
        dt num = 0;

        // fetch number
        dt i = 0;
        while (true) {
            char c = token.str[i++];
            if (c == 0x00)
                break;

            // add new digit
            num *= 16;

            // check 0 ~ 9
            if (isDigit(c))
                num += c - 0x30;
            // check A - F
            else if (isHexU(c))
                num += c - 0x37;
            // check a ~ f
            else if (isHexL(c))
                num += c - 0x57;

            // invalid number character
            else {
                char text[256];
                sprintf(text, errorMessage[19], token.str);

                glerr.data = text;
                glerr.line = token.line;
                raise(glerr);
            };
        };

        // check number size
        if (num >> 16) {
            char text[256];
            sprintf(text, errorMessage[22], num);

            glerr.data = text;
            glerr.line = token.line;
            raise(glerr);
        };

        // success
        data.type = 1 + ((num >> 8) ? 1 : 0);
        data.num = num;
        return data;
    };

    // parse binary number
    if (bin) {
        dt num = 0;

        // fetch number
        dt i = 0;
        while (true) {
            char c = token.str[i++];
            if (c == 0x00)
                break;

            // add new digit
            num *= 2;

            // check 0 ~ 1
            if (isBinary(c))
                num += c - 0x30;

            // invalid number character
            else {
                char text[256];
                sprintf(text, errorMessage[20], token.str);

                glerr.data = text;
                glerr.line = token.line;
                raise(glerr);
            };
        };

        // check number size
        if (num >> 16) {
            char text[256];
            sprintf(text, errorMessage[22], num);

            glerr.data = text;
            glerr.line = token.line;
            raise(glerr);
        };

        // success
        data.type = 1 + ((num >> 8) ? 1 : 0);
        data.num = num;
        return data;
    };

    // parse decimal number
    if (isDigit(token.str[0])) {
        dt num = 0;

        // fetch number
        dt i = 0;
        while (true) {
            char c = token.str[i++];
            if (c == 0x00)
                break;

            // add new digit
            num *= 10;

            // check 0 ~ 9
            if (isDigit(c))
                num += c - 0x30;

            // invalid number character
            else {
                char text[256];
                sprintf(text, errorMessage[21], token.str);

                glerr.data = text;
                glerr.line = token.line;
                raise(glerr);
            };
        };

        // check number size
        if (num >> 16) {
            char text[256];
            sprintf(text, errorMessage[22], num);

            glerr.data = text;
            glerr.line = token.line;
            raise(glerr);
        };

        // success
        data.type = 1 + ((num >> 8) ? 1 : 0);
        data.num = num;
        return data;
    };

    // check for register names
    for (int i = 0; i < 4; i++) {
        if (strcmpi(token.str, registerNames[i + 1]) == 0) {
            // return register
            data.type = i + 5;
            return data;
        };
    };

    // parse name
    data.str = token.str;
    data.type = 0;
    return data;
};

// parse string in quotes
mt parseQuotes(token_t& token) {
    // flags
    bool quotes = false;
    bool escape = false;
    vec<char> data;

    dt i = 0;
    while (true) {
        char c = token.str[i++];
        if (c == 0x00)
            break;

        // parse characters inside quotes
        if (quotes) {
            // check for escape sequence
            if (escape) {
                char t = transformEscape(c);
                if (t == 0x00) {
                    char text[256];
                    sprintf(text, errorMessage[34], c);

                    glerr.data = text;
                    glerr.line = token.line;
                    raise(glerr);
                };

                // push escape character
                data.push_back(t);
                escape = false;
            } else {
                // check for escape start
                if (c == '\\') {
                    escape = true;
                    continue;
                };

                // check for quotes
                if (c == '"') {
                    quotes = false;
                    continue;
                };

                // push character to the string
                data.push_back(c);
            };
        } else {
            if (c == '"') {
                quotes = true;
            } else {
                // characters not in quotes
                char text[256];
                sprintf(text, errorMessage[29], 3);

                glerr.data = text;
                glerr.line = token.line;
                raise(glerr);
            };
        };
    };

    // success
    data.push_back(0);
    return createString(data);
};

short parseOffset(token_t& token) {
    short offset = 0;

    dt i = 0;
    while (true) {
        char c = token.str[i++];
        if (c == 0x00)
            break;

        // plus sign
        if (c == '+') {
            // check offset direction
            if (offset < 0) {
                glerr.data = (mt)errorMessage[35];
                glerr.line = token.line;
                raise(glerr);
            };

            // increment offset
            offset++;
            continue;
        };

        // plus sign
        if (c == '-') {
            // check offset direction
            if (offset > 0) {
                glerr.data = (mt)errorMessage[35];
                glerr.line = token.line;
                raise(glerr);
            };

            // increment offset
            offset--;
            continue;
        };

        // invalid character
        char text[256];
        sprintf(text, errorMessage[36], c);

        glerr.data = text;
        glerr.line = token.line;
        raise(glerr);
    };

    // check offset
    if (offset == 0) {
        glerr.data = (mt)errorMessage[39];
        glerr.line = token.line;
        raise(glerr);
    };

    // success
    return offset;
};

// create stream reference
ref_t streamRef(vec<stream_t>& str) {
    ref_t ref;
    ref.str = str.size() - 1;
    ref.id = str.back().data.size();
    return ref;
};

// create space tab
/*void printTab(int c, st s) {
    for (int i = 0; i < c; i++)
        printf("%s", s);
};*/
