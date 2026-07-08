import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jaep_movies_app/presentation/providers/providers.dart';
import 'package:animate_do/animate_do.dart';


class ActorsByMovie extends ConsumerWidget {
  
  final String movieId;
  const ActorsByMovie({
    super.key,
    required this.movieId  
  });

  @override
  Widget build(BuildContext context, ref) {
    
    final actorsByMovie = ref.watch( actorsByMovieProvider);

    if (actorsByMovie[movieId] == null) {
      return Container(
        height: 100,
        margin: EdgeInsets.only(bottom: 50),
        child: Center(
          child: CircularProgressIndicator(strokeWidth: 2,),
        ),
      );
    }

    final actors = actorsByMovie[movieId]!;
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: actors.length,
        itemBuilder: (context, index) {
          final actor = actors[index];
          return FadeInRight(
            child: Container(
              padding: EdgeInsets.all(8),
              width: 135,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(20),
                    child: Image.network(
                      actor.profilePath,
                      height: 180,
                      width: 135,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return SizedBox(
                          height: 180,
                          width: 135,
                          child: Center(child: CircularProgressIndicator(strokeWidth: 2,))
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return SizedBox(
                          height: 180,
                          width: 135,
                          child: Center(child: Text('Sin imagen'))
                        );
                      },
                    ),
                  ),
            
                  Text(actor.name, maxLines: 1,),
                  Text(
                    actor.character ?? '',
                    maxLines: 1,
                    style: TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}