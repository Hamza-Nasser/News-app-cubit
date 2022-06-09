// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit/cubit.dart';
import 'package:news/layout/cubit/states.dart';
import 'package:news/shared/cubit/cubit.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: const Text('News app'),
              actions: [
                IconButton(
                  onPressed: (){
                    AppCubit.get(context).changeAppMode();

                  },
                  icon: const Icon(Icons.brightness_4_outlined),
                  color: AppCubit.get(context).isDark?Colors.white:Colors.black,
                )
              ],
            ),
            body: cubit.screens[cubit.currentModuleIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentModuleIndex,
              items: cubit.bottomNavigationBarItems,
              onTap: (index) {
                cubit.changeModuleIndex(index);
              },
            ),
          );
        }
    );
  }
}
