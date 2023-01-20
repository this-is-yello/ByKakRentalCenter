import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:bykakrentalcenter/To_Download_Screen.dart';
import 'package:bykakrentalcenter/Iinquiry_Screen.dart';
import 'package:bykakrentalcenter/main/Shopping_Bag_Screen.dart';
import 'package:bykakrentalcenter/booking/Go_To_Book_Screen.dart';

class ClickProduct extends StatelessWidget {
  const ClickProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 420),
            child: ProductDetail()
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

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

  var clickBtn = 0;

  clickZero() {
    setState(() {
      clickBtn = 0;
    });
    print(clickBtn);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        title: Text('상품상세', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 400,
                    color: Color(0xFF205B48),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('김주현바이각', style: TextStyle(color: Color(0xFF9E9E9E))),
                                  Padding(padding: EdgeInsets.all(4)),
                                  Text('[대여종류] 상품이름', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                                  Padding(padding: EdgeInsets.all(4)),
                                  Text('0원', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700))
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.share, size: 30),
                                    onPressed: () {},
                                  ),
                                  Padding(padding: EdgeInsets.all(8)),
                                  IconButton(
                                    icon: Icon(Icons.favorite_border, size: 30),
                                    onPressed: () {},
                                  )
                                ],
                              )
                            )
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Container(
                          width: double.infinity,
                          height: 2,
                          color: Colors.grey,
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        InkWell(
                          child: Text('(0개의 후기)'),
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                ]
              ),
            ),
          ),
          SliverPadding(padding: EdgeInsets.all(8)),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 400,
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Text('기본정보', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
            ),
          ),
          SliverPadding(padding: EdgeInsets.all(8)),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 3000,
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Text('상품소개', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
            ),
          ),
          SliverPadding(padding: EdgeInsets.all(8)),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 400,
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Text('위치정보', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
            ),
          ),
          SliverPadding(padding: EdgeInsets.all(8)),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Text('대여후기', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 20),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(100)
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('바이각', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                            Row(
                              children: [
                                Text('남성' + ', ' + '190cm / 90kg', style: TextStyle(color: Colors.grey)),
                                Text(', ' + '상의XL/하의XL', style: TextStyle(color: Colors.grey)),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', maxLines: 2),
                    Padding(padding: EdgeInsets.all(8)),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: 160,
                            color: Color(0xFF205B48),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(8)),
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: 160,
                            color: Color(0xFF205B48),
                          ),
                        ),
                        // Padding(padding: EdgeInsets.all(8)),
                        // Flexible(
                        //   flex: 1,
                        //   child: Container(
                        //     height: 120,
                        //     color: Color(0xFF205B48),
                        //   ),
                        // )
                      ],
                    )
                  ],
                ),
              ),
              childCount: 2
            ),
          ),
        ],
      ),
      bottomNavigationBar: Builder(
        builder: (context) => BottomAppBar(
          child: Container(
            padding: EdgeInsets.all(8),
            height: 76,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  child: Container(
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff205B48),
                    ),
                    child: Center(child: Text('예약하기', style: TextStyle(color: Colors.white, fontSize: 16))),
                  ),
                  onTap: () {
                    clickBookBtn() {
                      if(clickBtn == 0) {
                        showBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return BookBottomSheet(clickZero : clickZero);
                          }
                        );
                        clickBtn++;
                        print(clickBtn);
                      }
                      else if (clickBtn == 1) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ClickGoToBook()));
                        clickBtn--;
                        print(clickBtn);
                      }
                    }
                    clickBookBtn();
                  }
                ),
                IconButton(
                  alignment: Alignment.center,
                  icon: Icon(Icons.shopping_bag_outlined, size: 32,),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text('장바구니 등록'),
                        content: Text('장바구니에 상품을 등록하였습니다.\n장바구니로 이동하시겠습니까?'),
                        actions: [
                          TextButton(
                            child: Text('이동하기', style: (TextStyle(color: Color(0xFF205B48))),),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ClickShoppingBag()));
                              // Navigator.pop(context);
                            },
                          ),
                          TextButton(
                            child: Text('취소', style: (TextStyle(color: Color(0xFF205B48))),),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ]
                      ),
                    );
                  }
                ),
                IconButton(
                  alignment: Alignment.center,
                  icon: Icon(Icons.headset_mic_outlined, size: 30,  color: Colors.black),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ClickInquiry()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BookBottomSheet extends StatefulWidget {
  const BookBottomSheet({super.key, required this.clickZero});

  final Function() clickZero;

  @override
  State<BookBottomSheet> createState() => _BookBottomSheetState();
}

class _BookBottomSheetState extends State<BookBottomSheet> {

  final _valueList = ['S', 'M', 'L', '선택안함'];
  String? _upselectedValue;
  String? _downselectedValue;
  void initState() {
    setState(() {
      _upselectedValue = _valueList[3];
      _downselectedValue = _valueList[3];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 4,
            offset: Offset(0, -4),
          )
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.keyboard_double_arrow_down_rounded, size: 30,  color: Colors.black),
              onPressed: widget.clickZero,
            ),
            Padding(padding: EdgeInsets.all(4)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('상의 사이즈: '),
                Padding(padding: EdgeInsets.all(8)),
                DropdownButton(
                  value: _upselectedValue,
                  items: _valueList.map(
                    (e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      );
                    }
                  ).toList(),
                  onChanged: (value) {
                    setState(() {
                      _upselectedValue = value!;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('하의 사이즈: '),
                Padding(padding: EdgeInsets.all(8)),
                DropdownButton(
                  value: _downselectedValue,
                  items: _valueList.map(
                    (e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      );
                    }
                  ).toList(),
                  onChanged: (value) {
                    setState(() {
                      _downselectedValue = value!;
                    });
                  },
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(8)),
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              height: 56,
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('상품 0개'),
                  Text('0 원')
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(8)),
          ],
        ),
      ),
    );
  }
}