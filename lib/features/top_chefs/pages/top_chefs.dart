import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/core/network/api_client.dart';
import 'package:untitled3/data/repository/chefs/repository/chefs_repository.dart';

import '../managers/top_chefs_view_model.dart';

class TopChefs extends StatelessWidget {
  final int id;
  const TopChefs({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final vm = TopChefsViewModel(
          repository: ChefsRepository(dioClient: ApiClient()),
          id: id,
        );
        vm.fetchTopChefs();
        return vm;
      },
      child: Consumer<TopChefsViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (vm.topChefs.isEmpty) {
            return Center(
              child: Text(
                'Maʼlumotlar topilmadi',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            );
          }
          return ListView.builder(
            itemCount: vm.topChefs.length,
            itemBuilder: (context, index) {
              final chef = vm.topChefs[index];
              return ListTile(
                title: Text(chef.userName),
                subtitle: Text(chef.firstName),
              );
            },
          );
        },
      ),
    );
  }
}
