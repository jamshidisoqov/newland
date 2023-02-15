import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newland/core/data/api/news_api.dart';
import 'package:newland/core/data/models/category_data.dart';
import 'package:newland/di/database_module.dart';
import 'package:newland/view/home/components/post_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getAllCategories();
  }

  List<Category> categoryList = [];

  Future<void> getAllCategories() async {
    var api = getIt.get<NewsApi>();
    (await api.getAllCategory()).onSuccess((p0) {
      for (var element in p0) {
        categoryList.addAll((element.child ?? []));
      }

      categoryList.forEach((element) {
        print(element.name);
      });

      setState(() {});
    }).onMessage((p0) {
      print(p0);
    }).onError((p0) {
      print(p0);
    });
  }

  var currentClickIndex = 0;

  void bottomNavigationClick(position) {
    currentClickIndex = position;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "New land",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: "Home",
              activeIcon: Icon(CupertinoIcons.house_fill),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bookmark),
              label: "Saved",
              activeIcon: Icon(CupertinoIcons.bookmark_fill),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: "Profile",
              activeIcon: Icon(CupertinoIcons.person_fill),
            ),
          ],
          currentIndex: currentClickIndex,
          onTap: bottomNavigationClick,
          selectedFontSize: 12,
          unselectedFontSize: 12,
        ),
        body: DefaultTabController(
          length: categoryList.length,
          child: Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 36,
                    child: TabBar(
                      isScrollable : true,
                      physics: const BouncingScrollPhysics(),
                      indicator: const BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: List.generate(
                          categoryList.length,
                          (index) => Tab(
                                text: categoryList[index].name,
                              )),
                      labelColor: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: List.generate(
                      categoryList.length,
                      (index) => PostItem(
                        category: categoryList[index],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
