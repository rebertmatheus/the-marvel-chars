import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_marvel_chars/src/config/serviceLocator/service_locator.dart';
import 'package:the_marvel_chars/src/config/theme/color_scheme_base.dart';
import 'package:the_marvel_chars/src/config/theme/theme.dart';
import 'package:the_marvel_chars/src/features/characters/presentation/controllers/characters_view_controller.dart';
import 'package:the_marvel_chars/src/features/characters/presentation/views/characters_view.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  ServiceLocator.setupServiceLocator();

  await dotenv.load(fileName: '.env');

  final brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
  bool isDarkMode = brightness == Brightness.dark;
  runApp(MarvelCharacters(
    isDarkMode: isDarkMode,
  ));
}

class MarvelCharacters extends StatelessWidget {
  final bool isDarkMode = false;
  const MarvelCharacters({super.key, bool isDarkMode = false});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 1920),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Marvel\'s Characters',
          theme: theme(ColorSchemeBase.lightMode),
          darkTheme: theme(ColorSchemeBase.darkMode),
          home: child,
        );
      },
      child: CharactersView(
        viewController: ServiceLocator.get<ICharactersViewController>(),
      ),
    );
  }
}
