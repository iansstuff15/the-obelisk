import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_obelisk/core/constants/appConstants.dart';
import 'package:the_obelisk/core/constants/sizes.config.dart';
import 'package:the_obelisk/core/util/urlLauncher.dart';

class AppDrawer extends StatefulWidget {
  Widget? child;
  AppDrawer({super.key, this.child});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.medium),
      child: ListTileTheme(
        textColor: Colors.white,
        iconColor: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("The Obelisk",
                style: GoogleFonts.besley(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: AppSizes.medium)),
            const Text(
              "a demo news app utilizing newsapi.org",
              style: TextStyle(color: Colors.white),
            ),
            const Spacer(),
            ListTile(
              onTap: () {
                Launch.web(url: githubLink);
              },
              leading: const Icon(EvaIcons.github),
              title: const Text('Repository'),
            ),
            ListTile(
              onTap: () {
                Launch.web(url: curriculumVitaeLink);
              },
              leading: const Icon(EvaIcons.file),
              title: const Text('Curriculum Vitae'),
            ),
            ListTile(
              onTap: () {
                Launch.web(url: linkedInLink);
              },
              leading: const Icon(EvaIcons.linkedin),
              title: const Text('LinkedIn'),
            ),
            ListTile(
              onTap: () {
                Launch.phone();
              },
              leading: const Icon(EvaIcons.recording),
              title: const Text('Phone'),
            ),
            ListTile(
              onTap: () {
                Launch.sms();
              },
              leading: const Icon(Icons.sms),
              title: const Text('SMS'),
            ),
            ListTile(
              onTap: () {
                Launch.email();
              },
              leading: const Icon(Icons.email),
              title: const Text('Email'),
            ),
            // ListTile(
            //   onTap: () {},
            //   leading: const Icon(Icons.share),
            //   title: const Text('Share project to a friend'),
            // ),
            const Spacer(),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white54,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('A clean architecture demo'),
                    Text('Created by Diriangen Lempira Powell, 2023')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
