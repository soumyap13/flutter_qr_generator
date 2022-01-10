import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),

      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  String imageurl;
  String word;
  bool color = false;
  Color pickerColor = new Color(0xff443a49);
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
    super.initState();
  }

  void _handleOnPressed() {
    setState(() {
      color = !color;
      color ? _animationController.forward() : _animationController.reverse();
    });
  }

  void changeColor(Color color) {
    setState(() {
      pickerColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: const Text("Qr generator"),
        leading: const Icon(
          Icons.android,
          color: Colors.greenAccent,
        ),
        backgroundColor: const Color.fromRGBO(0, 36, 124, 1),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.image,
              color: Colors.white,
            ),
          )
        ],
      ),
      backgroundColor: const Color.fromRGBO(0, 36, 124, 1),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    Center(
                      child: Container(
                        height: 200,
                        width: 200,
                        child: Image.asset('assests/frame.png'),
                      ),
                    ),
                    imageurl != null
                        ? Center(
                            child: Container(
                              padding: const EdgeInsets.only(top: 10),
                              height: 190,
                              width: 190,
                              child: FadeInImage.assetNetwork(
                                  placeholder: "assests/loading.gif",
                                  image: imageurl),
                            ),
                          )
                        : Container()
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  width: 300,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Colors.white70,
                  ),
                  child: Center(
                    child: ListTile(
                      title: Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          cursorColor: Colors.black,
                          onChanged: (value) {
                            setState(() {
                              word = value;
                            });
                          },
                          decoration: new InputDecoration(
                            icon: Container(
                              padding: EdgeInsets.only(left: 10),
                              child: const Icon(
                                Icons.vpn_key,
                                color: Colors.black87,
                              ),
                            ),
                            hintText: 'Enter Something',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                AnimatedContainer(
                  padding: EdgeInsets.all(10),
                  duration: Duration(milliseconds: 450),
                  width: 300,
                  height: color == false ? 70 : 280,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 51, 145, 1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 100),
                              child: Row(
                                children: [
                                  const Text(
                                    "color",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: pickerColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                _handleOnPressed();
                              },
                              icon: AnimatedIcon(
                                icon: AnimatedIcons.menu_arrow,
                                color: Colors.white,
                                progress: _animationController,
                              ),
                            )
                          ],
                        ),
                        color == true
                            ? Container(
                                height: 200,
                                child: MaterialPicker(
                                  pickerColor: pickerColor,
                                  onColorChanged: changeColor,
                                  enableLabel: true,
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 50),
                      height: 70,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Color.fromRGBO(255, 144, 39, 1)),
                      child: FlatButton(
                          child: Text(
                            "Create QR",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            if (word != null) {}
                          }),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 50),
                      height: 70,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Color.fromRGBO(0, 180, 245, 1)),
                      child: FlatButton(
                          child: Text(
                            "Save QR",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {}),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
