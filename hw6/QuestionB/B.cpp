Node *B()
{
    Node *res;

    switch (token) {
    default:
    case 0:
        match(0);
        break;
    case 1:
        match(1);
        break;
    default:
        error();
    }

    return res;
}