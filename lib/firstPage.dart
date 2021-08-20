import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';

class FirstPage extends StatefulWidget {

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool currentIndex = false;
  // bool valueStatus = false;
  // int _currentIndex = 0;
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: Color.fromRGBO(40, 36, 36, 1.0),
      backgroundColor: Color.fromRGBO(26, 28, 30, 0.6),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // backgroundColor: Color.fromRGBO(40, 36, 36, 1.0),
            backgroundColor: Color.fromRGBO(26, 28, 30, 0.6),
            collapsedHeight: 100.0,
            pinned: _pinned,
            // snap: _snap,
            floating: _floating,
            expandedHeight: 260.0,
            flexibleSpace: Flexible(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   "Welcome Home",
                    //   style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 30.0,
                    //       fontWeight: FontWeight.w900),
                    // ),
                    // Text(
                    //   "ArunKumar",
                    //   style: TextStyle(color: Colors.white),
                    // )
                    NeumorphicText(
                      "Welcome Home",
                      style: NeumorphicStyle(
                        depth: 2.5,  //customize depth here
                        color: Colors.white,
                        shadowDarkColor: Colors.red, //customize color here
                      ),
                      textStyle: NeumorphicTextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold//customize size here
                        // AND others usual text style properties (fontFamily, fontWeight, ...)
                      ),
                    ),
                    NeumorphicText(
                      "Arun Kumar",
                      style: NeumorphicStyle(
                        depth: 2.5,  //customize depth here
                        color: Colors.white,
                        shadowDarkColor: Colors.black, //customize color here
                      ),
                      textStyle: NeumorphicTextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.normal//customize size here
                        // AND others usual text style properties (fontFamily, fontWeight, ...)
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              // color: Color.fromRGBO(40, 36, 36, 1.0),
              color: Color.fromRGBO(26, 28, 30, 0.6),
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Container(
                  height: height * 0.09,
                  width: width * 0.80,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white38,
                        offset: Offset(
                          -2.5,
                          -2.5,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 1.0,
                      ),
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(
                          2.5,
                          2.5,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Partially cloudy"),
                            Text(
                              "32°C",
                              style: TextStyle(
                                fontSize: 30.0,
                              ),
                            )
                          ],
                        ),
                        Image(image: AssetImage("images/cloud.png"),height: height*0.085,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //         (BuildContext context, int index) {
          //       return Container(
          //         color: index.isOdd ? Colors.white : Colors.black12,
          //         height: 100.0,
          //         child: Center(
          //           child: Text('$index', textScaleFactor: 5),
          //         ),
          //       );
          //     },
          //     childCount: 20,
          //   ),
          // ),

          SliverToBoxAdapter(
            child: Container(
              // color: Color.fromRGBO(40, 36, 36, 1.0),
              color: Color.fromRGBO(26, 28, 30, 0.6),
              child: Row (
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(icon:Icon(Icons.menu, size: 40.0,
                    color: Colors.white,),
                    onPressed: (){
                      setState(() {
                        if (currentIndex == false) {
                          currentIndex = true;
                        }
                        else if(currentIndex==true){
                          currentIndex = false;
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: EdgeInsets.all(12.0),
          //     child: SelectCard(choice: choices[0]),
          //   ),
          // )
          currentIndex ? SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(18.0),
                  child: SelectCard(choice: choices[0]),
                );
              },
              childCount: choices.length,
            ),
          ):
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(12.0),
                  child: SelectCard(choice: choices[index]),
                );
              },
              childCount: choices.length,
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300.0,
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
              childAspectRatio: 1.0,
            ),),
        ],
      ),
    );
  }
}

class KeyValue {
  const KeyValue({this.title, this.subTitle , this.backGroundImage});
  final String title;
  final String subTitle;
  final String backGroundImage;
}

const List<KeyValue> choices = const <KeyValue>[
  const KeyValue(title: 'Living Room', subTitle: "6 devices", backGroundImage: 'images/fur.jpg' ),
  const KeyValue(title: 'Living Room', subTitle: "6 devices", backGroundImage: 'images/fur.jpg'),
  const KeyValue(title: 'Living Room', subTitle: "6 devices", backGroundImage: 'images/fur.jpg'),
  const KeyValue(title: 'Living Room', subTitle: "6 devices", backGroundImage: 'images/fur.jpg'),
  const KeyValue(title: 'Living Room', subTitle: "6 devices", backGroundImage: 'images/fur.jpg'),
  const KeyValue(title: 'Living Room', subTitle: "6 devices", backGroundImage: 'images/fur.jpg'),
  const KeyValue(title: 'Living Room', subTitle: "6 devices", backGroundImage: 'images/fur.jpg'),
  const KeyValue(title: 'Living Room', subTitle: "6 devices", backGroundImage: 'images/fur.jpg'),
];


class SelectCard extends StatefulWidget {
  SelectCard({this.choice});
  final KeyValue choice;

  @override
  _SelectCardState createState() => _SelectCardState();
}

class _SelectCardState extends State<SelectCard> {

  bool valueStatus = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final TextStyle textStyle = Theme.of(context).textTheme.headline4;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10.0),
         boxShadow: [
           BoxShadow(
            color: Colors.white38,
            offset: Offset(
              -2.5,
              -2.5,
            ),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
          BoxShadow(
            color: Colors.black,
            offset: Offset(
              2.5,
              2.5,
            ),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
          ],
        ),
        child: Container(
          height: height * 0.20,
          width: width * 0.80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7), BlendMode.dstATop),
              image: AssetImage(widget.choice.backGroundImage),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(image: AssetImage("images/chair.png"),height: height*0.055,),
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      widget.choice.title,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 13.0),
                    ),
                    Text(
                      widget.choice.subTitle,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 10.0),
                    )
                  ],
                ),
                Switch(
                    activeColor: Colors.orange,
                    thumbColor:
                    MaterialStateProperty.all(Colors.orange),
                    value: valueStatus,
                    onChanged: (bool value) {
                      setState(() {
                        valueStatus = value;
                      });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

