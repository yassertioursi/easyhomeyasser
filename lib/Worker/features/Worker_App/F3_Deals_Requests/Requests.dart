import 'package:easyhome/User/features/User_App/F2_Home_User/Bloc/Fav_Bloc.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Requests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => bloc_fav(),
        ),
      ],
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            5,
            (index) => AppItem(),
          ),
        ),
      ),
    );
  }
}

class AppItem extends StatelessWidget {
  GlobalKey<FormState> formstate_title = GlobalKey();
  GlobalKey<FormState> formstate_desc = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
                padding: EdgeInsets.only(right: 10),
                height: 70,
                width: 70,
                child: ClipOval(
                  child: Image.network(
                    "https://m.media-amazon.com/images/I/41AY0W4qFOL._AC_UF894,1000_QL80_.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Yasser Levi   ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Icon(
                        Icons.verified_user_rounded,
                        color: Color(0xFF137A23),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, left: 0),
                    child: Text(
                      "Cleaner",
                      style: TextStyle(
                          color: MyColors.mainorange,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Applied for your post : ",
                  style: TextStyle(
                      fontSize: 16,
                      color: MyColors.mainblue,
                      fontWeight: FontWeight.w600),
                )),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
            child: Form(
              key: formstate_desc,
              child: SizedBox(
                height: 140,
                child: TextFormField(
                  initialValue: "Description",
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
