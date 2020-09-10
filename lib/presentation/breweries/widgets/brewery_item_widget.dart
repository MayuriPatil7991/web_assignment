import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BreweryItemWidget extends StatelessWidget {
  final String breweryName;
  final Function onTap;
  int selectedIndex;
  int currentIndex;

  BreweryItemWidget({this.breweryName,this.onTap,this.selectedIndex,this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
       onTap?.call();
      },
      child: Container(
          color: currentIndex == selectedIndex ? Color.fromRGBO(248,248,248, 1) : Colors.white,
          padding: EdgeInsets.only(top: 25,bottom: 25),
          constraints: BoxConstraints(
              minHeight: 120),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(12),
                child: Text(breweryName,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        color: currentIndex == selectedIndex ? Colors.pink : Color.fromRGBO(56 ,62, 59,1),
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          )),
    );
  }
}
