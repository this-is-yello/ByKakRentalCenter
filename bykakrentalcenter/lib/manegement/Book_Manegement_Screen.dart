import 'package:flutter/material.dart';

import 'package:bykakrentalcenter/To_Download_Screen.dart';

class ClickBookManege extends StatelessWidget {
  const ClickBookManege({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 420),
            child: BookMangement()
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


class BookMangement extends StatelessWidget {
  const BookMangement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Center(child: Text('예약관리', style: TextStyle(color: Colors.black))),
      ),
      body: CustomScrollView(      
        slivers: [
          SliverAppBar(
            elevation: 0,
            pinned: true,
            floating: true,
            centerTitle: true,
            automaticallyImplyLeading: false,
            expandedHeight: 200,
            toolbarHeight: 200,
            backgroundColor: Colors.white,
            title: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text('예약관리', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700)),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 16),
                  child: TextField(
                    // controller: inputSearch,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Color(0xff205B48)),
                      hintText: '예약자의 이름을 입력하세요.',
                      border: OutlineInputBorder(borderSide: BorderSide(width: 1), borderRadius: BorderRadius.circular(50)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Color(0xff205B48)), borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: Colors.grey,
                                  width: 1
                                )
                              )
                            ),
                            height: 50,
                            child: Center(child: Text('예약자', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700)))
                          ),
                          onTap: () {},
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Colors.grey,
                                width: 1
                              )
                            )
                          ),
                          height: 50,
                          child: Center(child: Text('전화번호', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700)))
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        child: InkWell(
                          child: Container(
                            height: 50,
                            child: Center(child: Text('방문일정', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700)))
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => InkWell(
                child: Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: Container(
                          height: 40,
                          child: Center(child: Text('이름', style: TextStyle(fontSize: 13),))
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        child: Container(
                          height: 40,
                          child: Center(child: Text('010-0000-0000', style: TextStyle(fontSize: 13),))
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        child: Container(
                          height: 40,
                          child: Center(child: Text('22.12.13(화) 오전11:00', style: TextStyle(fontSize: 13),))
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  showBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 4,
                              offset: Offset(0, -4), 
                            )
                          ],
                        ),
                        child: CustomScrollView(
                          slivers: [
                            SliverAppBar(
                              pinned: true,
                              floating: true,
                              automaticallyImplyLeading: false,
                              elevation: 0,
                              expandedHeight: 360,
                              toolbarHeight: 360,
                              backgroundColor: Colors.white,
                              titleTextStyle: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
                              shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                              ),
                              title: Container(
                                padding: EdgeInsets.only(left: 16, right: 16),
                                child: Column(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.keyboard_double_arrow_down_rounded, size: 30, color: Colors.black,),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    Padding(padding: EdgeInsets.all(8)),
                                    Row(
                                      children: [
                                        Text('예약번호'),
                                        Padding(padding: EdgeInsets.all(8)),
                                        Text('20221228001'),
                                      ],
                                    ),
                                    Padding(padding: EdgeInsets.all(8)),
                                    Row(
                                      children: [
                                        Text('예약자'),
                                        Padding(padding: EdgeInsets.all(8)),
                                        Text('이름'),
                                      ],
                                    ),
                                    Padding(padding: EdgeInsets.all(8)),
                                    Row(
                                      children: [
                                        Text('전화번호'),
                                        Padding(padding: EdgeInsets.all(8)),
                                        InkWell(
                                          child: Text('010-0000-0000'),
                                          onTap: () {},
                                        ),
                                      ],
                                    ),
                                    Padding(padding: EdgeInsets.all(8)),
                                    Row(
                                      children: [
                                        Text('대여일정'),
                                        Padding(padding: EdgeInsets.all(8)),
                                        Text('23.01.18 - 23.01.21'),
                                      ],
                                    ),
                                    Padding(padding: EdgeInsets.all(8)),
                                    Row(
                                      children: [
                                        Text('방문일정'),
                                        Padding(padding: EdgeInsets.all(8)),
                                        Text('22.12.23(화) 오전 11:00'),
                                      ],
                                    ),
                                    Padding(padding: EdgeInsets.all(8)),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          width: 120,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(0xff205B48),
                                            ),
                                            child: Text('예약변경'),
                                            onPressed: () {},
                                          ),
                                        ),
                                        Container(
                                          width: 120,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(0xff205B48),
                                              elevation: 0
                                            ),
                                            child: Text('예약취소'),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(padding: EdgeInsets.all(8)),
                                    Text('예약상품')
                                  ],
                                ),
                              ),
                            ),
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) => InkWell(
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('[대여종류]상품이름', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700)),
                                        Text(' / ', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700)),
                                        Text('사이즈', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700))
                                      ],
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                                childCount: 10
                              )
                            ),
                          ],
                        ),
                      );
                    }
                  );
                },
              ),
              childCount: 50
            )
          )
        ]
      )
    );
  }
}