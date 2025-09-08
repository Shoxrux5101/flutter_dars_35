// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:provider/provider.dart';
// import 'package:untitled3/core/authInterceptor.dart';
// import '../data/repository/authentication/repository/authentication_repository.dart';
// import '../data/repository/categories/repository/category_repository.dart';
// import '../data/repository/chefs/repository/top_chefs_profile_repository.dart';
// import '../data/repository/recipes/repository/recipe_repository.dart';
// import '../data/repository/reviews/repository/reviews_repository.dart';
// import '../features/top_chefs/managers/top_chefs_view_model.dart';
// import 'network/api_client.dart';
//
// final dependencies = <SingleChildWidget>[
//   Provider(create: (context) => FlutterSecureStorage()),
//   Provider(create: (context) => AuthInterceptor(secureStorage: context.read())),
//   Provider(create: (context) => ApiClient(interceptor: context.read())),
//   Provider(create: (context) => AuthenticationRepository(dioClient: context.read<ApiClient>(),),),
//   Provider(create: (context) =>RecipesRepository(dioClient: context.read<ApiClient>()),),
//   Provider(create: (context) =>CategoryRepository(dioClient: context.read<ApiClient>(),),),
//   Provider(create: (context) =>ReviewsRepository(dioClient: context.read<ApiClient>(),),),
//   Provider(create: (context) => ReviewsRepository(dioClient: context.read<ApiClient>()),),
//   Provider(create: (context) => TopChefsProfileRepository(dioClient: context.read(),),),
//
// ];