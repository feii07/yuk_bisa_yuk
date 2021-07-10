import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuk_bisa_yuk/DetailPetitionScreen.dart';
import 'package:yuk_bisa_yuk/models/Petisi.dart';

class PetitionScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Petisi"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            banner(),
            list()
            // Text('data')
          ],
        )
      )
    );
  }
  
  Container list(){
    return Container(
        child: 
          GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 3,
            crossAxisSpacing:  10,
            mainAxisSpacing: 5
          ),
          itemCount: petisiList.length, 
          itemBuilder: (context, index){
            final Petisi petisi = petisiList[index];
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
                        ),
                      )
                    ],
                  )
                );
          }
          ),
        
      );
  }

  Row banner() {
    return Row(
            children: [
               Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  height: 150,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 30),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Mulailah membantu dari hal kecil",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white
                            ),
                            softWrap: true
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 190),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("1 Tandatangan mu sangat berarti bagi kami",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.white70
                            ),
                            softWrap: true
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(fit: BoxFit.cover,
                    image: AssetImage('assets/images/backgroundpetisi.jpg'),
                    )
                  ),
                )
               )
            ],
          );
  }
}