typedef struct node {
	int val;
	int base;
} Node;

Node mknode(int base, int val)
{
	Node* res = (Node*)malloc(sizeof(Node));
	res.base = base;
	res.val = val;

	return res;
}
