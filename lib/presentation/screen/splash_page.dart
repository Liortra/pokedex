import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon/application/base_classes/base_ui_classes.dart';
import 'package:pokemon/application/routes/app_routes.dart';
import 'package:pokemon/presentation/bloc/splash/splash_cubit.dart';
import 'package:pokemon/presentation/style/app_colors.dart';
import 'package:pokemon/utils/size_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BaseState<SplashPage> with SingleTickerProviderStateMixin{

  final _cubit = GetIt.I<SplashCubit>();
  StreamSubscription? _streamSubscription;

  @override
  void initState() {

    super.initState();
    _streamSubscription = _cubit.stream.where((state) => state is NavigateMainPageState).listen((event) {
      Navigator.pushReplacementNamed(context, Routes.HomePage);
    });

    _cubit.start();
  }

  @override
  Widget bodyBuilder(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/pokedex.png",
            width: SizeConfig.screenWidth / 2,
            height: SizeConfig.screenHeight / 2,
            fit: BoxFit.contain,
          ),
          Text(
            AppLocalizations.of(context)!.splash,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription?.cancel();
  }
}

