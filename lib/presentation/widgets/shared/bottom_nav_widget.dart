import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/presentation/providers/ui_notifier.dart';
import 'package:movie_app/presentation/providers/trailer_provider.dart';
import 'package:movie_app/presentation/utils/ui_extensions.dart';
import 'package:provider/provider.dart';

class BottomNavWidget extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavWidget({super.key, required this.navigationShell});

  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  @override
  Widget build(BuildContext context) {
    final uINotifier = context.watch<UiNotifier>();
    final routerIndex = widget.navigationShell.currentIndex;

    // Sync notifier with router index
    if (uINotifier.selectedIndex != routerIndex) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        uINotifier.selectedIndex = routerIndex;
      });
    }

    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: SafeArea(
        child: Container(
          color: context.colors.tertiary,
          child: BottomNavigationBar(
            elevation: 0,
            currentIndex: routerIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              if (index == routerIndex) return;

              // Pause video when switching tabs
              context.read<TrailerProvider>().controller?.pause();

              widget.navigationShell.goBranch(
                index,
                initialLocation: index == routerIndex,
              );
              uINotifier.selectedIndex = index;
            },
            backgroundColor: Colors.transparent,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: context.colors.primary,
            unselectedItemColor: AppColors.unselectedItem,
            selectedLabelStyle: context.textTheme.displayMedium?.copyWith(
              color: context.colors.primary,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: context.textTheme.displayMedium?.copyWith(
              color: AppColors.unselectedItem,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            items: [
              buildNavItem(
                iconName: 'movie_home',
                label: 'Home',
                isSelected: uINotifier.selectedIndex == 0,
              ),
              buildNavItem(
                iconName: 'movie_discovery',
                label: 'Discovery',
                isSelected: uINotifier.selectedIndex == 1,
              ),
              buildNavItem(
                iconName: 'movie_watchlist',
                label: 'Watchlist',
                isSelected: uINotifier.selectedIndex == 2,
              ),
              buildNavItem(
                iconName: 'movie_profile',
                label: 'Profile',
                isSelected: uINotifier.selectedIndex == 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem buildNavItem({
    required String iconName,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/svg/$iconName.svg',
        height: 24,
        colorFilter: ColorFilter.mode(
          isSelected ? context.colors.primary : AppColors.unselectedItem,
          BlendMode.srcIn,
        ),
      ).paddingB(6),
      label: label,
    );
  }
}
