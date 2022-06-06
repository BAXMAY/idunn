import 'package:flutter/material.dart';
import 'package:flutter_app/bootstrap/app.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'bootstrap/boot.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Nylo nylo = await Nylo.init(setup: Boot.nylo, setupFinished: Boot.finished);

  await Supabase.initialize(
    url: 'https://vuqwzvufblmsicywhlox.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ1cXd6dnVmYmxtc2ljeXdobG94Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTQ1MzQ4MTQsImV4cCI6MTk3MDExMDgxNH0.sf7aylQLNiWByFdTuuxqmzd2pjsZ44SbfVTogxjfKzk'
  );

  runApp(
    AppBuild(
      navigatorKey: NyNavigator.instance.router.navigatorKey,
      onGenerateRoute: nylo.router!.generator(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
