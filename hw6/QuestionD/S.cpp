void S()
{
    switch (token) {
    case 0:
    case 1:
        L();
        R();
        break;
    case '$':
        break;
    default:
        error();
    }
}