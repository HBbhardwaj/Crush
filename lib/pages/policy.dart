import 'package:flutter/material.dart';
class policy extends StatefulWidget {
  const policy({ Key? key }) : super(key: key);

  @override
  State<policy> createState() => _policyState();
}

class _policyState extends State<policy> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Privacy Policy"),
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
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        color: Colors.white,
                        border: Border.all(color: Color(0xffffC4C4C4))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Your privacy is important to us. We have developed this policy to clarify how  we collect, use, communicate and disclose andmake use of your personal information.So, here we want to inform you that your data on our website is safely stored with us.',
                            style: TextStyle(
                               fontSize: 16,
                                height: 1.6,
                              ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: const Text(
                            'We will not transfer your data outside the website. In addition, you also have the option to set your profile privacy from the website’s setting option. We ensure that the confidentiality of personal information is protected and maintained by us.',
                            style: TextStyle(
                              height: 1.6,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
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
                  padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                  child: Text(
                    'Leave a reply',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                      // hintText: 'LoremIpsum@gmail.com',
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