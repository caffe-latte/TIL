# 비선형 자료구조 (12) - BST 합

1. BST 합
```python
class TreeNode:
    def __init__(self, val):
        self.val = val
        self.left = None
        self.right = None

# Brute Force
def rangeSumBST_BF(root: TreeNode, L: int, R: int) -> int:
    if not root:
        return 0
    return (root.val if L <= root.val <= R else 0) + rangeSumBST_BF(root.left, L, R) + rangeSumBST_BF(root.right, L, R)
    
# DFS - Pruning
def rangeSumBST_DFS(root: TreeNode, L: int, R: int) -> int:
    def dfs(node: TreeNode):
        if not node:
            return 0
        
        if node.val < L:
            return dfs(node.right)
        elif node.val > R:
            return dfs(node.left)
        return node.val + dfs(node.left) + dfs(node.right)
    
    return dfs(root)
    
# DFS - Repeat
def rangeSumBST_DFSR(root: TreNode, L: int, R: int) -> int:
    stack, sum = [root], 0
    while stack:
        node = stack.pop()
        if node:
            if node.val > L:
                stack.append(node.left)
            if node.val < R:
                stack.append(node.right)
            if L <= node.val <= R
                sum += node.val
    return sum
    
# BFS
def rangeSumBST_BFS(root: TreeNode, L: int, R: int) -> int:
    stack, sum = [root], 0
    while stack:
        node = stack.pop(0)
        if node:
            if node.val > L:
                stack.append(node.left)
            if node.val < R:
                stack.append(node.right)
            if L <= node.val <= R:
                sum += node.val
    return sum
```
