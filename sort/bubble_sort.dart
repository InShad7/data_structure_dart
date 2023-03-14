void main() {
  List<int> arr = [10, 5, 8, 4, 9, 3, 7, 2, 1];
  var result = bubbleSort(arr);
  print(result);
}

bubbleSort(arr) {
  for (int i = 0; i < arr.length-1; i++) {
    int flag = 0;
    for (int j = 0; j < arr.length - 1 - i; j++) {
      if (arr[j] > arr[j + 1]) {
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
        flag = 1;
      }
    }
    if (flag == 0) {
      break;
    }
  }
  return arr;
}
