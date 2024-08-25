import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 130, bottom: 40),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/wpp.png'), // Ganti dengan path gambar latar belakang Anda
            fit: BoxFit.cover, // Mengatur gambar agar mengisi seluruh layar
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset('images/welcometittle.png'),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/page1');
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 50),
                  primary: Colors.black,
                  onPrimary: const Color.fromARGB(255, 252, 191, 101),
                ),
                child: const Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
