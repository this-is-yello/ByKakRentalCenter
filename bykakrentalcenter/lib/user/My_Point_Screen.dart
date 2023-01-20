import 'package:flutter/material.dart';

import 'package:bykakrentalcenter/To_Download_Screen.dart';

class ClickMyPoint extends StatelessWidget {
  const ClickMyPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 420),
            child: MyPointScreen()
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

class MyPointScreen extends StatelessWidget {
  const MyPointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('마이 포인트', style: TextStyle(color: Colors.black)),
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
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
            title: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('마이 포인트'),
                  Text('50000P')
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 2,
              color: Colors.grey[200],
            ),
          ),
          SliverPadding(padding: EdgeInsets.all(8)),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Text('이용내역', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('[적립] 대여감사 포인트', style: TextStyle(fontSize: 18)),
                    Text('+500P')
                  ],
                ),
              ),
              childCount: 2
            )
          ),
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Text('포인트 이용 유의사항', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700))
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(4),
                    child: Text('※ 포인트 사용을 원하시면 직원에게 말씀해주세요', style: TextStyle(fontSize: 13))
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(4),
                    child: Text('※ 유효기간이 만료되면 자동으로 사라집니다.', style: TextStyle(fontSize: 13))
                  ),
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}
