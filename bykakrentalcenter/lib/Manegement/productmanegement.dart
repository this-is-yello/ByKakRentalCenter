import 'package:flutter/material.dart';

import 'package:bykakrentalcenter/todownload.dart';

class ClickProductManege extends StatelessWidget {
  const ClickProductManege({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 420),
            child: ProductManegement()
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

class ProductManegement extends StatelessWidget {
  const ProductManegement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Center(child: Text('제품관리', style: TextStyle(color: Colors.black))),
        actions: [
          IconButton(
            icon: Icon(Icons.add, size: 30,),
            onPressed: () {},
          )
        ],
      ),
      body: DefaultTabController(
        length: 6,
        child: Container(
          child: Column(
            children: [
              Container(
                height: 150,
                child: CustomScrollView(      
                  slivers: [
                    SliverAppBar(
                      elevation: 0,
                      pinned: true,
                      floating: true,
                      centerTitle: true,
                      automaticallyImplyLeading: false,
                      expandedHeight: 160,
                      toolbarHeight: 160,
                      backgroundColor: Colors.white,
                      title: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(bottom: 16),
                            child: Text('제품검색', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700)),
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(bottom: 16),
                            child: TextField(
                              // controller: inputSearch,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search, color: Color(0xff205B48)),
                                hintText: '제품의 이름이나 번호를 입력하세요.',
                                border: OutlineInputBorder(borderSide: BorderSide(width: 1), borderRadius: BorderRadius.circular(50)),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Color(0xff205B48)), borderRadius: BorderRadius.circular(50)),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.qr_code_scanner_rounded, color: Color(0xff205B48)),
                                  onPressed: () {},
                                )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
                )
              ),
              Container(
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Color(0xff205B48),
                  labelColor: Color(0xff205B48),
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      text: '자켓',
                    ),
                    Tab(
                      text: '팬츠',
                    ),
                    Tab(
                      text: '셔츠',
                    ),
                    Tab(
                      text: '조끼',
                    ),
                    Tab(
                      text: '구두',
                    ),
                    Tab(
                      text: '잡화',
                    )
                  ],
                )
              ),
              Expanded(
                child: Container(
                  height: double.infinity,
                  child: TabBarView(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: TabManege(),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: TabManege(),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: TabManege(),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: TabManege(),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: TabManege(),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: TabManege(),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      )
    );
  }
}

class TabManege extends StatelessWidget {
  const TabManege({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => InkWell(
              child: Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.photo, size: 56),
                    Padding(padding: EdgeInsets.all(4)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('제품명' + ' ' + '사이즈', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                        Padding(padding: EdgeInsets.all(2)),
                        Text('0101110101010110', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))
                      ],
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
                            expandedHeight: 480,
                            toolbarHeight: 480,
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
                                      Flexible(
                                        fit: FlexFit.tight,
                                          child: InkWell(
                                            child: Container(
                                            height: 160,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                            ),
                                          ),
                                          onTap: () {},
                                        )
                                      ),
                                      Padding(padding: EdgeInsets.all(8)),
                                      Flexible(
                                        fit: FlexFit.tight,
                                          child: InkWell(
                                            child: Container(
                                            height: 160,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                            ),
                                          ),
                                          onTap: () {},
                                        )
                                      )
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.all(4)),
                                  Row(
                                    children: [
                                      Text('제품번호'),
                                      Padding(padding: EdgeInsets.all(8)),
                                      Text('0100501810450'),
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.all(8)),
                                  Row(
                                    children: [
                                      Text('제품명'),
                                      Padding(padding: EdgeInsets.all(8)),
                                      Text('컬러 제품 사이즈'),
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.all(8)),
                                  Row(
                                    children: [
                                      Text('제품상태'),
                                      Padding(padding: EdgeInsets.all(8)),
                                      Text('대기중'),
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.all(8)),
                                  Row(
                                    children: [
                                      Text('제품이력'),
                                      Padding(padding: EdgeInsets.all(8)),
                                      Text('대여 0회'),
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.all(8)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: 240,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xff205B48),
                                          ),
                                          child: Text('상태변경'),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.all(8)),
                                  Text('이력 및 특이사항')
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
                                      Text('22.12.28대여 - 22.12.31반납', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700)),
                                    ],
                                  ),
                                ),
                                onTap: () {},
                              ),
                              childCount: 3
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
          ),
        ),
      ],
    );
  }
}