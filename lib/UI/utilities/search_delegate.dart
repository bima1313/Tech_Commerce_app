import 'package:e_commerce/UI/utilities/list_tile_search.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/data/models/products.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchData extends SearchDelegate<String> {
  final Iterable<Products> data;
  SearchData({required this.data});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final Iterable<Products> searchResults = data
        .where(
          (item) => item.name.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final resultData = searchResults.elementAt(index);
        return ListTile(
          onTap: () {
            close(context, resultData.name);
            context.pushNamed(Routes.detailsView, extra: resultData);
          },
          title: ListTileSearch(product: resultData),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final Iterable<Products> searchSuggestions = (query.isEmpty)
        ? []
        : data
            .where(
              (item) => item.name.toLowerCase().contains(
                    query.toLowerCase(),
                  ),
            )
            .toList();
    return ListView.builder(
      itemCount: searchSuggestions.length,
      itemBuilder: (context, index) {
        final resultData = searchSuggestions.elementAt(index);
        return ListTile(
          onTap: () {
            context.pushNamed(Routes.detailsView, extra: resultData);
            close(context, resultData.name);
          },
          title: ListTileSearch(product: resultData),
        );
      },
    );
  }
}
