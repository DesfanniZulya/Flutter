import 'package:flutter/material.dart';
import 'package:tugas1/Screen/latihan_form/page_detail_dosen.dart';

class PageGridView extends StatefulWidget {
  const PageGridView({super.key});

  @override
  State<PageGridView> createState() => _PageGridViewState();
}

class _PageGridViewState extends State<PageGridView> {
  List<Map<String,dynamic>> listDosen = [
    {"nidn":"1102900", "gambar":"gambar/berita1.jpeg", "nama": "Desfanni", "email":"andy@gmail.com"},
    {"nidn":"2000290", "gambar":"gambar/berita2.jpeg", "nama": "Zahira", "email":"andy@gmail.com"},
    {"nidn":"3028802", "gambar":"gambar/berita3.jpeg", "nama": "Naswa", "email":"andy@gmail.com"},
    {"nidn":"30992092", "gambar":"gambar/berita4.jpg", "nama": "Haura", "email":"andy@gmail.com"},

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8),
        child: GridView.builder(
          itemCount: listDosen.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.7),
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => DetailDosen(listDosen[index])));
              },
              child: Column(
                children: [
                  Expanded(
                      child: ClipRRect(
                        child: Image.asset(listDosen[index]["gambar"], fit: BoxFit.cover,),
                      )),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.black)
                    ),
                    child: Column(
                      children: [
                        Text(listDosen[index]["nidn"],style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        Text(listDosen[index]["nama"],style: TextStyle(fontSize: 12),),
                        Text(listDosen[index]["email"],style: TextStyle(fontSize: 12),),


                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}