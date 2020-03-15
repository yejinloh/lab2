import 'package:flutter/material.dart';
import 'package:lab2/registerscreen.dart';
//import 'package:lab2/mainscreen.dart';
//import 'package:http/http.dart' as http;
//import 'package:toast/toast.dart';
//import 'package:shared_preferences/shared_preferences.dart';
 
void main() => runApp(LoginScreen());
bool rememberMe = false;
 
class LoginScreen extends StatefulWidget {
  
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen>{
  bool _obscureText = true;
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  String urlLogin = "http://yjjmappflutter.com/WatchYou/php/login_user.php";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false, 
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Center(
              child: Image.asset('assets/images/logo.png',
            height: 100.0,
            width: 200.0
            ),
            ),
            ),

            Text('\n'),

            TextField(
              style: TextStyle(
                 fontFamily: 'Do Hyeon',
                 fontSize: 20
              ),
              controller: _email,
              decoration: InputDecoration(
                 hintText: "Email (Ex: example12@gmail.com)",
                 hintStyle: TextStyle(
                     fontSize: 20.0, 
                     color: Colors.black38),
                 border: OutlineInputBorder(
                 borderSide: BorderSide(
                    color: Colors.teal,
                 ),
                ),
                 prefixIcon: const Icon(
                   Icons.email,
                   color: Colors.white,
                 ),
              ),
            ),

            TextField(
              style: TextStyle(
                 fontFamily: 'Do Hyeon',
                 fontSize: 20
              ),
              controller: _password,
              decoration: InputDecoration(
                 hintText: "Password",
                 hintStyle: TextStyle(
                     fontSize: 20.0, 
                     color: Colors.black38),
                 border: OutlineInputBorder(
                 borderSide: BorderSide(
                    color: Colors.teal,
                 ),
                ),
                 prefixIcon: const Icon(
                   Icons.security,
                   color: Colors.white,
                 ),
              ),
              obscureText: _obscureText,
            ),
            new FlatButton(
                onPressed: _toggle,
                child: new Text(_obscureText ? "Show" : "Hide")),
                
                            Row(
                              children: <Widget>[
                                  Checkbox(
                                    value: rememberMe,
                                    onChanged: (bool value) {
                                      _onRememberMeChanged(value);
                                    },),
                                
                                    Text('Remember Me ',
                                     style: TextStyle(
                                     fontSize: 16, 
                                     fontWeight: FontWeight.bold)
                                    ),
                                    
                              ],
                            ),
                
                            roundedRectButton("Login", loginGradients, false),
                
                            Text("Don't have an account? ", style: TextStyle(fontSize: 16.0)),
                            GestureDetector(
                              onTap: _registerUser,
                              child: roundedRectButton(
                                "Register", registerGradients, false),
                            ),
                
                                      
                                
                                
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                
                                  void _onRememberMeChanged(bool newValue) => setState(() {
                                        rememberMe = newValue;
                                        print(rememberMe);
                                      });
                                  
                                
                                  void _registerUser() {
                                    Navigator.push(context,
                                    MaterialPageRoute(builder: (BuildContext context) => RegisterScreen()));
                  }
                
                  void _toggle() {
                    setState(() {
                   _obscureText = !_obscureText;
    });
  }
}

Widget roundedRectButton(
    String title, List<Color> gradient, bool isEndIconVisible) {
  return Builder(builder: (BuildContext mContext) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Stack(
        alignment: Alignment(1.0, 0.0),
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(mContext).size.width / 1.7,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              gradient: LinearGradient(
                  colors: gradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
            child: Text(title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500)),
            padding: EdgeInsets.only(top: 16, bottom: 16),
          ),
        ],
      ),
    );
  });
}

const List<Color> loginGradients = [
  Color(0xFFFF9945),
  Color(0xFFFc6076),
];

const List<Color> registerGradients = [
  Color(0xFFFF2345),
  Color(0xFFFc6076),
];