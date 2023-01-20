import 'dart:collection';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bykakrentalcenter/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:bykakrentalcenter/main.dart';
import 'package:bykakrentalcenter/To_Download_Screen.dart';
import 'package:bykakrentalcenter/Promotion_Screen.dart';
import 'package:bykakrentalcenter/account/SignUp_Screen.dart';

final auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;


class ClickLogIn extends StatelessWidget {
  const ClickLogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 420),
            child: LogIn()
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

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  var inputId = TextEditingController();
  var inputPassWord = TextEditingController();

  inputAccountState() async{
    if(inputId.text == '' || inputPassWord.text == '') {
      print('아이디, 비밀번호를 입력해라.');
    } else {
      print(auth.currentUser?.displayName.toString());
      print(auth.currentUser?.email);
      print(auth.currentUser?.uid);
      print('로그인 완료');
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => WebMain()), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('로그인', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(top: 120),
              child: Center(child: Text('by覺 렌탈센터', style: TextStyle(fontSize: 40, color: Colors.black, fontWeight: FontWeight.w700))),
            ),
          ),
          SliverPadding(padding: EdgeInsets.all(16)),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
            sliver: SliverToBoxAdapter(
              child: TextField(
                controller: inputId,
                decoration: InputDecoration(
                  hintText: '아이디',
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1), borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Color(0xff205B48)), borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
            sliver: SliverToBoxAdapter(
              child: TextField(
                controller: inputPassWord,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '비밀번호',
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1), borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Color(0xff205B48)), borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
            sliver: SliverToBoxAdapter(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      child: Text('회원가입'),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ClickSignUp()));
                      },
                    ),
                    Padding(padding: EdgeInsets.all(4)),
                    Text('/'),
                    Padding(padding: EdgeInsets.all(4)),
                    InkWell(
                      child: Text('아이디, 비밀번호 찾기'),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(32, 0, 32, 24),
            sliver: SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xFF205B48)
                ),
                child: InkWell(
                  child: Center(child: Text('로그인', style: TextStyle(fontSize: 24, color: Colors.white))),
                  onTap: () async{
                    try {
                      await auth.signInWithEmailAndPassword(
                        email: inputId.text,
                        password: inputPassWord.text
                      );
                    } catch (e) {
                      print(e);
                    }
                    inputAccountState();
                  },
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(32, 0, 32, 24),
            sliver: SliverToBoxAdapter(
              child: Container(
                child: Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                        height: 1,
                        color: Colors.black,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(4)),
                    Text('SNS계정으로 로그인하기'),
                    Padding(padding: EdgeInsets.all(4)),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                        height: 1,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(left: 48, right: 48),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: InkWell(
                      onTap: () async{},
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: InkWell(
                      onTap: () async{
                        
                      },
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: InkWell(
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}