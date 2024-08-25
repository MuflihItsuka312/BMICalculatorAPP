import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double bmi;
  final String resultRoute;

  const ResultPage({super.key, required this.bmi, required this.resultRoute});

  @override
  Widget build(BuildContext context) {
    String result = '';
    String message = '';
    if (resultRoute == 'FemaleResult') {
      if (bmi < 17) {
        result = 'Underweight';
        message = '"You need to eat more"';
      } else if (bmi > 17 && bmi < 23) {
        result = 'Normal';
        message = '"You have a normal body weight. Good job!"';
      } else if (bmi > 23 && bmi < 27) {
        result = 'Overweight';
        message = '"You need to exercise more"';
      } else {
        result = 'Obese';
        message = '"You need to exercise more and eat less"';
      }
    } else {
      if (bmi < 18) {
        result = 'Underweight';
        message = '"You need to eat more"';
      } else if (bmi > 18 && bmi < 25) {
        result = 'Normal';
        message = '"You have a normal body weight. Good job!"';
      } else if (bmi > 25 && bmi < 27) {
        result = 'Overweight';
        message = '"You have a normal body weight. Good job!"';
      } else {
        result = 'Obese';
        message = '"You need to exercise more and eat less"';
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'BMI Result',
          style: TextStyle(color: Color.fromARGB(255, 252, 191, 101)),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 0, bottom: 0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/wppmidrev.png'), // Ganti dengan path gambar latar belakang Anda
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Text(
                'Result',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 252, 191, 101),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 252, 191, 101),
                    width: 0.9,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '${bmi.toStringAsFixed(1)} kg/m2',
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 252, 191, 101),
                          ),
                        ),
                        Text(
                          result,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 252, 191, 101),
                          ),
                        ),
                        Text(
                          message,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(255, 252, 191, 101),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 252, 191, 101), backgroundColor: Colors.black,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.height * 0.7,
                  height: 50,
                  child: const Center(
                    child: Text(
                      "ReCalculate",
                      style: TextStyle(
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
