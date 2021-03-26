import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sneakers/screens/product_screen/controllers/product_screen_controller.dart';

class CartButton extends StatefulWidget {
  @override
  _CartButtonState createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> with TickerProviderStateMixin {
  Animation<double> _animation;
  Animation<Color> _colorAnimation;
  Animation<Color> _iconColorAnimation;
  final ProductScreenController controller =
      Get.find<ProductScreenController>();

  @override
  void initState() {
    super.initState();

    controller.animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 120),
    );

    _animation = Tween<double>(begin: 1.0, end: 1.5)
        .animate(controller.animationController);

    _colorAnimation = ColorTween(begin: Colors.white, end: Color(0xFF403B58))
        .animate(controller.animationController)
          ..addListener(() {
            setState(() {});
          });

    _iconColorAnimation = ColorTween(begin: Colors.black, end: Colors.white)
        .animate(controller.animationController);
         
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: PhysicalModel(
        borderRadius: BorderRadius.circular(64),
        shadowColor: Colors.black.withOpacity(0.5),
        color: _colorAnimation.value,
        elevation: 2,
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Get.toNamed("cart");
          },
          child: SvgPicture.asset(
            "assets/icons/cart.svg",
            height: 25,
            color: _iconColorAnimation.value,
          ),
        ),
      ),
    );
  }
}
