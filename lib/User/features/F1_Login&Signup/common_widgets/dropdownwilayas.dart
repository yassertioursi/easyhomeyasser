import 'package:easyhome/User/features/F1_Login&Signup/BLoC/bloc_auth.dart';
import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/text_verify_field.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropDown extends StatefulWidget {
  final GlobalKey<FormState> formstate_wilaya;
  final void Function(String) onWilayaChanged;

  DropDown(
      {Key? key, required this.formstate_wilaya, required this.onWilayaChanged})
      : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? valueChoose;
  List<String> wilayasList = [
    '01   Adrar',
    '02   Chlef',
    '03   Laghouat',
    '04   Oum El Bouaghi',
    '05   Batna',
    '06   Béjaïa',
    '07   Biskra',
    '08   Béchar',
    '09   Blida',
    '10   Bouira',
    '11   Tamanrasset',
    '12   Tébessa',
    '13   Tlemcen',
    '14   Tiaret',
    '15   Tizi Ouzou',
    '16   Alger',
    '17   Djelfa',
    '18   Jijel',
    '19   Sétif',
    '20   Saïda',
    '21   Skikda',
    '22   Sidi Bel Abbès',
    '23   Annaba',
    '24   Guelma',
    '25   Constantine',
    '26   Médéa',
    '27   Mostaganem',
    '28   M\'Sila',
    '29   Mascara',
    '30   Ouargla',
    '31   Oran',
    '32   El Bayadh',
    '33   Illizi',
    '34   Bordj Bou Arréridj',
    '35   Boumerdès',
    '36   El Tarf',
    '37   Tindouf',
    '38   Tissemsilt',
    '39   El Oued',
    '40   Khenchela',
    '41   Souk Ahras',
    '42   Tipaza',
    '43   Mila',
    '44   Aïn Defla',
    '45   Naama',
    '46   Aïn Témouchent',
    '47   Ghardaïa',
    '48   Relizane',
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => bloc_one()),
      ],
      child: Consumer<bloc_one>(builder: (context, bloc_1, child) {
        return Container(
          decoration: BoxDecoration(
            color: MyColors.loggrey1,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0.5),
                blurRadius: bloc_1.validated ? 18 : 2,
                color: bloc_1.validated
                    ? Colors.black.withOpacity(0.25)
                    : Colors.black.withOpacity(0.0),
              ),
            ],
          ),
          child: Form(
            key: widget.formstate_wilaya,
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(
                  Icons.place,
                  color: MyColors.mainblue,
                ),
                hintText: "SELECT YOUR WILAYA",
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                  borderSide: BorderSide(
                    color: MyColors.loggrey1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
              borderRadius: BorderRadius.circular(10),
              iconEnabledColor: MyColors.mainblue,
              iconDisabledColor: Colors.red,
              dropdownColor: Colors.white,
              icon: Icon(Icons.keyboard_arrow_down_rounded),
              iconSize: 36,
              isDense: true,
              isExpanded: false,
              value: valueChoose,
              onChanged: (dynamic newValue) {
                setState(() {
                  valueChoose = newValue as String;
                  widget.formstate_wilaya.currentState!.validate();
                  widget.onWilayaChanged(valueChoose!);
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  bloc_1.setValidated(false);
                  return 'Please select a wilaya';
                } else {
                  bloc_1.setValidated(true);
                }
                ;
              },
              items: wilayasList.map((valueItem) {
                return DropdownMenuItem(
                  value: valueItem,
                  child: Text(
                    valueItem,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 134, 143, 154),
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      }),
    );
  }
}
