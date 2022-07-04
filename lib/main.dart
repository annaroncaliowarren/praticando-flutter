import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    // método que vai executar o app
    MaterialApp(
      // widget com configurações prontas
      home: HomePage(), // definindo que a home será HomePage
      debugShowCheckedModeBanner: false,
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String firstUrl =
      'https://cdn.pixabay.com/photo/2022/06/27/08/37/lotus-7287044_960_720.jpg';

  List<String> listImages = [
    'https://cdn.pixabay.com/photo/2022/06/27/08/37/lotus-7287044_960_720.jpg',
    'https://cdn.pixabay.com/photo/2022/06/21/07/50/dogs-7275314_960_720.jpg',
    'https://cdn.pixabay.com/photo/2022/04/18/15/38/poppies-7140807_960_720.jpg',
    'https://cdn.pixabay.com/photo/2022/06/19/04/25/cat-7271017_960_720.jpg',
    'https://cdn.pixabay.com/photo/2022/05/31/06/24/bird-7232808_960_720.jpg'
  ];

  void changeImage() {
    int randomNumber = Random().nextInt(listImages.length);

    setState(() {
      firstUrl = listImages[randomNumber];
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // esqueleto do app. sempre interessante ter um em cada página
      appBar: AppBar(), // Widget do flutter para AppBar
      body: SingleChildScrollView(
        child: Center(
          //widget para centralizar dentro do espaço disponível
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                //Widget para mostrar um texto na tela
                'Olá Mundo!',
                style: TextStyle(
                    letterSpacing: 2,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 80),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(left: 0, bottom: 30, right: 0, top: 10),
                child: Text(
                  'Segue uma imagem para você:',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Image.network(firstUrl),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    primary: Colors.lightBlue,
                    textStyle: const TextStyle(fontWeight: FontWeight.w500)),
                onPressed: () {
                  changeImage();
                },
                child: const Text('Clique para mudar a imagem!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
