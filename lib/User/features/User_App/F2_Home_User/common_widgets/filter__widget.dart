import 'package:easyhome/User/features/User_App/F2_Home_User/Bloc/Select_job.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/Services/Search_Main.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/common_widgets/SearchWorkers.dart';
import 'package:easyhome/utils/constants/Categorys.dart';
import 'package:easyhome/utils/constants/Wilayas.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class FilterWidget extends StatelessWidget {
  List<String> jobs;
  String wilaya;
  int rating;
  String sortby;

  FilterWidget(
      {required this.jobs,
      required this.wilaya,
      required this.rating,
      required this.sortby});

  @override
  Widget build(BuildContext context) {
    bool yesorno = true;
    bool yesorno1 = true;
    bool yesorno2 = true;
    bool yesorno3 = true;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => Select_Job()),
        ChangeNotifierProvider(
            create: (BuildContext context) => SortByProvider()),
        ChangeNotifierProvider(
            create: (BuildContext context) => WilayaProvider()),
        ChangeNotifierProvider(
            create: (BuildContext context) => RatingProvider()),
      ],
      child: AlertDialog(
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer<SortByProvider>(
              builder: (context, sortByProvider, child) {
                if (yesorno1) {
                  sortByProvider.setSelectedSort(sortby);
                  yesorno1 = false;
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Sort by :",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: MyColors.mainblue, width: 3),
                        ),
                        child: DropdownButton<String>(
                          alignment: Alignment.center,
                          borderRadius: BorderRadius.circular(10),
                          underline: Container(),
                          focusColor: Colors.white,
                          value: sortByProvider.selectedSort,
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: MyColors.mainblue,
                            size: 30,
                          ),
                          onChanged: (newValue) {
                            sortByProvider.setSelectedSort(newValue!);
                          },
                          items: ["Default", "Rating", "Distance"]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            Consumer<WilayaProvider>(
              builder: (context, wilayaProvider, child) {
                if (yesorno2) {
                  wilayaProvider.setSelectedWilaya(wilaya);
                  yesorno2 = false;
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Wilaya :",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: MyColors.mainblue,
                            width: 3,
                          ),
                        ),
                        child: DropdownButton<String>(
                          alignment: Alignment.center,
                          borderRadius: BorderRadius.circular(10),
                          underline: Container(),
                          focusColor: Colors.white,
                          value: wilayaProvider.selectedWilaya,
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: MyColors.mainblue,
                            size: 30,
                          ),
                          onChanged: (newValue) {
                            wilayaProvider.setSelectedWilaya(newValue!);
                          },
                          items: Wilayas()
                              .wilayasList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                textAlign: TextAlign.center,
                              ),
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Rating :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Consumer<RatingProvider>(
                      builder: (context, bloc_rating, child) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: RatingBar.builder(
                        itemSize: 20,
                        initialRating: rating.toDouble(),
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          color: MyColors.stars,
                          FontAwesomeIcons.solidStar,
                        ),
                        onRatingUpdate: (rating) {
                          bloc_rating.setrating(rating);
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        "Jobs:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Consumer<Select_Job>(
                    builder: (context, bloc_select, child) {
                      if (yesorno && !jobs.isEmpty) {
                        bloc_select.selectedItems = jobs;
                        yesorno = false;
                      }
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Row(
                              children: [
                                for (int index = 0; index <= 2; index++)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: MyColors.mainblue),
                                        color: bloc_select.selectedItems
                                                .contains(
                                                    Workers_Cat().cats[index])
                                            ? MyColors.mainblue
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 0, bottom: 0.0),
                                        child: Center(
                                          child: TextButton(
                                            child: Text(
                                                "${Workers_Cat().cats[index]}",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: bloc_select
                                                            .selectedItems
                                                            .contains(
                                                                Workers_Cat()
                                                                        .cats[
                                                                    index])
                                                        ? Colors.white
                                                        : MyColors.mainblue,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            onPressed: () {
                                              bloc_select.set_Selected(
                                                  Workers_Cat().cats[index]);
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                for (int index = 3; index <= 5; index++)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: MyColors.mainblue),
                                        color: bloc_select.selectedItems
                                                .contains(
                                                    Workers_Cat().cats[index])
                                            ? MyColors.mainblue
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 0, bottom: 0.0),
                                        child: Center(
                                          child: TextButton(
                                            child: Text(
                                                "${Workers_Cat().cats[index]}",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: bloc_select
                                                            .selectedItems
                                                            .contains(
                                                                Workers_Cat()
                                                                        .cats[
                                                                    index])
                                                        ? Colors.white
                                                        : MyColors.mainblue,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            onPressed: () {
                                              bloc_select.set_Selected(
                                                  Workers_Cat().cats[index]);
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              children: [
                                for (int index = 6;
                                    index <= Workers_Cat().cats.length - 1;
                                    index++)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: MyColors.mainblue),
                                        color: bloc_select.selectedItems
                                                .contains(
                                                    Workers_Cat().cats[index])
                                            ? MyColors.mainblue
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 0, bottom: 0.0),
                                        child: Center(
                                          child: TextButton(
                                            child: Text(
                                                "${Workers_Cat().cats[index]}",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: bloc_select
                                                            .selectedItems
                                                            .contains(
                                                                Workers_Cat()
                                                                        .cats[
                                                                    index])
                                                        ? Colors.white
                                                        : MyColors.mainblue,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            onPressed: () {
                                              bloc_select.set_Selected(
                                                  Workers_Cat().cats[index]);
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Consumer<Select_Job>(builder: (context, bloc_select, child) {
                    return Consumer<WilayaProvider>(
                        builder: (context, bloc_wilaya, child) {
                      return Consumer<SortByProvider>(
                          builder: (context, bloc_sort, child) {
                        return Consumer<RatingProvider>(
                            builder: (context, bloc_rating, child) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: MyColors.mainblue,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              showSearch(
                                  context: context,
                                  delegate: SearchWorkers(
                                    Id_Search: 3,
                                    jobs: bloc_select.selectedItems,
                                    rating: bloc_rating.rating,
                                    wilaya: bloc_wilaya.selectedWilaya,
                                    sort: bloc_sort.selectedSort,
                                  ));
                            },
                            child: Text(
                              "Apply",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        });
                      });
                    });
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SortByProvider extends ChangeNotifier {
  String selectedSort = "Default";

  void setSelectedSort(String sort) {
    selectedSort = sort;
    notifyListeners();
  }
}

class WilayaProvider extends ChangeNotifier {
  String selectedWilaya = "All";

  void setSelectedWilaya(String wilaya) {
    selectedWilaya = wilaya;
    notifyListeners();
  }
}

class RatingProvider extends ChangeNotifier {
  int rating = 0;

  setrating(r) {
    rating = r;
  }
}
