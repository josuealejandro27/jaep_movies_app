import 'package:flutter/material.dart';
import 'package:jaep_movies_app/presentation/providers/providers.dart';
import 'package:jaep_movies_app/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> with AutomaticKeepAliveClientMixin{

  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
            titlePadding: EdgeInsets.zero,
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                  MoviesSlideshow(movies: nowPlayingMovies),

                  SizedBox(height: 20,),

                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'En Cines',
                    subTitle: 'A partir de',
                    loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
                  ),
                ],
              );
            },
            childCount: 1,
          ),
        )
      ],
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}