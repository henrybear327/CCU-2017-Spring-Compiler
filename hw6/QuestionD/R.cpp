Node *R(int side)
{
    Node *Lnptr;
    Node *res;

    switch (token) {
    case '.':
        match('.');
        Lnptr = L(side);

        res = Lnptr;
        break;
    case '$':
        res = mknode(1, 0);
        break;
    default:
        error();
    }

    return res;
}
