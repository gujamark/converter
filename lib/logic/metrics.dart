class MetricsHelper {
  double? convert(String? from, String? to, double amount) {
    if (from == to) {
      return amount;
    } else if (from == "km" && to == "m") {
      return amount * 1000;
    } else if (from == "km" && to == "cm") {
      return amount * 100000;
    } else if (from == "m" && to == "km") {
      return amount / 1000;
    } else if (from == "m" && to == "cm") {
      return amount * 100;
    } else if (from == "cm" && to == "km") {
      return amount / 100000;
    } else if (from == "cm" && to == "m") {
      return amount / 100;
    }
  }
}
