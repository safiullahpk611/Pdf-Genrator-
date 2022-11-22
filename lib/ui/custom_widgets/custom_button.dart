import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final buttonName,myICon,onPressed;
 CustomButton({this.buttonName,this.myICon,this.onPressed}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.brown,


      ),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(buttonName,style: TextStyle(fontSize: 16,color: Colors.white),)),
              InkWell(child: Icon(myICon,color:Colors. white,),
              onTap:onPressed ,
              )
            ],
          ),
      ),
    ),
    );
  }
}
