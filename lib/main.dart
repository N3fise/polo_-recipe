import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: "Yemek tarifi"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(widget.title),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(
              width: ekranGenisligi,
                child: Image.asset("resimler/polo.jpg")
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: ekranGenisligi/8,
                    child: TextButton(
                      onPressed: () {
                        print("beğenildi.");
                      },
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Yazı rengi
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.orange), // Buton rengi
                      ),
                      child: Yazi("Beğen", ekranGenisligi / 20),
                    ),
                  ),
                ),


                Expanded(
                  child: SizedBox(
                    height: ekranGenisligi/8,
                    child: TextButton(
                      onPressed: () {
                        print("yorumun için teşekkür ederiz.");
                      },
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange)
                        // Yazı rengi
                      ),
                      child: Yazi("Yorum yap", ekranGenisligi / 20),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(ekranYuksekligi/100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Polo",
                      style: TextStyle(
                          color: Colors.deepOrange,
                        fontSize: ekranGenisligi/20,
                        fontWeight: FontWeight.bold,
                      ),
                  ),
                  Row(
                    children: [
                      Yazi("hem et hem de tavuk ile yapılabilir.", ekranGenisligi/25),
                      Spacer(),
                      Yazi("8 Ağustos", ekranGenisligi/25),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(ekranYuksekligi/100),
              child: Yazi("Bir miktar zeytinyağı tavaya koyuyoruz ve ısınmasının ardından tavaya kemikli karışık erlerimizi koyup kavurmaya başlıyoruz. Daha sonra soğanlarımızı ekliyoruz, soğanlar biraz pembeleşince havuçları ekleyip kavuruyoruz. Havuçların iyice suyunu çıkarması yemeğe kat ve kat lezzet verdiği için, orta ateşte havuçlar yumuşayana kadar 10 dk kavuruyoruz. Daha sonra su, biraz kimyon ve tuz ekliyoruz ( damak zevkinize göre ayarlayın). Sarımsağı ekleyin ve 5-10 dk pişirin, sonra et sarımsakları çıkarıp yıkayıp hazırladığımız pirinci ekleyin, lezzetli olması için biraz kavurun ve üzerine çok geçmeyecek şekilde su ekleyin ( 1-2 su bardağı arası ). Ardından kenarda hazırladığımız et, sarımsak ve kuru üzümlerimizi pirincin üzerine ekliyoruz, tenceremizin kapağını kapatıp kısık ateşte pilavımızı dinlendiriyoruz. Servis ederken üzerine ekstra kimyon ekliyebiliriz, afiyet olsun :-)", ekranGenisligi/25),
            ),
          ],
        ),
      ),
    );
  }
}

class Yazi extends StatelessWidget {
  String icerik;
  double yaziBoyutu;

  Yazi(this.icerik, this.yaziBoyutu);

  @override
  Widget build(BuildContext context) {
    return Text(icerik,style: TextStyle(fontSize: yaziBoyutu),);
  }
}

