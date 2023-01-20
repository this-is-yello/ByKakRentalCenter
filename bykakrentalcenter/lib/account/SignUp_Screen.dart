import 'package:bykakrentalcenter/account/LogIn_Screen.dart';
import 'package:bykakrentalcenter/Promotion_Screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bykakrentalcenter/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:bykakrentalcenter/To_Download_Screen.dart';

final auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;


class ClickSignUp extends StatelessWidget {
  const ClickSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 420),
            child: SignUp()
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

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  var inputNewId = TextEditingController();
  var inputNewPassWord = TextEditingController();
  var inputNewPassWordConfirm = TextEditingController();
  var inputNewName = TextEditingController();
  var inputNewPhone = TextEditingController();

  letsSignUp() async{
    final result = await auth.createUserWithEmailAndPassword(
      email: inputNewId.text,
      password: inputNewPassWord.text,
    );
    await auth.currentUser?.updateDisplayName(inputNewName.text);
  }

  addAccount() {
    firestore.collection('account').doc(inputNewId.text).set({'grade' : 'user', 'name' : inputNewName.text, 'phone' : inputNewPhone.text, 'id' : inputNewId.text, 'password' : inputNewPassWord.text});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('회원가입', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(top: 80, bottom: 20),
              child: Center(child: Text('by覺 렌탈센터', style: TextStyle(fontSize: 40, color: Colors.black, fontWeight: FontWeight.w700))),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
            sliver: SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                child: Text('회원정보', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700))
              )
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(32, 0, 32, 32),
            sliver: SliverToBoxAdapter(
              child: TextField(
                controller: inputNewName,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: '이름',
                  labelText: '이름',
                  floatingLabelStyle: TextStyle(color: Color(0xFF205B48)),
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1), borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Color(0xff205B48)), borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(32, 0, 32, 32),
            sliver: SliverToBoxAdapter(
              child: TextField(
                controller: inputNewPhone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: '전화번호',
                  labelText: '전화번호',
                  floatingLabelStyle: TextStyle(color: Color(0xFF205B48)),
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
                width: double.infinity,
                child: Text('계정정보', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700))
              )
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(32, 0, 32, 32),
            sliver: SliverToBoxAdapter(
              child: Container(
                child: TextFormField( // 이메일 인증은 필요할 것 같습니다?
                  controller: inputNewId,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: '이메일',
                    labelText: '이메일',
                    floatingLabelStyle: TextStyle(color: Color(0xFF205B48)),
                    border: OutlineInputBorder(borderSide: BorderSide(width: 1), borderRadius: BorderRadius.circular(5)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Color(0xff205B48)), borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(32, 0, 32, 32),
            sliver: SliverToBoxAdapter(
              child: TextField(
                controller: inputNewPassWord,
                keyboardType: TextInputType.number,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '비밀번호',
                  labelText: '비밀번호',
                  floatingLabelStyle: TextStyle(color: Color(0xFF205B48)),
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1), borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Color(0xff205B48)), borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(32, 0, 32, 32),
            sliver: SliverToBoxAdapter(
              child: TextField(
                controller: inputNewPassWordConfirm,
                keyboardType: TextInputType.number,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '비밀번호 확인',
                  labelText: '비밀번호 확인',
                  floatingLabelStyle: TextStyle(color: Color(0xFF205B48)),
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1), borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Color(0xff205B48)), borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(32, 0, 32, 32),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 60,
                child: ElevatedButton(
                  child: Text('가입하기'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF205B48)
                  ),
                  onPressed: () {
                    if(inputNewId.text != '' || inputNewName.text != '' || inputNewPassWord.text != '' || inputNewPassWordConfirm.text != '') {
                      letsSignUp();
                      addAccount();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => WebMain()));
                    } else {
                      print('입력안해?');
                    }
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}