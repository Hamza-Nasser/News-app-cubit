import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit/cubit.dart';
import 'package:news/layout/news_layout.dart';
import 'package:news/shared/bloc_observer.dart';
import 'package:news/shared/cubit/cubit.dart';
import 'package:news/shared/cubit/states.dart';
import 'package:news/shared/network/local/cache_helper.dart';
import 'package:news/shared/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.dioInit();
  await CacheHelper.prefsInit();

  BlocOverrides.runZoned(() {
    bool isDark = CacheHelper.getPrefsBoolean('isDark');
    runApp(NewsApp(isDark));
  }, blocObserver: MyBlocObserver());
}

class NewsApp extends StatelessWidget {
  final bool isDark;
  const NewsApp(this.isDark, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => NewsCubit()..getBusniessData(),
          ),
          BlocProvider(
            create: (context) => AppCubit()..changeAppMode(fromShared: isDark),
          )
        ],
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                primaryIconTheme: const IconThemeData(color: Colors.black),
                iconTheme: const IconThemeData(color: Colors.black),
                primarySwatch: Colors.deepOrange,
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  elevation: 0.0,
                ),
                appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark),
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    elevation: 0.0,
                    showUnselectedLabels: false,
                    backgroundColor: Colors.white,
                    selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.grey),
                
              ),
              darkTheme: ThemeData(
                scaffoldBackgroundColor: const Color.fromARGB(255, 20, 29, 45),
                primarySwatch: Colors.deepOrange,
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  elevation: 0.0,
                ),
                appBarTheme: const AppBarTheme(
                  backgroundColor: Color.fromARGB(255, 20, 29, 45),
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Color.fromARGB(255, 20, 29, 45),
                      statusBarIconBrightness: Brightness.light),
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    elevation: 0.0,
                    showUnselectedLabels: false,
                    backgroundColor: Color.fromARGB(255, 20, 29, 45),
                    selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.grey),
                textTheme: const TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                iconTheme: const IconThemeData(color: Colors.white),
              ),
              themeMode: AppCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: const NewsScreen(),
            );
          },
        ));
  }
}
