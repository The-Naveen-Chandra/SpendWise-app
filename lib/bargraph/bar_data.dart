import 'package:spendwise_app/bargraph/individual_bar.dart';

class BarData {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double firAmount;
  final double satAmount;

  BarData({
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thurAmount,
    required this.firAmount,
    required this.satAmount,
  });

  List<IndividualBar> barData = [];

  // initialize bar data into list
  void initializeBarData() {
    barData = [
      // sunday
      IndividualBar(x: 0, y: sunAmount),

      // monday
      IndividualBar(x: 1, y: monAmount),

      // tuesday
      IndividualBar(x: 2, y: tueAmount),

      // wednesday
      IndividualBar(x: 3, y: wedAmount),

      // thursday
      IndividualBar(x: 4, y: thurAmount),

      // firday
      IndividualBar(x: 5, y: firAmount),

      // saturday
      IndividualBar(x: 6, y: satAmount),
    ];
  }
}
