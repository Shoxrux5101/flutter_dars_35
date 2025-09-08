import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/core/authInterceptor.dart';
import 'package:untitled3/core/network/api_client.dart';
import 'package:untitled3/core/utils/app_colors.dart';
import 'package:untitled3/data/repository/following/following_repository.dart';
import 'package:untitled3/features/followers_page/managers/following_view_model.dart';

class FollowingPage extends StatelessWidget {
  const FollowingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final vm = FollowingViewModel(
          repository: FollowingRepository(
            apiClient: ApiClient(
              interceptor: AuthInterceptor(
                secureStorage: FlutterSecureStorage(),
              ),
            ),
          ),
        );
        vm.loadFollowing();
        return vm;
      },
      builder: (context, child) => Consumer<FollowingViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (vm.following == null) {
            return Center(
              child: Text(
                'Following malumotlari topilmadi',
                style: TextStyle(color: AppColors.white),
              ),
            );
          }
          // final follow = vm.following;
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset('assets/icons/back-arrow'),
              ),
              centerTitle: true,
              title: Text(vm.following as String),
            ),
          );
        },
      ),
    );
  }
}
