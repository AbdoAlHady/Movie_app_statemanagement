import 'package:flutter/material.dart';
import 'package:movie_app/views/widgets/movie_list_view_item.dart';

class MovieListView extends StatelessWidget {
  const MovieListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const MovieListViewItem();
      },
    );
  }
}
