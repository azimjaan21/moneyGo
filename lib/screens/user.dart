import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:money_go/screens/home.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late String _name;
  late File _image;
  final usercontroller = TextEditingController();

  Future getImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile!.path);
    });
  }

  @override
  void initState() {
    super.initState();
    _name = '';
    _image = File('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50.50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: 'money',
                    ),
                    TextSpan(
                      text: 'Go',
                      style: TextStyle(
                        color: Color(0xff7356f7),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(90),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xffbebebe),
                            offset: Offset(10, 10),
                            blurRadius: 30,
                            spreadRadius: 1,
                          ),
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(-10, -10),
                            blurRadius: 30,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        backgroundImage:
                            _image.path.isEmpty ? null : FileImage(_image),
                        radius: 90,
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: _image.path.isEmpty
                              ? Image.asset(
                                  'assets/images/user.png',
                                )
                              : null,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        onPressed: getImage,
                        icon: Icon(
                          _image.path.isEmpty ? Icons.add_a_photo : null,
                          size: 36,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: usercontroller,
                  onChanged: (value) {
                    setState(() {
                      _name = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Enter your name',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  usercontroller.text.isNotEmpty && _image.path.isNotEmpty
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(
                              name: _name,
                              image: _image,
                            ),
                          ),
                        )
                      : ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Center(child: Text('Please, enter the information completely!'),),
                            backgroundColor: Colors.black,
                            duration: Duration(seconds: 3),
                            behavior: SnackBarBehavior.floating,
                            dismissDirection: DismissDirection.down,
                            action: SnackBarAction(
                              label: 'Ok',
                              textColor: Colors.deepPurple,
                              onPressed: () {},
                            ),
                          ),
                        );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 90, vertical: 5),
                  child: const Text(
                    'Get started',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
