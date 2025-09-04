import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../managers/favourite_view_model.dart';
import 'favourite_widget.dart';

class RecipeDetailWidget extends StatelessWidget {
  const RecipeDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<FavouriteViewModel>();

    if (viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (viewModel.error != null) {
      return Center(child: Text("Xatolik: ${viewModel.error}"));
    }
    if (viewModel.recipes.isEmpty) {
      return const Center(child: Text("Hech qanday recipe topilmadi"));
    }

    return Column(
      children: [
        if (viewModel.recipes.length >= 2) ...[
          const SizedBox(height: 16),
        ],
        GridView.builder(
          padding: const EdgeInsets.all(12),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.75,
          ),
          itemCount: viewModel.recipes.length > 2
              ? viewModel.recipes.length - 2
              : viewModel.recipes.length,
          itemBuilder: (context, index) {
            final recipe = viewModel.recipes.length > 2
                ? viewModel.recipes[index + 2]
                : viewModel.recipes[index];
            return _GridRecipeCard(recipe: recipe);
          },
        ),
      ],
    );
  }
}
class _GridRecipeCard extends StatelessWidget {
  final dynamic recipe;
  const _GridRecipeCard({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Stack(
              children: [
                Image.network(
                  recipe.photo,
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.image_not_supported, size: 60),
                ),
                const Positioned(top: 8, right: 8, child: FavouriteWidget()),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  recipe.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Image.asset("assets/alarm.png", width: 12, height: 12),
                    const SizedBox(width: 4),
                    Text("${recipe.timeRequired} min", style: TextStyle(color: AppColors.redPinkMain, fontSize: 11)),
                    const Spacer(),
                    Image.asset("assets/star.png", width: 12, height: 12),
                    const SizedBox(width: 4),
                    Text("${recipe.rating}", style: TextStyle(color: AppColors.redPinkMain, fontSize: 11)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}