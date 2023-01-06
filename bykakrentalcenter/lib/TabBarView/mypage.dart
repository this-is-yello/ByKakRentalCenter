import 'package:flutter/material.dart';

import 'package:bykakrentalcenter/Account/login.dart';

import 'package:bykakrentalcenter/TabBarView/bookhistory.dart';

import 'package:bykakrentalcenter/FromMyPage/mysize.dart';
import 'package:bykakrentalcenter/FromMyPage/mypoint.dart';
import 'package:bykakrentalcenter/FromMyPage/calender.dart';

import 'package:bykakrentalcenter/Manegement/bookmanegement.dart';
import 'package:bykakrentalcenter/Manegement/membermanegement.dart';
import 'package:bykakrentalcenter/Manegement/productmanegement.dart';
import 'package:bykakrentalcenter/Manegement/inquirymanegement.dart';



class Mypage extends StatelessWidget {
  const Mypage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: UserMyPageState(),
    );
  }
}

// ---------------------------------------------------------------------------------------------
class LogOutState extends StatelessWidget {
  const LogOutState({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(40)
            ),
          ),
          Padding(padding: EdgeInsets.all(8)),
          Container(
            child: Center(child: Text('로그인하세요.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
          ),
          Padding(padding: EdgeInsets.only(left: 160)),
          Icon(Icons.keyboard_arrow_right, size: 50, color: Colors.grey)
        ],
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ClickLogIn()));
      },
    );
  }
}

class UserLogInState extends StatelessWidget {
  const UserLogInState({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(40)
            ),
          ),
          Padding(padding: EdgeInsets.all(8)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Center(child: Text('이름', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
              ),
              Container(
                child: Center(child: Text('010-1122-3344', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(left: 140)),
          Icon(Icons.keyboard_arrow_right, size: 50, color: Colors.grey)
        ],
      ),
      onTap: () {
        // 회원정보수정
        // Navigator.push(context, MaterialPageRoute(builder: (context) => ClickLogIn()));
      },
    );
  }
}

class AdminLogInState extends StatelessWidget {
  const AdminLogInState({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(40)
            ),
          ),
          Padding(padding: EdgeInsets.all(8)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Center(child: Text('바이각', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
              ),
              Container(
                child: Center(child: Text('010-1122-3344', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(left: 140)),
          Icon(Icons.keyboard_arrow_right, size: 50, color: Colors.grey)
        ],
      ),
      onTap: () {
        // 회원정보수정
        // Navigator.push(context, MaterialPageRoute(builder: (context) => ClickLogIn()));
      },
    );
  }
}


class UserMyPageState extends StatelessWidget {
  const UserMyPageState({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.all(16),
          sliver: SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              child: Text('마이페이지', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700))
            )
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          sliver: SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 80,
              child: Container(
                child: LogOutState()
              )
            )
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          sliver: SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 120,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('마이 포인트', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                            Padding(padding: EdgeInsets.all(4)),
                            Text('0 P', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                          ]
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ClickMyPoint()));
                      },
                    ),
                    Container(
                      height: 70,
                      width: 2,
                      color: Colors.grey[200],
                    ),
                    InkWell(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('예약내역', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                            Padding(padding: EdgeInsets.all(4)),
                            Text('0 건', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                          ]
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ClickBookHistory()));
                      },
                    ),
                  ]
                ),
              ),
            )
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          sliver: SliverToBoxAdapter(
            child: InkWell(
              child: Container(
                width: double.infinity,
                height: 80,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      )
                    ],
                  ),
                  child: Center(
                    child: Text('마이 사이즈', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700))
                  ),
                )
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ClickMySize()));
              },
            )
          )
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
              width: double.infinity,
              child: Text('대여일정', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700))
            )
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          sliver: SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: TableCalendarScreen(),
            )
          ),
        ),
      ],
    );
  }
}

class AdminMyPageState extends StatelessWidget {
  const AdminMyPageState({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.all(16),
          sliver: SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              child: Text('마이페이지', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700))
            )
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          sliver: SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 80,
              child: Container(
                child: AdminLogInState()
              )
            )
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          sliver: SliverGrid.count(
            crossAxisCount: 2,
            childAspectRatio: 3.5,
            children: [
              Container(
                child: InkWell(
                  child: Center(child: Text('회원관리', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ClickMember()));
                  },
                ),
              ),
              Container(
                child: InkWell(
                  child: Center(child: Text('예약관리', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ClickBookManege()));
                  },
                ),
              ),
              Container(
                child: InkWell(
                  child: Center(child: Text('문의관리', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ClickInquiryManege()));
                  },
                ),
              ),
              Container(
                child: InkWell(
                  child: Center(child: Text('제품관리', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ClickProductManege()));
                  },
                ),
              ),
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          sliver: SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 60,
              child: Container(
                child: InkWell(
                  child: Center(child: Text('바코드로 제품검색', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
                  onTap: () {},
                ),
              )
            )
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
              width: double.infinity,
              child: Text('관리자 일정', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700))
            )
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          sliver: SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: TableCalendarScreen(),
            )
          ),
        ),
      ]
    );
  }
}