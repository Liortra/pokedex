import 'package:flutter/material.dart';
import 'package:pokemon/presentation/style/app_colors.dart';
import 'package:pokemon/utils/size_config.dart';

abstract class BaseState<Page extends StatefulWidget> extends State<Page> {

  EdgeInsets setPadding() => const EdgeInsets.all(0.0);

  AppBar? setAppBar() => null;

  bool setResizeToAvoidBottomInset() => false;

  bool appBarBackArrow() => false;

  Color setBackgroundColor() => AppColors.red;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: setBackgroundColor(),
      resizeToAvoidBottomInset: setResizeToAvoidBottomInset(),
      appBar: setAppBar(),
      body: BaseBuild.baseBody(
        bodyBuilder: bodyBuilder,
        context: context,
        setPadding: setPadding(),
      ),
      floatingActionButtonLocation: floatingActionButtonLocation(),
      floatingActionButton: floatingActionButton(context),
      bottomNavigationBar: bottomBuilder(context),
      endDrawer: drawerBuilder(context),
    );
  }

  Widget bodyBuilder(BuildContext context);

  Widget? drawerBuilder(BuildContext context) => null;

  Widget? bottomBuilder(BuildContext context) => null;

  Widget? floatingActionButton(BuildContext context) => null;

  FloatingActionButtonLocation? floatingActionButtonLocation() => null;

  void dismissKeyboard(context) {
    BaseBuild.dismissKeyboard(context);
  }
}

abstract class BaseStatelessClass extends StatelessWidget {
  const BaseStatelessClass({Key? key}) : super(key: key);


  bool appBarBackArrow() => false;

  bool enableBaseTopMargin() => true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: BaseBuild.baseBody(
          bodyBuilder: bodyBuilder,
          context: context),
    );
  }

  Widget bodyBuilder(BuildContext context);

  void dismissKeyboard(context) {
    BaseBuild.dismissKeyboard(context);
  }
}

class BaseBuild {
  static Widget baseBody(
          {required Function bodyBuilder,
          required BuildContext context,
          EdgeInsets setPadding = EdgeInsets.zero}) => bodyBuilder(context);

  static void dismissKeyboard(context) {
    // dismiss keyboard before submit the form
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
