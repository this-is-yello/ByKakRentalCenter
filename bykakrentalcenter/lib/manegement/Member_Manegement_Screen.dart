import 'dart:developer';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bykakrentalcenter/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:bykakrentalcenter/To_Download_Screen.dart';
// import 'package:bykakrentalcenter/user/Give_Point_Screen.dart';
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
        title: Text('????????????', style: TextStyle(color: Colors.black)),
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
                  child: Text('????????????', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700)),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 16),
                  child: TextField(
                    // controller: inputSearch,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Color(0xff205B48)),
                      hintText: '????????? ???????????? ????????? ???????????????.',
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

  var inputGivePoint = TextEditingController();
  var inputGivePointContent = TextEditingController();
  var inputUsePoint = TextEditingController();

  addPoint() async{
    var inputPointList = await firestore.collection('account').doc(widget.dbName[widget.i]['id']).get();
    List inputGivePointList = inputPointList['givepoint'];
    List inputGivePointContentList = inputPointList['givepointcontent'];

    inputGivePointList.add(int.parse(inputGivePoint.text));
    inputGivePointContentList.add(inputGivePointContent.text);

    firestore.collection('account').doc(widget.dbName[widget.i]['id']).update({"givepoint" : inputGivePointList});
    firestore.collection('account').doc(widget.dbName[widget.i]['id']).update({"givepointcontent" : inputGivePointContentList});
    firestore.collection('account').doc(widget.dbName[widget.i]['id']).update({"givepointdate" : FieldValue.arrayUnion([DateTime.now()])});
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
                title: Text('????????????', style: TextStyle(color: Colors.black)),
                actions: [
                  TextButton(
                    child: Text('??????', style: TextStyle(color: Colors.black),),
                    onPressed: () {},
                  )
                ],
              ),
              body: ListView(
                
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    child: Text('????????????', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700)),
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
                            Text('?????????', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),),
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
                            child: Center(child: Text('????????? ??????', style: TextStyle(color: Colors.white, fontSize: 16 , fontWeight: FontWeight.w700),)),
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
                                          child: Text('????????? ??????', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700)),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 16),
                                          child: TextField(
                                            keyboardType: TextInputType.text,
                                            controller: inputGivePointContent,
                                            decoration: InputDecoration(
                                              hintText: '????????? ?????? ??????',
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
                                                  hintText: '????????? ?????????',
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
                                                child: Center(child: Text('??????', style: TextStyle(color: Colors.white),)),
                                              ),
                                              onTap: () {
                                                if(inputGivePoint.text != '' || inputGivePointContent.text != '') {
                                                  addPoint();
                                                } else {
                                                  print('error');
                                                }
                                              },
                                            )
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 20, bottom: 16),
                                          width: double.infinity,
                                          child: Text('????????? ??????', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700)),
                                        ),
                                        Row(
                                          children: [
                                            Flexible(
                                              child: TextField(
                                                keyboardType: TextInputType.number,
                                                controller: inputUsePoint,
                                                decoration: InputDecoration(
                                                  hintText: '????????? ?????????',
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
                                                child: Center(child: Text('??????', style: TextStyle(color: Colors.white),)),
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
                      child: Text('???????????????', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700)),
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
//             child: Text('????????? ??????', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700)),
//           ),
//           Container(
//             margin: EdgeInsets.only(bottom: 16),
//             child: TextField(
//               keyboardType: TextInputType.text,
//               controller: inputGivePointContent,
//               decoration: InputDecoration(
//                 hintText: '????????? ?????? ??????',
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
//                     hintText: '????????? ?????????',
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
//                   child: Center(child: Text('??????', style: TextStyle(color: Colors.white),)),
//                 ),
//                 onTap: () {},
//               )
//             ],
//           ),
//           Container(
//             margin: EdgeInsets.only(top: 20, bottom: 16),
//             width: double.infinity,
//             child: Text('????????? ??????', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700)),
//           ),
//           Row(
//             children: [
//               Flexible(
//                 child: TextField(
//                   keyboardType: TextInputType.number,
//                   controller: inputUsePoint,
//                   decoration: InputDecoration(
//                     hintText: '????????? ?????????',
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
//                   child: Center(child: Text('??????', style: TextStyle(color: Colors.white),)),
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