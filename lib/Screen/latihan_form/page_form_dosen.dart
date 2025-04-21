import 'package:flutter/material.dart';
import 'package:tugas1/Screen/latihan_form/page_grid_view.dart';
import 'package:tugas1/Screen/latihan_form/page_list_view.dart';
import 'package:tugas1/Screen/latihan_form/page_register.dart';


class PageFormDosen extends StatefulWidget {
  const PageFormDosen({super.key});

  @override
  State<PageFormDosen> createState() => _PageFormDosen();
}

class _PageFormDosen extends State<PageFormDosen> with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Form Dosen', style: TextStyle(color: Colors.white)),
      ),
      body: TabBarView(controller: tabController, children: [PageRegister(), PageGridView(), PageListView()]),
      bottomNavigationBar: BottomAppBar(
        child: TabBar(controller: tabController,tabs: [
          Tab(text: 'Form Register', icon: Icon(Icons.input),),
          Tab(text: 'Grid View', icon: Icon(Icons.grid_on),),
          Tab(text: 'List View', icon: Icon(Icons.list),),
        ]),
      ),
    );
  }
}