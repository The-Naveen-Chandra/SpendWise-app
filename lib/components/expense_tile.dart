import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpenseTile extends StatelessWidget {
  const ExpenseTile({
    super.key,
    required this.name,
    required this.amount,
    required this.dateTime,
    required this.deleteTapped,
  });

  final String name;
  final String amount;
  final DateTime dateTime;
  final void Function(BuildContext)? deleteTapped;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            // delete button
            SlidableAction(
              onPressed: deleteTapped,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
            ),
          ],
        ),
        child: ListTile(
          title: Text(name),
          subtitle: Text(
            '${dateTime.day} / ${dateTime.month} / ${dateTime.year}',
          ),
          trailing: Text("₹$amount.00",
              style: GoogleFonts.lato(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }
}
