import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/core/widgets/custom_app_bar.dart';
import 'package:untitled3/features/trending_recipe/managers/trending_recipes_view_model.dart';
import 'package:untitled3/features/trending_recipe/pages/trending_recipes_details.dart';
import 'package:untitled3/features/trending_recipe/widgets/most_view_today.dart';
import '../../../core/network/api_client.dart';
import '../../../core/widgets/bottom_navigation_bar/bottom_navigation.dart';
import '../../../data/repository/categories/repository/category_repository.dart';
import '../../../data/repository/recipes/repository/recipe_repository.dart';
import '../../../data/repository/trending_recipes/repository/trending_recipes_repository.dart';
import '../../recipes/managers/recipe_view_model.dart';
import '../widgets/recipe_list.dart';

class TrendingRecipes extends StatelessWidget {
  const TrendingRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Trending Recipes'),
      body: Column(
        children: [
          Expanded(
            child: ChangeNotifierProvider(
              create: (context) {
                final vm = TrendingRecipesViewModel(
                  repository: TrendingRecipesRepository(dioClient: ApiClient()),
                );
                vm.fetchTrendingRecipes();
                return vm;
              },
              builder: (context, child) => Consumer<TrendingRecipesViewModel>(
                builder: (context, vm, child) {
                  if (vm.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (vm.recipes == null) {
                    return const Center(
                      child: Text(
                        'Trending malumotlar topilmadi',
                        style: TextStyle(color: Colors.black, fontSize: 16),
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
          ),

          Expanded(
            child: ChangeNotifierProvider(
              create: (context) {
                final apiClient = ApiClient();
                final recipesRepository = RecipesRepository(dioClient: apiClient);
                final categoryRepository = CategoryRepository(dioClient: apiClient);

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
                    return const Center(
                      child: Text(
                        'Recipes topilmadi',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    );
                  }
                  final recipes = vm.recipes;
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>TrendingRecipesDetails(),
                      )
                      );
                    },
                      child: RecipeList(vm: vm)
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