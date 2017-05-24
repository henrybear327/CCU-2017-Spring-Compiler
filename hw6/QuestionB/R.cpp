Node *R()
{
    Node *Lnptr;
    Node *res;
    switch (token) {
    case '.':
        match('.');

        Lnptr = L();

        res = Lnptr;
        break;
    case '$':
        break;
    default:
        error();
    }

    return res;
}
