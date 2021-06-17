import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() => runApp(LeadingTrailingDates());

class LeadingTrailingDates extends StatefulWidget {
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
              monthViewSettings: DateRangePickerMonthViewSettings(
                  showTrailingAndLeadingDates: true),
              cellBuilder:
                  (BuildContext context, DateRangePickerCellDetails details) {
                int midMonth = details
                    .visibleDates[details.visibleDates.length ~/ 2].month;
                if (details.date.month != midMonth) {
                  return Center(
                    child: Container(
                        child: Text(
                      DateFormat('d').format(details.date),
                      style: TextStyle(color: Colors.grey),
                    )),
                  );
                } else {
                  return Center(
                    child: Container(
                        child: Text(DateFormat('d').format(details.date))),
                  );
                }
              })),

    ));
  }
}

