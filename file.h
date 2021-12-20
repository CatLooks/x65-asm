// -- file manager -- //

// file reader
file_t fileRead(st filename) {
    file_t file;
    file.name = filename;

    // try opening file stream
    FILE* fp = fopen(filename, "r");
    if (fp == null) {
        fclose(fp);
        char text[256];
        sprintf(text, errorMessage[6], filename);

        glerr.data = text;
        raise(glerr);
    };

    // read symbols from file
    while (true) {
        bt c = fgetc(fp);
        if (feof(fp))
            break;
        file.data.push_back(c);
    };
    file.data.push_back('\n');

    // success
    file.valid = true;
    fclose(fp);
    return file;
};

// file reader
file_t fileLoad(st filename) {
    file_t file;
    file.name = filename;

    // try opening file stream
    FILE* fp = fopen(filename, "rb");
    if (fp == null) {
        fclose(fp);
        char text[256];
        sprintf(text, errorMessage[6], filename);

        glerr.data = text;
        raise(glerr);
    };

    // read symbols from file
    while (true) {
        bt c = fgetc(fp);
        if (feof(fp))
            break;
        file.data.push_back(c);
    };

    // success
    file.valid = true;
    fclose(fp);
    return file;
};

// file writer
void fileWrite(file_t& file) {
    if (!file.valid)
        return;

    // open file stream
    FILE* fp = fopen(file.name, "wb");
    if (fp == null) {
        fclose(fp);
        char text[256];
        sprintf(text, errorMessage[6], file.name);

        glerr.data = text;
        raise(glerr);
    };

    // write symbols
    for (bt c : file.data)
        fputc(c, fp);

    // success
    fclose(fp);
};
