
import 'package:jaep_movies_app/domain/domain.dart';
import 'package:jaep_movies_app/infrastructure/infrastructure.dart';

class ActorMapper {

  static Actor castToEntity ( Cast cast) => Actor(
    id: cast.id,
    name: cast.name,
    profilePath: 
    cast.profilePath.isNotEmpty
    ? 'https://image.tmdb.org/t/p/w500${ cast.profilePath}'
    : "https://i.pinimg.com/736x/96/e2/a7/96e2a7d987ce19f693d39f131cda092a.jpg",
    character: cast.character
  );
}