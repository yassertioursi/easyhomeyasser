import 'package:easyhome/User/features/User_App/F2_Home_User/Bloc/Fav_Bloc.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/BloC/Save_Text.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class DealWorker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => Save_Text()),
        ChangeNotifierProvider(
            create: (BuildContext context) => Save_Text_One()),
      ],
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            5,
            (index) => DealItem(),
          ),
        ),
      ),
    );
  }
}

class DealItem extends StatelessWidget {
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
      height: 400,
      width: MediaQuery.of(context).size.width - 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            padding: const EdgeInsets.only(bottom: 10.0),
            child:
                Consumer<Save_Text>(builder: (context, bloc_save_text, child) {
              return Form(
                key: formstate_title,
                child: TextFormField(
                  onChanged: (value) {
                    bloc_save_text.setChanged(true);
                  },
                  maxLength: 100,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  cursorColor: MyColors.mainblue,
                  decoration: InputDecoration(
                    suffixIcon: bloc_save_text.changed
                        ? IconButton(
                            icon: Icon(
                              Icons.playlist_add_check_circle_sharp,
                              color: MyColors.mainorange,
                            ),
                            onPressed: () {
                              bloc_save_text.setChanged(false);
                              SystemChannels.textInput
                                  .invokeMethod('TextInput.hide');
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                          )
                        : null,
                    label: Text(
                      "Title :",
                      style: TextStyle(
                        color: MyColors.mainblue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                      borderSide: BorderSide(width: 2, color: Colors.black),
                    ),
                  ),
                ),
              );
            }),
          ),
          Consumer<Save_Text_One>(builder: (context, bloc_save_text1, child) {
            return Form(
              key: formstate_desc,
              child: SizedBox(
                height: 140,
                child: TextFormField(
                  onChanged: (value) {
                    bloc_save_text1.setChanged(true);
                  },
                  maxLength: 100,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  maxLines: 7,
                  cursorColor: MyColors.mainblue,
                  decoration: InputDecoration(
                    suffixIcon: bloc_save_text1.changed
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 13.0, right: 7),
                                child: IconButton(
                                  icon: Icon(
                                    size: 30,
                                    Icons.playlist_add_check_circle_sharp,
                                    color: MyColors.mainorange,
                                  ),
                                  onPressed: () {
                                    bloc_save_text1.setChanged(false);
                                    SystemChannels.textInput
                                        .invokeMethod('TextInput.hide');
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                  },
                                ),
                              ),
                            ],
                          )
                        : null,
                    label: Text(
                      "Description :",
                      style: TextStyle(
                        color: MyColors.mainblue,
                        fontWeight: FontWeight.bold,
                      ),
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
                      borderSide: BorderSide(width: 2, color: Colors.black),
                    ),
                  ),
                ),
              ),
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "On going",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF137A23),
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
                      "Discard",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
