import 'package:flutter/material.dart';
import 'package:jaep_movies_app/domain/domain.dart';

class MovieHorizontalListview extends StatefulWidget {

  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListview({
    super.key,
    required this.movies,
    this.title,
    this.subTitle,
    this.loadNextPage
  });

  @override
  State<MovieHorizontalListview> createState() => _MovieHorizontalListviewState();
}

class _MovieHorizontalListviewState extends State<MovieHorizontalListview> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [

          Expanded(
            child: ListView.builder(
              itemCount: widget.movies.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return _Slide(movie: widget.movies[index],);
              },
            )
          )
        ],
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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Image
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GestureDetector(
                child: Image.network(
                  height: 220,
                  movie.posterPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          SizedBox(height: 5,),

          //Titulo
          SizedBox(
            width: 150,
            child: Text(
              movie.title,
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }
}