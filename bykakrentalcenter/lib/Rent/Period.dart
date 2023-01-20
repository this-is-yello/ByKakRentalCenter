import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';

import 'package:bykakrentalcenter/To_Download_Screen.dart';

class ClickPeriodSet extends StatelessWidget {
  const ClickPeriodSet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 420),
            child: DatePick()
          ),
          Padding(padding: EdgeInsets.all(20)),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 480),
            child: ToDownload()
          ),
        ],
      ),
    );
  }
}


class DatePick extends StatefulWidget {
  const DatePick({super.key});

  @override
  State<DatePick> createState() => _DatePickState();
}

class _DatePickState extends State<DatePick> {

  var startDate;
  var endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomDateRangePicker(
        barrierDismissible: true,
        // initialStartDate: DateTime.now(),
        // initialEndDate: DateTime.now().add(const Duration(days: 30)),
        minimumDate: DateTime.now(),
        maximumDate: DateTime.now().add(const Duration(days: 30)),
        onApplyClick: (start, end) {
          endDate = end;
          startDate = start;
        },
        onCancelClick: () {
          endDate = null;
          startDate = null;
        },

      )
    );
  }
}

// class DateRangePick extends StatefulWidget {
//   const DateRangePick({super.key});

//   @override
//   State<DateRangePick> createState() => _DateRangePickState();
// }

// class _DateRangePickState extends State<DateRangePick> {
//   DateTimeRange dateRange = DateTimeRange(
//     start: DateTime.now(),
//     end: DateTime.now(),
//   );


//   @override
//   Widget build(BuildContext context) {
//     final start = dateRange.start;
//     final end = dateRange.end;

//     return Container();
//   }
//   Future pickDateRange() async {
//     DateTimeRange? newDateRange = await showDateRangePicker(
//       context: context,
//       initialDateRange: dateRange,
//       firstDate: DateTime(2022),
//       lastDate: DateTime(2099),
//     );
//   }
// }