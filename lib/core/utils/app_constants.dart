import 'package:movie_app/models/movies_model.dart';

abstract class AppConstants {
  static const String imageurl =
      'https://images.pexels.com/photos/12327637/pexels-photo-12327637.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';

  static List<String> genres = [
    "Action",
    "Adventure",
    "Animation",
    "Comedy",
    "Crime",
  ];

  static List<MoivesResult> randomMovies = List.generate(
    10,
    (index) => MoivesResult(
      adult: false,
      backdropPath: "/v9acaWVVFdZT5yAU7J2QjwfhXyD.jpg",
      genreIds: [1, 2, 3],
      id: 101,
      originalLanguage: "en",
      originalTitle: "Movie Title 1",
      overview: "Overview of the movie 1",
      popularity: 8.7,
      posterPath: "/poster1.jpg",
      releaseDate: "2024-01-01",
      title: "Movie 1",
      video: false,
      voteAverage: 7.8,
      voteCount: 1000,
    ),
  ).toList();
}
