void main() {
  List<int> arr = [10, 5, 8, 4, 9, 3, 7, 2, 1];

  int low = 0;
  int high = arr.length - 1;
  var result = quickSort(arr, low, high);
  print(result);
}

List quickSort(List list, low, high) {
  if (low < high) {
    int result = partition(list, low, high);
    quickSort(list, low, result - 1);
    quickSort(list, result + 1, high);
  }
  return list;
}

partition(List list, low, high) {
  int pivot = list[high];

  int i = low - 1;
  for (int j = low; j < high; j++) {
    if (list[j] < pivot) {
      i++;
      swap(list, i, j);
    }
  }
  swap(list, i + 1, high);
  return i + 1;
}

void swap(List list, int i, int j) {
  int temp = list[i];
  list[i] = list[j];
  list[j] = temp;
}
