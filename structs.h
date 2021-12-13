// -- project structures -- //

// parsed data object
struct data_t {
    bool lit;
    dt line;
    bt type;
    mt str;
    wt num;

    // constructor
    data_t () {
        lit = false;
        str = null;
        line = 0;
        type = 0;
    };
};

// operation object
struct operation_t {
    enum operator_t {
        None, And, Or, Xor, Add, Sub, Mul, Div, Shl, Shr, Count
    };

    operator_t action;
    data_t value;

    // constructor
    operation_t () {
        action = operator_t::None;
    };
};
typedef operation_t::operator_t Operator;

// operator names
st operatorName[] {
    "?", "&", "|", "^", "+", "-", "*", "/", "<<", ">>", null
};

// argument object
struct arg_t {
    vec<operation_t> ops;
    data_t value;
};

// error object
struct error_t {
    struct file_t* file;
    bool type;
    dt line;
    mt data;

    // constructor
    error_t () {
        file = null;
        data = null;
        type = true;
    };
};

// file object
struct file_t {
    vec<bt> data;
    bool valid;
    st name;

    // constructor
    file_t () {
        valid = false;
        name = null;
    };
};

// parameter collection object
struct param_t {
    bool warnings;
    bool document;
    bool color;

    vec<mt> lib;
    mt out, inp;

    // constuctor
    param_t () {
        document = false;
        warnings = false;
        color = false;
        out = null;
        inp = null;
    };
};

// token object
struct token_t {
    vec<struct token_t> arr;
    mt str;
    dt line;
    bt type;

    // constructor
    token_t () {
        str = null;
        line = 0;
        type = 0;
    };
};

// label object
struct lab_t {
    mt name;
    wt pos;
};

// variable object
struct var_t {
    mt name;
    wt span;
    wt data;
    bt size;
};

// request object
struct req_t {
    arg_t arg;
    bool used;
    bt size;

    // constructor
    req_t () {
        used = false;
        size = 0;
    };
};

// byte stream
struct stream_t {
    vec<bt> data;
    dt pos;

    // constructor
    stream_t () {
        pos = 0;
    };
};

// reference object
struct ref_t {
    dt str;
    dt id;

    // constructor
    ref_t () {
        str = 0;
        id = 0;
    };
};

// unknown object
struct unv_t {
    bool type;
    req_t req;
    ref_t ref;
    wt root;
    dt lab;

    // constructor
    unv_t () {
        type = false;
        root = 0;
        lab = 0;
    };
};

// constructor object
struct crt_t {
    vec<stream_t> data;
    vec<lab_t> labs;
    vec<var_t> heap;
    dt vpos;
    dt spos;
    dt size;

    // constructor :)
    crt_t () {
        vpos = 0;
        spos = 0;
        size = 0;
    };
};
