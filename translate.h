// -- token translator -- //

// print data
/*void printData(data_t& data) {
    switch (data.type) {
        case 0:
        printf("Line: %s", data.str);
        break;
        case 1:
        printf("Byte: %02X", data.num);
        break;
        case 2:
        printf("Word: %04X", data.num);
        break;
        case 3:
        printf("Data: %s", data.str);
        break;
        case 4: {
            if ((short)data.num > 0)
                printf("Offset: +%d", (short)data.num);
            else
                printf("Offset: %d", (short)data.num);
        };
        break;
        case 5:
        printf("Reg: A");
        break;
        case 6:
        printf("Reg: B");
        break;
        case 7:
        printf("Reg: X");
        break;
        case 8:
        printf("Reg: Y");
        break;
        default:
        printf("???");
    };
    if (data.lit)
        printf(" const");
    printf("\n");
};*/

// data types
st dataName[] {
    "name", "byte", "word", "str", "offset", "reg A", "reg B", "reg X", "reg Y"
};

// line translator
asm_t translateLine(token_t& root) {
    // resources
    Int opcode = Int::Invalid;
    bool anonymous = false;
    vec<arg_t> arguments;
    mt label = null;
    bt next = 1;

    // flags
    bool arg = false;
    bool hex = false;
    bool bin = false;
    bool lit = false;

    // iterate through each token
    for (token_t& token : root.arr) {
        // ignore whitespaces
        if (token.type == 1)
            continue;

        // print token
        //tokenInfo(token);

        // check for redundant tokens
        if (next == 0) {
            glerr.data = (mt)errorMessage[14];
            glerr.line = token.line;
            raise(glerr);
        };

        // parse opcode
        if (next == 1) {
            // check for anonymous branch
            if (token.type == 5) {
                anonymous = true;

                // EOI
                next = 0;
                continue;
            };

            // check for string type
            if (token.type != 4) {
                char text[256];
                sprintf(text, errorMessage[13], typeName[7], typeName[token.type]);

                glerr.data = text;
                glerr.line = token.line;
                raise(glerr);
            };

            // get opcode id
            opcode = transformOpcode(token.str);

            // check for label
            if (opcode == Int::Invalid) {
                label = token.str;

                // expecting label operator
                next = 2;
            } else {
                // expecting an argument
                next = 3;
            };
            continue;
        };

        // parse label operator
        if (next == 2) {
            // check for label constructor
            if (token.type == 5) {
                // check character repeat
                int len = strlen(token.str);
                if (len > 1) {
                    glerr.data = (mt)errorMessage[15];
                    glerr.line = token.line;
                    glerr.type = false;
                    raise(glerr);
                };

                // EOI
                next = 0;
                continue;
            };

            // check for variable constructor
            if (token.type == 8) {
                int len = strlen(token.str);
                if (len > 1) {
                    glerr.data = (mt)errorMessage[16];
                    glerr.line = token.line;
                    glerr.type = false;
                    raise(glerr);
                };

                // transform into .set macro
                arg_t lab;
                lab.value.str = label;
                arguments.push_back(lab);
                label = null;
                opcode = Int::Set;

                next = 3;
                continue;
            };

            // invalid label operator
            char text[256];
            sprintf(text, errorMessage[17], token.str);

            glerr.data = text;
            glerr.line = token.line;
            raise(glerr);
        };

        // parse instruction argument
        if (next == 3) {
            // check for number type
            if (token.type == 2) {
                parseType(token, hex, bin);
                continue;
            };

            // check for constant
            if (token.type == 6) {
                // check for types
                if (hex || bin) {
                    glerr.data = (mt)errorMessage[30];
                    glerr.line = token.line;
                    raise(glerr);
                };
                // check for constant
                if (lit) {
                    glerr.data = (mt)errorMessage[24];
                    glerr.line = token.line;
                    raise(glerr);
                };

                lit = true;
                continue;
            };

            // parse as operand
            if (arg) {
                // check for operator
                if (token.type == 3) {
                    // check for types
                    if (hex || bin) {
                        glerr.data = (mt)errorMessage[30];
                        glerr.line = token.line;
                        raise(glerr);
                    };
                    // check for constant
                    if (lit) {
                        char text[256];
                        sprintf(text, errorMessage[31], typeName[3]);

                        glerr.data = text;
                        glerr.line = token.line;
                        raise(glerr);
                    };

                    // empty operator error
                    glerr.data = (mt)errorMessage[27];
                    glerr.line = token.line;
                    raise(glerr);
                };

                // check for name
                if (token.type == 4) {
                    // check for operands
                    if (arguments.empty()) {
                        char text[256];
                        sprintf(text, errorMessage[29], 1);

                        glerr.data = text;
                        glerr.line = token.line;
                        raise(glerr);
                    };

                    // check for operations
                    if (arguments.back().ops.empty()) {
                        char text[256];
                        sprintf(text, errorMessage[29], 2);

                        glerr.data = text;
                        glerr.line = token.line;
                        raise(glerr);
                    };

                    // push as operand
                    arguments.back().ops.back().value = parseString(token, hex, bin);
                    arguments.back().ops.back().value.lit = lit;
                    arguments.back().ops.back().value.line = token.line;

                    lit = false;
                    hex = false;
                    bin = false;
                    arg = false;
                    continue;
                };

                // check for string
                if (token.type == 7) {
                    // check for types
                    if (hex || bin) {
                        glerr.data = (mt)errorMessage[30];
                        glerr.line = token.line;
                        raise(glerr);
                    };
                    // check for operands
                    if (arguments.empty()) {
                        char text[256];
                        sprintf(text, errorMessage[29], 1);

                        glerr.data = text;
                        glerr.line = token.line;
                        raise(glerr);
                    };
                    // check for operations
                    if (arguments.back().ops.empty()) {
                        char text[256];
                        sprintf(text, errorMessage[29], 2);

                        glerr.data = text;
                        glerr.line = token.line;
                        raise(glerr);
                    };

                    // parse string
                    data_t data;
                    mt str = parseQuotes(token);

                    // check for a character
                    if (strlen(str) == 1) {
                        data.type = 1;
                        data.num = str[0];
                    } else {
                        // push string
                        data.type = 3;
                        data.str = str;
                    };
                    data.lit = lit;
                    data.line = token.line;
                    arguments.back().ops.back().value = data;

                    arg = false;
                    lit = false;
                    continue;
                };

                // check for branch
                if (token.type == 5) {
                    // invalid operand type
                    char text[256];
                    sprintf(text, errorMessage[25], typeName[5]);

                    glerr.data = text;
                    glerr.line = token.line;
                    raise(glerr);
                };
            }

            // parse as argument
            else {
                // check for operator
                if (token.type == 3) {
                    // check for types
                    if (hex || bin) {
                        glerr.data = (mt)errorMessage[30];
                        glerr.line = token.line;
                        raise(glerr);
                    };
                    // check for constant
                    if (lit) {
                        char text[256];
                        sprintf(text, errorMessage[31], typeName[3]);

                        glerr.data = text;
                        glerr.line = token.line;
                        raise(glerr);
                    };

                    // check for operands
                    if (arguments.empty()) {
                        glerr.data = (mt)errorMessage[26];
                        glerr.line = token.line;
                        raise(glerr);
                    };

                    // get operator id
                    Operator op = transformOperator(token.str);
                    if (op == Operator::None) {
                        // invalid operand type
                        char text[256];
                        sprintf(text, errorMessage[28], token.str);

                        glerr.data = text;
                        glerr.line = token.line;
                        raise(glerr);
                    };

                    // push operation to last argument
                    operation_t opt;
                    opt.action = op;
                    arguments.back().ops.push_back(opt);

                    arg = true;
                    continue;
                };

                // check for name
                if (token.type == 4) {
                    // add name to arguments
                    arg_t add;
                    add.value = parseString(token, hex, bin);
                    add.value.lit = lit;
                    add.value.line = token.line;
                    arguments.push_back(add);

                    lit = false;
                    hex = false;
                    bin = false;
                    continue;
                };

                // check for branch
                if (token.type == 5) {
                    // check for types
                    if (hex || bin) {
                        glerr.data = (mt)errorMessage[30];
                        glerr.line = token.line;
                        raise(glerr);
                    };
                    // check for constant
                    if (lit) {
                        char text[256];
                        sprintf(text, errorMessage[31], typeName[5]);

                        glerr.data = text;
                        glerr.line = token.line;
                        raise(glerr);
                    };

                    // switch to branch mode
                    next = 4;
                    continue;
                };

                // check for string
                if (token.type == 7) {
                    // check for types
                    if (hex || bin) {
                        glerr.data = (mt)errorMessage[30];
                        glerr.line = token.line;
                        raise(glerr);
                    };

                    // parse string
                    arg_t data;
                    mt str = parseQuotes(token);

                    // check for a character
                    if (strlen(str) == 1) {
                        data.value.type = 1;
                        data.value.num = str[0];
                    } else {
                        // push string
                        data.value.type = 3;
                        data.value.str = str;
                    };
                    data.value.lit = lit;
                    data.value.line = token.line;
                    arguments.push_back(data);

                    lit = false;
                    continue;
                };
            };

            // invalid argument type
            char text[256];
            sprintf(text, errorMessage[18], typeName[token.type]);

            glerr.data = text;
            glerr.line = root.line;
            raise(glerr);
        };
        // parse branch
        if (next == 4) {
            // check token type
            if (token.type != 3) {
                char text[256];
                sprintf(text, errorMessage[13], "offset", typeName[token.type]);

                glerr.data = text;
                glerr.line = token.line;
                raise(glerr);
            };

            // get branch offset
            short offset = parseOffset(token);

            // push branch
            arg_t data;
            data.value.line = token.line;
            data.value.type = 4;
            data.value.num = (wt)offset;
            arguments.push_back(data);

            // EOI
            next = 0;
            continue;
        };
    };

    // check for unfinished flags
    if (hex || bin) {
        glerr.data = (mt)errorMessage[32];
        glerr.line = root.line;
        raise(glerr);
    };
    if (lit) {
        glerr.data = (mt)errorMessage[33];
        glerr.line = root.line;
        raise(glerr);
    };
    if (arg) {
        glerr.data = (mt)errorMessage[27];
        glerr.line = root.line;
        raise(glerr);
    };
    if (next == 4) {
        glerr.data = (mt)errorMessage[39];
        glerr.line = root.line;
        raise(glerr);
    };

    // return anonymous label
    if (anonymous) {
        asm_t res;
        res.valid = true;
        res.line = root.line;
        res.rel = true;
        return res;
    };

    // if results are empty, exit
    if (opcode == Int::Invalid && label == null)
        return asm_t();

    // return assembly unit
    asm_t res;
    res.data = vec<arg_t>(arguments);
    res.opcode = opcode;
    res.label = label;
    res.valid = true;
    res.line = root.line;
    return res;
};

// token translator
void translateToken(vec<asm_t>& assembly, token_t& root) {
    // translate each line
    for (token_t& line : root.arr) {
        asm_t res = translateLine(line);
        if (!res.valid)
            continue;
        assembly.push_back(res);
    };
};
