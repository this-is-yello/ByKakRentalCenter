import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:bykakrentalcenter/account/LogIn_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import 'package:bykakrentalcenter/To_Download_Screen.dart';
import 'package:bykakrentalcenter/Promotion_Screen.dart';
import 'package:bykakrentalcenter/user/User_Info_Screen.dart';

final auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      title: '바이각 렌탈센터',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lineseed'
      ),
      home: HomeScreen()
    ),
    
  );
  // runApp(
  //   MaterialApp(
  //     title: '바이각 슈트 렌탈센터',
  //     debugShowCheckedModeBanner: false,
  //     theme: ThemeData(
  //       fontFamily: 'Lineseed',
  //       bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //         backgroundColor: Colors.white,
  //         selectedItemColor: Color(0xFF205B48),
  //         unselectedItemColor: Colors.grey,
  //         showUnselectedLabels: true,
  //       ),
  //     ),
  //     home: WebMain(),
  //     localizationsDelegates: [
  //       GlobalMaterialLocalizations.delegate,
  //       GlobalWidgetsLocalizations.delegate
  //     ],
  //     supportedLocales: [
  //       const Locale('en', 'US'),
  //       const Locale('ko', 'KO'),
  //     ],
  //   )
  // );
}

// -------------------------------------------------- HomeScreen ---------------------------------------------------
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool phoneWidth = false;
  bool tablteWidth = false;

  widthState() {
    if(MediaQuery.of(context).size.width < 640) {
      setState(() {
        phoneWidth = true;
        tablteWidth = false;
      });
      print('$phoneWidth' + '$tablteWidth');
    } else if (MediaQuery.of(context).size.width < 1080) {
      setState(() {  
        phoneWidth = false;
        tablteWidth = true;
      });
      print('$phoneWidth' + '$tablteWidth');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Color(0xFF1E1E1E), size: 28),
            title: Center(
              child: MediaQuery.of(context).size.width < 640 ? PhoneAppBar() : MediaQuery.of(context).size.width < 1080 ? TabletAppBar() : WebAppBar()
            ),
          ),
          body: ListView(
            children: [
              Container(
                child: Center(child: MainBanner()),
              ),
              Container(
                child: Center(
                  child: MediaQuery.of(context).size.width < 640 ? PhoneFirstContents() : MediaQuery.of(context).size.width < 1080 ? TabletFirstContents() : WebFirstContents()
                ),
              ),
              Container(
                child: Center(
                  child: WebSecondContents(),
                ),
              )
            ],
          )
        );
      }
    );
  }
}

// -------------------------------------------------- AppBar-Phone ---------------------------------------------------
class PhoneAppBar extends StatelessWidget {
  const PhoneAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          Text('순양 렌탈센터', style: TextStyle(color: Color(0xFF1E1E1E), fontWeight: FontWeight.w700)),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
// -------------------------------------------------- AppBar_Tablet ---------------------------------------------------
class TabletAppBar extends StatelessWidget {
  const TabletAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 560,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('순양 렌탈센터', style: TextStyle(color: Color(0xFF1E1E1E), fontWeight: FontWeight.w700)),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                TextButton(
                  child: Text('예약내역', style: TextStyle(fontSize: 16, color: Color(0xFF1E1E1E), fontWeight: FontWeight.w700)),
                  onPressed: () {},
                ),
                TextButton(
                  child: Text('마이페이지', style: TextStyle(fontSize: 16, color: Color(0xFF1E1E1E), fontWeight: FontWeight.w700)),
                  onPressed: () {},
                ),
                TextButton(
                  child: Text('로그인', style: TextStyle(fontSize: 16, color: Color(0xFF1E1E1E), fontWeight: FontWeight.w700)),
                  onPressed: () {},
                ),
              ]
            ),
          )
        ],
      ),
    );
  }
}
// -------------------------------------------------- AppBar_Web ---------------------------------------------------
class WebAppBar extends StatelessWidget {
  const WebAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 560,
        maxWidth: 1080,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('순양 렌탈센터', style: TextStyle(color: Color(0xFF1E1E1E), fontWeight: FontWeight.w700)),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                TextButton(
                  child: Text('예약내역', style: TextStyle(fontSize: 16, color: Color(0xFF1E1E1E), fontWeight: FontWeight.w700)),
                  onPressed: () {},
                ),
                TextButton(
                  child: Text('마이페이지', style: TextStyle(fontSize: 16, color: Color(0xFF1E1E1E), fontWeight: FontWeight.w700)),
                  onPressed: () {},
                ),
                TextButton(
                  child: Text('로그인', style: TextStyle(fontSize: 16, color: Color(0xFF1E1E1E), fontWeight: FontWeight.w700)),
                  onPressed: () {},
                ),
              ]
            ),
          )
        ],
      ),
    );
  }
}


// -------------------------------------------------- MainBanner ---------------------------------------------------
class MainBanner extends StatelessWidget {
  const MainBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Container(
          width: 100.w,
          height: 36.w,
          color: Color(0xFF205B48),
          child: Center(child: Text('K!mjuhyeon by 覺 BANNER'),),
        );
      }
    );
  }
}


// -------------------------------------------------- Content-1-Phone ---------------------------------------------------
class PhoneFirstContents extends StatefulWidget {
  const PhoneFirstContents({super.key});

  @override
  State<PhoneFirstContents> createState() => _PhoneFirstContentsState();
}

class _PhoneFirstContentsState extends State<PhoneFirstContents> {

  changeRowColumn() {
    if(MediaQuery.of(context).size.width < 1080) {
      return Column();
    } else {
      return Row();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              InkWell(
                child: Container(
                  width: 100.w,
                  height: 80,
                  child: Text('대여기간'),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 4,
                        offset: Offset(0, 4), 
                      )
                    ],
                  ),
                ),
                onTap: () {},
              ),
              Padding(padding: EdgeInsets.all(8)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: InkWell(
                      child: Container(
                        height: 80,
                        child: Text('대여형태'),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 4,
                              offset: Offset(0, 4), 
                            )
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Flexible(
                    fit: FlexFit.tight,
                    child: InkWell(
                      child: Container(
                        height: 80,
                        child: Text('상담시간'),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 4,
                              offset: Offset(0, 4), 
                            )
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Flexible(
                    fit: FlexFit.tight,
                    child: InkWell(
                      child: Container(
                        height: 80,
                        child: Text('검색'),
                        decoration: BoxDecoration(
                          color: Color(0xFF205B48),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 4,
                              offset: Offset(0, 4), 
                            )
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              )
            ],
          )
        );
      }
    );
  }
}
// -------------------------------------------------- Content-1-Tablet ---------------------------------------------------
class TabletFirstContents extends StatelessWidget {
  const TabletFirstContents({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 560,
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                InkWell(
                  child: Container(
                    width: 100.w,
                    height: 90,
                    child: Text('대여기간'),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 4,
                          offset: Offset(0, 4), 
                        )
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
                Padding(padding: EdgeInsets.all(8)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: InkWell(
                        child: Container(
                          height: 90,
                          child: Text('대여형태'),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 4,
                                offset: Offset(0, 4), 
                              )
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    Flexible(
                      fit: FlexFit.tight,
                      child: InkWell(
                        child: Container(
                          height: 90,
                          child: Text('상담시간'),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 4,
                                offset: Offset(0, 4), 
                              )
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    Flexible(
                      fit: FlexFit.tight,
                      child: InkWell(
                        child: Container(
                          height: 90,
                          child: Text('검색'),
                          decoration: BoxDecoration(
                            color: Color(0xFF205B48),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 4,
                                offset: Offset(0, 4), 
                              )
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
// -------------------------------------------------- Content-1-Web ---------------------------------------------------
class WebFirstContents extends StatelessWidget {
  const WebFirstContents({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 1080,
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: InkWell(
                    child: Container(
                      height: 100,
                      child: Text('대여기간'),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 4,
                            offset: Offset(0, 4), 
                          )
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Flexible(
                  fit: FlexFit.tight,
                  child: InkWell(
                    child: Container(
                      height: 100,
                      child: Text('대여형태'),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 4,
                            offset: Offset(0, 4), 
                          )
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Flexible(
                  fit: FlexFit.tight,
                  child: InkWell(
                    child: Container(
                      height: 100,
                      child: Text('상담시간'),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 4,
                            offset: Offset(0, 4), 
                          )
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Flexible(
                  fit: FlexFit.tight,
                  child: InkWell(
                    child: Container(
                      height: 100,
                      child: Text('검색'),
                      decoration: BoxDecoration(
                        color: Color(0xFF205B48),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 4,
                            offset: Offset(0, 4), 
                          )
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}


// -------------------------------------------------- Content-2-Phone ---------------------------------------------------
class PhoneSecondContents extends StatefulWidget {
  const PhoneSecondContents({super.key});

  @override
  State<PhoneSecondContents> createState() => _PhoneSecondContentsState();
}

class _PhoneSecondContentsState extends State<PhoneSecondContents> {

  fontSizeH2(c) {
    if(MediaQuery.of(context).size.width < 640) {
      return 20;
    } else if (MediaQuery.of(context).size.width < 1080) {
      return 24;
    } else {
      return 32;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Text('인기상품', style: TextStyle(fontSize: fontSizeH2(context), fontWeight: FontWeight.w700)),
              ),
              Padding(padding: EdgeInsets.all(8)),
              Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 42.w,
                    viewportFraction: 1,
                    scrollDirection: Axis.horizontal,
                    enlargeCenterPage: true,
                    autoPlay: true,
                  ),
                  items: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: Column(
                            children: [
                              Container(
                                width: 30.w,
                                height: 30.w,
                                decoration: BoxDecoration(
                                  color: Color(0xFF205B48),
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                                ),
                              ),
                              Container(
                                width: 30.w,
                                height: 10.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                        InkWell(
                          child: Column(
                            children: [
                              Container(
                                width: 30.w,
                                height: 30.w,
                                decoration: BoxDecoration(
                                  color: Color(0xFF205B48),
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                                ),
                              ),
                              Container(
                                width: 30.w,
                                height: 10.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                        InkWell(
                          child: Column(
                            children: [
                              Container(
                                width: 30.w,
                                height: 30.w,
                                decoration: BoxDecoration(
                                  color: Color(0xFF205B48),
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                                ),
                              ),
                              Container(
                                width: 30.w,
                                height: 10.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          onTap: () {},
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
// -------------------------------------------------- Content-2-Tablet ---------------------------------------------------
class TabletSecondContents extends StatefulWidget {
  const TabletSecondContents({super.key});

  @override
  State<TabletSecondContents> createState() => _TabletSecondContentsState();
}

class _TabletSecondContentsState extends State<TabletSecondContents> {

  fontSizeH2(c) {
    if(MediaQuery.of(context).size.width < 640) {
      return 20;
    } else if (MediaQuery.of(context).size.width < 1080) {
      return 24;
    } else {
      return 32;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 560,
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Text('인기상품', style: TextStyle(fontSize: fontSizeH2(context), fontWeight: FontWeight.w700)),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Container(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 228,
                      viewportFraction: 1,
                      scrollDirection: Axis.horizontal,
                      enlargeCenterPage: true,
                      autoPlay: true,
                    ),
                    items: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Column(
                              children: [
                                Container(
                                  width: 160,
                                  height: 160,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF205B48),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                                  ),
                                ),
                                Container(
                                  width: 160,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {},
                          ),
                          InkWell(
                            child: Column(
                              children: [
                                Container(
                                  width: 160,
                                  height: 160,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF205B48),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                                  ),
                                ),
                                Container(
                                  width: 160,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {},
                          ),
                          InkWell(
                            child: Column(
                              children: [
                                Container(
                                  width: 160,
                                  height: 160,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF205B48),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                                  ),
                                ),
                                Container(
                                  width: 160,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {},
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
// -------------------------------------------------- Content-2-Web ---------------------------------------------------
class WebSecondContents extends StatefulWidget {
  const WebSecondContents({super.key});

  @override
  State<WebSecondContents> createState() => _WebSecondContentsState();
}

class _WebSecondContentsState extends State<WebSecondContents> {

  fontSizeH2(c) {
    if(MediaQuery.of(context).size.width < 640) {
      return 20;
    } else if (MediaQuery.of(context).size.width < 1080) {
      return 24;
    } else {
      return 32;
    }
  }

  paddingSet(c) {
    if(MediaQuery.of(context).size.width < 640) {
      return 16;
    } else if (MediaQuery.of(context).size.width < 1080) {
      return 20;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 1080,
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Text('인기상품', style: TextStyle(fontSize: fontSizeH2(context), fontWeight: FontWeight.w700)),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Container(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      // height: 428,
                      viewportFraction: 1,
                      scrollDirection: Axis.horizontal,
                      enlargeCenterPage: true,
                      // autoPlay: true,
                    ),
                    items: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Column(
                              children: [
                                Container(
                                  width: 20.w,
                                  height: 20.w,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF205B48),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                                  ),
                                ),
                                Container(
                                  width: 20.w,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {},
                          ),
                          InkWell(
                            child: Column(
                              children: [
                                Container(
                                  width: 20.w,
                                  height: 20.w,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF205B48),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                                  ),
                                ),
                                Container(
                                  width: 20.w,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {},
                          ),
                          // InkWell(
                          //   child: Column(
                          //     children: [
                          //       Container(
                          //         width: 20.w,
                          //         height: 20.w,
                          //         decoration: BoxDecoration(
                          //           color: Color(0xFF205B48),
                          //           borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                          //         ),
                          //       ),
                          //       Container(
                          //         width: 20.w,
                          //         height: 100,
                          //         decoration: BoxDecoration(
                          //           color: Colors.white,
                          //           borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(0.5),
                          //               blurRadius: 4,
                          //               offset: Offset(0, 4),
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          //   onTap: () {},
                          // )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}