import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileInput extends StatelessWidget {
  final String path;
  final TextEditingController textEditingController;
  final bool enabled;
  final bool obscure;
  final TextInputType type;

  const ProfileInput({
    Key key,
    @required this.textEditingController,
    @required this.path,
    this.enabled,
    this.obscure = false,
    this.type = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: PhysicalModel(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.3),
        child: CupertinoTextField(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 6),
          decoration: BoxDecoration(color: Colors.transparent),
          obscureText: obscure,
          controller: textEditingController,
          enabled: enabled,
          keyboardType: type,
          prefix: Container(
            margin: EdgeInsets.only(left: 12, right: 16),
            child: SvgPicture.asset(
              path,
              color: context.theme.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
