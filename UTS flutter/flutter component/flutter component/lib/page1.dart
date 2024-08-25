import 'package:flutter/material.dart';
import 'result_page.dart';

void main() {
  runApp(const MaterialApp(
    home: BMICalculator(),
  ));
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double height = 100;
  int weight = 50;
  String gender = 'male';

  void selectGender(String selectedGender) {
    setState(() {
      gender = selectedGender;
    });
  }

  BoxDecoration getGenderBoxDecoration(String selectedGender) {
    return BoxDecoration(
      color: gender == selectedGender ? Colors.transparent : Colors.grey,
      border: Border.all(
        color: gender == selectedGender ? Colors.amberAccent : Colors.grey,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(15),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.amberAccent),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/wppmidrev.png'), // Ganti dengan path gambar latar belakang Anda
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    selectGender('male');
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: getGenderBoxDecoration('male'),
                    child: Center(
                      child: Icon(
                        Icons.male,
                        size: 40,
                        color: gender == 'male'
                            ? Colors.amberAccent
                            : const Color.fromARGB(255, 71, 71, 71),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    selectGender('female');
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: getGenderBoxDecoration('female'),
                    child: Center(
                      child: Icon(
                        Icons.female,
                        size: 40,
                        color: gender == 'female'
                            ? Colors.amberAccent
                            : const Color.fromARGB(255, 77, 77, 77),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                children: <Widget>[
                  const Text('Tinggi Badan',
                      style:
                          TextStyle(color: Colors.amberAccent, fontSize: 19)),
                  Text('${height.toStringAsFixed(1)} cm',
                      style:
                          TextStyle(color: Colors.amberAccent, fontSize: 19)),
                ],
              ),
            ),
            Slider(
              activeColor: Colors.amberAccent,
              inactiveColor: Colors.grey,
              thumbColor: Colors.amberAccent,
              value: height,
              min: 0,
              max: 300,
              onChanged: (newValue) {
                setState(() {
                  height = newValue;
                });
              },
            ),
            const Center(
              child: Text(
                'Berat Badan',
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.normal,
                    color: Colors.amberAccent),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      weight--;
                    });
                  },
                  backgroundColor: const Color.fromARGB(255, 37, 37, 37),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 3, color: Colors.amberAccent),
                      borderRadius: BorderRadius.circular(70)),
                  child: const Icon(Icons.remove),
                ),
                Text('$weight kg',
                    style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.normal,
                        color: Colors.amberAccent)),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      weight++;
                    });
                  },
                  backgroundColor: const Color.fromARGB(255, 37, 37, 37),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 3, color: Colors.amberAccent),
                      borderRadius: BorderRadius.circular(70)),
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                double bmi = weight / ((height / 100) * (height / 100));
                String resultRoute =
                    (gender == 'male') ? 'MaleResult' : 'FemaleResult';
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmi: bmi,
                      resultRoute: resultRoute,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                onPrimary: const Color.fromARGB(255, 252, 191, 10),
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.height * 0.17,
                height: 50,
                child: Center(
                  child: Text(
                    "Calculate",
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
    );
  }
}
