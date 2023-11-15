import 'package:eden_app_test/controllers/auth_controller.dart';
import 'package:eden_app_test/utils/base.dart';
import 'package:eden_app_test/views/orders/orders.dart';
import 'package:eden_app_test/widgets/featured_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class OnboardingView extends StatefulWidget {
  static const String routeName = '/onboarding';

  const OnboardingView({Key? key}) : super(key: key);

  @override
  OnboardingViewState createState() => OnboardingViewState();
}

class OnboardingViewState extends StateMVC<OnboardingView> {
  OnboardingViewState() : super(AuthController()) {
    con = controller as AuthController;
  }

  late AuthController con;

  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     con.initialize(context);
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: null,
      child: Scaffold(
        key: con.scaffoldKey,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/logo_green.png',
                  width: 100,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: featuredNewBtn(
                context,
                text: "Sign in with Google",
                btnColor: Colors.black,
                btnTextColor: Colors.white,
                onPressed: () => pushNewScreen(context, screen: const OrdersView(), withNavBar: false),
                icon: const FaIcon(
                  FontAwesomeIcons.google,
                  size: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
