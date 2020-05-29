class PointClass {
  double x;
  double y;

  PointClass(double x, double y) {
    this.x = x;
    this.y = y;
  }

  @override
  String toString() => 'Point $x,$y';
}
