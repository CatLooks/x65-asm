// -- core file -- //

// standard library
#include <cstring>
#include <cstdlib>
#include <cstdio>
#include <vector>

// project types
#define null __null
#define vec std::vector
typedef unsigned short wt;
typedef unsigned char bt;
typedef unsigned int dt;
typedef const char* st;
typedef char* mt;
#include "structs.h"

// include project
#include "error.h"
#include "opcodes.h"
#include "macros.h"
#include "file.h"
#include "params.h"
#include "token.h"
#include "translate.h"
#include "assemble.h"

// program entry
int main(int argc, st* argv) {
    // toggle escape mode
    system("color");

    // parse parameters
    param_t param = parseParams(argc, argv);

    // open root file
    file_t root = fileRead(param.inp);
    glerr.file = &root;

    // tokenize root file
    token_t token = tokenizeFile(root);

    // translate root token
    vec<asm_t> assembly;
    translateToken(assembly, token);

    // assemble code
    crt_t code = assembleList(assembly);

    // save assembly
    file_t out = assembleFile(code, param.out);
    fileWrite(out);

    // success
    return 0;
};
