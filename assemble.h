// -- translator assembler -- //

// request info
void printRequest(req_t& req) {
    printf("\e[38;5;129m");
    printData(req.arg.value);
    for (operation_t& b : req.arg.ops) {
            printf("%s ", operatorName[b.action]);
            printData(b.value);
        };
    printf("Size: %d\n", req.size);
    printf("\e[0m");
};

// get variable pointer
var_t* getVar(vec<var_t>& heap, mt name) {
    for (var_t& var : heap) {
        if (strcmp(name, var.name) == 0) {
            return &var;
        };
    };
    return null;
};

// get label pointer
lab_t* getLabel(vec<lab_t>& labs, mt name) {
    for (lab_t& lab : labs) {
        if (lab.name == null)
            continue;
        if (strcmp(name, lab.name) == 0) {
            return &lab;
        };
    };
    return null;
};

// apply operation
void apply(Operator op, data_t& a, data_t& b) {
    // check for invalid constant
    if (b.lit) {
        char text[256];
        sprintf(text, errorMessage[31], dataName[b.type]);

        glerr.data = text;
        glerr.line = a.line;
        raise(glerr);
    };

    // check types
    if (!(a.type == 1 || a.type == 2)) {
        char text[256];
        sprintf(text, errorMessage[29], 4);

        glerr.data = text;
        glerr.line = a.line;
        raise(glerr);
    };
    if (!(b.type == 1 || b.type == 2)) {
        char text[256];
        sprintf(text, errorMessage[29], 5);

        glerr.data = text;
        glerr.line = b.line;
        raise(glerr);
    };

    // apply operation
    switch (op) {
        case Operator::Add:
        a.num += b.num;
        break;
        case Operator::Sub:
        a.num -= b.num;
        break;
        case Operator::And:
        a.num &= b.num;
        break;
        case Operator::Or:
        a.num |= b.num;
        break;
        case Operator::Xor:
        a.num ^= b.num;
        break;
        case Operator::Mul:
        a.num *= b.num;
        break;
        case Operator::Div:
        a.num /= b.num;
        break;
        case Operator::Shr:
        a.num >>= b.num;
        break;
        case Operator::Shl:
        a.num <<= b.num;
        break;
        default:
        break;
    };

    // change type
    a.type = a.num >= 0x100 ? 2 : (a.type == 1 ? b.type : 2);
};

// get anonymous label address
wt getAddress(vec<lab_t>& labs, dt init, short offset, dt line) {
    short rel = offset > 0 ? 1 : -1;
    init -= offset > 0 ? 0 : 1;
//    printf("Start: %d\n", init);
//    printf("Init: %d\n", rel);
//    printf("Dest: %d\n", offset);
//    printf("\n");

    // check for immediate match
    if (rel == offset) {
        if (init >= 0 && init < (dt)labs.size()) {
            //printf("Result: %04X\n", labs[init].pos);
            return labs[init].pos;
        };
        // invalid branch
        glerr.data = (mt)errorMessage[48];
        glerr.line = line;
        raise(glerr);
    };

    // go through each label
    while (init >= 0 && init < (dt)labs.size()) {
        lab_t& lab = labs[init];

        // check if label is anonymous
        //printf("Name: %s\n", lab.name);
        //printf("Offset: %d\n", rel);
        if (lab.name == null) {
            rel += offset > 0 ? 1 : -1;
        };

        // check if reached destinated label
        if (rel == offset) {
            //printf("Result: %04X\n", lab.pos);
            return lab.pos;
        };

        // shift label pointer
        if (offset > 0)
            init++;
        else
            init--;
    };

    // invalid branch
    glerr.data = (mt)errorMessage[48];
    glerr.line = line;
    raise(glerr);
    return 0;
};

// assemble argument
req_t assembleArgument(vec<var_t>& heap, arg_t& arg, bool strings, bool branches, bool requests) {
    req_t ret;

    // check if root is string
    if (arg.value.type == 3) {
        // check for incompatabilities
        if (strings == false || branches) {
            char text[256];
            sprintf(text, errorMessage[40], dataName[arg.value.type]);

            glerr.data = text;
            glerr.line = arg.value.line;
            raise(glerr);
        };

        // check for operations
        if (!arg.ops.empty()) {
            char text[256];
            sprintf(text, errorMessage[25], dataName[arg.value.type]);

            glerr.data = text;
            glerr.line = arg.value.line;
            raise(glerr);
        };
        // check for constant
        if (arg.value.lit) {
            char text[256];
            sprintf(text, errorMessage[31], dataName[arg.value.type]);

            glerr.data = text;
            glerr.line = arg.value.line;
            raise(glerr);
        };

        ret.arg = arg;
        return ret;
    };

    // check if root is register
    if (arg.value.type >= 5) {
        // check for incompatabilities
        if (branches) {
            char text[256];
            sprintf(text, errorMessage[40], dataName[arg.value.type]);

            glerr.data = text;
            glerr.line = arg.value.line;
            raise(glerr);
        };

        // check for operations
        if (!arg.ops.empty()) {
            char text[256];
            sprintf(text, errorMessage[25], dataName[arg.value.type]);

            glerr.data = text;
            glerr.line = arg.value.line;
            raise(glerr);
        };
        // check for constant
        if (arg.value.lit) {
            char text[256];
            sprintf(text, errorMessage[31], dataName[arg.value.type]);

            glerr.data = text;
            glerr.line = arg.value.line;
            raise(glerr);
        };

        ret.arg = arg;
        return ret;
    };

    // check if root is offset
    if (arg.value.type == 4) {
        // check for operations
        if (!arg.ops.empty()) {
            char text[256];
            sprintf(text, errorMessage[25], dataName[arg.value.type]);

            glerr.data = text;
            glerr.line = arg.value.line;
            raise(glerr);
        };
        // check for constant
        if (arg.value.lit) {
            char text[256];
            sprintf(text, errorMessage[31], dataName[arg.value.type]);

            glerr.data = text;
            glerr.line = arg.value.line;
            raise(glerr);
        };

        // create short label request
        ret.arg.value.line = arg.value.line;
        ret.arg.value.num = arg.value.num;
        ret.arg.value.type = 4;
        ret.size = 1 + (branches ? 0 : 1);
        return ret;
    };

    // check root value
    if (arg.value.type == 0) {
        // check for value
        var_t* var = getVar(heap, arg.value.str);
        if (var == null) {
            // check for requests
            if (!requests) {
                glerr.data = (mt)errorMessage[46];
                glerr.line = arg.value.line;
                raise(glerr);
            };

            // request full value
            ret.arg.value = arg.value;
            ret.size = 2;
            ret.used = true;
            for (operation_t& op : arg.ops) {
                // check if name
                if (op.value.type == 0) {
                    var_t* operand = getVar(heap, op.value.str);

                    // if unknown
                    if (operand == null) {
                        // check for requests
                        if (!requests) {
                            glerr.data = (mt)errorMessage[46];
                            glerr.line = op.value.line;
                            raise(glerr);
                        };

                        // push raw data
                        ret.arg.ops.push_back(op);
                        continue;
                    };

                    // create variable data
                    operation_t nop;
                    nop.value.line = op.value.line;
                    nop.value.lit = op.value.lit;
                    nop.value.type = operand->size;
                    nop.value.num = operand->data;
                    nop.action = op.action;

                    // add new operation
                    ret.arg.ops.push_back(nop);
                    continue;
                };
                // check if number
                if (op.value.type == 1 || op.value.type == 2) {
                    ret.arg.ops.push_back(op);
                    continue;
                };
                // invalid operand type
                char text[256];
                sprintf(text, errorMessage[25], dataName[op.value.type]);

                glerr.data = text;
                glerr.line = arg.value.line;
                raise(glerr);
            };
            return ret;
        };

        // place root value
        ret.arg.value.type = var->size;
        ret.arg.value.num = var->data;
        ret.arg.value.line = arg.value.line;
        ret.arg.value.lit = arg.value.lit;
    };

    // check for number
    if (arg.value.type == 1 || arg.value.type == 2) {
        ret.arg.value = arg.value;
    };

    // parse operations
    for (dt i = 0; i < (dt)arg.ops.size(); i++) {
        // check operand type
        if (arg.ops[i].value.type == 1 || arg.ops[i].value.type == 2) {
            apply(arg.ops[i].action, ret.arg.value, arg.ops[i].value);

        } else if (arg.ops[i].value.type == 0) {
            var_t* var = getVar(heap, arg.ops[i].value.str);
            if (var == null) {
                // check for requests
                if (!requests) {
                    glerr.data = (mt)errorMessage[46];
                    glerr.line = arg.ops[i].value.line;
                    raise(glerr);
                };

                // return request
                ret.size = 2;
                ret.used = true;
                for (; i < (dt)arg.ops.size(); i++) {
                    operation_t& op = arg.ops[i];

                    // check if name
                    if (op.value.type == 0) {
                        var_t* operand = getVar(heap, op.value.str);

                        // if unknown
                        if (operand == null) {
                            // check for requests
                            if (!requests) {
                                glerr.data = (mt)errorMessage[46];
                                glerr.line = op.value.line;
                                raise(glerr);
                            };

                            // push raw data
                            ret.arg.ops.push_back(op);
                            continue;
                        };

                        // create variable data
                        operation_t nop;
                        nop.value.line = op.value.line;
                        nop.value.lit = op.value.lit;
                        nop.value.type = operand->size;
                        nop.value.num = operand->data;
                        nop.action = op.action;

                        // add new operation
                        ret.arg.ops.push_back(nop);
                        continue;
                    };
                    // check if number
                    if (op.value.type == 1 || op.value.type == 2) {
                        ret.arg.ops.push_back(op);
                        continue;
                    };

                    // invalid operand type
                    char text[256];
                    sprintf(text, errorMessage[25], dataName[op.value.type]);

                    glerr.data = text;
                    glerr.line = arg.value.line;
                    raise(glerr);
                };
                return ret;
            };

            // create variable data
            data_t data;
            data.line = arg.value.line;
            data.lit = arg.value.lit;
            data.type = var->size;
            data.num = var->data;

            // apply value from variable
            apply(arg.ops[i].action, ret.arg.value, data);

        } else {
            // invalid operand type
            char text[256];
            sprintf(text, errorMessage[25], dataName[arg.ops[i].value.type]);

            glerr.data = text;
            glerr.line = arg.value.line;
            raise(glerr);
        };
    };

    // return number
    ret.size = ret.arg.value.type;
    return ret;
};

// assemble unknown
void assembleUnknown(crt_t& crt, unv_t& unv) {
    wt result;

    // check root value
    if (unv.req.arg.value.type == 0) {
        // get label address
        lab_t* lab = getLabel(crt.labs, unv.req.arg.value.str);

        // validate label
        if (lab == null) {
            char text[256];
            sprintf(text, errorMessage[50], unv.req.arg.value.str);

            glerr.data = text;
            glerr.line = unv.req.arg.value.line;
            raise(glerr);
        };

        // set initial value
        //printf("%s = %04X\n", unv.req.arg.value.str, lab->pos);
        result = lab->pos;

    } else if (unv.req.arg.value.type == 1 || unv.req.arg.value.type == 2) {
        // set initial value
        result = unv.req.arg.value.num;

    } else if (unv.req.arg.value.type == 4) {
        // set initial value
        result = getAddress(crt.labs, unv.lab, unv.req.arg.value.num, unv.req.arg.value.line);
        //printf("%s = %04X\n", null, result);

    } else {
        // invalid root type
        char text[256];
        sprintf(text, errorMessage[49], dataName[unv.req.arg.value.type]);

        glerr.data = text;
        glerr.line = unv.req.arg.value.line;
        raise(glerr);
    };

    // parse operations
    for (operation_t& op : unv.req.arg.ops) {
        // if name
        if (op.value.type == 0) {
            // get label address
            lab_t* lab = getLabel(crt.labs, op.value.str);

            // validate label
            if (lab == null) {
                char text[256];
                sprintf(text, errorMessage[50], unv.req.arg.value.str);

                glerr.data = text;
                glerr.line = unv.req.arg.value.line;
                raise(glerr);
            };

            data_t a;
            a.num = result;
            a.type = 2;
            apply(op.action, a, op.value);
            result = a.num;
            continue;
        };
        // if number
        if (op.value.type == 1 || op.value.type == 2) {
            data_t a;
            a.num = result;
            a.type = 2;
            apply(op.action, a, op.value);
            result = a.num;
            continue;
        };

        // invalid root type
        char text[256];
        sprintf(text, errorMessage[25], dataName[op.value.type]);

        glerr.data = text;
        glerr.line = unv.req.arg.value.line;
        raise(glerr);
    };

    // store values
    if (unv.type) {
        int rel = result - unv.root;

        // verify distance
        if (rel >= 128) {
            char text[256];
            sprintf(text, errorMessage[37], rel);

            glerr.data = text;
            glerr.line = unv.req.arg.value.line;
            raise(glerr);
        };
        if (rel < -128) {
            char text[256];
            sprintf(text, errorMessage[38], rel);

            glerr.data = text;
            glerr.line = unv.req.arg.value.line;
            raise(glerr);
        };

        crt.data[unv.ref.str].data[unv.ref.id] = (bt)rel;
    } else {
        crt.data[unv.ref.str].data[unv.ref.id + 0] = result & 0xFF;
        crt.data[unv.ref.str].data[unv.ref.id + 1] = result >> 0x8;
    };
};

// assemble unit
void assembleUnit(crt_t& crt, asm_t& unit, vec<unv_t>& reqs) {
    // print unit data
    if (unit.opcode != Int::Invalid)
        printf("Opc: %s\n", instructionNames[unit.opcode]);
    if (unit.label)
        printf("Lab: %s\n", unit.label);

    for (arg_t& a : unit.data) {
        printData(a.value);
        for (operation_t& b : a.ops) {
            printf("%s ", operatorName[b.action]);
            printData(b.value);
        };
    };

    // validate
    if (!unit.valid)
        return;

    // check for anonymous label
    if (unit.rel) {
        lab_t label;
        label.name = null;
        label.pos = crt.spos;
        crt.labs.push_back(label);
        printf("\n");
        return;
    };

    // check for label
    if (unit.label) {
        lab_t label;
        label.name = unit.label;
        label.pos = crt.spos;
        crt.labs.push_back(label);
        printf("\n");
        return;
    };

    // check for opcode
    if (unit.opcode < Int::Count) {
        // fetch addressing mode
        AddrMode mode = AddrMode::IMP;
        bt unknown = 0;
        bt length = 0;
        wt param = 0;
        unv_t unv;

        // parse each argument
        for (arg_t& element : unit.data) {
            req_t req = assembleArgument(crt.heap, element, false, isBranch(unit.opcode), true);
            printRequest(req);

            // adjust addressing mode
            if (req.arg.value.type == 0 || req.used) {
                if (mode == AddrMode::IMP) {
                    mode = req.size == 2 ? (req.arg.value.lit ? AddrMode::DIM : AddrMode::DIR) : (req.arg.value.lit ? AddrMode::IMM : AddrMode::ZPG);
                    unknown = req.size;
                    unv.req = req;
                    continue;
                };
            } else if (req.arg.value.type == 1) {
                if (mode == AddrMode::IMP) {
                    mode = req.arg.value.lit ? AddrMode::IMM : AddrMode::ZPG;
                    length = 1;
                    param = req.arg.value.num;
                    continue;
                };

            } else if (req.arg.value.type == 2) {
                if (mode == AddrMode::IMP) {
                    mode = req.arg.value.lit ? AddrMode::DIM : AddrMode::DIR;
                    length = 2;
                    param = req.arg.value.num;
                    continue;
                };

            } else if (req.arg.value.type == 4) {
                if (mode == AddrMode::IMP) {
                    mode = isBranch(unit.opcode) ? AddrMode::REL : AddrMode::DIR;
                    unknown = 1;
                    unv.req = req;
                    unv.type = isBranch(unit.opcode);
                    continue;
                };

            } else if (req.arg.value.type == 5) {
                if (mode == AddrMode::IMP) {
                    mode = AddrMode::ACC;
                    continue;
                };

            } else if (req.arg.value.type == 6) {
                if (mode == AddrMode::IMP) {
                    mode = AddrMode::BUF;
                    continue;
                };

            } else if (req.arg.value.type == 7) {
                if (mode == AddrMode::IMP) {
                    mode = isIndirect(unit.opcode) ? AddrMode::IND : AddrMode::ZPX;
                    length = isIndirect(unit.opcode) ? 0 : 1;
                    continue;
                };
                if (mode == AddrMode::ZPG) {
                    mode = AddrMode::ZPX;
                    length = 1;
                    param = req.arg.value.num;
                    continue;
                };
                if (mode == AddrMode::DIR) {
                    mode = AddrMode::DRX;
                    length = 2;
                    param = req.arg.value.num;
                    continue;
                };

            } else if (req.arg.value.type == 8) {
                if (mode == AddrMode::IMP) {
                    mode = AddrMode::ZPY;
                    length = 1;
                    param = req.arg.value.num;
                    continue;
                };
                if (mode == AddrMode::ZPG) {
                    mode = AddrMode::ZPY;
                    length = 1;
                    param = req.arg.value.num;
                    continue;
                };
                if (mode == AddrMode::DIR) {
                    mode = AddrMode::DRY;
                    length = 2;
                    param = req.arg.value.num;
                    continue;
                };

            };

            // invalid addressing mode part
            char text[256];
            sprintf(text, errorMessage[43], addrModeNames[mode]);

            glerr.data = text;
            glerr.line = req.arg.value.line;
            raise(glerr);
        };

        // check if addressing mode is available
        bt opcode = opcodeMatrix[unit.opcode][mode];

        // if failed try again with word addressing modes
        if (opcode == NOPC) {
            if (mode == AddrMode::IMM) {
                opcode = opcodeMatrix[unit.opcode][AddrMode::DIM];
                length = 2;
            } else if (mode == AddrMode::ZPG) {
                opcode = opcodeMatrix[unit.opcode][AddrMode::DIR];
                length = 2;
            } else if (mode == AddrMode::ZPX) {
                opcode = opcodeMatrix[unit.opcode][AddrMode::DRX];
                length = 2;
            } else if (mode == AddrMode::ZPY) {
                opcode = opcodeMatrix[unit.opcode][AddrMode::DRY];
                length = 2;
            };
        };

        // invalid addressing mode
        if (opcode == NOPC) {
            char text[256];
            sprintf(text, errorMessage[45], instructionNames[unit.opcode], addrModeNames[mode]);

            glerr.data = text;
            glerr.line = unit.line;
            raise(glerr);
        };

        // push opcode to stream
        crt.data.back().data.push_back(opcode);
        crt.spos++;

        // push opcode arguments
        if (unknown) {
            // create a value fill
            unv.lab = (dt)crt.labs.size();
            unv.root = crt.spos + unknown;
            unv.ref = streamRef(crt.data);
            reqs.push_back(unv);

            // push dummy data
            if (unknown == 1) {
                crt.data.back().data.push_back(0);
                crt.spos++;
            } else if (unknown == 2) {
                crt.data.back().data.push_back(0);
                crt.data.back().data.push_back(0);
                crt.spos += 2;
            };

        } else {
            // push argument
            if (length == 1) {
                crt.data.back().data.push_back(param & 0xFF);
                crt.spos++;
            } else if (length == 2) {
                crt.data.back().data.push_back(param & 0xFF);
                crt.data.back().data.push_back(param >> 0x8);
                crt.spos += 2;
            };
        };

        // print addressing mode
        printf("\e[38;5;192mMode: %s\n\e[0m", addrModeNames[mode]);
        printf("\n");

        return;
    };

    // process macros
    if (unit.opcode == Int::Set) {
        // check for empty arguments
        if (unit.data.empty()) {
            glerr.data = (mt)errorMessage[47];
            glerr.line = unit.line;
            raise(glerr);
        };

        // test for clean string
        if (!unit.data[0].ops.empty() || unit.data[0].value.type != 0) {
            glerr.data = (mt)errorMessage[41];
            glerr.line = unit.data[0].value.line;
            raise(glerr);
        };

        // parse value
        req_t req = assembleArgument(crt.heap, unit.data[1], false, false, false);

        // create new label
        var_t var;
        var.name = unit.data[0].value.str;
        var.span = 0;
        var.size = req.arg.value.type;
        var.data = req.arg.value.num;
        crt.heap.push_back(var);

    } else if (unit.opcode == Int::Spos) {
        // check for empty arguments
        if (unit.data.empty()) {
            glerr.data = (mt)errorMessage[47];
            glerr.line = unit.line;
            raise(glerr);
        };

        // parse value
        if (!unit.data[0].ops.empty() || unit.data[0].value.type >= 3) {
            glerr.data = (mt)errorMessage[42];
            glerr.line = unit.data[0].value.line;
            raise(glerr);
        };
        req_t req = assembleArgument(crt.heap, unit.data[0], false, false, false);

        // change relative position
        crt.spos = req.arg.value.num;

    } else if (unit.opcode == Int::Vpos) {
        // check for empty arguments
        if (unit.data.empty()) {
            glerr.data = (mt)errorMessage[47];
            glerr.line = unit.line;
            raise(glerr);
        };

        // parse value
        if (!unit.data[0].ops.empty() || unit.data[0].value.type >= 3) {
            glerr.data = (mt)errorMessage[42];
            glerr.line = unit.data[0].value.line;
            raise(glerr);
        };
        req_t req = assembleArgument(crt.heap, unit.data[0], false, false, false);

        // change relative position
        crt.vpos = req.arg.value.num;

    } else if (unit.opcode == Int::Fpos) {
        // check for empty arguments
        if (unit.data.empty()) {
            glerr.data = (mt)errorMessage[47];
            glerr.line = unit.line;
            raise(glerr);
        };

        // parse value
        if (!unit.data[0].ops.empty() || unit.data[0].value.type >= 3) {
            glerr.data = (mt)errorMessage[42];
            glerr.line = unit.data[0].value.line;
            raise(glerr);
        };
        req_t req = assembleArgument(crt.heap, unit.data[0], false, false, false);

        // change relative position
        crt.data.push_back(stream_t());
        crt.data.back().pos = req.arg.value.num;

    } else if (unit.opcode == Int::Byte) {
        // check for empty arguments
        if (unit.data.empty()) {
            glerr.data = (mt)errorMessage[47];
            glerr.line = unit.line;
            raise(glerr);
        };

        // parse each value
        for (arg_t& arg : unit.data) {
            req_t req = assembleArgument(crt.heap, arg, true, false, true);

            // check for unknown value
            if (req.arg.value.type == 0 || req.used) {
                char text[256];
                sprintf(text, errorMessage[18], dataName[2]);

                glerr.data = text;
                glerr.line = unit.line;
                raise(glerr);

            } else if (req.arg.value.type == 1) {
                crt.data.back().data.push_back(req.arg.value.num & 0xFF);
                crt.spos++;

            } else if (req.arg.value.type == 2) {
                char text[256];
                sprintf(text, errorMessage[18], dataName[2]);

                glerr.data = text;
                glerr.line = unit.line;
                raise(glerr);

            } else if (req.arg.value.type == 3) {
                dt i = 0;
                while (true) {
                    char c = req.arg.value.str[i++];
                    if (c == 0x00)
                        break;

                    crt.data.back().data.push_back(c);
                    crt.spos++;
                };

            } else {
                glerr.data = (mt)errorMessage[42];
                glerr.line = unit.line;
                raise(glerr);
            };
        };

    } else if (unit.opcode == Int::Word) {
        // check for empty arguments
        if (unit.data.empty()) {
            glerr.data = (mt)errorMessage[47];
            glerr.line = unit.line;
            raise(glerr);
        };

        // parse each value
        for (arg_t& arg : unit.data) {
            req_t req = assembleArgument(crt.heap, arg, true, false, true);

            // check for unknown value
            if (req.arg.value.type == 0 || req.used) {
                unv_t unv;
                unv.req = req;
                unv.lab = (dt)crt.labs.size();
                unv.ref = streamRef(crt.data);
                reqs.push_back(unv);

                crt.data.back().data.push_back(0);
                crt.data.back().data.push_back(0);
                crt.spos += 2;

            } else if (req.arg.value.type == 1) {
                crt.data.back().data.push_back(req.arg.value.num & 0xFF);
                crt.data.back().data.push_back(0);
                crt.spos += 2;

            } else if (req.arg.value.type == 2) {
                crt.data.back().data.push_back(req.arg.value.num & 0xFF);
                crt.data.back().data.push_back(req.arg.value.num >> 0x8);
                crt.spos += 2;

            } else if (req.arg.value.type == 3) {
                dt i = 0;
                while (true) {
                    char c = req.arg.value.str[i++];
                    if (c == 0x00)
                        break;

                    crt.data.back().data.push_back(c);
                    crt.data.back().data.push_back(0);
                    crt.spos++;
                };

            } else {
                glerr.data = (mt)errorMessage[42];
                glerr.line = unit.line;
                raise(glerr);
            };
        };
    };

    printf("\n");
};

// assemble list
crt_t assembleList(vec<asm_t>& assembly) {
    vec<unv_t> reqs;
    crt_t crt;

    // create initial stream
    crt.data.push_back(stream_t());

    // assemble each unit
    for (asm_t& unit : assembly) {
        assembleUnit(crt, unit, reqs);
    };

    // process each value request
    for (unv_t& unv : reqs) {
        assembleUnknown(crt, unv);
    };

    // print data
    for (stream_t& str : crt.data) {
        printf("Stream %04X:\n", str.pos);
        for (dt i = 0; i < (dt)str.data.size(); i++) {
            printf("%02X ", str.data[i]);
            if (i % 16 == 15)
                printf("\n");
        };
        if ((int)str.data.size() % 16)
            printf("\n");
        printf("\n");
    };

    /*printf("Heap:\n");
    for (var_t& var : crt.heap) {
        printf("Name: %s\n", var.name);
        printf("Data: %04X\n", var.data);
        printf("Span: %d\n", var.span);
        printf("Size: %d\n", var.size);
        printf("\n");
    };

    printf("Labels:\n");
    for (lab_t& lab : crt.labs) {
        printf("Name: %s\n", lab.name);
        printf("Pos: %04X\n", lab.pos);
        printf("\n");
    };*/

    // return constructor
    return crt;
};

// create file from assembly
file_t assembleFile(crt_t& crt, st filename) {
    file_t file;
    file.name = filename;

    // push each stream
    for (stream_t& str : crt.data) {
        // expand buffer
        dt size = (dt)str.data.size() + str.pos;
        if ((dt)file.data.size() < size) {
            for (dt i = (dt)file.data.size(); i < size; i++)
                file.data.push_back(0);
        };

        // fill values
        for (dt i = 0; i < (dt)str.data.size(); i++)
            file.data[i + str.pos] = str.data[i];
    };

    // print buffer
    /*for (dt i = 0; i < (dt)file.data.size(); i++) {
        printf("%02X ", file.data[i]);
        if (i % 16 == 15)
            printf("\n");
    };
    if ((int)file.data.size() % 16)
        printf("\n");*/

    // success
    file.valid = true;
    return file;
};
