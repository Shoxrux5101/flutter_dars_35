import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/core/widgets/custom_app_bar.dart';
import 'package:untitled3/features/trending_recipe/managers/trending_recipes_view_model.dart';
import 'package:untitled3/features/trending_recipe/widgets/most_view_today.dart';
import '../../../core/authInterceptor.dart';
import '../../../core/network/api_client.dart';
import '../../../core/router/routes.dart';
import '../../../core/widgets/bottom_navigation_bar/bottom_navigation.dart';
import '../../../data/repository/categories/category_repository.dart';
import '../../../data/repository/recipes/recipe_repository.dart';
import '../../../data/repository/trending_recipes/trending_recipes_repository.dart';
import '../../recipes/managers/recipe_view_model.dart';
import '../widgets/recipe_list.dart';

class TrendingRecipes extends StatelessWidget {
  const TrendingRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(title: 'Trending Recipes'),
      body: Column(
        children: [
          ChangeNotifierProvider(
            create: (context) {
              final vm = TrendingRecipesViewModel(
                repository: TrendingRecipesRepository(apiClient: ApiClient(interceptor: AuthInterceptor(
                  secureStorage: FlutterSecureStorage(),
                ),)),
              );
              vm.fetchTrendingRecipes();
              return vm;
            },
            builder: (context, child) => Consumer<TrendingRecipesViewModel>(
              builder: (context, vm, child) {
                if (vm.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (vm.recipes == null) {
                  return Center(
                    child: Text(
                      'Trending malumotlar topilmadi',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  );
                }
                final recipe = vm.recipes!;
                return Column(
                  children: [
                    MostViewToday(
                      vm: vm,
                      recipe: recipe,
                    ),
                  ],
                );
              },
            ),
          ),
          Expanded(
            child: ChangeNotifierProvider(
              create: (context) {
                final apiClient = ApiClient(interceptor: AuthInterceptor(
                    secureStorage: const FlutterSecureStorage(),
                ),);
                final recipesRepository = RecipesRepository(apiClient: apiClient);
                final categoryRepository = CategoryRepository(
                  apiClient: ApiClient(interceptor: AuthInterceptor(secureStorage: FlutterSecureStorage()))
                );
                return RecipeViewModel(
                  recipesRepository: recipesRepository,
                  categoryRepository: categoryRepository,
                  catId: 1,
                );
              },
              builder: (context, child) => Consumer<RecipeViewModel>(
                builder: (context, vm, child) {
                  if (vm.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (vm.recipes.isEmpty) {
                    return Center(
                      child: Text(
                        'Recipes topilmadi',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    );
                  }
                  return RecipeList(
                    vm: vm,
                    onRecipeTap: (int recipeId) {
                      context.push(
                        Routes.trendingRecipeDetailsPage,
                        extra: {"id": recipeId},
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}