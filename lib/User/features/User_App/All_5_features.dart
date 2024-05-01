import 'package:easyhome/User/features/User_App/F2_Home_User/Home_Screen.dart';
import 'package:easyhome/User/features/User_App/F3_Create_Post/Create_Post.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Deals&Apps.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home_User extends StatefulWidget {
  const Home_User({Key? key});

  @override
  State<Home_User> createState() => _Home_UserState();
}

class _Home_UserState extends State<Home_User> {
  int currentTab = 0;
  final List<Widget> screens = [
    HomeUser(),
    Map(),
    Deals_Apps(),
    Profile(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeUser();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.loggrey1,
        floatingActionButton: Container(
          child: FloatingActionButton(
            backgroundColor: Colors.black,
            child: Icon(Icons.add, color: Colors.white),
            onPressed: () {
              Create_Post New_Post = Create_Post();
              New_Post.creat_post(context);
            },
          ),
        ),
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          height: 70,
          color: MyColors.mainblue,
          shape: CircularNotchedRectangle(),
          notchMargin: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: 70,
                  width: 70,
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = HomeUser();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          size: 20,
                          FontAwesomeIcons.home,
                          color:
                              currentTab == 0 ? Colors.white : MyColors.grey4,
                        ),
                        currentTab == 0
                            ? Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: Text("Home",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: Text(''),
                              ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: SizedBox(
                    height: 70,
                    width: 70,
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = Map();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            size: 20,
                            FontAwesomeIcons.mapLocationDot,
                            color:
                                currentTab == 1 ? Colors.white : MyColors.grey4,
                          ),
                          currentTab == 1
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(" Map",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      )),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(''),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: SizedBox(
                    height: 70,
                    width: 70,
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = Deals_Apps();
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            size: 20,
                            FontAwesomeIcons.solidHandshake,
                            color:
                                currentTab == 2 ? Colors.white : MyColors.grey4,
                          ),
                          currentTab == 2
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(" Deals",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(''),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = Profile();
                      currentTab = 3;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Icon(
                          FontAwesomeIcons.solidUser,
                          size: 20,
                          color:
                              currentTab == 3 ? Colors.white : MyColors.grey4,
                        ),
                      ),
                      currentTab == 3
                          ? Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Text("Account",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  )),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Text(''),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Map extends StatelessWidget {
  const Map({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Map"),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
