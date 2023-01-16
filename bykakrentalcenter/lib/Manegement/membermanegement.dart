import 'dart:developer';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bykakrentalcenter/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:bykakrentalcenter/todownload.dart';
import 'package:bykakrentalcenter/FromMyPage/givepoint.dart';
import 'package:flutter/services.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:intl/intl.dart';

final auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;


class ClickMember extends StatelessWidget {
  const ClickMember({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 420),
            child: MemberManege()
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


class MemberManege extends StatefulWidget {
  const MemberManege({super.key});

  @override
  State<MemberManege> createState() => _MemberManegeState();
}

class _MemberManegeState extends State<MemberManege> {

  var dbName;
  var dbPhone;
  var dbPoint;
  
  var checkEmail;
  var memberLength; 
  
  int i = 0;

  emailCheck() async{

    checkEmail = await firestore.collection('account').get();
    memberLength = checkEmail.docs.length;

    for (i = 0; i <= checkEmail.docs.length-1; i++) {
      // if (checkEmail.docs[i]['grade'] == 'user') {
        setState(() {
          dbName = checkEmail.docs;
          dbPhone = checkEmail.docs;
          dbPoint = checkEmail.docs;
        });
        print(dbName);
      // }
    }
  }

  @override
  void initState() {
    super.initState();
    emailCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('회원관리', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      body: CustomScrollView(      
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
                  child: Text('회원검색', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700)),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 16),
                  child: TextField(
                    // controller: inputSearch,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Color(0xff205B48)),
                      hintText: '회원의 이름이나 번호를 입력하세요.',
                      border: OutlineInputBorder(borderSide: BorderSide(width: 1), borderRadius: BorderRadius.circular(50)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Color(0xff205B48)), borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => Container(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: InkWell(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.photo, size: 60,),
                      Padding(padding: EdgeInsets.all(8)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(dbName[i]['name'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                          Text(dbPhone[i]['phone'], style: TextStyle(color: Colors.grey))
                        ],
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MemberDetail(dbName:dbName, dbPhone:dbPhone, dbPoint:dbPoint, i:i)));
                  },
                ),
              ),
              childCount: memberLength
            ),
          )
        ],
      ),
    );
  }
}


class MemberDetail extends StatefulWidget {
  const MemberDetail({super.key, this.dbName, this.dbPhone, this.dbPoint, this.i});

  final dbName;
  final dbPhone;
  final dbPoint;
  final i;

  @override
  State<MemberDetail> createState() => _MemberDetailState();
}

class _MemberDetailState extends State<MemberDetail> {

  var inputGivePoint;
  var inputGivePointContent = TextEditingController();
  var inputUsePoint;

  addPoint() {
    // firestore.collection('account').doc(widget.dbName[widget.i]['id']).update({'givePoint' : {3 : inputGivePointContent.text}, 'giveContent' : {3 : inputGivePoint}});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 420),
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.black),
                title: Text('회원관리', style: TextStyle(color: Colors.black)),
                actions: [
                  TextButton(
                    child: Text('수정', style: TextStyle(color: Colors.black),),
                    onPressed: () {},
                  )
                ],
              ),
              body: ListView(
                
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    child: Text('회원정보', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700)),
                  ),
                  Container(
                    width: double.infinity,
                    height: 90,
                    margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 4,
                          offset: Offset(0, 4), 
                        )
                      ], 
                      color: Colors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.photo, size: 60,),
                        Padding(padding: EdgeInsets.all(8)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${widget.dbName[widget.i]['name']}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                            Text('${widget.dbPhone[widget.i]['phone']}', style: TextStyle(color: Colors.grey))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 120,
                    margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    padding: EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 4,
                          offset: Offset(0, 4), 
                        )
                      ], 
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('포인트', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),),
                            Text('${widget.dbPoint[widget.i]['point']}' + ' ' + 'P', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700))
                          ],
                        ),
                        InkWell(
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Color(0xFF205B48),
                              borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15))
                            ),
                            child: Center(child: Text('포인트 지급', style: TextStyle(color: Colors.white, fontSize: 16 , fontWeight: FontWeight.w700),)),
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Container(
                                    width: 300,
                                    height: 320,
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 16),
                                          width: double.infinity,
                                          child: Text('포인트 지급', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700)),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 16),
                                          child: TextField(
                                            keyboardType: TextInputType.text,
                                            controller: inputGivePointContent,
                                            decoration: InputDecoration(
                                              hintText: '포인트 지급 내용',
                                              border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Color(0xff205B48))),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Flexible(
                                              child: TextField(
                                                keyboardType: TextInputType.number,
                                                controller: inputGivePoint,
                                                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                                                decoration: InputDecoration(
                                                  hintText: '지급할 포인트',
                                                  border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Color(0xff205B48))),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              child: Container(
                                                width: 56,
                                                height: 56,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                                                  color: Color(0xff205B48),
                                                ),
                                                child: Center(child: Text('지급', style: TextStyle(color: Colors.white),)),
                                              ),
                                              onTap: () {
                                                addPoint();
                                              },
                                            )
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 20, bottom: 16),
                                          width: double.infinity,
                                          child: Text('포인트 사용', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700)),
                                        ),
                                        Row(
                                          children: [
                                            Flexible(
                                              child: TextField(
                                                keyboardType: TextInputType.number,
                                                controller: inputUsePoint,
                                                decoration: InputDecoration(
                                                  hintText: '사용할 포인트',
                                                  border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Color(0xff205B48))),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              child: Container(
                                                width: 56,
                                                height: 56,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                                                  color: Color(0xff205B48),
                                                ),
                                                child: Center(child: Text('사용', style: TextStyle(color: Colors.white),)),
                                              ),
                                              onTap: () {},
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                );
                              }
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 400,
                    margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 4,
                          offset: Offset(0, 4), 
                        )
                      ], 
                      color: Colors.white,
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      child: Text('마이사이즈', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700)),
                    ),
                  ),
                ],
              ),
            )
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

// class ClickGivePoint extends StatefulWidget {
//   const ClickGivePoint({super.key});

//   @override
//   State<ClickGivePoint> createState() => _ClickGivePointState();
// }

// class _ClickGivePointState extends State<ClickGivePoint> {
  
//   var inputGivePoint = TextEditingController();
//   var inputGivePointContent = TextEditingController();
//   var inputUsePoint = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 300,
//       height: 320,
//       child: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.only(bottom: 16),
//             width: double.infinity,
//             child: Text('포인트 지급', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700)),
//           ),
//           Container(
//             margin: EdgeInsets.only(bottom: 16),
//             child: TextField(
//               keyboardType: TextInputType.text,
//               controller: inputGivePointContent,
//               decoration: InputDecoration(
//                 hintText: '포인트 지급 내용',
//                 border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
//                 focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Color(0xff205B48))),
//               ),
//             ),
//           ),
//           Row(
//             children: [
//               Flexible(
//                 child: TextField(
//                   keyboardType: TextInputType.number,
//                   controller: inputGivePoint,
//                   decoration: InputDecoration(
//                     hintText: '지급할 포인트',
//                     border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
//                     focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Color(0xff205B48))),
//                   ),
//                 ),
//               ),
//               InkWell(
//                 child: Container(
//                   width: 56,
//                   height: 56,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
//                     color: Color(0xff205B48),
//                   ),
//                   child: Center(child: Text('지급', style: TextStyle(color: Colors.white),)),
//                 ),
//                 onTap: () {},
//               )
//             ],
//           ),
//           Container(
//             margin: EdgeInsets.only(top: 20, bottom: 16),
//             width: double.infinity,
//             child: Text('포인트 사용', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700)),
//           ),
//           Row(
//             children: [
//               Flexible(
//                 child: TextField(
//                   keyboardType: TextInputType.number,
//                   controller: inputUsePoint,
//                   decoration: InputDecoration(
//                     hintText: '사용할 포인트',
//                     border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
//                     focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Color(0xff205B48))),
//                   ),
//                 ),
//               ),
//               InkWell(
//                 child: Container(
//                   width: 56,
//                   height: 56,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
//                     color: Color(0xff205B48),
//                   ),
//                   child: Center(child: Text('사용', style: TextStyle(color: Colors.white),)),
//                 ),
//                 onTap: () {},
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }