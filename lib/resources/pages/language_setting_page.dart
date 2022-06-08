import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:settings_ui/settings_ui.dart';

class LanguageSettingPage extends NyStatefulWidget {
  LanguageSettingPage({super.key, required this.languageCode});

  final String languageCode;

  @override
  _LanguageSettingPageState createState() => _LanguageSettingPageState();
}

class _LanguageSettingPageState extends NyState<LanguageSettingPage> {
  static const List<String> languageCodeList = ['en', 'th'];

  int languageIndex = 0;

  @override
  init() async {
    languageIndex = languageCodeList.indexOf(widget.languageCode);
  }

  @override
  void dispose() {
    super.dispose();
  }

  _onSelectLanguage(int idx) async {
    //  Set restartState to false. So it won't reset theme
    await changeLanguage(languageCodeList[idx], restartState: false);
    setState(() {
      languageIndex = idx;
    });
  }

  Widget trailingWidget(int index) {
    return (languageIndex == index)
        ? Icon(Icons.check, color: Colors.blue)
        : Icon(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('language'.tr().capitalize()),
      ),
      body: SafeArea(
        child: Container(
          child: SettingsList(sections: [
            SettingsSection(
              tiles: <SettingsTile>[
                SettingsTile(
                  title: Text("English"),
                  trailing: trailingWidget(0),
                  onPressed: (BuildContext context) => _onSelectLanguage(0),
                ),
                SettingsTile(
                  title: Text("ไทย"),
                  trailing: trailingWidget(1),
                  onPressed: (BuildContext context) => _onSelectLanguage(1),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
