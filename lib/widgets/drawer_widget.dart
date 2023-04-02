import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_flutter/widgets/vertical_spacing.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final themeState= Provider.of<DarkThemeProvider>(context);

    return Drawer(
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: Theme.of(context).primaryColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(child: Image.asset('assets/images/newspaper.png',
                    height: 60, width: 60,
                      ),
                    ),
                    const VerticalSpacing(20),
                    Flexible(
                        child: Text(
                            'Newspect',
                        style: GoogleFonts.lobster(
                          textStyle: TextStyle(fontSize: 20, letterSpacing: 0.6)
                        ),
                       ),
                    ),
                  ],
                ),),

            const VerticalSpacing(20),

            ListTilesWidget(
              label: "Home",
              icon: IconlyBold.home,
              fct: () {},
            ),
            ListTilesWidget(
              label: "Bookmarks",
              icon: IconlyBold.bookmark,
              fct: () {},
            ),
            const Divider(thickness: 1,),
            SwitchListTile(
              title: Text(
                themeState.getDarkTheme ? 'dark' :'light',
                style: const TextStyle(fontSize: 20),
              ),
              secondary: Icon(themeState.getDarkTheme
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined),
              onChanged: (bool value){
                setState(() {
                  themeState.setDarkTheme = value;
                });
              },
              value: themeState.getDarkTheme,
            ),
          ],
        ),
      )
    );
  }
}

class ListTilesWidget extends StatelessWidget {
  const ListTilesWidget({
    super.key, required this.label, required this.fct, required this.icon,
  });

  final String label;
  final Function fct;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,
      color: Theme.of(context).colorScheme.secondary,),
      title: Text(
        label,
      style: const TextStyle(fontSize: 20),
      ),
      onTap: () {fct();},
    );
  }
}
