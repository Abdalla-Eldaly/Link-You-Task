import '../../domain/models/user_model.dart';
import '../models/cache/cache_user_model.dart';

class HiveUserDto {
  static User toEntity(CacheUserModel cacheUser) {
    return User(
      id: cacheUser.id,
      username: cacheUser.username,
      firstName: cacheUser.firstName,
      lastName: cacheUser.lastName,
      email: cacheUser.email,
      gender: cacheUser.gender,
      image: cacheUser.image,
    );
  }

  static CacheUserModel toHiveModel(User entity) {
    return CacheUserModel(
      id: entity.id ?? 0,
      username: entity.username ?? "",
      firstName: entity.firstName ?? "",
      lastName: entity.lastName ?? "",
      email: entity.email ?? "",
      gender: entity.gender ?? "",
      image: entity.image ?? "",
    );
  }
}
