class Measures {
  Measures({
    required this.us,
    required this.metric,
  });

  Metric us;
  Metric metric;
}

class Metric {
  Metric({
    required this.amount,
    required this.unitShort,
    required this.unitLong,
  });

  double amount;
  String unitShort;
  String unitLong;
}
