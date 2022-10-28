import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';








class AllergiesPage extends StatefulWidget {
  static String id = 'allergies_page';
  @override
  State<AllergiesPage> createState() => _AllergiesPage();
}

class _AllergiesPage extends State<AllergiesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Container(
        //Adding a image to the background
        //decoration: ,
        child: Scaffold(
            backgroundColor: Colors.grey[850],
            body: SingleChildScrollView(
                child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Center(),
                        SizedBox(height: 20,),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 15), child:Text('Introduzca la siguiente información : ',textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontFamily: 'Inter', fontSize: 30,fontWeight: FontWeight.bold),  ),),
                        SizedBox(height: 40,),
                        _allergieTextField(),
                        SizedBox(height: 20,),
                        Divider(
                          color: Colors.red[900],
                          thickness:8,
                          indent: 1,
                          endIndent: 1,
                        ),
                        SizedBox(height: 20,),
                        _dateTextField(),
                        SizedBox(height: 20,),
                        Divider(
                          color: Colors.red[900],
                          thickness:8,
                          indent: 1,
                          endIndent: 1,
                        ),
                        SizedBox(height: 20,),
                        _notesTextField(),
                        //SizedBox(height: 20,),
                        //_speciesTextField(),
                        //SizedBox(height: 20,),
                        //_speciesTextField(),
                        Center(child:Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30) , child: Row( children: [Center(), _buttonSave(),SizedBox(width: 70,),_buttonCancel(),],))),
                      ],
                    )
                ))
        ),
      ),
    );
  }

  Widget _notesTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                cursorColor: Colors.red[900],
                style: TextStyle(color: Colors.white, fontFamily: 'Inter',),
                decoration: InputDecoration(
                    hoverColor: Colors.red[900],
                    focusColor: Colors.red[900],
                    hintStyle: TextStyle(color: Colors.white,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold),
                    labelStyle: TextStyle(color: Colors.white,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold),
                    labelText: 'Notas'
                ),
                onChanged: (value) {

                },
              )
          );
        }
    );
  }


  Widget _dateTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: DateTimeFormField(
              dateTextStyle: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                contentPadding:  EdgeInsets.symmetric(vertical: 29,horizontal: 8),
                hintStyle: TextStyle(color: Colors.white),
                errorStyle: TextStyle(color: Colors.redAccent),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2.0,
                    ),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(15.0),
                    )
                ),

                suffixIcon: Icon(Icons.event_note),
                labelText: 'Fecha',
              ),
              mode: DateTimeFieldPickerMode.date,
              autovalidateMode: AutovalidateMode.always,
              validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
              onDateSelected: (DateTime value) {
                print(value);
              },
            ),
          );
        }
    );
  }



  Widget _allergieTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                cursorColor: Colors.red[900],
                style: TextStyle(color: Colors.white, fontFamily: 'Inter',),
                decoration: InputDecoration(
                    hoverColor: Colors.red[900],
                    focusColor: Colors.red[900],
                    hintStyle: TextStyle(color: Colors.white,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold),
                    labelStyle: TextStyle(color: Colors.white,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold),
                    labelText: 'Alergia'
                ),
                onChanged: (value) {

                },
              )
          );
        }
    );
  }


  Widget _buttonSave() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return SizedBox(
              width: 150,
              height: 60,

              child:RaisedButton(
                child: Container(
                  child: Text('Guardar', style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold)

                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.red[900],
                elevation: 10.0,
              ));
        }
    );
  }



  Widget _buttonCancel() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return SizedBox(
              width: 150,
              height: 60,

              child:RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 0),
                child: Container(
                  child: Text('Cancelar', style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold)

                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.red[900],
                elevation: 10.0,
              ));
        }
    );
  }

}