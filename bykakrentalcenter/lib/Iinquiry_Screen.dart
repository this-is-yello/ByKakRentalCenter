import 'package:flutter/material.dart';

import 'package:bykakrentalcenter/To_Download_Screen.dart';
// import 'package:get/get.dart';

class ClickInquiry extends StatelessWidget {
  const ClickInquiry({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 420),
            child: InquiryScreen()
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

class InquiryScreen extends StatelessWidget {
  const InquiryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            margin: EdgeInsets.all(16),
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
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                    color: Colors.grey,
                  )
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('[대여종류] 상품이름', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                      Padding(padding: EdgeInsets.all(4)),
                      Text('yyyy.mm.dd - yyyy.mm.dd', style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            color: Colors.grey[300],
            width: double.infinity,
            height: 2,
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Text('문의유형', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
          ),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: InkWell(
                    child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 4,
                              offset: Offset(0, 4), 
                            )
                          ], 
                          color: Colors.white,
                        ),
                        
                        child: Center(child: Text('사이즈 문의', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
                    ),
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(
                      //   builder: (context) => ClickMeetingRent()
                      // ));
                    },
                  )
                ),
                Padding(padding: EdgeInsets.all(8)),
                Flexible(
                  fit: FlexFit.tight,
                  child: InkWell(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 4,
                            offset: Offset(0, 4), 
                          )
                        ], 
                        color: Colors.white,
                      ),
                      child: Center(child: Text('상품구성 문의', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
                    ),
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(
                      //   builder: (context) => ClickWeddingRent()
                      // ));
                    },
                  )
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  // controller: inputTitle,
                  decoration: InputDecoration(
                    hintText: '제목',
                    border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Color(0xff205B48))),
                  ),
                ),
                Padding(padding: EdgeInsets.all(4)),
                TextField(
                  // controller: inputInquiry,
                  decoration: InputDecoration(
                    hintText: '문의내용',
                    border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Color(0xff205B48))),
                  ),
                  maxLines: 8,
                  minLines: 8,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 32),
            color: Colors.grey[300],
            width: double.infinity,
            height: 2,
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 4,
                  offset: Offset(0, 4), 
                )
              ], 
            ),
            child: InkWell(
              child: Center(child: Text('전화상담 요청', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
              onTap: () {},
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: InkWell(
                child: Container(
                  margin: EdgeInsets.fromLTRB(8, 8, 4, 8),
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xff205B48),
                  ),
                  child: Center(child: Text('취소', style: TextStyle(color: Colors.white, fontSize: 16))),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            // Padding(padding: EdgeInsets.all(1)),
            Flexible(
              fit: FlexFit.tight,
              child: InkWell(
                child: Container(
                  margin: EdgeInsets.fromLTRB(4, 8, 8, 8),
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xff205B48),
                  ),
                  child: Center(child: Text('문의하기', style: TextStyle(color: Colors.white, fontSize: 16))),
                ),
                onTap: () {},
              ),
            )
          ],
        )
      ),
    );
  }
}