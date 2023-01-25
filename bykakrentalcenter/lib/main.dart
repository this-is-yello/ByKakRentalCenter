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
}

// -------------------------------------------------- HomeScreen ---------------------------------------------------
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 1),
    () {
      setState(() {
        _isLoading = false;
      });
    });
    
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Color(0xFF1E1E1E), size: 28),
            title: Center(
              child: MediaQuery.of(context).size.width < 640 ? PhoneAppBar() : WideAppBar()
            ),
          ),
          body: _isLoading ? Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                color: Color(0xFF205B48),
              ),
            ),
          ) : ListView(
            children: [
              Container(
                child: Center(child: MainBanner()),
              ),
              Container(
                child: Center(
                  child: FirstContents()
                ),
              ),
              Container(
                child: Center(
                  child: SecondContents(),
                ),
              ),
              Container(
                child: Center(
                  child: ThirdContents(),
                ),
              ),
              Container(
                child: Center(
                  child: FourthContents(),
                ),
              ),
              Container(
                child: Center(
                  child: Footer(),
                ),
              ),
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
// -------------------------------------------------- AppBar_Wide ---------------------------------------------------
class WideAppBar extends StatefulWidget {
  const WideAppBar({super.key});

  @override
  State<WideAppBar> createState() => _WideAppBarState();
}

class _WideAppBarState extends State<WideAppBar> {
  
  widgetSize(c) {
    if(MediaQuery.of(context).size.width < 1080) {
      return 560;
    } else {
      return 1080;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      width: widgetSize(context),
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
          height: 40.w,
          color: Color(0xFF205B48),
          child: Center(child: Text('K!mjuhyeon by 覺 BANNER'),),
        );
      }
    );
  }
}


// -------------------------------------------------- Content-1 ---------------------------------------------------
class FirstContents extends StatefulWidget {
  const FirstContents({super.key});

  @override
  State<FirstContents> createState() => _FirstContentsState();
}

class _FirstContentsState extends State<FirstContents> {

  widgetSize(c) {
    if(MediaQuery.of(context).size.width < 640) {
      return 360;
    } else if (MediaQuery.of(context).size.width < 1080) {
      return 560;
    } else {
      return 1080;
    }
  }

  paddingSize(c) {
    if(MediaQuery.of(context).size.width < 640) {
      return 8;
    } else {
      return 16;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Container(
          width: widgetSize(context),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                InkWell(
                  child: Container(
                    width: 100.w,
                    height: 90,
                    padding: EdgeInsets.all(paddingSize(context)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('대여기간'),
                        Padding(padding: EdgeInsets.only(top: paddingSize(context))),
                        Text('YY.MM.DD - YY.MM.DD')
                      ],
                    ),
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
                          padding: EdgeInsets.all(paddingSize(context)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('대여형태'),
                              Padding(padding: EdgeInsets.only(top: paddingSize(context))),
                              Text('예복대여')
                            ],
                          ),
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
                          padding: EdgeInsets.all(paddingSize(context)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('상담시간'),
                              Padding(padding: EdgeInsets.only(top: paddingSize(context))),
                              Text('YY.MM.DD / HH.MM')
                            ],
                          ),
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
                  ],
                ),
                Padding(padding: EdgeInsets.all(8)),
                InkWell(
                  child: Container(
                    width: 100.w,
                    height: 60,
                    child: Center(child: Text('검색', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700))),
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
              ],
            ),
          ),
        );
      }
    );
  }
}


// -------------------------------------------------- Content-2 ---------------------------------------------------
class SecondContents extends StatefulWidget {
  const SecondContents({super.key});

  @override
  State<SecondContents> createState() => _SecondContentsState();
}

class _SecondContentsState extends State<SecondContents> {

  fontSizeH2(c) {
    if(MediaQuery.of(context).size.width < 640) {
      return 20;
    } else if (MediaQuery.of(context).size.width < 1080) {
      return 24;
    } else {
      return 32;
    }
  }

  fontSizeSub(c) {
    if(MediaQuery.of(context).size.width < 640) {
      return 14;
    } else if (MediaQuery.of(context).size.width < 1080) {
      return 16;
    } else {
      return 20;
    }
  }

  widgetSize(c) {
    if(MediaQuery.of(context).size.width < 640) {
      return 360;
    } else if (MediaQuery.of(context).size.width < 1080) {
      return 560;
    } else {
      return 1080;
    }
  }

  paddingSize(c) {
    if(MediaQuery.of(context).size.width < 640) {
      return 8;
    } else {
      return 16;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Container(
          // padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Text('인기상품', style: TextStyle(fontSize: fontSizeH2(context), fontWeight: FontWeight.w700)),
              ),
              Padding(padding: EdgeInsets.all(8)),
              Container(
                width: widgetSize(context),
                padding: EdgeInsets.all(16),
                child: CarouselSlider(
                  options: CarouselOptions(
                    // height: 30.w,
                    viewportFraction: 0.45,
                    scrollDirection: Axis.horizontal,
                    enlargeCenterPage: true,
                    autoPlay: true,
                  ),
                  items: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          child: InkWell(
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    //height: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF205B48),
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(paddingSize(context)),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('상품명', style: TextStyle(fontSize: fontSizeSub(context), color: Color(0xFF1E1E1E))),
                                      Padding(padding: EdgeInsets.all(2)),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('대여샵', style: TextStyle(fontSize: fontSizeSub(context), color: Color(0xFF9E9E9E))),
                                          Text('50000원', style: TextStyle(fontSize: fontSizeSub(context), color: Color(0xFF205B48), fontWeight: FontWeight.w700)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {},
                          ),
                        ),
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


// -------------------------------------------------- Content-3 ---------------------------------------------------
class ThirdContents extends StatefulWidget {
  const ThirdContents({super.key});

  @override
  State<ThirdContents> createState() => _ThirdContentsState();
}

class _ThirdContentsState extends State<ThirdContents> {

  fontSizeH2(c) {
    if(MediaQuery.of(context).size.width < 640) {
      return 20;
    } else if (MediaQuery.of(context).size.width < 1080) {
      return 24;
    } else {
      return 32;
    }
  }

  fontSizeSub(c) {
    if(MediaQuery.of(context).size.width < 640) {
      return 14;
    } else if (MediaQuery.of(context).size.width < 1080) {
      return 16;
    } else {
      return 20;
    }
  }

  widgetSize(c) {
    if(MediaQuery.of(context).size.width < 640) {
      return 360;
    } else if (MediaQuery.of(context).size.width < 1080) {
      return 560;
    } else {
      return 1080;
    }
  }

  paddingSize(c) {
    if(MediaQuery.of(context).size.width < 640) {
      return 8;
    } else {
      return 16;
    }
  }
  gridHeight(c) {
    if(MediaQuery.of(context).size.width < 640) {
      return 780;
    } else if (MediaQuery.of(context).size.width < 1080) {
      return 1240;
    } else {
      return 1100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Text('패키지 상품', style: TextStyle(fontSize: fontSizeH2(context), fontWeight: FontWeight.w700)),
              ),
              Padding(padding: EdgeInsets.all(8)),
              Container(
                padding: EdgeInsets.all(16),
                width: widgetSize(context),
                height: gridHeight(context),
                child: GridView.builder(
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1 / 1.5,
                    crossAxisCount: MediaQuery.of(context).size.width < 1080 ? 2 : 3,
                    mainAxisSpacing: paddingSize(context),
                    crossAxisSpacing: paddingSize(context),
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              //height: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Color(0xFF205B48),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(paddingSize(context)),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('패키지 명', style: TextStyle(fontSize: fontSizeSub(context), color: Color(0xFF1E1E1E))),
                                Padding(padding: EdgeInsets.all(2)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('대여샵', style: TextStyle(fontSize: fontSizeSub(context), color: Color(0xFF9E9E9E))),
                                    Text('500000원', style: TextStyle(fontSize: fontSizeSub(context), color: Color(0xFF205B48), fontWeight: FontWeight.w700)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      onTap: () {},
                    );
                  }
                ),
              )
            ],
          ),
        );
      }
    );
  }
}


// -------------------------------------------------- Content-4 ---------------------------------------------------
class FourthContents extends StatefulWidget {
  const FourthContents({super.key});

  @override
  State<FourthContents> createState() => _FourthContentsState();
}

class _FourthContentsState extends State<FourthContents> {
  
  fontSizeH2(c) {
    if(MediaQuery.of(context).size.width < 640) {
      return 20;
    } else if (MediaQuery.of(context).size.width < 1080) {
      return 24;
    } else {
      return 32;
    }
  }

  fontSizeSub(c) {
    if(MediaQuery.of(context).size.width < 640) {
      return 14;
    } else if (MediaQuery.of(context).size.width < 1080) {
      return 16;
    } else {
      return 20;
    }
  }

  widgetSize(c) {
    if(MediaQuery.of(context).size.width < 640) {
      return 360;
    } else if (MediaQuery.of(context).size.width < 1080) {
      return 560;
    } else {
      return 1080;
    }
  }

  paddingSize(c) {
    if(MediaQuery.of(context).size.width < 640) {
      return 8;
    } else {
      return 16;
    }
  }

  boxSize(c) {
    if(MediaQuery.of(context).size.width < 640) {
      return 50;
    } else if (MediaQuery.of(context).size.width < 1080) {
      return 80;
    } else {
      return 120;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Text('서비스 이용안내', style: TextStyle(fontSize: fontSizeH2(context), fontWeight: FontWeight.w700)),
              ),
              Padding(padding: EdgeInsets.all(8)),
              Container(
                padding: EdgeInsets.all(16),
                width: widgetSize(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              width: boxSize(context),
                              height: boxSize(context),
                              decoration: BoxDecoration(
                                color: Color(0xFF1E1E1E),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(8)),
                            Text('예약안내', style: TextStyle(fontSize: fontSizeSub(context)))
                          ]
                        ),
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              width: boxSize(context),
                              height: boxSize(context),
                              decoration: BoxDecoration(
                                color: Color(0xFF1E1E1E),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(8)),
                            Text('대여/반납', style: TextStyle(fontSize: fontSizeSub(context)))
                          ]
                        ),
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              width: boxSize(context),
                              height: boxSize(context),
                              decoration: BoxDecoration(
                                color: Color(0xFF1E1E1E),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(8)),
                            Text('취소/환불', style: TextStyle(fontSize: fontSizeSub(context)))
                          ]
                        ),
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              width: boxSize(context),
                              height: boxSize(context),
                              decoration: BoxDecoration(
                                color: Color(0xFF1E1E1E),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(8)),
                            Text('위약금', style: TextStyle(fontSize: fontSizeSub(context)))
                          ]
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(20))
            ],
          ),
        );
      }
    );
  }
}


// -------------------------------------------------- MainFooter ---------------------------------------------------
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Container(
          width: 100.w,
          height: 28.w,
          color: Color(0xFF205B48),
          child: Center(child: Text('K!mjuhyeon by 覺 FOOTER'),),
        );
      }
    );
  }
}