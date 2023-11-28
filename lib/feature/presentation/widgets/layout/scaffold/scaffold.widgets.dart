import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_obelisk/feature/presentation/widgets/button/icon_button.widget.dart';
import 'package:the_obelisk/feature/presentation/widgets/layout/bottom-navigation/bottom-nav.widget.dart';
import 'package:the_obelisk/feature/presentation/widgets/layout/drawer/drawer.widget.dart';

class AppScaffold extends StatefulWidget {
  Widget? child;
  Widget? customBottomNav;
  FloatingActionButtonLocation? bottomNavPosition;
  bool? includeTopSafeArea;
  bool? showAppBar;
  bool? showHamburgerMenu;
  bool? enableDrawer;
  bool? enableBottomNav;
  AppScaffold(
      {super.key,
      required this.child,
      this.includeTopSafeArea = true,
      this.showAppBar = false,
      this.showHamburgerMenu = false,
      this.enableDrawer = true,
      this.customBottomNav,
      this.enableBottomNav = true,
      this.bottomNavPosition = FloatingActionButtonLocation.centerDocked});
  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    ModalRoute<dynamic>? currentRoute = ModalRoute.of(context);
    String routeName = currentRoute!.settings.name!;
    final advancedDrawerController = AdvancedDrawerController();
    return AdvancedDrawer(
        backdrop: Container(
          width: double.infinity,
          height: double.infinity,
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 19, 19, 19)),
        ),
        controller: advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        drawer: AppDrawer(),
        child: Scaffold(
          floatingActionButtonLocation: widget.bottomNavPosition,
          floatingActionButton: widget.enableBottomNav!
              ? widget.customBottomNav ?? const AppBottomNavigation()
              : null,
          appBar: widget.showAppBar!
              ? AppBar(
                  leading: widget.showHamburgerMenu!
                      ? AppIconButton(
                          onPressed: () {
                            if (widget.enableDrawer!) {
                              advancedDrawerController.showDrawer();
                            }
                          },
                          icon: Icons.menu,
                        )
                      : null,
                  title: Text(
                    "The Obelisk",
                    style: GoogleFonts.besley(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                )
              : null,
          body: SizedBox(
              child: SafeArea(
                  top: widget.includeTopSafeArea!,
                  child: SingleChildScrollView(
                    child: widget.child!,
                  ))),
        ));
  }
}
