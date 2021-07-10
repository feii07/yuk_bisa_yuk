import 'package:flutter/cupertino.dart';
import 'package:yuk_bisa_yuk/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:yuk_bisa_yuk/PetitionScreen.dart';
import 'package:yuk_bisa_yuk/models/Petisi.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'DetailPetitionScreen.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: BuildAppbar(),
      body: SingleChildScrollView(
        child: Column(
        mainAxisSize: MainAxisSize.min,
          children:[
            Container(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SlideShow(),
                ),
              // child: SlideShow(),
            ),
            Menu(context),
            Banner(),
            Judul(),
            PetisiPopuler(),
          ]
        ),
      ),
    );
  }

  Widget PetisiPopuler() {
    return SizedBox(
      height: 250.0,
      child: ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: petisiList.length, itemBuilder: (context, index){
              final Petisi petisi = petisiList[index];
              if(petisi.populer == 1){
                return Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 5, 5),
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column (
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () { 
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPetitionScreen(petisi: petisi)),
                          );
                      },
                        child: Card( 
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Column(
                            children: [
                              Image.asset(petisi.gambar),
                              SizedBox(
                                height: 70.0,
                                child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(petisi.judul),
                              ),
                              )
                            ],
                          ),
                        )
                      )
                    ],
                  )
                );
              } else {
                return Container(
                  color: Colors.white,
                );
              }
            },
      )
    );
  }

  Row Judul() {
    return Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 0, 10),
                child: Text(
                  'Petisi Terpopuler',
                  style: TextStyle( 
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                )
            ],
          );
  }

  ImageSlideshow SlideShow() {
    return ImageSlideshow(
            initialPage: 0,
            children: [
              Image.asset(
              'assets/images/donation1.png',
              fit: BoxFit.cover,
              ),
              Image.asset(
              'assets/images/donation2.png',
              fit: BoxFit.cover,
              ),
              Image.asset(
              'assets/images/donation3.png',
              fit: BoxFit.cover
              )
            ],
            autoPlayInterval: 3000,
          );
  }

  AppBar BuildAppbar() {
    return AppBar(
      toolbarHeight: 60,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Image.asset("assets/icon/logo.png"),
    );
  }

  Widget Menu(context){
     return SizedBox(
      height: 100.0,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column (
                children: [
                  Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Card( 
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)
                      ),
                      child: new InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PetitionScreen()),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Image.asset('assets/icon/petition.png',
                                  width: 50,
                                ),
                          )
                      )
                    ),
                  ),
                  Center(
                    child: Text("Petisi",
                      style: TextStyle(
                      fontSize: 10.0,
                      )
                    ),
                  )
                ],
              )
            ),
            Expanded(
            flex: 3,
            child: Column (
                children: [
                  Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Card( 
                      color: Color.fromRGBO(224,244,244,0),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)
                      ),
                      child: new InkWell(
                        onTap: (){
                          showToastMessage('Maaf, fitur Donasi masih belum rilis');
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Image.asset('assets/icon/donation.png',
                                  width: 50,
                                ),
                          )
                      )
                    ),
                  ),
                  Center(
                    child: Text("Donasi",
                      style: TextStyle(
                      fontSize: 10.0,
                      )
                    ),
                  )
                ],
              )
            ),
            Expanded(
            flex: 3,
            child: Column (
                children: [
                  Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Card( 
                      color: Color.fromRGBO(224,244,244,0),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)
                      ),
                      child: new InkWell(
                        onTap: (){
                          showToastMessage('Maaf, fitur Crowdfunding masih belum rilis');
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Image.asset('assets/icon/crowdfunding.png',
                                  width: 50,
                                ),
                          )
                      )
                    ),
                  ),
                  Center(
                    child: Text("Crowdfunding",
                      style: TextStyle(
                      fontSize: 10.0,
                      )
                    ),
                  )
                ],
              )
            ),
            Expanded(
            flex: 3,
            child: Column (
                children: [
                  Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Card( 
                      color: Color.fromRGBO(224,244,244,0),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)
                      ),
                      child: new InkWell(
                        onTap: (){
                          showToastMessage('Maaf, fitur Vounteer masih belum rilis');
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Image.asset('assets/icon/volunteer.png',
                                  width: 50,
                                ),
                          )
                      )
                    ),
                  ),
                  Center(
                    child: Text("Volunteer",
                      style: TextStyle(
                      fontSize: 10.0,
                      )
                    ),
                  )
                ],
              )
            ),
        ],
      ),
    );
  }

    Row Banner() {
    return Row(
            children: [
               Expanded(
                flex: 3,
                child: Container(
                  height: 70,
                  margin: EdgeInsets.fromLTRB(2, 15, 2, 0),
                  child: Padding(
                    padding: EdgeInsets.only(left: 180, right: 40),
                    child: Align(
                    alignment: Alignment.center,
                    child: Text(" Yuk mulai membantu sesama dengan mengisi petisi",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                    softWrap: true
                  ),
                  ),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(fit: BoxFit.cover,
                    image: AssetImage('assets/images/background.jpg'),
                    )
                  ),
                )
               )
            ],
          );
  }
  
  //run with flutter run --no-sound-null-safety 
    void showToastMessage(String message){
     Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}