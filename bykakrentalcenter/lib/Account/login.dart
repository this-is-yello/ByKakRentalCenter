import 'package:flutter/material.dart';

import 'package:bykakrentalcenter/todownload.dart';

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

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text('로그인', style: TextStyle(color: Colors.black))),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 56),
            child: Center(child: Text('by覺 렌탈센터', style: TextStyle(fontSize: 40, color: Colors.black, fontWeight: FontWeight.w700)))
          ),
          Padding(padding: EdgeInsets.all(16)),
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
              child: TextField(
                // controller: inputID,
                decoration: InputDecoration(
                  hintText: '아이디',
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1), borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Color(0xff205B48)), borderRadius: BorderRadius.circular(5)),
                ),
              ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
              child: TextField(
                // controller: inputPassword,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '비밀번호',
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Color(0xff205B48))),
                ),
              ),
          ),
          Padding(padding: EdgeInsets.all(8)),
          Container(
            padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  child: Text('회원가입'),
                  onTap: () {},
                ),
                Padding(padding: EdgeInsets.all(4)),
                Text('/'),
                Padding(padding: EdgeInsets.all(4)),
                InkWell(
                  child: Text('아이디, 비밀번호 찾기'),
                  onTap: () {},
                )
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(16)),
          Container(
            width: double.infinity,
            height: 70,
            margin: EdgeInsets.fromLTRB(32, 0, 32, 0),
            color: Color(0xff205B48),
            child: Center(child: Text('로그인', style: TextStyle(fontSize: 20, color: Colors.white))),
          ),
          Padding(padding: EdgeInsets.all(24)),
          Container(
            padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
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
              ]
            ),
          ),
          Padding(padding: EdgeInsets.all(16)),
          Container(
            width: double.infinity,
            height: 80,
            padding: EdgeInsets.fromLTRB(48, 0, 48, 0),
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
                    onTap: () {},
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
                    onTap: () {},
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
          ),
        ],
      ),
    );
  }
}