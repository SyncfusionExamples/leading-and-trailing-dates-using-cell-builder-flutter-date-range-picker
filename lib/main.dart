import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() => runApp(const LeadingTrailingDates());

class LeadingTrailingDates extends StatefulWidget {
  const LeadingTrailingDates({super.key});

  @override
  State<StatefulWidget> createState() => LeadingTrailingDatesCustomization();
}

class LeadingTrailingDatesCustomization extends State<LeadingTrailingDates> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Card(
              margin: const EdgeInsets.fromLTRB(50, 150, 50, 150),
              child: SfDateRangePicker(
                  monthViewSettings: const DateRangePickerMonthViewSettings(
                      showTrailingAndLeadingDates: true),
                  cellBuilder:
                      (BuildContext context, DateRangePickerCellDetails details) {
                    int midMonth = details
                        .visibleDates[details.visibleDates.length ~/ 2].month;
                    if (details.date.month != midMonth) {
                      return Center(
                        child: Text(
                          DateFormat('d').format(details.date),
                          style: const TextStyle(color: Colors.grey),
                        ),
                      );
                    } else {
                      return Center(
                        child: Text(DateFormat('d').format(details.date)),
                      );
                    }
                  })),

        ));
  }
}