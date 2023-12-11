import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lq_software/clients/create_client/presentation/create_client.page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'LQ Software',
        theme: ThemeData(
          fontFamily: GoogleFonts.dmSans().fontFamily,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 149, 92, 255)),
          primaryColor: Color.fromARGB(255, 155, 101, 255),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const CreateClientPage(),
        });
  }
}
