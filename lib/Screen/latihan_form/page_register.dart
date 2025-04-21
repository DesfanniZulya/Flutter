import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tugas1/Screen/nav_bar//page_register.dart';

class PageRegister extends StatefulWidget {
  const PageRegister({super.key});

  @override
  State<PageRegister> createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {
  TextEditingController nipn = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController tgllahir = TextEditingController();
  TextEditingController alamat = TextEditingController();
  String? valPendidikan, valStatus, inputForm;
  final _formKey = GlobalKey<FormState>();

  Future selectDate() async {
    DateTime? pickDate = await showDatePicker(
        context: context,
        firstDate: DateTime(1950),
        lastDate: DateTime(2100),
        initialDate: DateTime.now());
    if (pickDate != null) {
      tgllahir.text = DateFormat("dd-MM-yyyy").format(pickDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text("Form Register", style: TextStyle(fontSize: 18)),
                ),
                SizedBox(height: 15),
                CostumeInput(
                    labelInput: "NIPN",
                    controller: nipn,
                    hintText: "12345678",
                    textInputType: TextInputType.number),
                SizedBox(height: 15),
                CostumeInput(
                    labelInput: "Nama",
                    controller: nama,
                    hintText: "Desfanni",
                    textInputType: TextInputType.name),
                SizedBox(height: 15),
                CostumeInput(
                  labelInput: "Tanggal Lahir",
                  controller: tgllahir,
                  hintText: "dd/mm/YYYY",
                  textInputType: TextInputType.datetime,
                  onTap: () {
                    selectDate();
                  },
                ),
                SizedBox(height: 15),
                Text("Pendidikan", style: TextStyle(fontSize: 18)),
                SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton(
                    value: valPendidikan,
                    underline: Container(),
                    isExpanded: true,
                    items: ["S1", "S2", "S3"].map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(e),
                        ),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        valPendidikan = val;
                      });
                    },
                  ),
                ),
                SizedBox(height: 15),
                Text("Status", style: TextStyle(fontSize: 18)),
                SizedBox(height: 5),
                Row(
                  children: [
                    CostumeRadio(
                      value: 'Menikah',
                      groupValue: valStatus.toString(),
                      onChange: (val) {
                        setState(() {
                          valStatus = val;
                        });
                      },
                    ),
                    CostumeRadio(
                      value: 'Single',
                      groupValue: valStatus.toString(),
                      onChange: (val) {
                        setState(() {
                          valStatus = val;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 15),
                CostumeInput(
                    labelInput: "Alamat",
                    controller: alamat,
                    hintText: "Jl. Contoh No. 123",
                    textInputType: TextInputType.text),
                SizedBox(height: 15),
                CostumeButton(
                    bgcolor: Colors.green,
                    labelButton: "Save",
                    onPressed: () {
                      setState(() {
                        if (_formKey.currentState!.validate()) {
                          if (valPendidikan != null && valStatus != null) {
                            inputForm = "NIPN : ${nipn.text}\n"
                                "Nama : ${nama.text}\n"
                                "Tanggal Lahir : ${tgllahir.text}\n"
                                "Pendidikan : ${valPendidikan.toString()}\n"
                                "Status : ${valStatus.toString()}\n"
                                "Alamat : ${alamat.text}";

                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                      inputForm.toString(),
                                    )));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        "Silahkan pilih pendidikan dan status")));
                          }
                        }
                      });
                    },
                    labelColor: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
