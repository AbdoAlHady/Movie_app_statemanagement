import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helpers/popup_helper.dart';
import 'package:movie_app/core/service/setup_getit.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/repository/movies_repo.dart';
import 'package:movie_app/views/widgets/movie_list_view_item.dart';

class MovieListView extends StatefulWidget {
  const MovieListView({
    super.key,
  });

  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  final List<MoivesResult> movies = [];
  bool isFetching = false;
  final ScrollController _scrollController = ScrollController();
  int currentPage = 1;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    fetchMovies();

    super.initState();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !isFetching) {
      fetchMovies();
    }
  }

  Future<void> fetchMovies() async {
    if (isFetching) return;
    setState(() {
      isFetching = true;
    });
    var result = await getIt<MoviesRepo>().getMovies(currentPage);
    result.fold((l) {
      PopupHelper.showSnackBar(l.errorModel.message!);
    }, (movieModel) {
      setState(() {
        movies.addAll(movieModel.results!);
        currentPage++;
        isFetching = false;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: movies.length + (isFetching ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < movies.length) {
          return MovieListViewItem(movie: movies[index]);
        } else {
          return SizedBox(
              width: 50.w,
              height: 50.h,
              child: const Center(child: CircularProgressIndicator.adaptive()));
        }
      },
    );
  }
}
