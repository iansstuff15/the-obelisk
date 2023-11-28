import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_obelisk/core/constants/fontWeight.config.dart';
import 'package:the_obelisk/core/constants/sizes.config.dart';
import 'package:the_obelisk/feature/presentation/widgets/form/input/formField.widget.dart';
import 'package:the_obelisk/feature/presentation/widgets/layout/scaffold/scaffold.widgets.dart';

class SearchPage extends StatelessWidget {
  static String id = "Search";
  const SearchPage({super.key});

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
              "Search",
              style: GoogleFonts.besley(
                  fontWeight: AppFontWeight.bold, fontSize: AppSizes.medium),
            ),
            AppTextFormField(
              keyboardType: TextInputType.text,
              placeholder: "Keywords or phrases in the article title and body",
            )
          ],
        ),
      ),
    );
  }
}
