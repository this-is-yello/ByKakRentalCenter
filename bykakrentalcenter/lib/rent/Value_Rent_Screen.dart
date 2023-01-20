import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:bykakrentalcenter/To_Download_Screen.dart';
import 'package:bykakrentalcenter/Rent/Period.dart';
import 'package:bykakrentalcenter/Rent/Product_Detail_Screen.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class ClickMeetingRent extends StatelessWidget {
  const ClickMeetingRent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 420),
            child: MeetingRent()
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

class MeetingRent extends StatelessWidget {
  const MeetingRent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('면접대여', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            pinned: true,
            floating: true,
            centerTitle: true,
            automaticallyImplyLeading: false,
            expandedHeight: 100,
            toolbarHeight: 100,
            backgroundColor: Colors.white.withOpacity(0),
            title: Container(
              padding: EdgeInsets.only(top: 6, bottom: 10),
              child: InkWell(
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 4,
                        offset: Offset(0, 4), 
                      )
                    ], 
                  ),
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.timer, color: Color(0xFF205B48)),
                      Text('대여기간 설정하기', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700)),
                      Text("yy.mm.dd - yy.mm.dd", style: TextStyle(fontSize: 16, color: Colors.grey))
                    ],
                  ),
                ),
                onTap: () {
                  showCalendarDatePicker2Dialog(
                    context: context,
                    config: CalendarDatePicker2WithActionButtonsConfig(
                      calendarType: CalendarDatePicker2Type.range,
                    ),
                    dialogSize: const Size(325, 400),
                    // initialValue: _dialogCalendarPickerValue,
                    borderRadius: BorderRadius.circular(15),
                  );
                },
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  child: InkWell(
                    child:  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 4,
                            offset: Offset(0, 4), 
                          )
                        ], 
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                              color: Color(0xFF205B48),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('김주현바이각', style: TextStyle(fontSize: 14, color: Colors.grey)),
                                Padding(padding: EdgeInsets.all(2)),
                                Text('[면접대여]상품이름', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                                Padding(padding: EdgeInsets.all(2)),
                                Text('0원', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ClickProduct()));
                    },
                  ),
                ),
                childCount: 12
              ),
            ),
          ),
        ],
      ),
    );
  }
}