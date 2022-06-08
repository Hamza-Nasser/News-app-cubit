// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit/cubit.dart';
import 'package:news/layout/cubit/states.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusniessData(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: const Text('News app'),
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
        },
      ),
    );
  }
}
