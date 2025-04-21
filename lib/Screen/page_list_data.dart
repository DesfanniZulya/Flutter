import 'package:flutter/material.dart';
import 'package:tugas1/Screen/page_get_data.dart';

class PageListData extends StatelessWidget {
  const PageListData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page List Data'),
        backgroundColor: Colors.purple.shade200,
      ),

       body: ListView.builder(
        itemCount: 10, // total item
         itemBuilder: (context, index){

          return ListTile(
            title: Text('Judul berita $index'),
            subtitle: Text('Detail berita $index'),
            onTap: (){
              //proses passing data
              //buat satu file untuk menampung data
              Navigator.push(context, MaterialPageRoute(builder:(contex)
              => PageGet(index)
              ));
            },
          );
         }),
    );
  }
}