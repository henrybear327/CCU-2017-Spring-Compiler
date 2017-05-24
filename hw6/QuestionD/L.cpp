Node *L(int side)
{
    Node *Bnptr, *Lsnptr;
    Node *res;

    switch (token) {
    case 0:
    case 1:
        Bnptr = B();
        Lsnptr = Ls(side);

        res = Lsnptr;
        res.len = 1 + Lsnptr.len;
        res.val = (side == 1) ? B.val * get_power(res.len - 1) + Lsnptr.val
                  : B.val / 2 + Lsnptr.val / 2;
        break;
    case '$':
        res = mknode(1, 0);
        break;
    default:
        error();
    }

    return res;
}
