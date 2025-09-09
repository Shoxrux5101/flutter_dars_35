import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/core/authInterceptor.dart';
import 'package:untitled3/core/network/api_client.dart';
import 'package:untitled3/core/utils/app_colors.dart';
import 'package:untitled3/data/repository/following/following_repository.dart';
import '../../../core/widgets/bottom_navigation_bar/bottom_navigation.dart';
import '../../../features/followers_page/managers/following_view_model.dart';
import '../widgets/followers_item.dart';
import '../widgets/following_item.dart';

class FollowingPage extends StatefulWidget {
  const FollowingPage({super.key});

  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FollowingViewModel(
        repository: FollowingRepository(
          apiClient: ApiClient(
            interceptor: AuthInterceptor(
              secureStorage: const FlutterSecureStorage(),
            ),
          ),
        ),
      )..loadFollowing(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset(
              'assets/icons/back-arrow.svg',
              color: AppColors.redPinkMain,
            ),
          ),
          title: Consumer<FollowingViewModel>(
            builder: (context, vm, _) {
              return Text(
                vm.following.isNotEmpty ? vm.following.first.username : "Users",
                style: TextStyle(
                  color: AppColors.redPinkMain,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              );
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => _tabController.animateTo(0),
                      child: Column(
                        children: [
                          const Text(
                            'Following',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            height: 2,
                            width: 165,
                            color: _tabController.index == 0
                                ? AppColors.redPinkMain
                                : Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => _tabController.animateTo(1),
                      child: Column(
                        children: [
                          const Text(
                            'Followers',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            height: 2,
                            width: 130,
                            color: _tabController.index == 1
                                ? AppColors.redPinkMain
                                : Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20,),
                padding: const EdgeInsets.symmetric(horizontal: 16,),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFB3BA),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Color(0xFF8B4A5C),
                      fontSize: 16,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: const TextStyle(
                    color: Color(0xFF8B4A5C),
                    fontSize: 16,
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Consumer<FollowingViewModel>(
                      builder: (context, vm, _) {
                        if (vm.isLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.redPinkMain,
                            ),
                          );
                        }
                        if (vm.errorMessage != null) {
                          return Center(
                            child: Text(
                              vm.errorMessage!,
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }
                        return ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          itemCount: vm.following.length,
                          itemBuilder: (context, index) {
                            final user = vm.following[index];
                            return FollowingItem(user: user);
                          },
                        );
                      },
                    ),
                    Consumer<FollowingViewModel>(
                      builder: (context, vm, _) {
                        final followers = vm.following;
                        return ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          itemCount: followers.length,
                          itemBuilder: (context, index) {
                            final user = followers[index];
                            return FollowerItem(
                              user: user,
                              onDelete: () {
                                vm.removeUser(user.id);
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavigation(),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }
}
