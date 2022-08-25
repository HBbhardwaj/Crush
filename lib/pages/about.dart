import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("About Us"),
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
                      // height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                          color: Colors.white,
                          border: Border.all(color: Color(0xffffC4C4C4))),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: RichText(
                          text: const TextSpan(
                            text: 'Crush On Me Crush On You,',
                            style: TextStyle(
                                height: 1.6,
                                 fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600
                                  ),
                            children: <TextSpan>[
                              TextSpan(
                                  text:
                                      'where people find people. IT’S ALL ABOUT THE CRUSH! Post past & present crushes and find who had a crush on you! It’s Fun (and a littleexciting) discovering mystery crushes you never even knew about. Aren’t you curious?',
                                  style: TextStyle(
                                      height: 1.6,
                                      fontSize: 16,
                                      color: Colors.black45))
                            ],
                          ),
                        ),
                      )),
                ),
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
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            'Our Mission',
                            style: TextStyle(
                                height: 1.6,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child:  Text(
                            'Give a unique platform to let YOU engage with your crush. In this time of isolation and separation, CRUSH encourages us to reach out, connect, and express our love of one another (past or present).',
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
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Text(
                            'Our Commitment to Safety',
                            style: TextStyle(
                                height: 1.6,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: const Text(
                            'At Crush On Me Crush On You, YOU’LL SEE THE LITTLE LOCK ICON BY THE URL window, that means We commit to high standards and aim to improve with the best-in-class safety.).',
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
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '2 Responses',
                        style: TextStyle(
                            height: 1.6,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.justify,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // color: Colors.black,
                              margin: EdgeInsets.all(2),
                              child: InkWell(
                                onTap: () => null,
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Image.asset(
                                    'assets/images/Ellipse.png',
                                    // fit: BoxFit.none,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10,top: 10),
                                child: Container(
                                  // width: 300,
                                  // height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1),
                                      color: Colors.white,
                                      border:
                                          Border.all(color: Color(0xffffC4C4C4))),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 10, left: 10),
                                        child: Text(
                                          'Nicole said on May 29, 2013',
                                          style: TextStyle(
                                              height: 1.6,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: const Text(
                                          'Pellentesque rhoncus fermentum sem a gravida. Etiam enim arcu, scelerisque ut congue ac, consectetur a enim.Phasellus et ultricies urna. In mi velit, tristique ut feugiat non, fermentum non orci. Ut mi neque, tempus ac elementum nec, pulvinar et odio',
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
                            ),
                          ],
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.only(top:16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // color: Colors.black,
                              margin: EdgeInsets.all(2),
                              child: InkWell(
                                onTap: () => null,
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Image.asset(
                                    'assets/images/Ellipse.png',
                                    // fit: BoxFit.none,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10,top: 10),
                                child: Container(
                                  // width: 300,
                                  // height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1),
                                      color: Colors.white,
                                      border:
                                          Border.all(color: Color(0xffffC4C4C4))),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 10, left: 10),
                                        child: Text(
                                          'Michael said on May 29, 2013',
                                          style: TextStyle(
                                              height: 1.6,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: const Text(
                                          'Mauris felis lorem, venenatis egetcongue vel, accumsan sed felis.Nunc eget est metus. Pellentesque gravida pulvinar purus vitae pretium. Integer massa ante,fermentum cursus feugiat sed,elementum ut erat. Cras leo ante,luctus sed volutpat ac, varius ut lectus. Phasellus vel ligula lacus,tincidunt venenatis ipsum.',
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
                            ),
                          ],
                        ),
                      ),
                      
                        const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
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
                  child: TextField(
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
                        text: 'Your Name',
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
                  child: TextField(
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
                        text: 'Your Email',
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
                  child: TextField(
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
                  child: TextField(
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
