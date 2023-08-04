import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon/application/getit_modules/bloc_binding_module.dart';
import 'package:pokemon/application/getit_modules/data_binding_module.dart';
import 'package:pokemon/application/getit_modules/net_binding_module.dart';
import 'package:pokemon/presentation/widgets/pokeball_loader.dart';
import 'application/getit_modules/repository_bind_module.dart';
import 'application/routes/app_routes.dart';
import 'application/routes/route_generator.dart';

//https://pokeapi.co/docs/v2#pokemon-section
//https://www.pokemon.com/us/pokedex/

Future<void> setupLocator() async{
  NetBindingModule.providesModules();
  RepositoryBindingModule.providesModules();
  BlocBindingModule.providesModules();
  await DataBindingModule.providesModules();
}

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  runApp(
    FutureBuilder(
      future: GetIt.I.allReady(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        } else {
          return const CircularProgressIndicator();
        }
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = RouteGenerator();
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: Routes.SplashPage,
      onGenerateRoute: (route) => _appRouter.generateRoute(route, navigatorKey),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoadingConfigPage extends StatelessWidget {
  const LoadingConfigPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PokeballLoader();
  }
}
