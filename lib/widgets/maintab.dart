import 'package:demo_flr_01/screens/categorypost.dart';
import 'package:demo_flr_01/screens/latestpost.dart';
import 'package:demo_flr_01/screens/photos.dart';
import 'package:demo_flr_01/screens/video.dart';
import 'package:demo_flr_01/widgets/mydrawer.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class MainTab extends StatefulWidget {
  const MainTab({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final List<Tab> topTabs = <Tab>[
    const Tab(child: Text("LATEST")),
    const Tab(child: Text("POPULAR")),
    const Tab(child: Text("VIDEOS")),
    const Tab(child: Text("IMAGES")),
  ];

  @override
  void initState() {
    _tabController =
        TabController(length: topTabs.length, initialIndex: 0, vsync: this)
          ..addListener(() {
            setState(() {});
          });

    super.initState();
  }

  // Future<bool> _onWillPop() async {
  //   print("on Will Pop");
  //   if (_tabController?.index == 0) {
  //     await SystemNavigator.pop();
  //   }

  //   Future.delayed(const Duration(microseconds: 200), () {
  //     print("Set Index");
  //     _tabController?.index = 0;
  //   });

  //   print("Return");
  //   return _tabController?.index == 0;
  // }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text(
            'Wordpress Posts',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          actions: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow[800],
              ),
              child: IconButton(
                icon: const Icon(Icons.search),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  print('Search Button Clicked');
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow[800],
              ),
              child: IconButton(
                icon: const Icon(Icons.menu),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
              ),
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.black,
            tabs: topTabs,
          ),
        ),
        endDrawer: Container(
          child: MyDrawer(),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            LatestPost(),
            CategoryPost(),
            Video(),
            Photos(),
          ],
        ),
      ),
    );
  }
}
