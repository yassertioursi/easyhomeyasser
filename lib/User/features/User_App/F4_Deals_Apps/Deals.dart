import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/Dwwira.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/Bloc/Fav_Bloc.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/Services/Get_Worker_ById.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/BloC/Save_Text.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Get_My_Deals.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Update_Deal.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Deal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GetDeals getdeals = GetDeals();

    return FutureBuilder<String>(
      future: getdeals.getDeals(
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjQ4M2MyMDEyOGRjNzM0N2UwZjQ1OCIsImN1cnJlbnRSb2xlIjoiVXNlciIsImlhdCI6MTcxNDMyNDkwOCwiZXhwIjoxNzIyMTAwOTA4fQ.yOioCvoMstv4tQjtyMbMIXczZocAFj04jyPHXKyWr9Q"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child:
                  Dwwira(color: MyColors.mainblue, height: 60.0, width: 60.0));
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return ListView.builder(
            itemCount: getdeals.deals.length,
            itemBuilder: (BuildContext context, int index) {
              GetWorker getWorker = GetWorker();
              return FutureBuilder<String>(
                future: getWorker.getworker(
                    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZWY3NDZkOTcwODZjYmQ4ZWU2M2FlOCIsImN1cnJlbnRSb2xlIjoiV29ya2VyIiwiaWF0IjoxNzE0MzIzNjMzLCJleHAiOjE3MjIwOTk2MzN9.j-5a84kbE0_4zsIOpyQ_EhTsdtf9MtK6ADzTqok8i00",
                    getdeals.deals[index]["worker"]),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("");
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return DealItem(
                      dealId: getdeals.deals[index]["_id"],
                      name: "${getWorker.worker.name}",
                      job: getWorker.worker.job,
                      isCertified: getWorker.worker.isCertified,
                      profilePicture: getWorker.worker.profilePicture,
                      title: getdeals.deals[index]["userTitle"],
                      description: getdeals.deals[index]["userDescription"],
                      status: getdeals.deals[index]["status"],
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

class DealItem extends StatelessWidget {
  GlobalKey<FormState> formstate_title = GlobalKey();
  GlobalKey<FormState> formstate_desc = GlobalKey();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String dealId;
  String workerId;
  String name;
  String job;
  bool isCertified;
  String profilePicture;
  String title;
  String description;
  String status;

  DealItem({
    required this.dealId,
    required this.workerId,
    required this.name,
    required this.job,
    required this.isCertified,
    required this.profilePicture,
    required this.title,
    required this.description,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    titleController.text = title;
    descriptionController.text = description;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (BuildContext context) => Save_Text()),
          ChangeNotifierProvider(
              create: (BuildContext context) => Save_Text_One()),
        ],
        child: Container(
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
                padding: const EdgeInsets.only(top: 10, bottom: 10.0),
                child: Consumer<Save_Text>(
                    builder: (context, bloc_save_text, child) {
                  return Form(
                    key: formstate_title,
                    child: TextFormField(
                      controller: titleController,
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
                                onPressed: () async {
                                  bloc_save_text.setChanged(false);
                                  UpdateDeal updateDeal = UpdateDeal();
                                  await updateDeal.updateDealtitle(
                                      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjQ4M2MyMDEyOGRjNzM0N2UwZjQ1OCIsImN1cnJlbnRSb2xlIjoiVXNlciIsImlhdCI6MTcxNDMyNDkwOCwiZXhwIjoxNzIyMTAwOTA4fQ.yOioCvoMstv4tQjtyMbMIXczZocAFj04jyPHXKyWr9Q",
                                      dealId,
                                      titleController.text);

                                  SystemChannels.textInput
                                      .invokeMethod('TextInput.hide');
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                },
                              )
                            : null,
                        label: Text(
                          "Title",
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
              Consumer<Save_Text_One>(
                  builder: (context, bloc_save_text1, child) {
                return Form(
                  key: formstate_desc,
                  child: SizedBox(
                    height: 140,
                    child: TextFormField(
                      onChanged: (value) {
                        bloc_save_text1.setChanged(true);
                      },
                      controller: descriptionController,
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
                                    padding: const EdgeInsets.only(
                                        top: 13.0, right: 7),
                                    child: IconButton(
                                      icon: Icon(
                                        size: 30,
                                        Icons.playlist_add_check_circle_sharp,
                                        color: MyColors.mainorange,
                                      ),
                                      onPressed: () async {
                                        bloc_save_text1.setChanged(false);
                                        UpdateDeal updateDeal = UpdateDeal();
                                        await updateDeal.updateDealdesc(
                                            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjQ4M2MyMDEyOGRjNzM0N2UwZjQ1OCIsImN1cnJlbnRSb2xlIjoiVXNlciIsImlhdCI6MTcxNDMyNDkwOCwiZXhwIjoxNzIyMTAwOTA4fQ.yOioCvoMstv4tQjtyMbMIXczZocAFj04jyPHXKyWr9Q",
                                            dealId,
                                            descriptionController.text);

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
                          "Description",
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
                        status,
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
                        onPressed: () {},
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
        ));
  }
}
