import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextInput extends StatelessWidget {
  final String label;
  final TextEditingController textEditingController;
  final bool obscure;
  final TextInputType type;
  final TextInputAction action;

  const TextInput({
    Key key,
    @required this.label,
    @required this.textEditingController,
    this.obscure = false,
    this.type = TextInputType.text,
    this.action = TextInputAction.next,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: context.textTheme.bodyText1.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          PhysicalModel(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            elevation: 2,
            shadowColor: Colors.black.withOpacity(0.3),
            child: CupertinoTextField(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 6),
              decoration: BoxDecoration(color: Colors.transparent),
              controller: textEditingController,
              obscureText: obscure,
              keyboardType: type,
              textInputAction: action,
              suffix: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  textEditingController.clear();
                },
                child: Icon(
                  Icons.clear,
                  size: 12,
                  color: Colors.black,
                ),
              ),
              suffixMode: OverlayVisibilityMode.editing,
            ),
          ),
        ],
      ),
    );
  }
}
