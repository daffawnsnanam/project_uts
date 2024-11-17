// Dart import
import 'package:flutter/material.dart';

//Package imports
import 'package:spotify/config/constants.dart';
import 'package:spotify/pages/album_details_page.dart';
import 'package:spotify/pages/error_page.dart';
import 'package:spotify/pages/home_page.dart';

class RouteGenerator {
  static Route<dynamic> generatorRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: ((_) => const HomePage()));
      case errorPage:
        return MaterialPageRoute(builder: (_) => const ErrorPage());
        case albumDetailsPage:
        return MaterialPageRoute(builder: (_) => const AlbumDetailsPage());
      default:
        return MaterialPageRoute(builder: (_) => const ErrorPage());
    }
  }
}
