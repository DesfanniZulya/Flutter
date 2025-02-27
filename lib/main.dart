import 'package:flutter/material.dart';
import 'package:tugas1/Screen/page_cache_image.dart';


import 'package:tugas1/Screen/page_dua.dart';
import 'package:tugas1/Screen/page_empat.dart';
import 'package:tugas1/Screen/page_gambar.dart';
import 'package:tugas1/Screen/page_satu.dart';
import 'package:tugas1/Screen/page_tiga.dart';
import 'package:tugas1/Screen/page_url_image.dart';void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const PageOne(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //appBar : properti dari sebuah widget
        //AppBar : widget

        title: Text(
          'Desfanni Zulya',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blue.shade300,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Selamat Datang di Flutter App pertama Mi2b"),
            MaterialButton(onPressed: (){
//Page Satu
              Navigator.push(context, MaterialPageRoute(builder: (context)
                  => PageSatu()
              ));
              },
              elevation: 18.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              //ini untuk pindah page
              color: Colors.blue,
              child: Text('Page 1',
                style: TextStyle(fontSize: 14, color: Colors.white ),
              ),
            ),
      //  Page Dua
            Padding(
              padding: const EdgeInsets.all(8.0),
            child: MaterialButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)
              => PageDua()
              ));
            },
              elevation: 18.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              //ini untuk pindah page
              color: Colors.yellow,
              child: Text('Page 2',
                style: TextStyle(fontSize: 14, color: Colors.black ),
              ),
             ),
            ),
            //Page Tiga
            MaterialButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)
              => PageTiga()
              ));
            },
              elevation: 18.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              //ini untuk pindah page
              color: Colors.red,
              child: Text('Page 3',
                style: TextStyle(fontSize: 14, color: Colors.white ),
              ),
            ),
//page empat
            MaterialButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)
              => PageEmpat()
              ));
            },
              elevation: 18.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              //ini untuk pindah page
              color: Colors.green,
              child: Text('Page 4',
                style: TextStyle(fontSize: 14, color: Colors.white ),
              ),
            ),

            MaterialButton(onPressed: () {
              // ini untuk pindah page ke Page 4
              Navigator.push(context, MaterialPageRoute(builder: (context)
              => PageGambar()
              ));
            },
              elevation: 18.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

              color: Colors.purple,
              child: Text('Page Gambar',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),

            MaterialButton(onPressed: () {
              // ini untuk pindah page ke Page 4
              Navigator.push(context, MaterialPageRoute(builder: (context)
              => PageUrlImage()
              ));
            },
              elevation: 18.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

              color: Colors.red,
              child: Text('Page Url',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),

            MaterialButton(onPressed: () {
              // ini untuk pindah page ke Page 4
              Navigator.push(context, MaterialPageRoute(builder: (context)
              => PageCacheImage()
              ));
            },
              elevation: 18.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

              color: Colors.orange,
              child: Text('Page Chace',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),

          ],
        ),

        //child :  cuma bisa nampung 1 widget
        //children : bisa nampung beberapa widget
      ),
    );
  }
}