class Node {
  int data;
  Node? next;
  Node? prev;
  Node(this.data);
}

class DLinkedList {
  Node? head;
  Node? tail;

  void addNode(int data) {
    Node newNode = Node(data);

    if (head == null) {
      head = newNode;
    } else {
      tail!.next = newNode;
      newNode.prev = tail;
    }
    tail = newNode;
  }

  void delete(int data) {
    Node? current = head;

    if (current == null) {
      return;
    }

    while (current != null) {
      if (current.data == data) {
        if (current == head) {
          head = current.next;
          head!.prev = null;
        } else if (current == tail) {
          tail = tail!.prev;
          tail!.next = null;
        } else {
          current.prev!.next = current.next;
          current.next!.prev = current.prev;
          return;
        }
      }
      current = current.next;
    }
  }

  void addBeg(int data) {
    Node newNode = Node(data);

    newNode.next = head;
    newNode.prev = null;
    head = newNode;
  }

  void addAfter(int after, int data) {
    Node? current = head;

    if (current == null) {
      return;
    }

    while (current != null) {
      if (current.data == after) {
        Node? newNode = Node(data);
        newNode.prev = current;
        newNode.next = current.next;
        current.next = newNode;

        if (newNode.next != null) {
          newNode.next!.prev = newNode;
        } else {
          tail = newNode;
        }
      }
      current = current.next;
    }
  }

  void reverse() {
    Node? current = tail;

    while (current != null) {
      print(current.data);
      current = current.prev;
    }
  }

  void display() {
    if (head == null) {
      print('empty');
      return;
    }

    Node? temp = head;

    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }
}

void main() {
  DLinkedList list = DLinkedList();

  list.addNode(10);
  list.addNode(20);
  list.addNode(30);
  list.addNode(40);
  list.addNode(50);
  list.addNode(60);

  // list.delete(60);

  list.addBeg(05);
  list.addAfter(20, 15);

  list.reverse();

  // list.display();
}
