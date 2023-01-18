import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class TableCalendarScreen extends StatelessWidget {
  const TableCalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableCalendar(
        locale: 'ko',
        firstDay: DateTime.utc(1997, 9, 20),
        lastDay: DateTime.utc(2999, 3, 14),
        focusedDay: DateTime.now(),
        headerStyle: HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
        ),
      ),
    );
  }
}
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CalendarDatePicker2(
        config: CalendarDatePicker2Config(
            calendarType: CalendarDatePicker2Type.multi,
        ),
        // onValueChanged: (dates) => _yourHandler(dates),
        initialValue: [],
      )
    );
  }
}