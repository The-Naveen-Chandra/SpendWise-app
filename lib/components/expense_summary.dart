import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:spendwise_app/bargraph/custom_bar_graph.dart';
import 'package:spendwise_app/data/expense_data.dart';
import 'package:spendwise_app/datetime/date_time_helper.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startOfWeek;

  const ExpenseSummary({
    super.key,
    required this.startOfWeek,
  });

  // calculate max amount in bar graph
  double calculateMax(
    ExpenseData value,
    String sunday,
    String monday,
    String tuesday,
    String wednesday,
    String thursday,
    String firday,
    String saturday,
  ) {
    double? max = 100;
    List<double> values = [
      value.calculateDailyExpenseSummary()[sunday] ?? 0,
      value.calculateDailyExpenseSummary()[monday] ?? 0,
      value.calculateDailyExpenseSummary()[tuesday] ?? 0,
      value.calculateDailyExpenseSummary()[wednesday] ?? 0,
      value.calculateDailyExpenseSummary()[thursday] ?? 0,
      value.calculateDailyExpenseSummary()[firday] ?? 0,
      value.calculateDailyExpenseSummary()[saturday] ?? 0,
    ];

    // sort form smallest to largest
    values.sort();

    // get largest amount (which is at the end of the sorted list)
    // and increase the cap slightly so the graph looks almost full
    max = values.last * 1.1;

    return max == 0 ? 100 : max;
  }

  // calculate the weekly total
  String calculateWeeklyTotal(
    ExpenseData value,
    String sunday,
    String monday,
    String tuesday,
    String wednesday,
    String thursday,
    String firday,
    String saturday,
  ) {
    List<double> values = [
      value.calculateDailyExpenseSummary()[sunday] ?? 0,
      value.calculateDailyExpenseSummary()[monday] ?? 0,
      value.calculateDailyExpenseSummary()[tuesday] ?? 0,
      value.calculateDailyExpenseSummary()[wednesday] ?? 0,
      value.calculateDailyExpenseSummary()[thursday] ?? 0,
      value.calculateDailyExpenseSummary()[firday] ?? 0,
      value.calculateDailyExpenseSummary()[saturday] ?? 0,
    ];

    double total = 0;
    for (int i = 0; i < values.length; i++) {
      total += values[i];
    }

    return total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    // get yyyy mm dd for each of this weak
    String sunday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 0)));
    String monday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 1)));
    String tuesday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 2)));
    String wednesday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 3)));
    String thursday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 4)));
    String firday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 5)));
    String saturday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 6)));

    return Consumer<ExpenseData>(
      builder: (context, value, child) => Column(
        children: [
          // weekly summary
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              top: 10,
              bottom: 25,
            ),
            child: Row(
              children: [
                Text(
                  "Week Total: ",
                  style: GoogleFonts.robotoMono(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "₹${calculateWeeklyTotal(
                    value,
                    sunday,
                    monday,
                    tuesday,
                    wednesday,
                    thursday,
                    firday,
                    saturday,
                  )}",
                  style: GoogleFonts.robotoMono(
                    fontSize: 16,
                    color: Colors.redAccent.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // bar graph
          SizedBox(
            height: 200,
            child: CustomBarGraph(
              maxY: calculateMax(
                value,
                sunday,
                monday,
                tuesday,
                wednesday,
                thursday,
                firday,
                saturday,
              ),
              sunAmount: value.calculateDailyExpenseSummary()[sunday] ?? 0,
              monAmount: value.calculateDailyExpenseSummary()[monday] ?? 0,
              tueAmount: value.calculateDailyExpenseSummary()[tuesday] ?? 0,
              wedAmount: value.calculateDailyExpenseSummary()[wednesday] ?? 0,
              thurAmount: value.calculateDailyExpenseSummary()[thursday] ?? 0,
              firAmount: value.calculateDailyExpenseSummary()[firday] ?? 0,
              satAmount: value.calculateDailyExpenseSummary()[saturday] ?? 0,
            ),
          ),
        ],
      ),
    );
  }
}
