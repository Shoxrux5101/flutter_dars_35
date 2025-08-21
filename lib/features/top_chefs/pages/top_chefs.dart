import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/core/network/api_client.dart';
import 'package:untitled3/data/repository/chefs/repository/chefs_repository.dart';
import 'package:untitled3/features/top_chefs/widgets/most_liked_chefs.dart';
import 'package:untitled3/features/top_chefs/widgets/most_viewed_chefs.dart';
import '../../../core/widgets/bottom_navigation_bar/bottom_navigation.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../managers/top_chefs_view_model.dart';
import '../widgets/new_chefs.dart';

class TopChefs extends StatelessWidget {
  final List<int> ids;

  const TopChefs({super.key,required this.ids});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final apiClient = context.read<ApiClient>();
        final vm = TopChefsViewModel(
          repository: ChefsRepository(dioClient: apiClient),
        );
        vm.fetchTopViewedChefs([1,6]);
        vm.fetchTopLikedChefs([3,2]);
        vm.fetchNewChefs([8,4]);
        return vm;
      },
      child: Consumer<TopChefsViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (vm.topChefs.isEmpty) {
            return Scaffold(
              body: Center(
                child: Text(
                  'Maʼlumotlar topilmadi',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            );
          }
          return Scaffold(
            backgroundColor: Color(0xFF1C0F0D),
            extendBody: true,
            appBar: CustomAppBar(title: 'TopChefs'),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  MostViewedChefs(chefs: vm.topChefs),
                  MostLikedChefs(chefs: vm.mostLikeChefs),
                  NewChefs(chefs: vm.newChefs,),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigation(),
          );
        },
      ),
    );
  }
}
