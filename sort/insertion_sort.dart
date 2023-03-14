void main() {
  List<int> arr = [10, 5, 8, 4, 9, 3, 7, 2, 1];

  var result = insertionSort(arr);
  print(result);
}

insertionSort(arr) {
  for (int i = 0; i < arr.length; i++) {
    int temp = arr[i];
    int j = i - 1;
    // print(j);
    while (j >= 0 && arr[j] > temp) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = temp;
  }
  return arr;
}
