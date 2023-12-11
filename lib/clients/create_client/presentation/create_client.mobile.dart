import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateClientMobilePage extends StatefulWidget {
  CreateClientMobilePage({super.key});

  @override
  State<CreateClientMobilePage> createState() => _CreateClientMobilePageState();
}

class _CreateClientMobilePageState extends State<CreateClientMobilePage> {
  Uint8List? _imageBytes;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _imageBytes = await pickedFile.readAsBytes();
    } else {
      print('No image selected.');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
            title: Text('LQ Software'),
            backgroundColor: Theme.of(context).colorScheme.primary),
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Criar Cliente',
            style: TextStyle(fontSize: 20),
          ),
        ),
        // Add avatar
        Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 160),
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 140),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(40)),
                        color: Colors.deepPurpleAccent,
                      ),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Nome',
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black12,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(360),
                  ),
                  child: _imageBytes == null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              hoverColor: Colors.transparent,
                              onPressed: getImage,
                              icon: const Icon(
                                Icons.add_a_photo,
                                color: Colors.black38,
                              ),
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const Text(
                              'Clique e escolha um avatar',
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w100),
                            )
                          ],
                        )
                      : GestureDetector(
                          onTap: getImage,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(360),
                            ),
                            child: Image.memory(
                              _imageBytes!,
                              repeat: ImageRepeat.noRepeat,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                ),
                // Add name
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
