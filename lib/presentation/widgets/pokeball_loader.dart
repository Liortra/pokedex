import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokemon/presentation/style/app_colors.dart';
import 'package:pokemon/utils/size_config.dart';

class PokeballLoader extends StatefulWidget {
  const PokeballLoader({Key? key}) : super(key: key);

  @override
  State<PokeballLoader> createState() => _PokeballLoaderState();
}

class _PokeballLoaderState extends State<PokeballLoader> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _animDouble;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animDouble = CurvedAnimation(
      parent: _animationController,
      curve: Curves.decelerate,
    );
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(child: _loader());
  }

  Widget _loader() {
    return RotationTransition(
      turns: _animDouble,
      child: Image.asset(
          "assets/images/poke_ball_icon.png",
          width: SizeConfig.screenWidth / 2,
          height: SizeConfig.screenHeight / 2,
          fit: BoxFit.fitWidth
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
