class Node {
  int data;
  Node? next;

  Node(this.data);
}

class Queue {
  Node? front;
  Node? rear;

  void enqueue(int data) {
    Node? newNode = Node(data);

    if (rear == null) {
      front = rear = newNode;
      return;
    } else {
      rear!.next = newNode;
      rear = newNode;
    }
  }

  void dequeue() {
    if (front == null) {
      print('empty');
    }

    front = front!.next;
    if (front == null) {
      rear = null;
    }
  }

  frontData() {
    return front!.data;
    // print('front element is: ${front!.data}');
  }

  rearData() {
    return rear!.data;
    // print('rear element is: ${rear!.data}');
  }

  void display() {
    Node? temp = front;
    if (temp == null) {
      print('empty');
    }

    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }


}

void main() {
  Queue list = Queue();

  List<int> arr = [1, 2, 3, 4, 5];

  for (int i = 0; i < arr.length; i++) {
    list.enqueue(arr[i]);
  }

  // list.dequeue();

  // print("front: ${list.frontData()}");
  // print("rear: ${list.rearData()}");



  list.display();
}
