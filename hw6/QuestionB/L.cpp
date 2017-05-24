Node *L()
{
    Node *Bnptr, Lsnptr;
    Node *res;

    switch (token) {
    case 0:
    case 1:
        Bnptr = B();
        Lsnptr = Ls();

        res = Lsnptr;
        res.val = Bnptr.val * Lsnptr.base + Lsnptr.val;
        res.base *= 2;
        break;
    case '$':
        res = mknode(1, 0);
        break;
    default:
        error();
    }

    return res;
}
