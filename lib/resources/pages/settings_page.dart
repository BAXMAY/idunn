import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/app_settings.dart';
import 'package:flutter_app/resources/pages/language_setting_page.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:nylo_framework/theme/helper/ny_theme.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends NyStatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends NyState<SettingsPage> {
  late AppSettings _appSettings;
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

    setState(() {
      _appSettings.language = NyLocalization.instance.languageCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    //  Get AppSettings object of route arguments
    _appSettings = ModalRoute.of(context)!.settings.arguments as AppSettings;

    return Scaffold(
      appBar: AppBar(
        title: Text("settings".tr().capitalize()),
      ),
      body: SafeArea(
        child: Container(
          child: SettingsList(sections: [
            SettingsSection(
              title: Text('Personalization'),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: Icon(Icons.language),
                  title: Text('Language'),
                  value: Text(_appSettings.language),
                  onPressed: _onPressLanguageSetting,
                ),
                SettingsTile.switchTile(
                  onToggle: (value) {
                    _appSettings.darkTheme = value;
                    NyTheme.set(context,
                        id: (value
                            ? 'default_dark_theme'
                            : 'default_light_theme'));
                    setState(() {});
                  },
                  initialValue: _appSettings.darkTheme,
                  leading: Icon(Icons.format_paint),
                  title: Text('Enable dark theme'),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
