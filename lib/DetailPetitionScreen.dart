
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuk_bisa_yuk/DetailPetitionState.dart';
import 'package:yuk_bisa_yuk/models/Petisi.dart';

class DetailPetitionScreen extends StatefulWidget{
  Petisi petisi;

  DetailPetitionScreen({required this.petisi});

  @override
  State<StatefulWidget> createState() {
    return DetailPetitionState( petisi: petisi);
  }
}