// void heapSort(List<int> arr) {
//   int heapSize = arr.length - 1;

//   for (int i = (heapSize ~/ 2) - 1; i >= 0; i--) {
//     heapify(arr, heapSize, i);
//   }

//   for (int i = heapSize - 1; i >= 0; i--) {
//     int temp = arr[0];
//     arr[0] = arr[i];
//     arr[i] = temp;

//     heapify(arr, i, 0);
//   }
// }

void buildHeap(List<int> arr, int len) {
  for (int i = (parent(len - 1)); i >= 0; i--) {
    heapify(arr, len, i);
  }
}

void heapSort(List<int> arr, int len) {
  if (len - 1 < 0) {
    return;
  } 
  buildHeap(arr, len);
  int temp = arr[0];
  arr[0] = arr[len - 1];
  arr[len - 1] = temp;

  heapSort(arr, len - 1);
}

void heapify(List<int> arr, int len, int index) {
  int left = 2 * index + 1;
  int right = 2 * index + 2;
  int large = index;

  if ((left < len && arr[left] > arr[large])) {
    large = left;
  }

  if ((right < len && arr[right] > arr[large])) {
    large = right;
  }

  if (large != index) {
    int temp = arr[index];
    arr[index] = arr[large];
    arr[large] = temp;

    heapify(arr, len, large);
  }
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

void main(List<String> args) {
  List<int> arr = [15, 20, 7, 9, 30];
  heapSort(arr, arr.length);
  print(arr);
}
