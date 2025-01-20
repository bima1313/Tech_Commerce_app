import 'package:e_commerce/UI/extensions/text_style.dart';
import 'package:e_commerce/UI/utilities/search_delegate.dart';
import 'package:e_commerce/logic/bloc/main_bloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<MainBloc>().state.products;
    return GestureDetector(
      onTap: () async {
        await showSearch(
          context: context,
          delegate: SearchData(data: products!),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(32.0),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 4.0),
              spreadRadius: 1.0,
              blurRadius: 128.0,
              blurStyle: BlurStyle.inner,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            spacing: 8.0,
            children: [
              const Icon(Icons.search),
              'Search'.textBody,
            ],
          ),
        ),
      ),
    );
  }
}
