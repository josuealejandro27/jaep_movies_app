import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:jaep_movies_app/domain/domain.dart';

class MoviesSlideshow extends StatelessWidget {
  final List<Movie> movies;
  const MoviesSlideshow({
    super.key,
    required this.movies
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return movies.isNotEmpty ? SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        itemCount: movies.length,
        itemBuilder: (context, index) => Placeholder(),
      )
    ) : SizedBox();
  }
}