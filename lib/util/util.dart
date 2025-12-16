String doubleToString(double? num) {
  if (num == null) return "";
  if (num.isNaN) return "Error";
  return num % 1 == 0 ? num.round().toString() : num.toString();
}
