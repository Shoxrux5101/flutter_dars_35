import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled3/features/top_chefs/widgets/options_button.dart';
import 'package:untitled3/features/top_chefs/widgets/share_button.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/custom_toggle.dart';
import '../../../data/models/chefs_model.dart';

class TopChefsProfileAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final ChefsModel chefsModel;

  const TopChefsProfileAppBar({super.key, required this.chefsModel});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset(
          'assets/icons/back-arrow.svg',
          color: AppColors.redPinkMain,
        ),
      ),
      title: Center(
        child: Text(
          chefsModel.userName,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.redPinkMain,
          ),
        ),
      ),
      actions: [
        ShareButton(chefsModel: chefsModel),
        OptionsButton(chefsModel: chefsModel),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
