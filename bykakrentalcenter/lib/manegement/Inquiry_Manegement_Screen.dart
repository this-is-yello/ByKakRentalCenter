import 'package:flutter/material.dart';

import 'package:bykakrentalcenter/To_Download_Screen.dart';

class ClickInquiryManege extends StatelessWidget {
  const ClickInquiryManege({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 420),
            child: InquiryManegement()
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

class InquiryManegement extends StatelessWidget {
  const InquiryManegement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Center(child: Text('문의관리', style: TextStyle(color: Colors.black))),
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
                    child: Text('문의관리', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700)),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(bottom: 16),
                    child: TextField(
                      // controller: inputSearch,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Color(0xff205B48)),
                        hintText: '예약자의 이름을 입력하세요.',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(50)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:BorderSide(width: 2, color: Color(0xff205B48)),
                          borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(color: Colors.grey, width: 1)
                              )
                            ),
                            height: 50,
                            child: Center(child: Text('이름', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700)))
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(right: BorderSide(color: Colors.grey, width: 1))
                            ),
                            height: 50,
                            child: Center(child: Text('제목', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700)))
                          ),
                        ),
                        Flexible(                           
                          flex: 3,
                          child: InkWell(
                            child: Container(
                              height: 50,
                              child: Center(child: Text('문의일자', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700)))
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
                            child: Center(child: Text('이름', style: TextStyle(fontSize: 13)))
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Container(
                            height: 40,
                            child: Center(child: Text('사이즈 문의', style: TextStyle(fontSize: 13)))
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Container(
                            height: 40,
                            child: Center(child: Text('22.12.13(화)', style: TextStyle(fontSize: 13)))
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
                                expandedHeight: 280,
                                toolbarHeight: 280,
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
                                        icon: Icon(Icons.keyboard_double_arrow_down_rounded, size: 30,  color: Colors.black),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      Padding(
                                          padding: EdgeInsets.all(8)),
                                      Row(
                                        children: [
                                          Text('제목'),
                                          Padding(padding: EdgeInsets.all(8)),
                                          Text('전화상담 요청'),
                                        ],
                                      ),
                                      Padding(
                                          padding: EdgeInsets.all(8)),
                                      Row(
                                        children: [
                                          Text('이름'),
                                          Padding(padding: EdgeInsets.all(8)),
                                          Text('이름'),
                                        ],
                                      ),
                                      Padding(
                                          padding: EdgeInsets.all(8)),
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
                                          Text('문의일자'),
                                          Padding(padding: EdgeInsets.all(8)),
                                          Text('22.12.23(화)'),
                                        ],
                                      ),
                                      Padding(padding: EdgeInsets.all(8)),
                                      Text('문의내용')
                                    ],
                                  ),
                                ),
                              ),
                              SliverToBoxAdapter(
                                child: Container(
                                  width: double.infinity,
                                  height: 300,
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 2, color: Colors.grey)
                                  ),
                                  child: Text('상품 구성이 어떻게 되는지 궁금합니다.'),
                                ),
                              )
                            ],
                          ),
                        );
                      }
                    );
                  },
                ),
              childCount: 8
            )
          )
        ]
      )
    );
  }
}
