import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/Dwwira.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/Bloc/Fav_Bloc.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/Services/Get_Worker_ById.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Get_My_Apps.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Get_PostByID.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GetApps getapps = GetApps();
    return FutureBuilder<String>(
      future: getapps.getApps(
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZWY3NDZkOTcwODZjYmQ4ZWU2M2FlOCIsImN1cnJlbnRSb2xlIjoiV29ya2VyIiwiaWF0IjoxNzE0MzIzNjMzLCJleHAiOjE3MjIwOTk2MzN9.j-5a84kbE0_4zsIOpyQ_EhTsdtf9MtK6ADzTqok8i00"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Dwwira(color: MyColors.mainblue, height: 60.0, width: 60.0),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return ListView.builder(
            itemCount: getapps.apps.length,
            itemBuilder: (BuildContext context, int index) {
              GetWorker getWorker = GetWorker();
              return FutureBuilder<String>(
                future: getWorker.getworker(
                    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZWY3NDZkOTcwODZjYmQ4ZWU2M2FlOCIsImN1cnJlbnRSb2xlIjoiV29ya2VyIiwiaWF0IjoxNzE0MzIzNjMzLCJleHAiOjE3MjIwOTk2MzN9.j-5a84kbE0_4zsIOpyQ_EhTsdtf9MtK6ADzTqok8i00",
                    getapps.apps[index]["worker"]["_id"]),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("");
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return AppItem(
                      postId: getapps.apps[index]["post"],
                      appId: getapps.apps[index]["_id"],
                      name: getWorker.worker.name,
                      job: getWorker.worker.job,
                      isCertified: getWorker.worker.isCertified,
                      profilePicture: getWorker.worker.profilePicture,
                      description: getapps.apps[index]["description"],
                      workerId: getWorker.worker.id,
                    );
                  }
                },
              );
            },
          );
        }
      },
    );
  }
}

class AppItem extends StatelessWidget {
  GlobalKey<FormState> formstate_desc = GlobalKey();

  String appId;
  String workerId;
  String postId;
  String name;
  String job;
  bool isCertified;
  String profilePicture;
  String description;

  AppItem({
    required this.appId,
    required this.workerId,
    required this.postId,
    required this.name,
    required this.job,
    required this.isCertified,
    required this.profilePicture,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    GetPost getPost = GetPost();
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      width: MediaQuery.of(context).size.width - 40,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: ClipOval(
                  child: Container(
                      height: 60,
                      width: 60,
                      child: profilePicture != "default.jpg"
                          ? Image.network(
                              profilePicture,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              "lib/utils/images/default.jpg",
                              fit: BoxFit.cover,
                            )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        isCertified
                            ? Icon(
                                Icons.verified_user_rounded,
                                color: Color(0xFF137A23),
                              )
                            : Text(''),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, left: 0),
                      child: Text(
                        job,
                        style: TextStyle(
                            color: MyColors.mainorange,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 0, 7),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Applied for your post : ",
                style: TextStyle(
                  fontSize: 16,
                  color: MyColors.mainblue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
            child: Align(
              alignment: Alignment.topLeft,
              child: FutureBuilder(
                future: getPost.getpost(
                    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZWY3NDZkOTcwODZjYmQ4ZWU2M2FlOCIsImN1cnJlbnRSb2xlIjoiV29ya2VyIiwiaWF0IjoxNzE0MzIzNjMzLCJleHAiOjE3MjIwOTk2MzN9.j-5a84kbE0_4zsIOpyQ_EhTsdtf9MtK6ADzTqok8i00",
                    postId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("");
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Text("\"${getPost.post["title"]}\"");
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
            child: Form(
              key: formstate_desc,
              child: SizedBox(
                height: 140,
                child: TextFormField(
                  initialValue: description,
                  readOnly: true,
                  maxLines: 7,
                  cursorColor: MyColors.mainblue,
                  decoration: InputDecoration(
                    label: Text(
                      "Description :",
                      style: TextStyle(
                          color: MyColors.mainblue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    alignLabelWithHint: true,
                    focusColor: Colors.white,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1.5,
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(width: 1.5, color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red[800],
                ),
                onPressed: () async {},
                child: Text(
                  "Decline",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: MyColors.mainblue,
                ),
                onPressed: () async {},
                child: Text(
                  "Accept",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
