void L()
{
    switch (token) {
    case 0:
    case 1:
        B();
		Ls();
        break;
	case '$':
		break;
    default:
        error();
    }
}
