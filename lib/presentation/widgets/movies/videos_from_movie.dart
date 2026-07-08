import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jaep_movies_app/domain/domain.dart';
import 'package:jaep_movies_app/presentation/providers/providers.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideosFromMovie extends ConsumerWidget {
  final String movieId;
  const VideosFromMovie({
    super.key,
    required this.movieId
  });

  @override
  Widget build(BuildContext context, ref) {

    final moviesFromVideo = ref.watch( videosFromMovieProvider(movieId));

    return moviesFromVideo.when(
      data: (videos) => _VideoList(videos: videos,),
      error:(_, __) => Center(child: Text('No se pudo cargar los videos'),),
      loading:() => Center(child: CircularProgressIndicator(strokeAlign: 2,),),
    );
  }
}

class _VideoList extends StatelessWidget {
  final List<Video> videos;
  const _VideoList({
    required this.videos
  });

  @override
  Widget build(BuildContext context) {

    //si no existen videos
    if(videos.isEmpty) return SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _YoutubeVideoPlayer(
          youtubeId: videos.first.youtubeKey,
          name: videos.first.name,
        )
      ],
    );
  }
}

class _YoutubeVideoPlayer extends StatefulWidget {
  final String youtubeId;
  final String name;

  const _YoutubeVideoPlayer({
    required this.youtubeId,
    required this.name
  });

  @override
  State<_YoutubeVideoPlayer> createState() => _YoutubeVideoPlayerState();
}

class _YoutubeVideoPlayerState extends State<_YoutubeVideoPlayer> {

  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.youtubeId,
      autoPlay: true,
      params: YoutubePlayerParams(
        enableCaption: true,
        showFullscreenButton: false,
        mute: true,
        
      )
    );
    super.initState();
    
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.name),
          YoutubePlayer(controller: _controller),
        ],
      ),
    );
  }
}