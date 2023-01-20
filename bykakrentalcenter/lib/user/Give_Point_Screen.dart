import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bykakrentalcenter/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import 'package:bykakrentalcenter/To_Download_Screen.dart';

final auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;

class ClickGivePoint extends StatelessWidget {
  const ClickGivePoint({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 420),
            child: GivePoint()
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


class GivePoint extends StatefulWidget {
  const GivePoint({super.key});

  @override
  State<GivePoint> createState() => _GivePointState();
}

class _GivePointState extends State<GivePoint> {

  var inputGivePoint = TextEditingController();
  var inputGivePointContent = TextEditingController();
  var inputUsePoint = TextEditingController();

  var dbName;
  var dbPoint;
  
  var checkEmail;
  var memberLength; 
  
  int i = 0;

  emailCheck() async{

    checkEmail = await firestore.collection('account').get();
    memberLength = checkEmail.docs.length;

    for (i = 0; i <= checkEmail.docs.length-1; i++) {
      setState(() {
        dbName = checkEmail.docs[i]['name'].toString();
        dbPoint = checkEmail.docs[i]['point'].toString();
      });
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
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: Text('포인트 지급', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700)),
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
                    Text(dbName, style: TextStyle(fontSize: 16)),
                    Text(dbPoint, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700))
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            padding: EdgeInsets.all(16),
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
                      onTap: () {},
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
          ),
        ],
      ),
    );
  }
}