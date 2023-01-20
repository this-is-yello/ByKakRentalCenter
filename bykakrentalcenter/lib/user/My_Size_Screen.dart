import 'package:flutter/material.dart';

import 'package:bykakrentalcenter/To_Download_Screen.dart';

class ClickMySize extends StatelessWidget {
  const ClickMySize({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 420),
            child: MySizeScreen()
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

class MySizeScreen extends StatelessWidget {
  const MySizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Center(child: Text('마이사이즈', style: TextStyle(color: Colors.black))),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Text('상체 사이즈', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                  ),
                  Padding(padding: EdgeInsets.all(4)),
                  Container(
                    width: double.infinity,
                    height: 300,
                    color: Colors.indigo,
                  ),
                  Padding(padding: EdgeInsets.all(16)),
                  Container(
                    width: double.infinity,
                    child: Text('하체 사이즈', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                  ),
                  Padding(padding: EdgeInsets.all(4)),
                  Container(
                    width: double.infinity,
                    height: 300,
                    color: Colors.indigo,
                  ),
                  Padding(padding: EdgeInsets.all(16)),
                  Container(
                    //설명
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
