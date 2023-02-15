import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          length: 3,
          child: Scaffold(
            body: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 36,
                    child: TabBar(
                      physics: BouncingScrollPhysics(),
                      indicator: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: [
                        Tab(
                          text: "Transports",
                        ),
                        Tab(
                          text: "Transports",
                        ),
                        Tab(
                          text: "Transports",
                        ),
                      ],
                      labelColor: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Icon(Icons.directions_car),
                      Icon(Icons.directions_transit),
                      Icon(Icons.directions_bike),
                    ],
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
