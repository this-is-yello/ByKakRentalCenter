import 'package:flutter/material.dart';

import 'package:bykakrentalcenter/To_Download_Screen.dart';
import 'package:bykakrentalcenter/booking/Go_To_Book_Screen.dart';

class ClickShoppingBag extends StatelessWidget {
  const ClickShoppingBag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 420),
            child: ShoppingBag()
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

class ShoppingBag extends StatefulWidget {
  const ShoppingBag({super.key});

  @override
  State<ShoppingBag> createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {

  bool _checkProductAll = false;
  bool _checkProductOne = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('장바구니', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Checkbox(
                            activeColor: Color(0xFF205B48),
                            checkColor: Colors.white,
                            value: _checkProductAll,
                            onChanged: (value) {
                              setState(() {
                                _checkProductAll = true;
                                // _checkProductAll = false;
                              });

                            },
                          ),
                          Text('전체선택', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))
                        ],
                      ),
                    ),
                    TextButton(
                      child: Text('선택삭제', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700)),
                      onPressed: () {},
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Checkbox(
                            activeColor: Color(0xFF205B48),
                            checkColor: Colors.white,
                            value: _checkProductOne,
                            onChanged: (value) {
                              setState(() {
                                _checkProductOne = true;
                                // _checkProductAll = false;
                              });

                            },
                          ),
                          TextButton(
                            child: Text('삭제', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700)),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('[면접대여] 블랙 솔리드 슈트', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                                Padding(padding: EdgeInsets.all(2)),
                                Text('50,000원', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                                Padding(padding: EdgeInsets.all(2)),
                                Text('옵션:' + ' ' + '자켓L 바지L', style: TextStyle(fontSize: 15, color: Colors.grey)),
                                Padding(padding: EdgeInsets.all(4)),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF205B48),
                                    // minimumSize: Size(double.infinity, 50)
                                  ),
                                  child: Text('예약하기'),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ClickGoToBook()));
                                  },
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(8),
                            width: 100,
                            height: 100,
                            color: Color(0xFF205B48),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 2,
                      color: Colors.grey[200],
                    ),
                  ],
                ),
              ),
              childCount: 2
            )
          )
        ],
      ),
      bottomNavigationBar: BookBottomSheet(),
    );
  }
}

class BookBottomSheet extends StatelessWidget {
  const BookBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 4,
            offset: Offset(0, -4), 
          )
        ], 
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('선택 상품 수', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              Text('총 0개', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))
            ],
          ),
          Padding(padding: EdgeInsets.all(5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('총 금액', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              Text('0 원', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))
            ],
          ),
          Padding(padding: EdgeInsets.all(16)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff205B48),
              minimumSize: Size(double.infinity, 50)
            ),
            child: Text('예약하기'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ClickGoToBook()));
            },
          ),
        ],
      ),
    );
  }
}
          