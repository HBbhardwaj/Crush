import 'package:flutter/material.dart';

class workScreen extends StatefulWidget {
  const workScreen({Key? key}) : super(key: key);

  @override
  State<workScreen> createState() => _workScreenState();
}

class _workScreenState extends State<workScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("How does it work?"),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: const Text(
                            'Crush on me Crush on you is a social interaction website that allows people to engage with their crush. It allows you to reach out to your crush by postingand messaging it. It’s a great platform to express love for one another.',
                            style: TextStyle(height: 1.6, fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: const Text(
                            'Here, you can have fun with your old and new friends.',
                            style: TextStyle(height: 1.6, fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: const Text(
                            'It allows you to communicate directly with your crushes online. The crush on me crushes on your window pops up as an overlay of the website page with the browser.',
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
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        color: Colors.white,
                        border: Border.all(color: Color(0xffffC4C4C4))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text(
                                    'Our website has various exciting features and functions that allow you:-',
                                    style: TextStyle(
                                        height: 1.6,
                                        fontSize:20,
                                        fontWeight: FontWeight.bold
                                        ),
                                    // textAlign: TextAlign.justify,
                                  ),
                              ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 10,top: 20),
                               child: Container(
                            height: 5.0,
                            width: 5.0,
                            decoration: new BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                            ),
                          ),
                             ),
                            Expanded(
                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'To search your crush and send them friend requests.',
                                  style: TextStyle(
                                      height: 1.6,
                                      fontSize:16,
                                      ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                           
                          ],
                        ),
                         Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 10,top: 20),
                               child: Container(
                            height: 5.0,
                            width: 5.0,
                            decoration: new BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                            ),
                          ),
                             ),
                            Expanded(
                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  ' To chat with your crush online and can check each other’s messages in the Messages section',
                                  style: TextStyle(
                                      height: 1.6,
                                      fontSize:16,
                                      ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                           
                          ],
                        ),
                         Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 10,top: 20),
                               child: Container(
                            height: 5.0,
                            width: 5.0,
                            decoration: new BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                            ),
                          ),
                             ),
                            Expanded(
                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Post your crush so that he/ she can know who had a crush on them.',
                                  style: TextStyle(
                                      height: 1.6,
                                      fontSize:16,
                                      ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                           
                          ],
                        ),
                         Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 10,top: 20),
                               child: Container(
                            height: 5.0,
                            width: 5.0,
                            decoration: new BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                            ),
                          ),
                             ),
                            Expanded(
                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  ' With one click, you can start intersecting with your crush.',
                                  style: TextStyle(
                                      height: 1.6,
                                      fontSize:16,
                                      ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                           
                          ],
                        ),
                         Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 10,top: 20),
                               child: Container(
                            height: 5.0,
                            width: 5.0,
                            decoration: new BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                            ),
                          ),
                             ),
                            Expanded(
                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'You can post about your past and present crushes and have fun by interacting with them after a long time.',
                                  style: TextStyle(
                                      height: 1.6,
                                      fontSize:16,
                                      ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                           
                          ],
                        ),
                         Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 10,top: 20),
                               child: Container(
                            height: 5.0,
                            width: 5.0,
                            decoration: new BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                            ),
                          ),
                             ),
                            Expanded(
                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Feel special By checking the list of people who had a crush on you.',
                                  style: TextStyle(
                                      height: 1.6,
                                      fontSize:16,
                                      ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                           
                          ],
                        ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 10,top: 20),
                               child: Container(
                            decoration: new BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                            ),
                          ),
                             ),
                            Expanded(
                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Millions of people are having fun with their crushes and now you can too.',
                                  style: TextStyle(
                                      height: 1.6,
                                      fontSize:16,
                                      ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                           
                          ],
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
                      const Text(
                        'One Response',
                        style: TextStyle(
                            height: 1.6,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.justify,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(2),
                              child: InkWell(
                                onTap: () => null,
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Image.asset(
                                    'assets/images/Ellipse.png',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1),
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Color(0xffffC4C4C4))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(top: 10, left: 10),
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
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                        child: Text(
                          'Leave a reply',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: 2, right: 2, top: 10, bottom: 10),
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Color(0xffffC4C4C4)),
                          // set border width
                          borderRadius: BorderRadius.all(Radius.circular(
                              2.0)), // set rounded corner radius
                        ),
                        child: TextField(
                          maxLines: 6,
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
                            margin: const EdgeInsets.symmetric(
                                vertical: 25, horizontal: 10),
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
