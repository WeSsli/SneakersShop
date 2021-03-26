import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers/screens/login_screen/controllers/log_in_controller.dart';

class ProgressButton extends StatefulWidget {
  final String text;

  const ProgressButton({Key key, this.text}) : super(key: key);

  @override
  _ProgressButtonState createState() => _ProgressButtonState();
}

class _ProgressButtonState extends State<ProgressButton>
    with TickerProviderStateMixin {
  int state = 0;
  Animation animation;
  double width = double.infinity;
  GlobalKey globalKey = GlobalKey();
  double circular = 12;
  bool reverse = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        setState(() {
          if (state == 0) {
            animateButton();
          }
        });
      },
      minSize: 0,
      padding: EdgeInsets.zero,
      color: Colors.transparent,
      child: Container(
        key: globalKey,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        width: width,
        decoration: BoxDecoration(
          color: context.theme.primaryColor,
          borderRadius: BorderRadius.circular(circular),
        ),
        child: Center(
          child: _buildButtonChild(),
        ),
      ),
    );
  }

  Future<void> animateButton() async {
    double initialWidth = globalKey.currentContext.size.width;

    AnimationController controller =
        AnimationController(duration: Duration(milliseconds: 250), vsync: this);
    animation = Tween(begin: 0.0, end: 0.95).animate(controller)
      ..addListener(() {
        setState(() {
          width = initialWidth - ((initialWidth - 48.0) * animation.value);
          if (reverse) {
            circular = 12;
          } else {
            circular += 10.0;
          }
        });
      });
    controller.forward();

    setState(() {
      state = 1;
    });

    await Future.delayed(Duration(milliseconds: 2000));

    if (await Get.find<SigninController>().signIn()) {
      setState(() {
        state = 2;
      });
    } else {
      setState(() {
        state = 3;
      });
    }

    if (state == 3) {
      await Future.delayed(Duration(milliseconds: 375));
      reverse = true;
      controller.reverse().then((value) => reverse = false);
      state = 0;
    }
  }

  Widget _buildButtonChild() {
    if (state == 0) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 22),
        child: FittedBox(
          child: Text(
            widget.text,
            style: context.textTheme.bodyText1.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
      );
    } else if (state == 1) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 22),
        child: SizedBox(
          height: 24,
          width: 24,
          child: CircularProgressIndicator(
            value: null,
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        ),
      );
    } else if (state == 2) {
      return Padding(
        padding: const EdgeInsets.all(22.0),
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(22.0),
        child: Icon(
          Icons.clear,
          color: Colors.white,
        ),
      );
    }
  }
}
