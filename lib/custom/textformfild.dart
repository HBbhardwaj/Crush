// import 'package:flutter/material.dart';
//
// class CommonStyle{
//   static InputDecoration textFieldStyle({
//     String labelTextStr="",
//     String hintTextStr="",
//     Icons icons,
//   })
//   {return InputDecoration(
//     contentPadding: EdgeInsets.all(12),
//     prefixIcon:Icon(
//       Icons.lock,
//       color: Color(0xff027056),
//     ),
//     labelText: labelTextStr,
//     hintText:hintTextStr,
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//     ),
//   );}
// }


import 'package:flutter/material.dart';

class EditTextUtils {
  TextFormField getCustomEditTextArea(
      {
        String hintValue = "",
        bool? validation,
        TextEditingController? controller,
        TextInputType keyboardType = TextInputType.text,
        TextStyle? textStyle,
        Widget ?prefixicon,
        Widget? suffixIcon,
        // Icon?icons,

        String? validationErrorMsg}) {
    TextFormField textFormField = TextFormField(
      keyboardType: keyboardType,
      style: textStyle,
      controller: controller,

      decoration: InputDecoration(
        filled: true,
      //  fillColor: Color(0xffAFB1B2),
        //fillColor: Color(0xffD4F8EF),
          prefixIcon:prefixicon,
        suffixIcon:  suffixIcon,
        isCollapsed: true,
        contentPadding: EdgeInsets.all(13),

          hintText: hintValue,
        hintStyle: TextStyle(fontSize: 15.0,
            //color: Color(0xff027056)
            color:  Color(0xffAFB1B2)
        ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
             // color: Color(0xffDBF5EF)
              color:  Color(0xffAFB1B2)
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
             // color: Color(0xffDBF5EF)
              color:  Color(0xffAFB1B2)
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
             // color: Color(0xffDBF5EF)
              color:  Color(0xffAFB1B2)
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
    return textFormField;
  }
}



class ButtonClass extends StatelessWidget {
 String ?texxt;
  String ?buum;
  Function?function;
  Color?color;
 //add this
 ButtonClass(this.texxt, this.buum,this.function,this.color); // change this

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(top: 75),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(5),
        color: color,
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
         onPressed:(){
            print(buum);
            function;
         },// add this here
          child: Text(texxt!,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20)
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
//==============for alll==========

class CustomScaffold extends StatelessWidget {
  Widget?widget;
  PreferredSizeWidget?appbarWidget;
  CustomScaffold(this.appbarWidget,this.widget);
  // change this

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: widget,
          appBar: appbarWidget,
        ),
      ),
    );
  }
}
//=================for account create======================

class RadioButton extends StatelessWidget {
  String?string;
 RadioButton(this.string);
  // change this

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(string!,style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    );
  }
}

class CreateaccountText extends StatelessWidget {
  String?string;
  CreateaccountText(this.string);
  // change this

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(string!+" (required)",style: TextStyle(
        fontSize: 12,
      ),
      ),
    );
  }
}




class CATextField  {
  TextFormField getCustomEditTextArea(
      {
        String hintValue = "",
        TextEditingController? controller,
        TextInputType keyboardType = TextInputType.text,
        TextStyle? textStyle,

        // Icon?icons,

        String? validationErrorMsg}) {
    TextFormField textFormField = TextFormField(
      keyboardType: keyboardType,
      style: textStyle,
      controller: controller,

      decoration: InputDecoration(
        filled: true,
        //  fillColor: Color(0xffAFB1B2),
        //fillColor: Color(0xffD4F8EF),

        isCollapsed: true,
        contentPadding: EdgeInsets.all(11),

        hintText: hintValue,
        hintStyle: TextStyle(fontSize: 15.0,
            //color: Color(0xff027056)
            color:  Color(0xffAFB1B2)
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(3.0)),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            // color: Color(0xffDBF5EF)
              color:  Color(0xffAFB1B2)
          ),
          borderRadius: BorderRadius.circular(3.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            // color: Color(0xffDBF5EF)
              color:  Color(0xffAFB1B2)
          ),
          borderRadius: BorderRadius.circular(3.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            // color: Color(0xffDBF5EF)
              color:  Color(0xffAFB1B2)
          ),
          borderRadius: BorderRadius.circular(3.0),
        ),
      ),
    );
    return textFormField;
  }
}
//This field can be seen by:
class CAProfileText extends StatelessWidget {
  // String?string;
  // CAProfileText(this.string);
  // change this

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(" This field can be seen by:",style: TextStyle(
        fontSize: 12,
      ),
      ),
    );
  }
}

class CAProfileHeadingText extends StatelessWidget {
  String?string;
  CAProfileHeadingText(this.string);
  // change this

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top: 20,bottom: 10),
      child: Text(string!,style: TextStyle(
        fontSize: 12,
      ),
      ),
    );
  }
}
//=============dropdown list=============

