Node *S()
{
    Node *Lnptr, *Rnptr;
    Node *res;
    switch (token) {
    case 0:
    case 1:
        Lnptr = L();
        Rnptr = R();

        res = Rnptr;
        res.val = Lnptr.val + Rnptr.val / Rnptr.base;
        break;
    case '$':
        res = mknode(1, 0);
        break;
    default:
        error();
    }

    return res;
}
