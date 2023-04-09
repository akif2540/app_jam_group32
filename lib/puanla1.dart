import 'package:flutter/material.dart';
import 'puanla2.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text("Eğitimi Puanla"),),
            backgroundColor: Colors.blue[700],
            body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: SoruSayfasi(),
                ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {


  List <Widget> secimler=[kYanlisIcon,kYanlisIcon,kYanlisIcon,kYanlisIcon,kYanlisIcon];
  List <String> sorular=[
    'Eğitim videosunu beğendin mi?',
    'Eğitmenin anlatımından memnun kaldın mı?',
    'Eğitimin içeriğini beğendin mi?',
    'Eğitimin sorularını beğendin mi?',
    'Motivasyonun arttı mı ?',
    'Teşekkürler.....)'
  ];
  int soruIndex=0;
  int soruIndex1=0;
  int soruIndex2=0;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                sorular[soruIndex],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          spacing:15, // emojiler arası boşluk
          children:secimler,
        ),
        Wrap(
          children: [
          ElevatedButton(onPressed: (){
            Text("4");


          }, child: Text("Eğitime Puanım")),


          ],
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),

                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.red[400]),
                              padding: MaterialStateProperty.all(EdgeInsets.all(12),)
                          ),
                          child: const Icon(
                            Icons.thumb_down,
                            size: 30.0,
                          ),
                          onPressed: () {
                            setState(() {
                              soruIndex++;
                              soruIndex1++;
                              //secimler.add(kYanlisIcon);

                            });



                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child:ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.green[400]),
                              padding: MaterialStateProperty.all(EdgeInsets.all(12),)
                          ),
                          child: Icon(Icons.thumb_up, size: 30.0),
                          onPressed: () {
                            setState(() {
                              secimler[soruIndex2]=kDogruIconu;
                              soruIndex++;
                              soruIndex2++;

                            });

                          },
                        ))),
              ])),
        )
      ],
    );
  }
}