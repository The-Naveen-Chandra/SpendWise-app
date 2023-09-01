import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spendwise_app/bargraph/custom_bar_graph.dart';
import 'package:spendwise_app/data/expense_data.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startOfWeek;

  const ExpenseSummary({
    super.key,
    required this.startOfWeek,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => SizedBox(
        height: 200,
        child: CustomBarGraph(
          maxY: 100,
          sunAmount: 20,
          monAmount: 50,
          tueAmount: 10,
          wedAmount: 30,
          thurAmount: 40,
          firAmount: 3,
          satAmount: 90,
        ),
      ),
    );
  }
}
