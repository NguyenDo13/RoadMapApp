import 'package:flutter/material.dart';
import 'package:road_map_flutter/app/UIData/app_content.dart';
import 'package:road_map_flutter/app/UIData/style.dart';

class InputTextField extends StatelessWidget {
  final bool isEmail;
  final bool isPassword;
  const InputTextField({
    super.key,
    this.isEmail = false,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    String textTitle = '';
    String hintText = '';
    Icon iconField = const Icon(Icons.error);
    if (isEmail) {
      textTitle = EMAIL;
      iconField = const Icon(Icons.email, color: Colors.white);
      hintText = ENTER_EMAIL;
    } else if (isPassword) {
      textTitle = PASS;
      iconField = const Icon(Icons.lock, color: Colors.white);
      hintText = ENTER_PASS;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          textTitle,
          style: LabelStyle,
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: isEmail == true
                ? TextInputType.emailAddress
                : TextInputType.none,
            obscureText: isPassword == false ? true : false,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14.0),
              prefixIcon: iconField,
              hintText: hintText,
              hintStyle: HintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
