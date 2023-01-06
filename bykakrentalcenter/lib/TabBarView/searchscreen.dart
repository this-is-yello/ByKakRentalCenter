import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            pinned: true,
            floating: true,
            centerTitle: true,
            automaticallyImplyLeading: false,
            expandedHeight: 100,
            toolbarHeight: 100,
            backgroundColor: Colors.white,
            title: Container(
              child: TextField(
                // controller: inputSearch,
                decoration: InputDecoration(
                  hintText: '검색어를 입력하세요.',
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Color(0xff205B48))),
                  suffixIcon: Icon(Icons.search, color: Color(0xff205B48))
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            sliver: SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                child: Text('카테고리', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700))
              )
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            sliver: SliverGrid.count(
              crossAxisCount: 3,
              childAspectRatio: 2.5,
              children: [
                Container(
                  child: InkWell(
                    child: Center(child: Text('자켓', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
                    onTap: () {},
                  ),
                ),
                Container(
                  child: InkWell(
                    child: Center(child: Text('바지', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
                    onTap: () {},
                  ),
                ),
                Container(
                  child: InkWell(
                    child: Center(child: Text('셔츠', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
                    onTap: () {},
                  ),
                ),
                Container(
                  child: InkWell(
                    child: Center(child: Text('조끼', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
                    onTap: () {},
                  ),
                ),
                Container(
                  child: InkWell(
                    child: Center(child: Text('구두', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
                    onTap: () {},
                  ),
                ),
                Container(
                  child: InkWell(
                    child: Center(child: Text('악세사리', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            sliver: SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                child: Text('최근 검색어', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700))
              )
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(Icons.search),
                    title: Container(
                      child: InkWell(
                        child: Text('제품명'),
                        onTap: () {},
                      ),
                    ),
                    trailing: TextButton(
                      child: Text('삭제', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
                      onPressed: () {},
                    ),
                  )
                ),
                childCount: 12,
              )
            ),
          )
        ],
      ),
    );
  }
}