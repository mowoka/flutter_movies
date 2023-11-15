import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_moka/src/core/utils/debouncer.dart';

typedef OnQuery<T> = Future<List<T>> Function(
    {required String query, required int page, required int size});

typedef BuilderFunction<T> = Widget Function(BuildContext, AsyncSnapshot<T?>);

class MokaSearchDelegate<T> extends SearchDelegate<T?> {
  final bool autoSuggest;
  final OnQuery<T> onQuery;
  final String searchPlaceholder;
  final TextInputType inputType;
  final int itemsPerPage;
  final BuilderFunction Function(
      Function(BuildContext context, T data) close, String query) builder;
  final _debouncer = Debouncer(milliseconds: 250);
  var _completer = Completer<List<T>>();
  final List<String> _queries = [];

  @override
  String get searchFieldLabel => searchPlaceholder;
  @override
  TextInputType get keyboardType => inputType;

  MokaSearchDelegate({
    required this.builder,
    this.searchPlaceholder = 'Telusuri',
    this.inputType = TextInputType.text,
    required this.onQuery,
    this.autoSuggest = true,
    this.itemsPerPage = 30,
  });

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<T>?>(
      future: debouncedOnQuery(),
      builder: builder(close, query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (autoSuggest == false) {
      return Container();
    }
    return FutureBuilder<List<T>>(
        future: debouncedOnQuery(), builder: builder(close, query));
  }

  Future<List<T>> debouncedOnQuery() {
    _completer = Completer<List<T>>();
    _debouncer.run(() async {
      _queries.add(query);
      final res = await onQuery(
        query: query,
        page: 1,
        size: itemsPerPage,
      );
      if (_completer.isCompleted) {
        return;
      }
      if (_queries.isNotEmpty && _queries.last == query) {
        _completer.complete(res);
        _queries.clear();
      }
    });
    return _completer.future;
  }
}
