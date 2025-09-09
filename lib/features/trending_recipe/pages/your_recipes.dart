import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/core/widgets/custom_app_bar.dart';
import '../../../core/authInterceptor.dart';
import '../../../core/network/api_client.dart';
import '../../../core/router/routes.dart';
import '../../../core/widgets/bottom_navigation_bar/bottom_navigation.dart';
import '../../../data/repository/categories/category_repository.dart';
import '../../../data/repository/recipes/recipe_repository.dart';
import '../../recipes/managers/recipe_view_model.dart';
import '../widgets/your_most_view_today.dart';
import '../widgets/your_recipe_list.dart';

class YourRecipes extends StatelessWidget {
  const YourRecipes({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(title: 'Your Recipes'),
      body: ChangeNotifierProvider(
        create: (context) {
          final apiClient = ApiClient(
            interceptor: AuthInterceptor(
              secureStorage: FlutterSecureStorage(),
            ),
          );
          final recipesRepository = RecipesRepository(apiClient: apiClient);
          final categoryRepository = CategoryRepository(
            apiClient: ApiClient(interceptor: AuthInterceptor(secureStorage: FlutterSecureStorage()))
          );
          return RecipeViewModel(
            recipesRepository: recipesRepository,
            categoryRepository: categoryRepository,
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
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              );
            }
            return Column(
              children: [
                YourMostViewToday(
                  vm: vm,
                  recipes: vm.recipes,
                ),
                SizedBox(height: 31.h,),
                Expanded(
                  child: YourRecipeList(
                    vm: vm,
                    onRecipeTap: (int recipeId) {
                      context.push('/trending-recipes/$recipeId');
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
