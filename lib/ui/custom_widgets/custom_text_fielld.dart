import 'package:flutter/material.dart';
class CustomTextFields extends StatelessWidget {
  final hintText,myIcon, readOnly,onTap,myController,maxLine,
  myValidator,
  onSubmit,
  keyBoardtype;
   CustomTextFields({this.hintText,this.myIcon,this.readOnly=false,this.onTap,this.myController,this.onSubmit,this.maxLine=1,this.myValidator,this.keyBoardtype}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height:65,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),

      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            TextFormField(
              onFieldSubmitted: onSubmit,

              keyboardType: keyBoardtype,
              autofocus: true,
              maxLines: maxLine,
              controller:myController ,
              validator: myValidator,
              decoration: InputDecoration(
                hintText: hintText,

                suffixIcon: myIcon,

              ),
              readOnly: readOnly,
              onTap: onTap,
            ),
            SizedBox(height: 15,),
          ],
        ),
      ),

    );
  }
}
