import 'package:flutter/material.dart';
import 'package:giris/puanla1.dart';
import "package:youtube_player_flutter/youtube_player_flutter.dart";

Future<void> main() async {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  static const customSwatch = MaterialColor(0xFF356EDE, <int, Color>{

    50: Color(0xFFFFEBEE),
    100: Color(0xFFFFCDD2),
    200: Color(0xFF99A489),
    300: Color(0xFFE57373),
    400: Color(0xFF356EDE),
    500: Color(0xFF528CF8),
    600: Color(0xFF1C5287),
    700: Color(0xFF1C5287),
    800: Color(0xFF356EDE),
    900: Color(0xFF356EDE),


  });

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: customSwatch,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  YoutubePlayerController? _controller;
   String girilenMetin = "";

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId:
          'Qv-3QWCbD1s', //https://www.youtube.com/watch?v=Qv-3QWCbD1s
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
        isLive: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller!,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.red,
        progressColors: const ProgressBarColors(
          playedColor: Colors.red,
          handleColor: Colors.redAccent,
        ),
      ),
      builder: (context, player) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const Text("Oyun ve Uygulama Akademisi Flutter Eğitimi"),
            ),
            body: Column(
              children: [
                player,
                Text(""),
                Text(""),
                Padding(
                  padding:const EdgeInsets.only(left: 50, right: 20, bottom: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: "Yorum ekleyin...",
                    ),
                    onSubmitted: ( String anlikVeri) {
                      debugPrint("On Submit :$anlikVeri");
                      girilenMetin = anlikVeri;
                    },
                  ),
                ),

ElevatedButton(onPressed:  (){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>BilgiTesti()));

} , child: Text("Eğitimi Puanla")),

              ],
            ));
      },
    );
  }
}

class SecondPage {
}




