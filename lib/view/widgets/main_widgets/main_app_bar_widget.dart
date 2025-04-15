import 'package:flutter/material.dart';
import 'package:foodtek/view/widgets/main_widgets/notification_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../app_styles.dart';
import '../../../controller/home_page_controller.dart';
import '../../../controller/lang_controller.dart';
import '../../../l10n/app_localizations.dart';

class MainAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final TabBar? tabBar;

  const MainAppBarWidget({super.key, this.tabBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: ListTile(
        leading: _buildLocationButton(),
        title: _buildLocationTitle(context),
        subtitle: _buildLocationSubtitle(context),
      ),
      bottom: tabBar,
      actions: [NotificationButton()],
    );
  }

  Widget _buildLocationButton() {
    return Consumer<HomePageController>(
      builder: (context, homePageController, child) {
        if (homePageController.isProductDetailsSelected) {
          return IconButton(
            onPressed: () {
              homePageController.toggleProductDetails();
            },
            icon: Icon(Icons.arrow_back),
          );
        } else {
          return Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Color(0xFFEDF7EF),
              borderRadius: BorderRadius.circular(4),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/images/location.png",
                height: 22,
                width: 22,
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildLocationTitle(BuildContext context) {
    LangController langController = Provider.of<LangController>(
      context,
      listen: false,
    );
    return GestureDetector(
      onTap: () {},
      child: Text(
        AppLocalizations.of(context)!.current_location,
        style: AppStyles.getFontStyle(
          langController,
          fontSize: 12,
          color: Color(0xFF606060),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildLocationSubtitle(BuildContext context) {
    LangController langController = Provider.of<LangController>(
      context,
      listen: false,
    );
    return Text(
      'Jl. Soekarno Hatta 15A...',
      style: AppStyles.getFontStyle(
        langController,
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Color(0xFF101010),
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  @override
  Size get preferredSize {
    return tabBar == null
        ? Size.fromHeight(kToolbarHeight)
        : Size.fromHeight(kToolbarHeight * 2);
  }
}
