import 'package:flutter/material.dart';
class TermsAndservice extends StatefulWidget {
  const TermsAndservice({ Key? key }) : super(key: key);

  @override
  State<TermsAndservice> createState() => _TermsAndserviceState();
}

class _TermsAndserviceState extends State<TermsAndservice> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Terms of service"),
          backgroundColor: Color(0xFFFFff9f04),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        color: Colors.white,
                        border: Border.all(color: Color(0xffffC4C4C4))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         const Padding(
                          padding: EdgeInsets.all(8.0),
                          child:  Text(
                            'Please read these terms of service and usethem carefully. These Terms govern and apply to your access and use of www.crushonmecrushonyou.com and chatting and postingservices available via the crush on me crush on you site and any content means information',
                            style: TextStyle(
                              height: 1.6,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              
                Padding(
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [   
                   const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                  child: Text(
                    'Leave a reply',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                
                  Padding(
                    padding: EdgeInsets.only(left: 10,top: 10),
                    child: RichText(
                      text: const TextSpan(
                        text: 'Your email address will not be published. Required fields are marked',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontStyle: FontStyle.italic
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' *',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:Colors.yellow
                                )),
                        ],
                      ),
                    ),
                  ),
                 Container(
                  margin: EdgeInsets.only(left: 2,right: 2,top: 10,bottom: 10),
                  padding: EdgeInsets.only(left:10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xffffC4C4C4)),
                   // set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(2.0)), // set rounded corner radius
                  ),
                  child: const TextField(
                    maxLines: 8,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'LoremIpsum@gmail.com',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10,top: 10),
                    child: RichText(
                      text: const TextSpan(
                        text: 'Name',
                        style: TextStyle(
                          color: Colors.black
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' *',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:Colors.yellow
                                )),
                        ],
                      ),
                    ),
                  ),
                 Container(
                 margin: EdgeInsets.only(left: 2,right: 2,top: 10,bottom: 10),
                  padding: EdgeInsets.only(left:10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xffffC4C4C4)), // set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(2.0)), // set rounded corner radius
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'LoremIpsum@gmail.com',
                      border: InputBorder.none,
                    ),
                  ),
                ),
               
                Padding(
                    padding: EdgeInsets.only(left: 10,top: 10),
                    child: RichText(
                      text: const TextSpan(
                        text: 'Email',
                        style: TextStyle(
                          color: Colors.black
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' *',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:Colors.yellow
                                )),
                        ],
                      ),
                    ),
                  ),
                Container(
                  margin: EdgeInsets.only(left: 2,right: 2,top: 10,bottom: 10),
                  padding: EdgeInsets.only(left:10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  border: Border.all(color: Color(0xffffC4C4C4)), // set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(2.0)), // set rounded corner radius
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'LoremIpsum@gmail.com',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const Align(
                  alignment: AlignmentDirectional(-0.9, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Text(
                      'Website',
                    ),
                  ),
                ),
                Container(
                margin: EdgeInsets.only(left: 2,right: 2,top: 10,bottom: 10),
                  padding: EdgeInsets.only(left:10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                   border: Border.all(color: Color(0xffffC4C4C4)), // set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(2.0)), // set rounded corner radius
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'LoremIpsum@gmail.com',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                      width: 220,
                      height: 45.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      child: FlatButton(
                        child: const Text(
                          'POST COMMENT',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        color: Color(0xfffff9d15),
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Color(0xfffff9d15),
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(5)),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
               
                const SizedBox(
                  height: 30,
                ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}