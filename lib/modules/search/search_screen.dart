import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit/cubit.dart';
import 'package:news/layout/cubit/states.dart';
import 'package:news/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener:(context, state) {},
      builder: (context, state){
        var searchCubit = NewsCubit.get(context);
        return Scaffold(
        
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                style: Theme.of(context).textTheme.bodyText1,
                onChanged: (value) {
                  if(value.isNotEmpty){
                    searchCubit.getSearchData(value);
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Search',
                  labelStyle: Theme.of(context).textTheme.bodyText1,
                  contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                  enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffB3ABAB),
                    width: 1,
                  ),
                  
                  borderRadius: BorderRadius.all(Radius.circular(10))),
                  focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffB3ABAB),
                    width: 1,
                  ),
                  
                  borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Expanded(
              child: articleBuilder(searchCubit.search, true),
            )
          ],
        ),
    
      );
      }, 
    );

  }
}