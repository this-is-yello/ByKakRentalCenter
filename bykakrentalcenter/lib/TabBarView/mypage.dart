import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bykakrentalcenter/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:bykakrentalcenter/promotionscreen.dart';
import 'package:bykakrentalcenter/Account/login.dart';
import 'package:bykakrentalcenter/TabBarView/bookhistory.dart';
import 'package:bykakrentalcenter/FromMyPage/mysize.dart';
import 'package:bykakrentalcenter/FromMyPage/mypoint.dart';
import 'package:bykakrentalcenter/FromMyPage/calender.dart';
import 'package:bykakrentalcenter/FromMyPage/userinfo.dart';
import 'package:bykakrentalcenter/Manegement/bookmanegement.dart';
import 'package:bykakrentalcenter/Manegement/membermanegement.dart';
import 'package:bykakrentalcenter/Manegement/productmanegement.dart';
import 'package:bykakrentalcenter/Manegement/inquirymanegement.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

final auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;

class Mypage extends StatefulWidget {
  const Mypage({super.key});

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {

  bool loginState = false;
  bool adminGrade = false;
  var dbPhone;

  emailCheck() async{ // 핸드폰 번호 띄우기 위해 // 마이페이지 정보 띄울 때도 필요할까?

    var checkEmail = await firestore.collection('account').get();

    for (int i = 0; i <= checkEmail.docs.length-1; i++) {
      if (checkEmail.docs[i]['id'] == auth.currentUser?.email) {
        setState(() {
          dbPhone = checkEmail.docs[i]['phone'];
        });
        print(dbPhone);
      }
    }
  }
  
  getData() async{
    emailCheck();

    var resultAdmin = await firestore.collection('adminAccount').get();
    var resultAccount = await firestore.collection('account').get();

    if (auth.currentUser?.uid == null) {
      print('no login');
    } else if (auth.currentUser?.uid.isNotEmpty == true) {
      setState(() {
        loginState = true;
      });
      print('yes login');
      
      for(int i = 0; i<=resultAccount.docs.length-1; i++) {
        if(resultAccount.docs[i]['id'] == auth.currentUser?.email && resultAccount.docs[i]['grade'] == 'admin') {
          setState(() {
            adminGrade = true;
          });
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: loginState ? adminGrade ? AdminMyPage(dbPhone : dbPhone) : UserMyPage(dbPhone : dbPhone) : LogOutMyPage()
    );
  }
}

// --------------------------------- 로그아웃 마이페이지 --------------------------------------------
class LogOutMyPage extends StatelessWidget {
  const LogOutMyPage({super.key});

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
                child: InkWell(
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
                )
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

// --------------------------------- 유저 마이페이지 --------------------------------------------
class UserMyPage extends StatelessWidget {
  const UserMyPage({super.key, this.dbPhone});

  final dbPhone;

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
                child: InkWell(
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
                            child: Center(child: Text('${auth.currentUser?.displayName.toString()}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
                          ),
                          Container(
                            child: Center(child: Text('${dbPhone}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(left: 140)),
                      Icon(Icons.keyboard_arrow_right, size: 50, color: Colors.grey)
                    ],
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ClickProfile()));
                  },
                )
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
        SliverPadding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
          sliver: SliverToBoxAdapter(
            child: TextButton(
              child: Text('로그아웃', style: TextStyle(color: Colors.red, fontSize: 20)),
              onPressed: () async{
                await auth.signOut();
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => WebMain()), (route) => false);
              },
            ),
          ),
        )
      ],
    );
  }
}

// --------------------------------- 관리자 마이페이지 --------------------------------------------
class AdminMyPage extends StatelessWidget {
  const AdminMyPage({super.key, this.dbPhone});

  final dbPhone;

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
                child: InkWell(
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
                            child: Center(child: Text('${auth.currentUser?.displayName.toString()}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
                          ),
                          Container(
                            child: Center(child: Text('${dbPhone}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(left: 140)),
                      Icon(Icons.keyboard_arrow_right, size: 50, color: Colors.grey)
                    ],
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ClickProfile()));
                  },
                )
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
        SliverPadding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
          sliver: SliverToBoxAdapter(
            child: TextButton(
              child: Text('로그아웃', style: TextStyle(color: Colors.red, fontSize: 20)),
              onPressed: () async{
                await auth.signOut();
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => WebMain()), (route) => false);
              },
            ),
          ),
        )
      ]
    );
  }
}