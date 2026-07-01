import 'package:jaep_movies_app/config/config.dart';
import 'package:jaep_movies_app/domain/domain.dart';
import 'package:dio/dio.dart';
import 'package:jaep_movies_app/infrastructure/infrastructure.dart';
import 'package:jaep_movies_app/infrastructure/mappers/videol_mapper.dart';

class MoviedbDatasourceImpl extends MoviesDatasource {
  
  final dio = Dio(BaseOptions(
    baseUrl: Enviroment.apiUrl,
    queryParameters: {
      'api_key': Enviroment.theMovieDbKey,
      'language': Enviroment.language,
    }
  ));

  @override
  Future<Movie> getMovieById(String id) async{
    final response = await dio.get('/movie/$id');
    if (response.statusCode != 200)
      throw Exception('Movie with id $id not found');

    final detail = MovieDbDetail.fromJson(response.data);
    final Movie movie = MovieMapper.movieDetailToEntity(detail);
    return movie;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing',
    queryParameters: {
      'page': page,
    });
    
    final movieDbResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = movieDbResponse.results
      .map( (moviedb) => MovieMapper.movieDbToEntity(moviedb)).toList();
      return movies;
  }

    @override
  Future<List<Actor>> getActorsByMovie(String movieId) async{
    final response = await dio.get(
      '/movie/$movieId/credits'
    );

    final credits = MovieDbCredits.fromJson(response.data);

    List<Actor> actors = credits.cast.map(
      (cast) => ActorMapper.castToEntity(cast)
    ).toList();

    return actors;
  }

  @override
  Future<List<Video>> getYoutubeVideoById(String movieId) async{
    final response = await dio.get('/movie/$movieId/videos');
    final videosResponse = MovieDbVideosResponse.fromJson(response.data);
    final videos = <Video>[];

    for(final v in videosResponse.results) {
      if(v.site == 'Youtube') {
        final video = VideoMapper.movieDbVideoToEntity(v);
        videos.add(video);
      }
    }

    return videos;
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    // TODO: implement getPopular
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getSimilarMovie(String movieId) {
    // TODO: implement getSimilarMovie
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    // TODO: implement getTopRated
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    // TODO: implement getUpcoming
    throw UnimplementedError();
  }


  @override
  Future<List<Movie>> searchMovie(String query) {
    // TODO: implement searchMovie
    throw UnimplementedError();
  }

}