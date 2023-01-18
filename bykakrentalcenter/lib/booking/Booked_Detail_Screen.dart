import 'package:flutter/material.dart';

import 'package:bykakrentalcenter/todownload.dart';

class ClickBookDetail extends StatelessWidget {
  const ClickBookDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 420),
            child: BookDetail()
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

class BookDetail extends StatelessWidget {
  const BookDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('예약상세', style: TextStyle(color: Colors.black)),
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
            expandedHeight: 200,
            toolbarHeight: 200,
            backgroundColor: Colors.white,
            title: Container(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Text('예약내역 상세', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700))
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Container(
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
                            Text('yy.mm.dd - yy.mm.dd', style: TextStyle(color: Colors.grey, fontSize: 14)),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(4)),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          child: Text('예약변경', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
                          onPressed: () {},
                        ),
                        Padding(padding: EdgeInsets.all(4)),
                        TextButton(
                          child: Text('예약취소', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Container(
                child: Row(
                  children: [
                    Text('예약번호:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                    Padding(padding: EdgeInsets.all(4)),
                    Text('2022123101020303', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))
                  ],
                ),
              ),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('예약자 정보', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Text('이름:'),
                                Padding(padding: EdgeInsets.all(4)),
                                Text('홍길동'),
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(4)),
                          Container(
                            child: Row(
                              children: [
                                Text('전화번호:'),
                                Padding(padding: EdgeInsets.all(4)),
                                Text('010-0011-2233'),
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(4)),
                          Container(
                            child: Row(
                              children: [
                                Text('이메일:'),
                                Padding(padding: EdgeInsets.all(4)),
                                Text('naver@naver.com'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('상담정보', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Text('방문일자:'),
                                Padding(padding: EdgeInsets.all(4)),
                                Text('yy.mm.dd(d)'),
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(4)),
                          Container(
                            child: Row(
                              children: [
                                Text('예상금액:'),
                                Padding(padding: EdgeInsets.all(4)),
                                Text('50000원'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8),
                      child: Text('※결제는 매장에서 진행하며, 상담 후 가격은 변동될 수 있습니다.', style: TextStyle(fontSize: 12))
                    )
                  ],
                ),
              ),
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
            padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
            sliver: SliverToBoxAdapter(
              child: Container(
                child: Text('예약상품 정보', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  padding: EdgeInsets.all(8),
                  child: Text('[대여종류] 상품명')
                ),
                childCount: 8
              )
            ),
          )
        ],
      ),
    );
    //                           Padding(padding: EdgeInsets.all(4)),
    //                           Row(
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             children: [
    //                               Text('방문일자 : ', style: TextStyle(fontWeight: FontWeight.w700)),
    //                               Column(
    //                                 children: [
    //                                   Text('yyyy.mm.dd(d)'),
    //                                 ],
    //                               )
    //                             ]
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 Padding(padding: EdgeInsets.all(8)),
    //                   Container(
    //                     width: double.infinity,
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Row(
    //                           children: [
    //                             Text('예상금액 : ', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
    //                             Text('50000원', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700))
    //                           ]
    //                         ),
    //                         Text('※매장에서 결제하며, 상담 후 가격은 변동될 수 있습니다.', style: TextStyle(fontSize: 12))
    //                       ],
    //                     ),
    //                   ),
    //                 Padding(padding: EdgeInsets.all(8)),
    //                 Container(
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.end,
    //                     children: [
    //                       TextButton(
    //                         child: Text('예약변경', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
    //                         onPressed: () {},
    //                       ),
    //                       TextButton(
    //                         child: Text('예약취소', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
    //                         onPressed: () {},
    //                       )
    //                     ],
    //                   )
    //                 )
    //               ],
    //             ),
    //           ),
    //           Container(
    //             height: 80,
    //             width: double.infinity,
    //             margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(15),
    //                 boxShadow: [
    //                   BoxShadow(
    //                     color: Colors.grey.withOpacity(0.5),
    //                     blurRadius: 4,
    //                     offset: Offset(0, 4), 
    //                   )
    //                 ], 
    //                 color: Colors.white,
    //               ),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 Container(
    //                   width: 80,
    //                   height: 80,
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
    //                     color: Colors.grey,
    //                   )
    //                 ),
    //                 Container(
    //                   padding: EdgeInsets.all(16),
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Text('[대여종류] 상품이름', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
    //                       Padding(padding: EdgeInsets.all(2)),
    //                       Text('yyyy.mm.dd - yyyy.mm.dd', style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w700)),
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}

