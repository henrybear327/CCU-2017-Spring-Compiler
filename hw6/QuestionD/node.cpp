typedef struct node {
    double val;
    int base;
} Node;

Node mknode(int base, double val)
{
    Node *res = (Node *)malloc(sizeof(Node));
    res.base = base;
    res.val = val;

    return res;
}

int getPower(int power)
{
    int res = 1;
    for (int i = 1; i <= power; i++)
        res *= 2;
    return res;
}
