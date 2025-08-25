import 'package:flutter/cupertino.dart';

import '../../../core/utils/app_colors.dart';
class CommunityBottomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CommunityBottomAppBar({super.key});
  @override
  Size get preferredSize => Size(double.infinity, 40);

  @override
  State<CommunityBottomAppBar> createState() => _CommunityBottomBarState();
}
class _CommunityBottomBarState extends State<CommunityBottomAppBar> {
  List items = ['Top Recipes', 'Newest', 'Oldest'];
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          Row(
            spacing: 35,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...List.generate(items.length, (index) {
                return GestureDetector(
                  onTap: () {
                    isSelected = index;
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: 15,
                    ),
                    height: 25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19),
                        color: isSelected == index
                            ? AppColors.redPinkMain
                            : AppColors.beige
                    ),
                    child: Text(
                      items[index],
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: isSelected == index
                              ? AppColors.white
                              : AppColors.redPinkMain
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}