import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:kur_tete/theQuiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kur Tete?',
      home: MyHomePage(title: 'Kur Tete?'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  //File file = File("/data/user/0/yo.apps.com.kur_tete/cache/file_picker/IMG-20210410-WA0002.jpg");
  File file1, file2 ;
  File audioFile;
  String audioPath;
  AudioPlayer _audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();
  List<theQuiz> quizes = [];
  bool canTap=false;
//StreamSubscription _playerCompleteSubscription;

  @override
  void initState() {
    /* _playerCompleteSubscription = _audioPlayer.onPlayerCompletion.listen((event) {
          //setState(() { });
      print("xxxxxxxxxxxxxxx");
   });*/

    quizes.add(theQuiz("/data/user/0/yo.apps.com.kur_tete/cache/file_picker/FB_IMG_16180856024227541.jpg", "/data/user/0/yo.apps.com.kur_tete/cache/file_picker/IMG_20210410_231718~2.jpg", "/data/user/0/yo.apps.com.kur_tete/cache/file_picker/mama.mp3"));
    quizes.add(theQuiz("/data/user/0/yo.apps.com.kur_tete/cache/file_picker/IMG_20210410_231553.jpg" , "/data/user/0/yo.apps.com.kur_tete/cache/file_picker/IMG_20210410_230337.jpg", "/data/user/0/yo.apps.com.kur_tete/cache/file_picker/ducky.mp3" ));
    quizes.add(theQuiz("/data/user/0/yo.apps.com.kur_tete/cache/file_picker/IMG_20210411_095346~2.jpg" , "/data/user/0/yo.apps.com.kur_tete/cache/file_picker/IMG_20210411_095431~2.jpg", "/data/user/0/yo.apps.com.kur_tete/cache/file_picker/baby.mp3"));
    quizes.add(theQuiz("/data/user/0/yo.apps.com.kur_tete/cache/file_picker/IMG_20210412_121029~2.jpg" , "/data/user/0/yo.apps.com.kur_tete/cache/file_picker/IMG_20210412_121127~2.jpg", "/data/user/0/yo.apps.com.kur_tete/cache/file_picker/batukai.mp3" ));
    quizes.add(theQuiz("/data/user/0/yo.apps.com.kur_tete/cache/file_picker/IMG_20210412_122039~2.jpg" , "/data/user/0/yo.apps.com.kur_tete/cache/file_picker/IMG_20210412_121254~2.jpg", "/data/user/0/yo.apps.com.kur_tete/cache/file_picker/birdy.mp3" ));
    quizes.add(theQuiz("/data/user/0/yo.apps.com.kur_tete/cache/file_picker/IMG_20210412_120734~2.jpg" , "/data/user/0/yo.apps.com.kur_tete/cache/file_picker/FB_IMG_16182364870404188~2.jpg", "/data/user/0/yo.apps.com.kur_tete/cache/file_picker/emilia.mp3"));
    quizes.add(theQuiz("/data/user/0/yo.apps.com.kur_tete/cache/file_picker/IMG_20210412_120944~2.jpg" , "/data/user/0/yo.apps.com.kur_tete/cache/file_picker/IMG_20210412_120734~2.jpg", "/data/user/0/yo.apps.com.kur_tete/cache/file_picker/vandens.mp3" ));
    quizes.add(theQuiz("/data/user/0/yo.apps.com.kur_tete/cache/file_picker/IMG_20210412_120615~2.jpg" , "/data/user/0/yo.apps.com.kur_tete/cache/file_picker/IMG_20210412_120544~2.jpg", "/data/user/0/yo.apps.com.kur_tete/cache/file_picker/star.mp3" ));
    quizes.add(theQuiz("/data/user/0/yo.apps.com.kur_tete/cache/file_picker/IMG_20210412_120515~2.jpg" , "/data/user/0/yo.apps.com.kur_tete/cache/file_picker/IMG_20210412_120446~2.jpg", "/data/user/0/yo.apps.com.kur_tete/cache/file_picker/ball.mp3" ));
    quizes.add(theQuiz("/data/user/0/yo.apps.com.kur_tete/cache/file_picker/IMG_20210412_120343~2.jpg" , "/data/user/0/yo.apps.com.kur_tete/cache/file_picker/IMG_20210412_120145~2.jpg", "/data/user/0/yo.apps.com.kur_tete/cache/file_picker/bubu.mp3" ));
    quizes.add(theQuiz("/data/user/0/yo.apps.com.kur_tete/cache/file_picker/IMG_20210412_120312~2.jpg" , "/data/user/0/yo.apps.com.kur_tete/cache/file_picker/IMG_20210412_120343~2.jpg", "/data/user/0/yo.apps.com.kur_tete/cache/file_picker/foxy.mp3" ));

    setUpVariables();
  }

  Future<void> setUpVariables() async {
    if(counter>10){counter=0;}
    file1 = File(quizes[counter].img1);
    file2 = File(quizes[counter].img2);
    audioPath = quizes[counter].audioQ;

    Future.delayed(const Duration(milliseconds: 1000), () async {
      print("clap endede xxxx");
      await _audioPlayer.play(audioPath);
    });

  }



  @override
  Widget build(BuildContext context) {
    canTap=true;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    child: Image.file(file1),
                  onTap: () async {
                      if(!canTap){return;}

                      print("onTap()....");
                    if(counter%2==0){
                      canTap=false;
                      quizes[counter].answer = true;
                      await audioCache.play('clap.mp3');
                        Future.delayed(const Duration(milliseconds: 2500), () {
                          print("clap endede xxxx");
                          setState(() {
                              counter++;
                              setUpVariables();
                          });
                        });
                    }
                    else{
                      await audioCache.play('buzz.mp3');
                    }
                  },
                )
              ),
            ),

            Container(
              color: Colors.blue,
              height: 25,
            ),

            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    child: Image.file(file2),
                  onTap: () async {
                    if(!canTap){return;}

                    print("whooohoo");
                    if(counter%2 != 0){
                      canTap=false;
                      quizes[counter].answer = true;
                      await audioCache.play('clap.mp3');
                        Future.delayed(const Duration(milliseconds: 2500), () {
                          print("clap endede xxxx");
                          setState(() {
                            counter++;
                            setUpVariables();
                          });
                        });
                    }
                    else{
                      await audioCache.play('buzz.mp3');
                    }
                  },
                ),
              ),
            ),


           /* Row(
              children: [
                ElevatedButton(
                    onPressed: () async {
                      FilePickerResult result = await FilePicker.platform.pickFiles(
                        type: FileType.custom, allowedExtensions: ['jpg', 'png'],   );

                      if(result != null) {
                        setState(() {
                          file = File(result.files.single.path);
                        });
                        print("path: ${result.files.single.path}");
                      } else {
                        print("blah blah blah...");
                      }
                },
                    child: Text("IMAGE")
                ),
                ElevatedButton(
                    onPressed: () async {
                      FilePickerResult result = await FilePicker.platform.pickFiles(
                        type: FileType.custom, allowedExtensions: ['mp3','wav'],);

                      if(result != null) {
                          audioFile = File(result.files.single.path);
                        print("path: ${result.files.single.path}");

                        await _audioPlayer.play(audioFile.path);
                      } else {
                        print("blah blah blah...");
                      }
                    },
                    child: Text("IMAGE")
                ),
                ElevatedButton(
                    onPressed: () async {
                    await audioCache.play('clap.mp3');
                    Future.delayed(const Duration(milliseconds: 2500), () {
                      print("clap endede xxxx");
                      //setState(() {});

                    });

                },
                    child: Text('CLAP'))
              ],
            ),
            Container(
              height: 300,
                child: Image.file(file)
            ),*/

          ],
        ),
      ),
    );
  }
}
