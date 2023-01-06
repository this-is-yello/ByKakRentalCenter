import 'package:flutter/material.dart';
import 'package:bykakrentalcenter/main.dart';

import 'package:bykakrentalcenter/Rent/meetingrent.dart';
import 'package:bykakrentalcenter/Rent/weddingrent.dart';
import 'package:bykakrentalcenter/Rent/product.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var mainColor = Color(0xff205B48);
  var blackColor = Color(0xff1E1E1E);
  var whiteColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            width: double.infinity,
            height: 200,
            color: mainColor,
            child: Center(child: Text('K!mjuhyeon by 覺 (Banner)', style: TextStyle(color: whiteColor))),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 4,
                                offset: Offset(0, 4), 
                              )
                            ],
                          ),
                          child: InkWell(
                            child: Center(child: Text('면접대여', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700))),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ClickMeetingRent()));
                            },
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(8)),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Container(
                          height: 160,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 4,
                                offset: Offset(0, 4), 
                              )
                            ],
                          ),
                          child: InkWell(
                            child: Center(child: Text('예복대여', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700))),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ClickWeddingRent()));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: Colors.grey[200],
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 8),
            child: Text('인기상품', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: InkWell(
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            color: mainColor,
                          ),
                          Padding(padding: EdgeInsets.all(8)),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('김주현바이각', style: TextStyle(fontSize: 14, color: Colors.grey)),
                                Text('[대여종류] 상품명', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                                Text('50,000원', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))
                              ]
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(left: 120)),
                          IconButton(
                            icon: Icon(Icons.favorite_border),
                            onPressed: () {},
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
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ClickProduct()));
                },
              ),
            ),
            childCount: 5
          )
        )
      ],
    );
  }
}