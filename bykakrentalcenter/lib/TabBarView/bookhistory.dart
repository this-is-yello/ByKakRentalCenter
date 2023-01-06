import 'package:flutter/material.dart';

import 'package:bykakrentalcenter/Booking/bookdetail.dart';
import 'package:bykakrentalcenter/todownload.dart';

class ClickBookHistory extends StatelessWidget {
  const ClickBookHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 420),
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.black),
              ),
              body: BookHistory(),
            )
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

class BookHistory extends StatelessWidget {
  const BookHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                child: Text('예약내역', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700))
              )
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  margin: EdgeInsets.only(bottom: 16),
                  width: double.infinity,
                  height: 100,
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
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                          color: Color(0xFF205B48),
                        )
                      ),
                      Padding(padding: EdgeInsets.all(8)),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('[대여종류] 상품이름', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                            Padding(padding: EdgeInsets.all(2)),
                            Text('yy.mm.dd - yy.mm.dd', style: TextStyle(color: Colors.grey, fontSize: 16)),
                            Padding(padding: EdgeInsets.all(2)),
                            InkWell(
                              child: Text('상세보기>', style: TextStyle(color: Colors.indigo, fontSize: 16, fontWeight: FontWeight.w700),),
                              onTap: () {
                                Navigator.push( context, MaterialPageRoute(builder: (context) => ClickBookDetail()));
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ),
                childCount: 4
              )
            ),
          ),
        ],
      ),
    );
  }
}
