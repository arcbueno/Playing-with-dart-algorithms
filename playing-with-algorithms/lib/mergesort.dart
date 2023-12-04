import 'dart:developer';

import 'package:playing_with_algorithms/utils/generate_numbers.dart';

class MergeSort {
  static void run() {
    var list = NumberGenerator.generate(6);
    log('The initial list is: $list');
    var sorted = _sort(list, 0, list.length - 1);
    log('The final list is: $sorted');
  }

  static List<int> _merge(List<int> left, List<int> right) {
    // Creating a list with fixed size, just in case the code tries
    // to insert a value on a inexistent position of the initial array
    final orderedList = List<int>.filled(left.length + right.length, 0);

    int leftPointer = 0;
    int rightPointer = 0;

    int mainPointer = 0;

    // While both arrays are not fully read, move its pointers
    // and compare the current value on the left and
    // current value on the right
    while (leftPointer < left.length && rightPointer < right.length) {
      // Comparing the current value of left and right arrays
      // and adding the smaller one to the main list
      if (left[leftPointer] < right[rightPointer]) {
        orderedList[mainPointer] = left[leftPointer];
        mainPointer++;
        leftPointer++;
      } else {
        orderedList[mainPointer] = right[rightPointer];
        mainPointer++;
        rightPointer++;
      }
    }

    // if left array is fully read, fill with the remaining
    // right data
    if (leftPointer == left.length) {
      while (rightPointer < right.length) {
        orderedList[mainPointer] = right[rightPointer];
        mainPointer++;
        rightPointer++;
      }
    }

    // if right array is fully read, fill with the remaining
    // left data
    if (rightPointer == right.length) {
      while (leftPointer < left.length) {
        orderedList[mainPointer] = left[leftPointer];
        mainPointer++;
        leftPointer++;
      }
    }

    return orderedList;
  }

  // The array value will always contains all the initial values
  static List<int> _sort(List<int> array, int first, int last) {
    // The divided list come to it minor number
    // Now, the result number will be compared and merge to
    // the original list
    if (last == first) {
      return [array[first]];
    }

    // Find the middle position of the current array
    int middle = (first + last) ~/ 2;

    List<int> left = _sort(array, first, middle);
    List<int> right = _sort(array, middle + 1, last);

    var mergedList = _merge(left, right);
    log('Merged list is $mergedList');
    return mergedList;
  }
}

void main(List<String> args) {
  MergeSort.run();
}
