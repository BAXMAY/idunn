class AppSettings {
  late bool darkTheme = true;
  late String language = 'en';

  AppSettings();
  AppSettings.init(this.darkTheme, this.language);
}
