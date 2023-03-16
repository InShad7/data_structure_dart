class MinHeap {
  List<int> heap = [];

  void buildHeap(List<int> arr, int len) {
    heap = arr;
    for (int i = parent(len - 1); i >= 0; i--) {
      shiftDown(i);
    }
  }

  void insert(int data) {
    heap.add(data);
    int currentIndex = heap.length - 1;

    shiftUp(currentIndex);
  }

  int delete() {
    int minValue = heap[0];
    int lastIndex = heap.length - 1;
    heap[0] = heap[lastIndex];
    heap.removeLast();
    shiftDown(0);
    return minValue;
  }

  shiftUp(int currentIndex) {
    int parentIndex = (currentIndex - 1) ~/ 2;

    while (currentIndex > 0 && heap[currentIndex] < heap[parentIndex]) {
      int temp = heap[currentIndex];
      heap[currentIndex] = heap[parentIndex];
      heap[parentIndex] = temp;

      currentIndex = parentIndex;
      parentIndex = (currentIndex - 1) ~/ 2;
    }
  }

  shiftDown(int currentIndex) {
    // int endIndx = heap.length - 1;
    // int leftindx = leftChild(currentIndex);

    // while (leftindx <= endIndx) {
    //   int rightindx = rightChild(currentIndex);
    //   int small;
    //   if (rightindx <= endIndx && heap[rightindx] < heap[leftindx]) {
    //     small = rightindx;
    //   } else {
    //     small = leftindx;
    //   }
    //   if (heap[currentIndex] > heap[small]) {
    //     int temp = heap[currentIndex];
    //     heap[currentIndex] = heap[small];
    //     heap[small] = temp;

    //     currentIndex = small;
    //     leftindx = leftChild(currentIndex);
    //   } else {
    //     return;
    //   }
    // }

    int left = leftChild(currentIndex);
    int right = rightChild(currentIndex);
    int small = currentIndex;

    if (left < heap.length && heap[left] < heap[small]) {
      small = left;
    }

    if (right < heap.length && heap[right] < heap[small]) {
      small = right;
    }

    if (small != currentIndex) {
      int temp = heap[currentIndex];
      heap[currentIndex] = heap[small];
      heap[small] = temp;

      shiftDown(small);
    }
  }

  // void heapSort(List<int> arr, int len) {
  //   if (len - 1 < 0) {
  //     return;
  //   }
  //   print(len);
  //   print(arr);
  //   buildHeap(arr, len);
  //   int temp = arr[0];
  //   arr[0] = arr[len - 1];
  //   arr[len - 1] = temp;

  //   heapSort(arr, len - 1);
  // }

  peek() {
    return heap[0];
  }

  void printHeap() {
    print(heap);
  }

  parent(int index) {
    return index - 1 ~/ 2;
  }

  leftChild(int index) {
    return 2 * index + 1;
  }

  rightChild(int index) {
    return 2 * index + 2;
  }
}

void main() {
  MinHeap binaryHeap = MinHeap();

  List<int> arr = [4, 8, 1, 7, 5, 2];
  binaryHeap.buildHeap(arr, arr.length);

  // binaryHeap.insert(10);
  // binaryHeap.insert(15);
  // binaryHeap.insert(20);
  // binaryHeap.insert(17);
  // binaryHeap.insert(25);

  print('Min Heap:');
  binaryHeap.printHeap();

  // print("after delete");
  // binaryHeap.delete();
  // binaryHeap.printHeap();

  // print('peek : ${binaryHeap.peek()}');

  // binaryHeap.buildHeap(arr, arr.length);
  // print(" after sort");
  // binaryHeap.heapSort(arr, arr.length);
  // binaryHeap.printHeap();
}
