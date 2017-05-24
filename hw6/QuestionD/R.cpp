void R()
{
    switch (token) {
    case '.':
        match('.');
        L();
        break;
    case '$':
        break;
    default:
        error();
    }
}
