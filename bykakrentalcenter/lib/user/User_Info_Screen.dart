import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bykakrentalcenter/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:bykakrentalcenter/To_Download_Screen.dart';
import 'package:flutterfire_ui/auth.dart';

final auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;

class ClickProfile extends StatelessWidget {
  const ClickProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 420),
            child: ProfileModify()
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

class ProfileModify extends StatefulWidget {
  const ProfileModify({super.key});

  @override
  State<ProfileModify> createState() => _ProfileModifyState();
}

class _ProfileModifyState extends State<ProfileModify> {

  var inputModifyName = TextEditingController();
  var inputModifyPhone = TextEditingController();
  // var inputModifyId = TextEditingController();
  var inputModifyPassWord = TextEditingController();
  var inputModifyPassWordConfirm = TextEditingController();

  var dbPhone;
  var dbId;
  var dbPassWord;

  modifyCheck() async{

    var checkModify = await firestore.collection('account').get();

    for (int i = 0; i < checkModify.docs.length; i++) {
      if (checkModify.docs[i]['id'] == auth.currentUser?.email) {
        setState(() {
          dbPhone = checkModify.docs[i]['phone'];
          dbId = checkModify.docs[i]['id'];
          dbPassWord = checkModify.docs[i]['password'];
        });         
      }
    }
  }

  letsUpdate() async{
    await auth.currentUser?.updateDisplayName(inputModifyName.text);
    // await auth.currentUser?.updateEmail(inputModifyId.text);
    await auth.currentUser?.updatePassword(inputModifyPassWord.text);
  }

  updateAccount() {
    firestore.collection('account').doc(auth.currentUser?.email).update({'name' : inputModifyName.text, 'phone' : inputModifyPhone.text, 'password' : inputModifyPassWord.text});
  }

  @override
  void initState() {
    super.initState();
    modifyCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('????????????', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(30),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
            sliver: SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                child: Text('????????????', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700))
              )
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(32, 0, 32, 32),
            sliver: SliverToBoxAdapter(
              child: TextField(
                controller: inputModifyName,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: '???????????? ????????? ???????????????.',
                  labelText: '${auth.currentUser?.displayName}',
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
                controller: inputModifyPhone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: '???????????? ??????????????? ???????????????.',
                  labelText: '${dbPhone}',
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
                child: Text('????????????', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700))
              )
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(32, 0, 32, 20),
            sliver: SliverToBoxAdapter(
              child: Flexible(
                child: Container(
                  child: Text('????????? ????????? :' + ' ' + '${auth.currentUser?.email}', style: TextStyle(fontSize: 20),),
                ),
              ),
            ),
          //   sliver: SliverToBoxAdapter(
          //     child: TextField(
          //       controller: inputModifyId,
          //       keyboardType: TextInputType.name,
          //       decoration: InputDecoration(
          //         hintText: '???????????? ???????????? ???????????????.',
          //         labelText: '${dbId}',
          //         floatingLabelStyle: TextStyle(color: Color(0xFF205B48)),
          //         border: OutlineInputBorder(borderSide: BorderSide(width: 1), borderRadius: BorderRadius.circular(5)),
          //         focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Color(0xff205B48)), borderRadius: BorderRadius.circular(5)),
          //       ),
          //     ),
          //   ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(32, 0, 32, 32),
            sliver: SliverToBoxAdapter(
              child: TextField(
                controller: inputModifyPassWord,
                keyboardType: TextInputType.number,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '???????????? ??????????????? ???????????????.',
                  labelText: '???????????? ??????????????? ???????????????.',
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
                controller: inputModifyPassWordConfirm,
                keyboardType: TextInputType.number,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '???????????? ??????',
                  labelText: '???????????? ??????',
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
                  child: Text('??????????????????'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF205B48)
                  ),
                  onPressed: () {
                    if (inputModifyName.text != '' || inputModifyPhone.text != '' || inputModifyPassWord.text != '' || inputModifyPassWordConfirm.text != '') {
                      letsUpdate();
                      updateAccount();
                    } else {
                      print('????????????');
                      print(inputModifyName.text);
                    }
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => WebMain()));
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