// -- tokenizer functions -- //

// tokenize line
token_t tokenizeLine(vec<char>& str, dt line) {
    token_t result;
    vec<char> data;
    bt type = 0;

    // stack
    vec<token_t>* pointer = &result.arr;
    vec<vec<token_t>*> pointer_stack;

    // flags
    bool quotes = false;
    bool escape = false;

    // parse each character
    for (char c : str) {
        // check for string data
        if (quotes) {
            // check for escape sequence
            if (escape) {
                data.push_back(c);
                escape = false;

            } else {
                // check for escape start
                if (c == '\\') {
                    data.push_back('\\');
                    escape = true;
                }

                // check for string end
                else if (c == '"') {
                    // create string token
                    data.push_back('"');
                    data.push_back(0);

                    token_t token;
                    token.str = createString(data);
                    token.line = line;
                    token.type = 7;
                    pointer->push_back(token);

                    data.clear();
                    quotes = false;
                }

                // add string character to token
                else {
                    data.push_back(c);
                };
            };
        } else {
            // check for comment
            if (c == '@') {
                break;
            };

            // check for quote
            if (c == '"') {
                // start new string
                data.push_back(0);

                token_t token;
                token.str = createString(data);
                token.line = line;
                token.type = type;
                pointer->push_back(token);

                data.clear();
                data.push_back('"');
                quotes = true;
                continue;
            };

            // check for opening parenthesis
            if (c == '(') {
                // check for uncompleted token
                if (!data.empty()) {
                    data.push_back(0);

                    token_t token;
                    token.str = createString(data);
                    token.line = line;
                    token.type = type;
                    pointer->push_back(token);

                    data.clear();
                    type = 0;
                };

                // push stack pointer
                pointer_stack.push_back(pointer);
                pointer->push_back(token_t());
                pointer = &pointer->back().arr;
                continue;
            };

            // check for closing parethesis
            if (c == ')') {
                // check for uncompleted token
                if (!data.empty()) {
                    data.push_back(0);

                    token_t token;
                    token.str = createString(data);
                    token.line = line;
                    token.type = type;
                    pointer->push_back(token);

                    data.clear();
                    type = 0;
                };

                // check for available pointers
                if (pointer_stack.empty()) {
                    glerr.data = (mt)errorMessage[9];
                    glerr.line = line;
                    raise(glerr);
                };

                // pop stack pointer
                pointer = pointer_stack.back();
                pointer_stack.pop_back();
                continue;
            };

            // get character type
            bt t = characterType[(bt)c];

            // validate character type
            if (t == 0) {
                char text[256];
                sprintf(text, errorMessage[7], c, c);

                glerr.data = text;
                glerr.line = line;
                raise(glerr);
            };

            if (type == 0) {
                // start new token
                data.push_back(c);
                type = t;

            } else if (t != type) {
                // add new token
                data.push_back(0);

                token_t token;
                token.str = createString(data);
                token.line = line;
                token.type = type;
                pointer->push_back(token);

                data.clear();
                data.push_back(c);
                type = t;
            } else {
                // add character to token
                data.push_back(c);
            };
        };
    };

    // check for uncompleted token
    if (!data.empty()) {
        data.push_back(0);

        token_t token;
        token.str = createString(data);
        token.line = line;
        token.type = type;
        pointer->push_back(token);
    };

    // check for not closed string
    if (quotes) {
        glerr.data = (mt)errorMessage[11];
        glerr.line = line;
        raise(glerr);
    };

    // check for not closed parentheses
    if (pointer_stack.size()) {
        glerr.data = (mt)errorMessage[12];
        glerr.line = line;
        raise(glerr);
    };

    // success
    result.line = line;
    return result;
};

// tokenize file
token_t tokenizeFile(file_t& file) {
    token_t token;
    vec<char> str;
    dt line = 1;

    // parse each line
    for (char c : file.data) {
        if (isValid(c)) {
            // process new line
            if (c == '\n') {
                // check for empty string
                if (!str.empty()) {
                    token.arr.push_back(tokenizeLine(str, line));
                    str.clear();
                };
                line++;
            }

            // process character
            else {
                str.push_back(c);
            };
        };
    };

    // success
    return token;
};

// print token info
void tokenInfo(token_t& token, int level = 1) {
    if (token.arr.empty()) {
        if (token.type == 0)
            return;

        printTab(level, "  ");
        printf("Data: <%s>\n", token.str);
        printTab(level, "  ");
        printf("Line: %d\n", token.line);
        printTab(level, "  ");
        printf("Type: %d\n", token.type);
        printf("\n");
    } else {
        for (token_t& child : token.arr) {
            tokenInfo(child, level + 1);
        };
    };
};
