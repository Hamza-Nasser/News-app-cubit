import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

Widget buildNewsItem(articale, context) {
  return InkWell(
    onTap: (){

    },
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    image: NetworkImage("${articale['urlToImage']??'https://images.unsplash.com/photo-1581955957646-b5a446b6100a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80'}"),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "${articale['title']}",
                    maxLines: 3,
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1
                  ),
                  Text(
                    "${articale['publishedAt']}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      letterSpacing: 1,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget articleBuilder(list, bool isSearch) {
  return ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildNewsItem(list[index], context),
            separatorBuilder: (context, index) => const SizedBox(
              height: 8,
            ),
            itemCount: list.length,
          ),
      fallback: (context) => !isSearch?const Center(child: CircularProgressIndicator()):Container());
}
