class Node {
  int data;
  Node? left, right;

  // Node(this.data);
  Node(this.data, [this.left, this.right]);
}

class BinarySearchTree {
  Node? root;

  void insert(int data) {
    Node? currentNode = root;

    if (currentNode == null) {
      root = Node(data);
      return;
    }
    while (true) {
      if (data < currentNode!.data) {
        if (currentNode.left == null) {
          currentNode.left = Node(data);
          break;
        } else {
          currentNode = currentNode.left;
        }
      } else {
        if (currentNode.right == null) {
          currentNode.right = Node(data);
          break;
        } else {
          currentNode = currentNode.right;
        }
      }
    }
  }

  bool isContains(int data) {
    Node? currentNode = root;
    while (currentNode != null) {
      if (data < currentNode.data) {
        currentNode = currentNode.left;
      } else if (data > currentNode.data) {
        currentNode = currentNode.right;
      } else {
        return true;
      }
    }
    return false;
  }

  void delete(int data) {
    root = deleteNode(root, data);
  }

  Node? deleteNode(Node? node, int data) {
    if (node == null) {
      return null;
    }
    if (data < node.data) {
      node.left = deleteNode(node.left, data);
    } else if (data > node.data) {
      node.right = deleteNode(node.right, data);
    } else {
      if (node.left == null) {
        return node.right;
      } else if (node.right == null) {
        return node.left;
      } else {
        Node minNode = findMin(node.right!);
        node.data = minNode.data;
        node.right = deleteNode(node.right, minNode.data);
      }
    }
    return node;
  }

  findMin(Node node) {
    while (node.left != null) {
      node = node.left!;
    }
    return node.data;
  }

  findMax(Node node) {
    while (node.right != null) {
      node = node.right!;
    }
    return node.data;
  }

  void inOrder() {
    inOrderHelper(root);
  }

  void inOrderHelper(Node? node) {
    if (node != null) {
      inOrderHelper(node.left);
      print(node.data);
      inOrderHelper(node.right);
    }
  }

  void preOrder() {
    preOrderHelper(root);
  }

  void preOrderHelper(Node? node) {
    if (node != null) {
      print(node.data);
      preOrderHelper(node.left);
      preOrderHelper(node.right);
    }
  }

  void postOrder() {
    postOrderHelper(root);
  }

  void postOrderHelper(Node? node) {
    if (node != null) {
      postOrderHelper(node.left);
      postOrderHelper(node.right);
      print(node.data);
    }
  }

  findClosestValue(Node? node, int target) {
    int closestVal = node!.data;
    while (node != null) {
      if ((node.data - target).abs() < (closestVal - target).abs()) {
        closestVal = node.data;
      }
      if (target < node.data) {
        node = node.left;
      } else if (target > node.data) {
        node = node.right;
      } else {
        break;
      }
    }
    return closestVal;
  }

  bool isValidBST(Node? node) {
    return isBSTHelper(root, null, null);
  }

  bool isBSTHelper(Node? node, int? minVal, int? maxVal) {
    if (node == null) {
      return true;
    }

    if ((minVal != null && node.data <= minVal ||
        maxVal != null && node.data >= maxVal)) {
      return false;
    }
    bool isLeftValid = isBSTHelper(node.left, minVal, node.data);
    bool isRightValid = isBSTHelper(node.right, node.data, maxVal);

    return isLeftValid && isRightValid;
  }

  int findHeight(Node? node) {
    if (node == null) {
      return -1;
    } else {
      int left = findHeight(node.left);
      int right = findHeight(node.right);
      return 1 + (left > right ? left : right);
    }
  }

  void breadth(Node? node) {
    if (node == null) {
      return;
    }
    List<Node> arr = [];
    arr.add(node);

    while (arr.isNotEmpty) {
      Node node = arr.removeAt(0);
      print(node.data);

      if (node.left != null) {
        arr.add(node.left!);
      }
      if (node.right != null) {
        arr.add(node.right!);
      }
    }
  }
  
  bool isSubtree(BinarySearchTree subtree) {
    return subtreeHelper(root, subtree.root);
  }

  subtreeHelper(Node? maintree, Node? subtree) {
    if (subtree == null) {
      return true;
    }
    if (maintree == null) {
      return false;
    }
    if (maintree.data == subtree.data && isMatch(maintree, subtree)) {
      return true;
    }
    return subtreeHelper(maintree.left, subtree) &&
        subtreeHelper(maintree.right, subtree);
  }

 isMatch(Node? node1, Node? node2) {
    if (node1 == null && node2 == null) {
      return true;
    }
    if (node1 == null || node2 == null) {
      return false;
    }
    if (node1.data != node2.data) {
      return false;
    }
    return isMatch(node1.left, node2.left) && isMatch(node1.right, node2.right);
  }
}

void main() {
  BinarySearchTree tree = BinarySearchTree();

  tree.insert(40);
  tree.insert(30);
  tree.insert(25);
  tree.insert(35);
  tree.insert(50);
  tree.insert(45);
  tree.insert(60);
  // tree.insert(100);
  // tree.insert(20);
  // tree.insert(30);

  // tree.delete(18);

  // print(tree.isContains(18));
  // tree.inOrder();
  // tree.preOrder();
  // tree.postOrder();

  // print("closeset val: ${tree.findClosestValue(tree.root, 19)}");

  // // print(tree.isValidBST(tree.root));
  // print("min: ${tree.findMin(tree.root!)}");

  // print("max: ${tree.findMax(tree.root!)}");

  // print("height: ${tree.findHeight(tree.root!)}");

  // tree.breadth(tree.root);

  BinarySearchTree subtree = BinarySearchTree();

  subtree.insert(50);
  subtree.insert(45);
  subtree.insert(60);

  bool isSubtree = tree.isSubtree(subtree);
  print(isSubtree);

  // List<int> arr = [10, 45, 110, 15, 9];
  // for (int i = 0; i < arr.length; i++) {
  //   tree.insert(arr[i]);
  // }
  // tree.inOrder();
}
