void R()
{
    switch (token) {
    case '.':
        match('.');
        R();
        break;
    case '$':
        break;
    default:
        error();
    }
}
