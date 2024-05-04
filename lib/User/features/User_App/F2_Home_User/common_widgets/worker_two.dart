import 'package:easyhome/User/features/User_App/F2_Home_User/Bloc/Fav_Bloc.dart';

import 'package:easyhome/User/features/User_App/F2_Home_User/Services/Get_Worker_ById.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Worker_two extends StatelessWidget {
   String firstName;
 String lastName;
 String email;
 String wilaya;
   String phoneNumber;
  String id;
  int rating;
  String ratingsNumber;
   int experience;
 String profilePicture;
   String job;
  bool isCertified;
  Worker_two({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.wilaya,
    required this.phoneNumber,
    required this.rating,
    required this.ratingsNumber,
    required this.experience,
    required this.profilePicture,
    required this.job,
    required this.isCertified,
    required this.id,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 35, 20, 5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 140,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            height: 120,
            width: 100,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
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
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                 left: 18.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "$firstName $lastName",
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
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0, left: 20),
                      child: Text(
                        job,
                        style: TextStyle(
                            color: MyColors.mainorange,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                        
                        },
                        icon: GetWorker().isFav
                            ? Icon(
                                Icons.favorite,
                                color: Color.fromARGB(255, 255, 17, 0),
                              )
                            : Icon(
                                Icons.favorite_border_outlined,
                              )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 10, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                FontAwesomeIcons.solidStar,
                                color: MyColors.stars,
                                size: 17,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 4.0, top: 3.0),
                                child: Text(
                                  "$rating ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Text(
                        "$wilaya",
                        style: TextStyle(
                          color: MyColors.mainblue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "($experience)",
                        style: TextStyle(color: Color(0xFFC7C7C7)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
