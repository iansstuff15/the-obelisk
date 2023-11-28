import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_obelisk/core/constants/fontWeight.config.dart';
import 'package:the_obelisk/core/constants/sizes.config.dart';
import 'package:the_obelisk/feature/presentation/widgets/bloc-builder/article/source-bloc.builder.widget.dart';
import 'package:the_obelisk/feature/presentation/widgets/layout/scaffold/scaffold.widgets.dart';

class CategoriesPage extends StatelessWidget {
  static String id = "Categories";
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showAppBar: true,
      showHamburgerMenu: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.small),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sources",
              style: GoogleFonts.besley(
                  fontWeight: AppFontWeight.bold, fontSize: AppSizes.medium),
            ),
            SourceBlocBuilder(direction: Axis.vertical)
          ],
        ),
      ),
    );
  }
}
