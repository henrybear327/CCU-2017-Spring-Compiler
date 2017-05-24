Node *B()
{
    Node *res;

    switch (token) {
    default:
    case 0:
        match(0);
        res = mknode(1, 0);
        break;
    case 1:
        match(1);
        res = mknode(1, 1);
        break;
    default:
        error();
    }

    return res;
}
