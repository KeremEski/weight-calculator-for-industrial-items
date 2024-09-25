import 'package:flutter/material.dart';
import 'package:paslanmaz_tezgah_com/service/weight_calculator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
// Sacın özgül ağırlığı 8000 kg/m3 yani 0.8 ile çarpılacak.

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController enController = TextEditingController();
  final TextEditingController boyController = TextEditingController();
  late WeightCalculator weightCalculator;
  late double screenHeight;
  late double screenWidth;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          color: const Color.fromARGB(255, 146, 146, 146),
          child: ElevatedButton(onPressed: () {
            weightCalculator = WeightCalculator(en: 70, boy: 160, yukseklik: 85, tablaSayisi: 1, ayakSayisi: 4, sacKalinligi: 1.2, sacKalitesi: "304", etrafiAcikmi: true, eviyeSayisi: 2);
            print("Toplam agirlik  ${weightCalculator.etrafiAcikTezgahHesaplama()}");
          }, child: const Text("Hesapla")),
        ),
      ),
    );
    
  }
  

}