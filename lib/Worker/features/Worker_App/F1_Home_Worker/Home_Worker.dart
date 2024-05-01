import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'common_widgets/details.dart';

class HomeWorker extends StatelessWidget {
  const HomeWorker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text(
            "Architect",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0),
              child: Icon(
                Icons.tune,
                size: 30,
              ),
            ),
          ),
        ],
        backgroundColor: MyColors.mainblue,
        leading: SizedBox(
          width: 40,
          height: 40,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                ),
                width: 80,
                height: 120,
              ),
              ClipOval(
                child: Image.asset(
                  "lib/utils/images/logo2.png",
                  height: 120,
                  width: 80,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return SafeArea(child: Post());
        },
      ),
    );
  }
}

class Post extends StatelessWidget {
  var Image_Controller = PageController();
  Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.symmetric(
              horizontal:
                  BorderSide(color: Colors.grey.withOpacity(0.3), width: 0.3))),
      padding: EdgeInsets.only(top: 30, bottom: 30),
      height: 700,
      width: MediaQuery.of(context).size.width - 80,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Container(
                        height: 55,
                        width: 55,
                        child: Image.network(
                          "https://www.lequipe.fr/_medias/img-photo-jpg/le-milieu-de-terrain-du-real-madrid-jude-bellingham-lors-du-match-de-liga-contre-osasuna-le-7-octobr/1500000001851041/374:13,1668:1308-828-828-75/a0479.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Jude Bellingham",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Text(
                              "Madrid                   ",
                              style: TextStyle(
                                  color: MyColors.mainorange,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        size: 40,
                        Icons.more_vert,
                        color: Colors.black,
                      )),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 5),
              child: PageView.builder(
                controller: Image_Controller,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return AspectRatio(
                    aspectRatio: 1.0,
                    child: Image.network(
                      "https://www.lequipe.fr/_medias/img-photo-jpg/le-milieu-de-terrain-du-real-madrid-jude-bellingham-lors-du-match-de-liga-contre-osasuna-le-7-octobr/1500000001851041/374:13,1668:1308-828-828-75/a0479.jpg",
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Icon(
                    Icons.work_outline,
                    size: 40,
                    color: Colors.black.withOpacity(0.7),
                  ),
                  onTap: () {},
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: SmoothPageIndicator(
                      controller: Image_Controller,
                      count: 4,
                      effect: ScrollingDotsEffect(
                        dotColor: Color(0xFFD7D4D4),
                        activeDotColor: MyColors.mainorange,
                        dotHeight: 9,
                        dotWidth: 9,
                      ),
                      onDotClicked: (index) {},
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                        "lib/utils/images/save-instagram1.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "I love jude I love jude I love jude I love jude I love judeI love jude.",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(17, 10.0, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "MaxPrice :",
                      style: TextStyle(
                          color: Color(0xFF3E3E3E),
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    Text(
                      "  2000 DA",
                      style: TextStyle(
                          color: Color(0xFF137A23),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.white,
                      useSafeArea: true,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return Details();
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12.0,
                      right: 12,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Details",
                          style: TextStyle(
                              color: Color(0xFF3E3E3E),
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xFF3E3E3E),
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
