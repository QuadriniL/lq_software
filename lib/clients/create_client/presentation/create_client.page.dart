import 'package:flutter/material.dart';
import 'package:lq_software/clients/create_client/presentation/create_client.desktop.dart';
import 'package:lq_software/clients/create_client/presentation/create_client.mobile.dart';

class CreateClientPage extends StatelessWidget {
  const CreateClientPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    if (screenSize.width > 800) {
      return const CreateClientDesktopPage();
    } else {
      return CreateClientMobilePage();
    }
  }
}
