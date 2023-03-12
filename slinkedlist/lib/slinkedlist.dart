class Node {
  int data;
  Node? next;

  Node(this.data);
}

class SLinkedList {
  Node? head;
  Node? tail;

  void addNode(int data) {
    Node newNode = Node(data);

    if (head == null) {
      head = newNode;
    } else {
      tail!.next = newNode;
    }
    tail = newNode;
  }

  void display() {
    if (head == null) {
      print("empty List");
      return;
    }
    Node? temp = head!;

    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }

  void delete(int data) {
    Node? temp = head, prev;

    if (temp == null) {
      return;
    }

    while (temp != null) {
      if (temp.data == data) {
        if (temp == head) {
          head = temp.next;
        } else {
          prev!.next = temp.next;
        }
      } else {
        prev = temp;
      }
      temp = temp.next;
    }
  }

  void addBeg(int data) {
    Node newNode = Node(data);
    newNode.next = head;
    head = newNode;
  }

  void addNextTo(int nextTo, int data) {
    Node newNode = Node(data);
    Node? temp = head;

    if (temp == null) {
      return;
    }

    while (temp != null && temp.data != nextTo) {
      temp = temp.next;
    }

    if (temp == tail) {
      tail!.next = newNode;
      tail = newNode;
    }
    newNode.next = temp!.next;
    temp.next = newNode;
  }

  void removeDuplicate() {
    Node? current = head;

    while (current != null) {
      Node runner = current;

      while (runner.next != null) {
        if (runner.next!.data == current.data) {
          runner.next = runner.next!.next;
        } else {
          runner = runner.next!;
        }
      }
      current = current.next;
    }
  }

  void reverse() {
    Node? prev;
    Node? current = head;

    while (current != null) {
      Node? nxt = current.next;

      current.next = prev;
      prev = current;
      current = nxt;
    }
    head = prev;
  }

  void midVal() {
    Node? temp = head, mid = head;

    while (temp != null && temp.next != null) {
      mid = mid!.next;
      temp = temp.next!.next;
    }
    print(mid!.data);
  }

  void recursion() {
    print('hi ');

    recursion();
  }

  // void binary() {
  //   Node? temp = head;
  //   String str = "";
  //   while (temp != null) {
  //     str = str + temp.data.toString();
  //     temp = temp.next;
  //   }
  //   print(int.parse(str, radix: 2));
  // }

  void binary() {
    Node? temp = head;
    int total = 0;
    while (temp != null) {
      total = total * 2 + temp.data;
      temp = temp.next;
    }
    print(total);
  }

  void arrDisplay() {
    Node? temp = head;

    List arr = [];

    while (temp != null) {
      arr.add(temp.data);
      temp = temp.next;
    }
    print(arr);
  }



  void before(int before, int data) {
    Node? newNode = Node(data);
    Node? temp = head;
    Node? prev;

    while (temp != null && temp.data != before) {
      prev = temp;
      temp = temp.next;
    }

    if (temp == head) {
      newNode.next = head;
      head = newNode;
    } else {
      newNode.next = temp;
      prev!.next = newNode;
    }
  }

    void sort() {
    Node? current = head, nxt;
    while (current != null) {
      nxt = current.next;
      while (nxt != null) {
        if (current.data > nxt.data) {
          int temp = nxt.data;
          nxt.data = current.data;
          current.data = temp;
        }
        nxt = nxt.next;
      }
      current = current.next;
    }
  }

  void insertionSort() {
    Node? temp = head!.next;
    while (temp != null) {
      Node? temp2 = head;
      while (temp2 != temp) {
        if (temp2!.data > temp.data) {
          int x = temp2.data;
          temp2.data = temp.data;
          temp.data = x;
        }
        temp2 = temp2.next;
      }
      temp = temp.next;
    }
  }

  void selectionSort() {
    Node? temp = head;
    while (temp != null) {
      Node? temp2 = temp;
      Node? min = temp;

      while (temp2 != null) {
        if (temp2.data < min!.data) {
          min = temp2;
        }
        temp2 = temp2.next;
      }
      int x = temp.data;
      temp.data = min!.data;
      min.data = x;
      temp = temp.next;
    }
  }
}

void main() {
  SLinkedList list = SLinkedList();

//   list.display();
  // list.addNode(90);
  // list.addNode(80);
  // list.addNode(1);
  // list.addNode(66);
  // list.addNode(50);
  // list.addNode(40);
  // list.addNode(30);
  // list.addNode(25);
  // list.addNode(32);
  // list.addNode(10);

// //   list.delete(40);

//   list.insertBeg(99);

//   list.insertAfter(40,50);

  List<int> arr = [80, 60, 70, 40, 20, 50, 10, 30];

  for (int i = 0; i < arr.length; i++) {
    list.addNode(arr[i]);
  }

  // list.addBeg(001);
  // list.addNextTo(10, 15);

  // list.removeDuplicate();
  // list.reverse();
  // list.delete(30);

  // list.midVal();
  // list.recursion();
  // list.binary();
  // list.arrDisplay();
  // list.sort();
  // list.before(10, 999);

  // list.display();
  // list.insertionSort();
  list.selectionSort();

  list.display();
}
