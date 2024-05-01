import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/Dwwira.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/Bloc/Fav_Bloc.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/Bloc/workers_search.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/Services/Get_Worker_ById.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/Services/Search_Main.dart';

import 'package:easyhome/utils/constants/colors.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'filter__widget.dart';
import 'worker_two.dart';

class SearchWorkers extends SearchDelegate {
  int Id_Search;

  List<String> jobs;
  int rating;
  String wilaya;
  String sort;

  SearchWorkers({
    required this.Id_Search,
    required this.jobs,
    required this.rating,
    required this.wilaya,
    required this.sort,
  });
  @override
  String? get searchFieldLabel => "Search";

  @override
  TextStyle? get searchFieldStyle =>
      TextStyle(color: MyColors.mainblue, fontSize: 20);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: MyColors.mainblue,
      ),
      appBarTheme: AppBarTheme(
        toolbarHeight: 90,
        color: MyColors.mainblue,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.fromLTRB(15, 15, 10, 15),
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w600,
          fontSize: 17,
        ),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      scaffoldBackgroundColor: MyColors.loggrey1,
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: IconButton(
            onPressed: () {
              showDialog(
                barrierColor: Colors.black.withOpacity(0.0),
                context: context,
                builder: (BuildContext context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: FilterWidget(
                              jobs: jobs,
                              wilaya: wilaya,
                              rating: rating,
                              sortby: sort,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(
              Icons.tune,
              size: 30,
            )),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: Icon(
          Icons.keyboard_arrow_left,
          size: 50,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (Id_Search == 2) {
      Search search = Search();

      search.getUrl =
          "https://easyhome-lcvx.onrender.com/api/v1/workers/?page=1&limit=5&fields=role,firstName,lastName,rating,job,wilaya,profilePicture,id,experience&\$or[0][lastName][\$regex]=(?i).*${Uri.encodeComponent(query.replaceAll(" ", ""))}.*&\$or[1][firstName][\$regex]=(?i).*${Uri.encodeComponent(query.replaceAll(" ", ""))}.*&job=${jobs[0]}";

      return FutureBuilder<String>(
        future: search.search_workers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: Dwwira(color: MyColors.mainblue, height: 50, width: 50));
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(
                    create: (BuildContext context) => WorkersSearch()),
              ],
              child: FutureBuilder<String>(
                future: search.search_workers(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: Dwwira(
                            color: MyColors.mainblue, height: 50, width: 50));
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Consumer<WorkersSearch>(
                        builder: (context, workersprovider, child) {
                      return ListView.builder(
                          itemCount: search.workers.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Stack(
                              children: [
                                Worker_two(
                                  firstName: search.workers[index]["firstName"],
                                  lastName: search.workers[index]["lastName"],
                                  email: "",
                                  wilaya: search.workers[index]["wilaya"],
                                  phoneNumber: "",
                                  rating: search.workers[index]["rating"],
                                  ratingsNumber: "",
                                  experience: search.workers[index]
                                      ["experience"],
                                  profilePicture: search.workers[index]
                                      ["profilePicture"],
                                  job: search.workers[index]["job"],
                                  isCertified: search.workers[index]
                                      ["isCertified"],
                                  id: search.workers[index]["_id"],
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                      padding:
                                          EdgeInsets.only(top: 37, right: 30),
                                      child: IconButton(
                                          onPressed: () {
                                            search.workers.removeAt(index);
                                            workersprovider.notifyListeners();
                                          },
                                          icon: Icon(Icons.close))),
                                ),
                              ],
                            );
                          });
                    });
                  }
                },
              ),
            );
          }
        },
      );
    } else if (Id_Search == 1) {
      if (query.isEmpty) {
        return Text("");
      } else {
        Search search = Search();

        search.getUrl =
            "https://easyhome-lcvx.onrender.com/api/v1/workers/?page=1&limit=5&fields=role,firstName,lastName,rating,job,wilaya,profilePicture,id,experience&\$or[0][lastName][\$regex]=(?i).*${Uri.encodeComponent(query.replaceAll(" ", ""))}.*&\$or[1][firstName][\$regex]=(?i).*${Uri.encodeComponent(query.replaceAll(" ", ""))}.*";

        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (BuildContext context) => WorkersSearch()),
          ],
          child: FutureBuilder<String>(
            future: search.search_workers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: Dwwira(
                        color: MyColors.mainblue, height: 50, width: 50));
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Consumer<WorkersSearch>(
                    builder: (context, workersprovider, child) {
                  return ListView.builder(
                      itemCount: search.workers.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: [
                            Worker_two(
                              firstName: search.workers[index]["firstName"],
                              lastName: search.workers[index]["lastName"],
                              email: "",
                              wilaya: search.workers[index]["wilaya"],
                              phoneNumber: "",
                              rating: search.workers[index]["rating"],
                              ratingsNumber: "",
                              experience: search.workers[index]["experience"],
                              profilePicture: search.workers[index]
                                  ["profilePicture"],
                              job: search.workers[index]["job"],
                              isCertified: search.workers[index]["isCertified"],
                              id: search.workers[index]["_id"],
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                  padding: EdgeInsets.only(top: 37, right: 30),
                                  child: IconButton(
                                      onPressed: () {
                                        search.workers.removeAt(index);
                                        workersprovider.notifyListeners();
                                      },
                                      icon: Icon(Icons.close))),
                            ),
                          ],
                        );
                      });
                });
              }
            },
          ),
        );
      }
    } else {
      String selected_jobs = "";
      int i = 0;
      for (i = 0; i < jobs.length; i++) {
        selected_jobs = selected_jobs + "&\$or[${i}][job]=${jobs.elementAt(i)}";
      }
      if (i == 0 && !selected_jobs.isEmpty) {
        selected_jobs = "&job=${selected_jobs[0]}";
      }

      Search search = Search();

      bool c1 = !selected_jobs.isEmpty;
      bool c2 = wilaya != "All";
      bool c3 = sort != "Default";
      search.getUrl =
          "https://easyhome-lcvx.onrender.com/api/v1/workers/?page=1&limit=5&fields=role,firstName,lastName,rating,job,wilaya,profilePicture,id,experience&\$or[0][lastName][\$regex]=(?i).*${Uri.encodeComponent(query.replaceAll(" ", ""))}.*&\$or[1][firstName][\$regex]=(?i).*${Uri.encodeComponent(query.replaceAll(" ", ""))}.*";

      if (c1) {
        search.getUrl = search.getUrl + selected_jobs;
      }
      if (c2) {
        search.getUrl = search.getUrl + "&wilaya=$wilaya";
      }
      if (c3) {
        search.getUrl = search.getUrl + "&sort=-${sort.toLowerCase()}";
      }

      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (BuildContext context) => WorkersSearch()),
        ],
        child: FutureBuilder<String>(
          future: search.search_workers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child:
                      Dwwira(color: MyColors.mainblue, height: 50, width: 50));
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Consumer<WorkersSearch>(
                  builder: (context, workersprovider, child) {
                return ListView.builder(
                    itemCount: search.workers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: [
                          Worker_two(
                            firstName: search.workers[index]["firstName"],
                            lastName: search.workers[index]["lastName"],
                            email: "",
                            wilaya: search.workers[index]["wilaya"],
                            phoneNumber: "",
                            rating: search.workers[index]["rating"],
                            ratingsNumber: "",
                            experience: search.workers[index]["experience"],
                            profilePicture: search.workers[index]
                                ["profilePicture"],
                            job: search.workers[index]["job"],
                            isCertified: search.workers[index]["isCertified"],
                            id: search.workers[index]["_id"],
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                                padding: EdgeInsets.only(top: 37, right: 30),
                                child: IconButton(
                                    onPressed: () {
                                      search.workers.removeAt(index);
                                      workersprovider.notifyListeners();
                                    },
                                    icon: Icon(Icons.close))),
                          ),
                        ],
                      );
                    });
              });
            }
          },
        ),
      );
    }
  }
}
