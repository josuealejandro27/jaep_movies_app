import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:jaep_movies_app/domain/domain.dart';
import 'package:animate_do/animate_do.dart';

class MoviesSlideshow extends StatelessWidget {
  final List<Movie> movies;
  const MoviesSlideshow({
    super.key,
    required this.movies
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    final filters = movies.take(6).toList();

    return FadeIn(
      child: SizedBox(
        height: 210,
        width: double.infinity,
        child: Swiper(
          scale: 0.8,
          viewportFraction: 0.8,
          autoplay: true,
          pagination: SwiperPagination(
            margin: EdgeInsets.only(top: 0),
            builder: DotSwiperPaginationBuilder(
              activeColor: colors.primary,
              color: Colors.white10
            )
          ),
          itemCount: filters.length,
          itemBuilder: (context, index) => _Slide(movie: filters[index],),
        )
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({
    required this.movie
  });

  @override
  Widget build(BuildContext context) {
    
    var decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 10),
          blurRadius: 10,
          color: Colors.black45
        )
      ]
    );

    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GestureDetector(
            onTap: () {},
            child: Image.network(
              movie.backdropPath,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return FadeIn(child: child);

                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes !=null ? loadingProgress.cumulativeBytesLoaded/loadingProgress.expectedTotalBytes!
                    : null,
                  ),
                );
              },
              ),
          ),
        ),
      ),
    );
  }
}