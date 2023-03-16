class BinaryHeap {
  List<int> heap = [];

  void buildMaxHeap(List<int> arr) {
    heap = arr;

    for (int i = parent(heap.length - 1); i >= 0; i--) {
      shiftDown(i);
    }
  }

  void insert(int data) {
    heap.add(data);
    shiftUp(heap.length - 1);
  }

  delete() {
    int max = heap[0];
    int last = heap.length - 1;
    heap[0] = last;
    heap.removeLast();
    shiftDown(0);

    return max;
  }

  shiftUp(int index) {
    int parent = (index - 1) ~/ 2;

    while (index > 0 && heap[index] > heap[parent]) {
      int temp = heap[index];
      heap[index] = heap[parent];
      heap[parent] = temp;

      index = parent;
      parent = (index - 1) ~/ 2;
    }
  }

  shiftDown(int index) {
    int left = 2 * index + 1;
    int right = 2 * index + 2;
    int large = index;

    if (left < heap.length && heap[left] > heap[large]) {
      large = left;
    }
    if (right < heap.length && heap[right] > heap[large]) {
      large = right;
    }

    if (large != index) {
      int temp = heap[index];
      heap[index] = heap[large];
      heap[large] = temp;

      shiftDown(large);
    }
  }

  // void heapSort() {
  //   int heapSize = heap.length;

  //   for (int i = heapSize ~/ 2-1; i >= 0; i--) {
  //     shiftDown(i);
  //   }

  //   for (int i = heapSize - 1; i >= 0; i--) {
  //     int temp = heap[0];
  //     heap[0] = heap[i];
  //     heap[i] = temp;
  //     shiftDown(i);
  //   }
  // }

  parent(int index) {
    return index - 1 ~/ 2;
  }

  leftChild(int index) {
    return 2 * index + 1;
  }

  rightChild(int index) {
    return 2 * index + 2;
  }

  void printHeap() {
    print(heap);
  }
}

void main() {
  BinaryHeap binaryHeap = BinaryHeap();

  List<int> arr = [15, 20, 7, 9, 30];
  binaryHeap.buildMaxHeap(arr);

  // binaryHeap.insert(10);
  // binaryHeap.insert(15);
  // binaryHeap.insert(20);
  // binaryHeap.insert(17);
  // binaryHeap.insert(25);
  // binaryHeap.insert(8);

  print('Heap:');
  binaryHeap.printHeap();

  // binaryHeap.delete();

  // print('Heap after deletion:');
  // binaryHeap.printHeap();

  // binaryHeap.heapSort();

  // print('Heap after heap sort:');
  // binaryHeap.printHeap();
}
