import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PageRegister extends StatefulWidget {
  const PageRegister({super.key});

  @override
  State<PageRegister> createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {
  TextEditingController fullname = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController tgllahir = TextEditingController();
  TextEditingController password = TextEditingController();
  String? valAgama, valJK,inputForm;
  final _formKey = GlobalKey<FormState>();

  Future selectDate() async{
    DateTime? pickDate = await showDatePicker(
        context: context,
        firstDate: DateTime(1950),
        lastDate: DateTime(2100),
        initialDate: DateTime.now()

    );
    if(pickDate!=null){
      tgllahir.text = DateFormat("dd-MM-yyyy").format(pickDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text("Form Register",style: TextStyle(fontSize: 18)),
                ),
                SizedBox(height: 15,),
                CostumeInput(
                    labelInput: "Full Name",
                    controller: fullname,
                    hintText: "Desfanni Zulya",
                    textInputType: TextInputType.name),
                SizedBox(height: 15,),
                CostumeInput(
                    labelInput: "Username",
                    controller: username,
                    hintText: "desfanni",
                    textInputType: TextInputType.name),
                SizedBox(height: 15,),
                CostumeInput(
                    labelInput: "Email",
                    controller: email,
                    hintText: "desfannizulya@gmail.com",
                    textInputType: TextInputType.emailAddress),
                SizedBox(height: 15,),
                CostumeInput(
                  labelInput: "Tanggal Lahir",
                  controller: tgllahir,
                  hintText: "dd/mm/YYYY",
                  textInputType: TextInputType.datetime,
                  onTap: (){
                    selectDate();
                  },
                ),
                SizedBox(height: 15,),
                CostumeInput(
                  labelInput: "Password",
                  controller: password,
                  hintText: "",
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                SizedBox(height: 15,),
                Text("Pilih Agama",style: TextStyle(fontSize: 18),),
                SizedBox(height: 5,),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1,color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton(
                    value: valAgama,
                    underline: Container(),
                    isExpanded: true,
                    items: [
                      "Islam",
                      "Kristen Katolik",
                      "Hindu",
                      "Budha",
                      "Konghucu",
                    ].map((e){
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
                        valAgama = val;
                      });
                    },

                  ),
                ),
                SizedBox(height: 15,),
                Text("Jenis Kelamin",style: TextStyle(fontSize: 18),),
                SizedBox(height: 5,),
                Row(
                  children: [
                    CostumeRadio(value: 'Pria', groupValue: valJK.toString(), onChange: (val){setState(() {
                      valJK = val;
                    });
                    },
                    ),

                    CostumeRadio(value: 'Wanita', groupValue: valJK.toString(), onChange: (val){setState(() {
                      valJK = val;
                    });
                    },
                    ),

                  ],
                ),
                SizedBox(height: 15,),
                CostumeButton(
                    bgcolor: Colors.green,
                    labelButton: "Save",
                    onPressed: (){
                      setState(() {
                        //cek validasi input
                        if(_formKey.currentState!.validate()){
                          // if(valJK)
                          if (valAgama != null && valJK != null){
                            //ambil input
                            inputForm = "Fullname : ${fullname.text}\n"
                                "Username : ${username.text}\n"
                                "Email : ${email.text}\n"
                                "Tanggal Lahir : ${tgllahir.text}\n"
                                "Agama : ${valAgama.toString()}\n"
                                "Jenis Kelamin : ${valJK.toString()}";

                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                      inputForm.toString(),
                                    )
                                )
                            );

                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(
                                "Silahkan pilih agama dan jenis kelamin"
                              ))
                            );
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

class CostumeInput extends StatelessWidget {
  final String labelInput;
  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final bool obscureText;
  final VoidCallback? onTap;

  const CostumeInput({super.key,
    required this.labelInput,
    required this.controller,
    required this.hintText,
    required this.textInputType,
    this.obscureText = false,
    this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelInput,style: TextStyle(fontSize: 18),),
        SizedBox(height: 5,),
        TextFormField(
          controller: controller, //Mendapatkan Input dari User
          validator: (val){
            return val!.isEmpty ? "Input tidak boleh kosong" : null;
          },
          decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
          ),
          keyboardType: textInputType,
          obscureText: obscureText ,
          onTap: (){
            onTap?.call();
            //event ketika klik input
          },
        )
      ],
    );
  }
}

class CostumeRadio extends StatelessWidget {
  final String value;
  final String groupValue;
  final ValueChanged<String> onChange;
  const CostumeRadio(
      {
        super.key,
        required this.value,
        required this.groupValue,
        required this.onChange
      });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child:
      RadioListTile(
        value: value,
        groupValue: groupValue,
        onChanged: (val){
          if(val != null){
            onChange(val);
          }
        },
        title: Text(value),
      ),

    )
    ;
  }
}

class CostumeButton extends StatelessWidget {
  final Color bgcolor;
  final   String labelButton;
  final VoidCallback onPressed;
  final Color labelColor;

  const CostumeButton({
    super.key,
    required this.bgcolor,
    required this.labelButton, required this.onPressed,
    required this.labelColor, });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            backgroundColor: bgcolor
        ) ,
        onPressed: () {
          onPressed.call();
        },
        child: Text(labelButton, style: TextStyle(color: labelColor),)
    );
  }
}