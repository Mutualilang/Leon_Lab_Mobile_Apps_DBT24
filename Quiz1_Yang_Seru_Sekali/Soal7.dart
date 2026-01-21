void main() {
  List<int> a = [1, 2, 6, 7];
  List<int> b = [3, 4, 5, 8];

  List<int> gabungan = [...a, ...b];

  int secondmaxvalue = gabungan.reduce((x, y) => x > y ? x : y);

  print(gabungan);
  print(secondmaxvalue);
}