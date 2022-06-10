import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:nylo_framework/theme/helper/ny_theme.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends NyStatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends NyState<SettingsPage> {
  @override
  init() async {}

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _onPressLanguageSetting(BuildContext context) async {
    // await Navigator.push(
    //     context,
    //     CupertinoPageRoute(
    //         builder: (BuildContext context) => LanguageSettingPage(languageCode: NyLocalization.instance.languageCode,)));

    await Navigator.pushNamed(context, '/settings/language');

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = ThemeProvider.controllerOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("settings".tr().capitalize()),
      ),
      body: Container(
        child: SettingsList(sections: [
          SettingsSection(
            title: Text('Personalization'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.language),
                title: Text('Language'),
                value: Text(NyLocalization.instance.languageCode),
                onPressed: _onPressLanguageSetting,
              ),
              SettingsTile.switchTile(
                onToggle: (value) {
                  NyTheme.set(context,
                      id: (value
                          ? 'default_dark_theme'
                          : 'default_light_theme'));
                  setState(() {});
                },
                initialValue:
                    themeController.currentThemeId == 'default_dark_theme',
                leading: Icon(Icons.format_paint),
                title: Text('Enable dark theme'),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
