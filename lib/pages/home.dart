import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendwise_app/components/custom_alert_button.dart';
import 'package:spendwise_app/components/custom_textfield.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // text field controllers
    final newExpenseNameController = TextEditingController();
    final newExpenseAmountController = TextEditingController();

    // save expense function
    void saveExpense() {

    }

    // cancel expense function
    void cancelExpense() {
      Navigator.pop(context);
    }

    // add new expense
    void addNewExpense() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            "Add new expense",
            style: GoogleFonts.robotoMono(
              fontWeight: FontWeight.w500,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // expense name
              CustomTextField(
                controller: newExpenseNameController,
                hintText: "Expense title",
              ),

              const SizedBox(
                height: 20,
              ),

              // expense amount
              CustomTextField(
                controller: newExpenseAmountController,
                hintText: "Expense amount",
              ),
            ],
          ),
          actions: [
            // save button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Save button
                CustomAlertButton(
                  onPressed: saveExpense,
                  title: "Save",
                ),

                // cancel button
                CustomAlertButton(
                  onPressed: cancelExpense,
                  title: "Cancel",
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(5.0, 5.0),
            ),
          ],
        ),
        child: FloatingActionButton(
          shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          backgroundColor: Colors.white,
          onPressed: addNewExpense,
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
