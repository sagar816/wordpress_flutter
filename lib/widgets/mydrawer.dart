import 'package:demo_flr_01/screens/pageDetail.dart';
import 'package:demo_flr_01/services/page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  MyPage pageService = MyPage();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.yellow[800],
        child: Column(
          children: [
            Expanded(
                child: Container(
                child: FutureBuilder<List>(
                future: pageService.getAllPage(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data?.length == 0) {
                      return const Center(
                        child: Text("No Page"),
                      );
                    }
                    return ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            title: Center(
                              child: Text(
                                snapshot.data?[i]['title']['rendered'],
                                style: const TextStyle(
                                    fontSize: 25, color: Colors.black),
                              ),
                            ),
                            onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PageDetail(data: snapshot.data?[i]),
                                ),
                              )
                            },
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),

              //  ListView.builder(
              //       itemCount: 3,
              //       itemBuilder: (context, i) {
              //         return ListTile(
              //           title: const Center(
              //             child: Text("Service", style:TextStyle(fontSize:25, color: Colors.black),
              //             ),
              //             ),
              //           onTap: () => {
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => const Text("service"
              //                 ),
              //               ),
              //             )
              //           },
              //         );
              //       }),
            ))
          ],
        ),
      ),
    );
  }
}
