class Node {
  dynamic data;
  Node? next;

  Node(this.data);
}

class Stack {
  Node? top;

  void push(dynamic data) {
    Node? newNode = Node(data);

    if (top == null) {
      top = newNode;
    } else {
      newNode.next = top;
      top = newNode;
    }
  }

  pop() {
    if (top == null) {
      print('underFlow');
    }

    top = top!.next;
  }

  peek() {
    return top!.data;
    // print('top element is: ${top!.data}');
  }

  size(arr) {
    return arr.length;
    // print('size is: ${arr.length}');
  }

  void isEmpty() {
    if (top == null) {
      print('empty');
    }
  }

  midValue() {
    // List arr = [];
    // Node? temp = top;
    // while (temp != null) {
    //   arr.add(temp.data);
    //   temp = temp.next;
    // }
    // int sec = 0;
    // int fst = 0;
    // for (int i = 0; i < arr.length; i++) {
    //   if (arr[i] > fst) {
    //     sec = fst;
    //     fst = arr[i];
    //   } else if (arr[i] < fst && arr[i] > sec) {
    //     sec = arr[i];
    //   }
    // }
    // return sec;

    // var len = arr.length / 2;

    // print("mid value : ${arr[len.toInt()]}");




    Node? fast = top;
    Node? slow = top;
    while (fast != null && fast.next != null) {
      fast = fast.next!.next;
      slow = slow!.next;
    }
    // print(slow!.data);
    return slow!.data;
  }

  void display() {
    Node? temp = top;
    if (temp == null) {
      print('stack is empty');
    }

    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }

  void transfer(Stack s1, Stack s2) {
    Node? temp = top;
    if (temp == null) {
      print("empty");
    }
    int mid = midValue();

    while (temp != null) {
      if (temp.data == mid) {
        temp = temp.next;
      }
      s1.push(temp!.data);
      temp = temp.next;
    }

    if (temp == null) {
      top = null;
    }

    Node? temp2 = s1.top;
    while (temp2 != null) {
      s2.push(temp2.data);
      temp2 = temp2.next;
    }
  }

  void reveerseString(Stack s1) {
    Node? temp = top;

    if (temp == null) {
      print('emptyyyyy');
    }
    while (temp != null) {
      s1.push(temp.data);
      // print(temp.data);
      temp = temp.next;
    }
  }

  void undo(Stack s1, Stack s2) {
    s1.push(s2.peek());
    s2.pop();
  }

  void redo(Stack s1, Stack s2) {
    s2.push(s1.peek());
    s1.pop();
  }
}

void main() {
  Stack list = Stack();
  Stack list2 = Stack();

  // List<String> arr = ["a", "b", "c"];

  List<int> arr = [10, 20, 30, 40, 50];

  for (int i = 0; i < arr.length; i++) {
    list.push(arr[i]);
  }

  // print( list.size(arr));

  // list.pop();

  // list.isEmpty();

  // print(list.peek());

  print(list.midValue());
  // list.midValue();

  // list.transfer(list2, list);

  list.display();
  // list.reveerseString(list2);
  // print('reverssed:');
  // list2.display();

  // list.display();

  // print('undo');
  // list.undo(list2, list);
  // list.display();

  // print('redo');
  // list.redo(list2, list);
  // list.display();
}
