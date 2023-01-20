import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

import 'package:bykakrentalcenter/booking/Booked_Detail_Screen.dart';
import 'package:bykakrentalcenter/booking/Book_Complete_Screen.dart';

import 'package:bykakrentalcenter/To_Download_Screen.dart';
import 'package:bykakrentalcenter/Rent/Period.dart';

class ClickGoToBook extends StatelessWidget {
  const ClickGoToBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 420),
            child: GoToBook()
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

class GoToBook extends StatefulWidget {
  const GoToBook({super.key});

  @override
  State<GoToBook> createState() => _GoToBookState();
}

class _GoToBookState extends State<GoToBook> {

  var startDate;
  var endDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('예약상세설정', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Color(0xFF205B48),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8))
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('[대여종류] 상품이름', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700)),
                        Padding(padding: EdgeInsets.all(2)),
                        Text('옵션:' + ' ' + '자켓 L 바지 L', style: TextStyle(color: Colors.grey, fontSize: 14)),
                      ],
                    )
                  ],
                ),
              ),
            )
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            sliver: SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                child: Text('방문상담일 설정', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))
              )
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text('날짜:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                      ),
                      Padding(padding: EdgeInsets.all(4)),
                      Container(
                        // width: double.infinity,
                        width: 140,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFFFFFF)
                          ),
                          child: Text('yy.mm.dd', style: TextStyle(color: Color(0xff205B48), fontSize: 18),),
                          onPressed: () {
                            DatePicker.showDatePicker(
                              context,
                              showTitleActions: true,
                              minTime: DateTime(2022, 3, 2),
                              maxTime: DateTime(2099, 12, 31),
                              onChanged: (data) {print('change $data');},
                              onConfirm: (data) {print('confirm $data');},
                              currentTime: DateTime.now(),
                              locale: LocaleType.ko,
                              theme: DatePickerTheme(
                                itemStyle: TextStyle(
                                  color: Color(0xff205B48),
                                  fontSize: 20
                                ),
                                doneStyle: TextStyle(
                                  color: Color(0xff205B48),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700
                                )
                              ),
                            );
                          },
                        )
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text('시간:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                      ),
                      Padding(padding: EdgeInsets.all(4)),
                      Container(
                        // width: double.infinity,
                        width: 140,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFFFFFF)
                          ),
                          child: Text('tt:mm AM', style: TextStyle(color: Color(0xff205B48), fontSize: 18),),
                          onPressed: () {
                             DatePicker.showTime12hPicker(
                              context,
                              // showTitleActions: true,
                              onChanged: (data) {print('change $data');},
                              onConfirm: (data) {print('confirm $data');},
                              // currentTime: DateTime(12, 00),
                              locale: LocaleType.ko,
                              theme: DatePickerTheme(
                                itemStyle: TextStyle(
                                  color: Color(0xff205B48),
                                  fontSize: 20
                                ),
                                doneStyle: TextStyle(
                                  color: Color(0xff205B48),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700
                                )
                              ),
                            );
                          },
                        )
                      ),
                    ],
                  ),
                ],
              )
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            sliver: SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                height: 2,
                color: Colors.grey[200],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            sliver: SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                child: Text('대여기간 설정', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))
              )
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            sliver: SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFFFFF)
                  ),
                  child: Text('yy.mm.dd - yy.mm.dd', style: TextStyle(color: Color(0xff205B48), fontSize: 20),),
                  onPressed: () {
                    showCalendarDatePicker2Dialog(
                      context: context,
                      config: CalendarDatePicker2WithActionButtonsConfig(
                        calendarType: CalendarDatePicker2Type.range,
                      ),
                      dialogSize: const Size(325, 400),
                      // initialValue: _dialogCalendarPickerValue,
                      borderRadius: BorderRadius.circular(8),
                    );
                  },
                )
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: InkWell(
          child: Container(
            margin: EdgeInsets.all(8),
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xff205B48),
            ),
            child: Center(child: Text('예약신청', style: TextStyle(color: Colors.white, fontSize: 16))),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ClickBookComplete()));
          },
        ),
      ),
    );
    //   bottomNavigationBar: BottomAppBar(
    //     color: Colors.white,
    //     child: InkWell(
    //       child: Container(
    //         margin: EdgeInsets.all(8),
    //         height: 56,
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(8),
    //           color: Color(0xff205B48),
    //         ),
    //         child: Center(child: Text('예약신청', style: TextStyle(color: Colors.white, fontSize: 16))),
    //       ),
    //       onTap: () {
    //         Navigator.push(context, MaterialPageRoute(builder: (context) => ClickBookComplete()));
    //       },
    //     ),
    //   ),
    // );
  }
}