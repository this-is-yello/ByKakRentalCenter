import 'package:flutter/material.dart';

import 'package:bykakrentalcenter/To_Download_Screen.dart';
import 'package:bykakrentalcenter/main/Book_History_Screen.dart';
import 'package:bykakrentalcenter/Promotion_Screen.dart';
import 'package:bykakrentalcenter/booking/Booked_Detail_Screen.dart';

class ClickBookComplete extends StatelessWidget {
  const ClickBookComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 420),
            child: Bookcomplete()
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

class Bookcomplete extends StatelessWidget {
  const Bookcomplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 180,
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    children: [
                      Text('예약이 완료되었습니다.', style: TextStyle(fontSize: 18),),
                      Text('방문일자는' + ' ' + 'yy.mm.dd' + '입니다.', style: TextStyle(fontSize: 18),)
                    ]
                  ),
                ),
                Padding(padding: EdgeInsets.all(16)),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: Text('홈으로', style: TextStyle(color: Color(0xFF205B48))),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => WebMain()), (route) => false);
                        },
                      ),
                      TextButton(
                        child: Text('예약내역확인', style: TextStyle(color: Color(0xFF205B48))),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ClickBookHistory()));
                        },
                      ),
                    ]
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}