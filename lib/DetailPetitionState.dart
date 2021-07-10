import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yuk_bisa_yuk/models/Petisi.dart';

import 'DetailPetitionScreen.dart';

class DetailPetitionState extends State<DetailPetitionScreen>{
  Petisi petisi;
  int _terkumpul = 0;

  DetailPetitionState({required this.petisi});

  //controller
  TextEditingController nama = new TextEditingController();

  void _incrementCounter() async {
    setState((){
      if(petisi.terkumpul < petisi.target){
        petisi.terkumpul = petisi.terkumpul + 1;
        _terkumpul = petisi.terkumpul;

        //membuat list partisipan
        petisi.partisipan.add(nama.text);

        //show success modal
        _showFullModalSuccess(context);
      }else{
        //show fail modal
        _showFullModalFailed(context);
      }
    });
  }

  void _syncPetisiTerkumpul(){
    setState(() {
      _terkumpul = petisi.terkumpul;
    });
  }

  @override
  Widget build(BuildContext context) {
    _syncPetisiTerkumpul();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(petisi.judul),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            showImage(),
            detail(),
            desc(),
            if (petisi.terkumpul == 0) 
              Container ( child: Text('Belum Ada Partisipan')) 
            else listPartisipan(petisi.partisipan),
            buttonIkuti(context),
          ],
        )
      )
    );
  }
  
  Container showImage() {
    return Container(
      child: Image.asset(
        petisi.gambar,
        fit: BoxFit.cover,
        height: 200, // set your height
        width: double.infinity, // and width here
      ),
    );
 }

 Container detail(){
   return Container(
     margin: EdgeInsets.all(2),
     child: Column(
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: Text(
              petisi.judul,
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Card(
                    elevation: 10,
                    child: Padding (
                      padding: EdgeInsets.all(5),
                      child: Column(
                          children: [
                            Image.asset('assets/icon/sign.png',
                            height: 50,
                            ),
                            Text('Terkumpul : $_terkumpul')
                          ],
                        ),
                      )
                  )
                ),
                Expanded(
                flex: 5,
                child: Card(
                    elevation: 10,
                    child: Padding (
                      padding: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Image.asset('assets/icon/target.png',
                          height: 50,
                          ),
                          Text('Target : '+ petisi.target.toString())
                        ],
                      ),
                    )
                  )
                )
            ],
          )
      ]
    ),
   );
 }

 Container desc(){
   return Container(
     margin: EdgeInsets.all(2),
     child: Padding(
       padding: EdgeInsets.all(20),
       child: Text(
        petisi.deskripsi,
        softWrap: true,
        ),
       )
   );
 }

 Container buttonIkuti(context) {
  return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 30), // double.infinity is the width and 30 is the height
          ),
          onPressed: () {
            _showBottomModal(context);
          },
          child: Text('Ikut Partisipasi'),
        ),
      ),
    );
  }
  
  _showBottomModal(context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (builder) {
        return new Container(
          height: 180,
          color: Colors.transparent,
          child: new Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(10.0),
                topRight: const Radius.circular(10.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0, // has the effect of softening the shadow
                  spreadRadius: 0.0, // has the effect of extending the shadow
                )
              ],
            ),
            alignment: Alignment.topLeft,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 20),
                      child: Text(
                        "Ikut Partisipasi",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Colors.black87),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: const Color(0xfff8f8f8),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: nama,
                        decoration: new InputDecoration(
                          hintText: "Masukan Nama Lengkap",
                          labelText: "Nama Lengkap",
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 30), // double.infinity is the width and 30 is the height
                        ),
                        onPressed: () {
                          _incrementCounter();
                        },
                        child: Text('Partisipasi Sekarang!'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      });
  }

  _showFullModalSuccess(context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false, // should dialog be dismissed when tapped outside
      barrierLabel: "Success", // label for barrier
      transitionDuration: Duration(milliseconds: 500), // how long it takes to popup dialog after button click
      pageBuilder: (_, __, ___) { // your widget implementation 
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ), 
              onPressed: (){
                Navigator.pop(context);
              }
            ),
            title: Text(
              "Success",
              style: TextStyle(color: Colors.black87, fontFamily: 'Overpass', fontSize: 20),
            ),
            elevation: 0.0
          ),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Image.asset(
                      "assets/icon/checked.png",
                      height: 200,
                      ),
                    )
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text("SUKSES!",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800
                        ),
                      ),
                    ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(80, 2, 80, 2),
                    child: Text("Terimakasih " + nama.text + " Atas Dukunganmu Untuk Petisi Ini!",
                          textAlign: TextAlign.center,
                          softWrap: true,
                      ),
                    ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(50, 30), 
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Kembali'),
                      ),
                    ),
                )
                
              ],
            ),
          ),
        );
      },
    );
  }

  _showFullModalFailed(context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false, // should dialog be dismissed when tapped outside
      barrierLabel: "Failed", // label for barrier
      transitionDuration: Duration(milliseconds: 500), // how long it takes to popup dialog after button click
      pageBuilder: (_, __, ___) { // your widget implementation 
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ), 
              onPressed: (){
                Navigator.pop(context);
              }
            ),
            title: Text(
              "Failed",
              style: TextStyle(color: Colors.black87, fontFamily: 'Overpass', fontSize: 20),
            ),
            elevation: 0.0
          ),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Image.asset(
                      "assets/icon/cancel.png",
                      height: 200,
                      ),
                    )
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text("GAGAL!",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800
                        ),
                      ),
                    ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(80, 2, 80, 2),
                    child: Text("Maaf " + nama.text + ", kamu belum bisa ikut serta dalam petisi ini. Petisi ini sudah melebihi target. ",
                          textAlign: TextAlign.center,
                          softWrap: true,
                      ),
                    ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(50, 30), 
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Kembali'),
                      ),
                    ),
                )
                
              ],
            ),
          ),
        );
      },
    );
  }
    Widget listPartisipan(List<String> list)
  {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Partisipan : ',
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
            ),
          Row(children: list.map((item) => new Text(item + ' ,')).toList())
        ],
      )
    );
  }
}