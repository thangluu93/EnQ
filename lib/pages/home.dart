import 'dart:ffi';

import 'package:EnQ/components/popular_card.dart';
import 'package:EnQ/const/size_config.dart';
import 'package:EnQ/const/style.dart';
import 'package:EnQ/models/recent.dart';
import 'package:EnQ/services/auth_service.dart';
import 'package:EnQ/utils/app_route.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 1:
          Navigator.of(context).pushNamed(AppRouting.leaderBoard);
          break;
        case 2:
          Navigator.of(context).pushNamed(AppRouting.categories);
          break;
        case 3:
          Navigator.of(context).pushNamed(AppRouting.profile);
          break;
        default:
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //UserService().getUsers().then((value) => print(value.body));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    AuthService auth = new AuthService();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight / 2.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Hello, Akita",
                        style: TitleStyle,
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            AssetImage('assets/images/baby_lion.jpg'),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Popular",
                      style: TextStyle(fontSize: 22.5, fontFamily: FontName),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          PopularCard(
                              'assets/images/undraw_book_lover_mkck.png'),
                          PopularCard(
                              'assets/images/undraw_book_reading_kx9s.png'),
                          PopularCard(
                              'assets/images/undraw_Reading_book_re_kqpk.png'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight / 2.25,
              color: Colors.lightBlueAccent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Recent",
                      style: TextStyle(fontSize: 22.5, fontFamily: FontName),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    color: Colors.amberAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(recents[0].photoUrl),
                          ),
                          Text(recents[0].userName),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Date: ' + recents[0].date),
                              Text('End Time: ' + recents[0].endAt),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Score'),
                              Text('${recents[0].point}' + '/10'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.barChartOutline),
              title: Text('Leader'),
            ),
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.listOutline),
              title: Text('Categories'),
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.history),
            //   title: Text('History'),
            // ),
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.personOutline),
              title: Text('Profile'),
            ),
          ],
          currentIndex: 0,
          selectedItemColor: Colors.black,
          selectedFontSize: 12,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
