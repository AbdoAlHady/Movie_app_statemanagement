import 'package:flutter/material.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/core/routing/slide_page_route_animation.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/views/screens/favorite_screen.dart';
import 'package:movie_app/views/screens/home_screen.dart';
import 'package:movie_app/views/screens/movie_details_screen.dart';
import 'package:movie_app/views/screens/splash_screen.dart';

class AppRouter {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Route? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.home:
        return SlidePageRouteAnimation(page: const HomeScreen());
      case Routes.splash:
        return SlidePageRouteAnimation(page: const SplashScreen());
      case Routes.movieDetails:
        return SlidePageRouteAnimation(
            page: MovieDetailsScreen(movie: args as MoivesResult));
      case Routes.favorite:
        return SlidePageRouteAnimation(page: const FavoriteScreen());

      default:
        return null;
    }
  }
}
