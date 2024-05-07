import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pemrograman_mobile/common/app_route.dart';
import 'package:pemrograman_mobile/features/destination/presentation/bloc/index/index_bloc.dart';
import 'package:pemrograman_mobile/features/destination/presentation/bloc/input/input_bloc.dart';
import 'package:pemrograman_mobile/features/destination/presentation/cubit/dashboard_cubit.dart';
import 'package:pemrograman_mobile/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocator();
  runApp(const MainApp());
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Color primaryColor = HexColor("54AD8F");
    Color scaffoldBackgroundColor = HexColor("F6F6F6");
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => DashboardCubit()),
        BlocProvider(create: (_) => locator<InputBloc>()),
        BlocProvider(create: (_) => locator<IndexBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // primaryColor: primaryColor,
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(),
          scaffoldBackgroundColor: scaffoldBackgroundColor,
        ),
        initialRoute: AppRoute.dashboard,
        onGenerateRoute: AppRoute.onGenerateRoute,
      ),
    );
  }
}
