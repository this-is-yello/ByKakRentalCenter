import 'package:bykakrentalcenter/Account/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import 'package:bykakrentalcenter/promotionscreen.dart';
import 'package:bykakrentalcenter/FromMyPage/userinfo.dart';

final auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // KakaoSdk.init(nativeAppKey: 'c9a3cb3dac96e754b9b895ee6de98028', loggingEnabled: true);
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    title: '바이각 슈트 렌탈센터',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Lineseed',
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFF205B48),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    ),
    home: WebMain(),
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate
    ],
    supportedLocales: [
      const Locale('en', 'US'),
      const Locale('ko', 'KO'),
    ],
  ));
}

// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: MyApp(),
//   ));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Shop(),
//       ),
//     );
//   }
// }


// class Shop extends StatefulWidget {
//   const Shop({super.key});

//   @override
//   State<Shop> createState() => _ShopState();
// }

// class _ShopState extends State<Shop> {

//   getData() async{
//     try {
//       var result = await auth.createUserWithEmailAndPassword(
//           email: "idc1234@test.com",
//           password: "123456",
//       );
//       print(result.user);
//     } catch (e) {
//       print(e);
//     } 

//     var result = await firestore.collection('product').get();
//     for (var doc in result.docs) {
//       print(doc['name']);
//     }
//   }
  
//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text('샵페이지'),
//     );
//   }
// }