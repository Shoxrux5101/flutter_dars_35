import 'package:provider/provider.dart';
import '../data/repository/authentication/repository/authentication_repository.dart';
import '../data/repository/categories/repository/category_repository.dart';
import '../data/repository/recipes/repository/recipe_repository.dart';
import 'network/api_client.dart';

final dependencies = [
  Provider(create: (context) => ApiClient()),
  Provider(
    create: (context) => AuthenticationRepository(
      dioClient: context.read<ApiClient>(),
    ),
  ),

];
