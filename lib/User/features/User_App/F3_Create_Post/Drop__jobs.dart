import 'package:easyhome/utils/constants/Categorys.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropJobs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DropJobsProvider>(
      builder: (context, provider, child) {
        double screenWidth = MediaQuery.of(context).size.width;
        double padding = screenWidth;

        return Container(
          width: screenWidth - 110,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 1.5),
          ),
          child: DropdownButton<String>(
            hint: Text(
              "Job:",
              style: TextStyle(
                color: MyColors.mainblue,
                fontWeight: FontWeight.w600,
              ),
            ),
            borderRadius: BorderRadius.circular(10),
            underline: Container(),
            focusColor: Colors.white,
            value: provider.dropdownValue,
            icon: Padding(
              padding: EdgeInsets.only(left: 40),
              child: Icon(
                Icons.keyboard_arrow_down,
                color: MyColors.mainblue,
                size: 30,
              ),
            ),
            onChanged: (newValue) {
              provider.updateDropdownValue(newValue);
            },
            items: provider.categories
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    value,
                    style: TextStyle(
                      color: MyColors.mainblue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

class DropJobsProvider with ChangeNotifier {
  String? _dropdownValue;
  List<String> _categories = Workers_Cat().cats;

  String? get dropdownValue => _dropdownValue;
  List<String> get categories => _categories;

  void updateDropdownValue(String? newValue) {
    _dropdownValue = newValue;
    notifyListeners();
  }
}
