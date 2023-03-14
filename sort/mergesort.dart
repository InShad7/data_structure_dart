void main() {
  List<int> arr = [10, 5, 8, 4, 9, 3, 6, 7, 2, 1];

  var result = mergeSort(arr);
  print(result);
}

mergeSort(List arr) {
  if (arr.length <= 1) {
    return arr;
  }

  int mid = arr.length ~/ 2;

  List left = mergeSort(arr.sublist(0, mid));
  List right = mergeSort(arr.sublist(mid));

  return merge(left, right);
}

merge(left, right) {
  List result = [];
  int i = 0, j = 0;

  while (i < left.length && j < right.length) {
    if (left[i] < right[j]) {
      result.add(left[i]);
      i++;
    } else {
      result.add(right[j]);
      j++;
    }
  }

  while (i < left.length) {
    result.add(left[i]);
    i++;
  }

  while (j < right.length) {
    result.add(right[j]);
    j++;
  }
  return result;
}
