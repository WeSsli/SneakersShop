import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers/screens/cart_screen/controllers/cart_controller.dart';
import 'package:sneakers/widgets/cart_progress_button.dart';
import 'package:sneakers/widgets/circular_reveal_painter.dart';
import 'package:sneakers/widgets/order_dialog.dart';

class CircularReveal extends StatefulWidget {
  @override
  _CircularRevealState createState() => _CircularRevealState();
}

class _CircularRevealState extends State<CircularReveal>
    with TickerProviderStateMixin {
  Animation _animation;
  double _fraction = 0.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: CircularRevealPainter(
            fraction: _fraction, screenSize: MediaQuery.of(context).size),
        child: CartProgressButton(
          text: "Złóż zamówienie",
          callback: reveal,
        ),
      ),
    );
  }

  void reveal() {
    AnimationController controller =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);

    _animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          _fraction = _animation.value;
        });
      });
    controller.forward().then((_) async {
      Get.dialog(OrderDialog())
          .then((value) => Get.find<CartController>().clearCart().then((_) {
                controller.reset();
              }));
    });
  }
}
