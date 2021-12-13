// -- parameter parser -- //

// parameter parser
param_t parseParams(int argc, st* argv) {
    param_t param;

    // check array size
    if (argc <= 1) {
        glerr.data = (mt)errorMessage[0];
        raise(glerr);
    };

    // process each string
    char last_flag = '?';
    bt arg = 0;

    for (int i = 1; i < argc; i++) {
        st str = argv[i];

        // expecting new flag / input
        if (arg == 0) {
            // check for flag
            if (str[0] == '-') {
                // check for empty argument
                if (arg) {
                    char text[128];
                    sprintf(text, errorMessage[1], str[0]);

                    glerr.data = text;
                    raise(glerr);
                };

                // check for right sized flag
                if (str[2]) {
                    glerr.data = (mt)errorMessage[2];
                    raise(glerr);
                };

                // process flag
                switch (str[1]) {
                    // disable warnings
                    case 'W':
                    case 'w':
                    param.warnings = true;
                    break;

                    // show help message
                    case 'H':
                    case 'h':
                    param.document = true;
                    break;

                    // set colored output
                    case 'C':
                    case 'c':
                    param.color = true;
                    colored = true;
                    break;

                    // add new library
                    case 'L':
                    case 'l':
                    arg = 1;
                    break;

                    // set output
                    case 'O':
                    case 'o':
                    arg = 2;
                    break;

                    // unknown flag
                    default:
                    char text[256];
                    sprintf(text, errorMessage[4], str[1]);

                    glerr.data = text;
                    raise(glerr);
                };
                last_flag = str[1];
            }

            // set input
            else {
                param.inp = (mt)str;
            };
        }

        // expecting string
        else {
            // add new library
            if (arg == 1) {
                param.lib.push_back((mt)str);
            }
            // set output
            else if (arg == 2) {
                param.out = (mt)str;
            };
            arg = 0;
        };
    };

    // check for unspecified argument
    if (arg) {
        char text[128];
        sprintf(text, errorMessage[1], last_flag);

        glerr.data = text;
        raise(glerr);
    };

    // check for empty input
    if (param.inp == null) {
        glerr.data = (mt)errorMessage[5];
        raise(glerr);
    };

    // check for empty output
    if (param.out == null) {
        param.out = transformFilename(param.inp, true);
    };

    // success
    return param;
};
