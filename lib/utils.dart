class IndicatorDetails {
  /// 0 <= value <= 1
  final double value;

  /// Number of the items
  final int itemCount;
  const IndicatorDetails({
    this.value = 0,
    this.itemCount = 10,
  });

  List<double> getValues() {
    List<double> values = [];
    double maxValuePerItem = 1 / itemCount;

    double temp = value;
    if (value > 0) {
      while (temp > 0) {
        if (temp <= maxValuePerItem) {
          values.add(double.parse(temp.toStringAsFixed(5)));
          temp -= temp;
          while (values.length < itemCount) {
            values.add(0);
          }
        } else {
          values.add(double.parse(maxValuePerItem.toStringAsFixed(5)));
          temp -= maxValuePerItem;
        }
      }
    } else {
      while (values.length < itemCount) {
        values.add(0);
      }
    }

    if (value == 1) {
      values.removeLast();
    }

    // if (kDebugMode) {
    //   print(values);
    // }

    return values;
  }
}
