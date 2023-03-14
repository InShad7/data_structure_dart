void main() {
  List<int> arr = [10, 5, 8, 4, 9, 3, 7, 2, 1];

  var result = selectionSort(arr);

  print(result);
}

selectionSort(arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    int min = i;

    for (int j = i + 1; j < arr.length; j++) {
      if (arr[j] < arr[min]) {
        min = j;
      }
    }
      if (min != i) {
        int temp = arr[i];
        arr[i] = arr[min];
        arr[min] = temp;
      }
    }
  
  return arr;
}
