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
