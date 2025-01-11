import 'package:flutter/material.dart';
import 'package:intl/intl.dart';  // Don't forget to import intl for DateFormat

void main() {
  runApp(MaterialApp(
    home: CurrentDate(),
  ));
}

class CurrentDate extends StatefulWidget {
  @override
  _CurrentDateState createState() => _CurrentDateState();
}

class _CurrentDateState extends State<CurrentDate> {
  DateTime now = DateTime.now();
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    // Format the current date
    String f1 = DateFormat("dd-MM-yyyy").format(now);

    return Scaffold(
      appBar: AppBar(title: Text("Current Date Example")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(now.toString(), style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text(f1, style: TextStyle(fontSize: 30)),
            SizedBox(height: 10),
            Text(
              selectedDate != null
                  ? DateFormat("dd-MM-yyyy").format(selectedDate!)
                  : "No date selected",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? now,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(3000),
                );

                if (date != null && selectedDate != date) {
                  setState(() {
                    selectedDate = date;
                  });
                }
              },
              child: Text("Pick Date"),
            ),
          ],
        ),
      ),
    );
  }
}
