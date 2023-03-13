void main() {
  List<int> my = [5, 9, 17, 23, 25, 45, 59, 63, 71, 89];
  int target = 59;
  int left = 0;
  int right = my.length-1 ;
  // print(right);
  var result = binarySearch(my, target, left, right);

  print(result);
}

int binarySearch(List<int> list, int target, int left, int right) {
  if (left > right) {
    return -1;
  }

  int middle = (left + right) ~/ 2;

  if (list[middle] == target) {
    return middle;
  } else if (target > list[middle]) {
    return binarySearch(list, target, middle + 1, right);
  } else {
    return binarySearch(list, target, left, middle - 1);
  }
}