import 'package:regest/services/auth.dart';
import 'package:regest/shared/constants.dart';
import 'package:regest/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.05), BlendMode.dstATop),
                image: AssetImage('assets/images/mountains.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: new ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(60.0),
                      child: Center(
                        child: Icon(
                          Icons.headset_mic,
                          color: Colors.redAccent,
                          size: 50.0,
                        ),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              new Expanded(
                                child: new Padding(
                                  padding: const EdgeInsets.only(left: 40.0),
                                  child: new Text(
                                    "EMAIL",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.redAccent,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          new Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(
                                left: 40.0, right: 40.0, top: 10.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: Colors.redAccent,
                                    width: 0.5,
                                    style: BorderStyle.solid),
                              ),
                            ),
                            padding:
                                const EdgeInsets.only(left: 0.0, right: 10.0),
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new Expanded(
                                  child: TextFormField(
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'samarthagarwal@live.com',
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                    validator: (val) =>
                                        val.isEmpty ? 'Enter an email' : null,
                                    onChanged: (val) {
                                      setState(() => email = val);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 24.0,
                          ),
                          new Row(
                            children: <Widget>[
                              new Expanded(
                                child: new Padding(
                                  padding: const EdgeInsets.only(left: 40.0),
                                  child: new Text(
                                    "PASSWORD",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.redAccent,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          new Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(
                                left: 40.0, right: 40.0, top: 10.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: Colors.redAccent,
                                    width: 0.5,
                                    style: BorderStyle.solid),
                              ),
                            ),
                            padding:
                                const EdgeInsets.only(left: 0.0, right: 10.0),
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new Expanded(
                                  child: TextFormField(
                                    obscureText: true,
                                    textAlign: TextAlign.left,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '*********',
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                    validator: (val) => val.length < 6
                                        ? 'Enter a password 6+ chars long'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => password = val);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 24.0,
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: new FlatButton(
                                  child: new Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.redAccent,
                                      fontSize: 15.0,
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                  onPressed: () => {},
                                ),
                              ),
                            ],
                          ),
                          new Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(
                                left: 30.0, right: 30.0, top: 20.0),
                            alignment: Alignment.center,
                            child: new Row(
                              children: <Widget>[
                                new Expanded(
                                  child: new FlatButton(
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(30.0),
                                    ),
                                    color: Colors.redAccent,
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        setState(() => loading = true);
                                        dynamic result = await _auth
                                            .signInWithEmailAndPassword(
                                                email, password);
                                        if (result == null) {
                                          setState(() {
                                            loading = false;
                                            error =
                                                'Could not sign in with those credentials';
                                          });
                                        }
                                      }
                                    },
                                    child: new Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 20.0,
                                        horizontal: 20.0,
                                      ),
                                      child: new Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          new Expanded(
                                            child: Text(
                                              "LOGIN",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 14.0),
                          )
                        ],
                      ),
                    ),

//                    new Container(
//                      width: MediaQuery.of(context).size.width,
//                      margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
//                      alignment: Alignment.center,
//                      child: Row(
//                        children: <Widget>[
//                          new Expanded(
//                            child: new Container(
//                              margin: EdgeInsets.all(8.0),
//                              decoration: BoxDecoration(border: Border.all(width: 0.25)),
//                            ),
//                          ),
//                          Text(
//                            "OR CONNECT WITH",
//                            style: TextStyle(
//                              color: Colors.grey,
//                              fontWeight: FontWeight.bold,
//                            ),
//                          ),
//                          new Expanded(
//                            child: new Container(
//                              margin: EdgeInsets.all(8.0),
//                              decoration: BoxDecoration(border: Border.all(width: 0.25)),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                    new Container(
//                      width: MediaQuery.of(context).size.width,
//                      margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
//                      child: new Row(
//                        children: <Widget>[
//                          new Expanded(
//                            child: new Container(
//                              margin: EdgeInsets.only(right: 8.0),
//                              alignment: Alignment.center,
//                              child: new Row(
//                                children: <Widget>[
//                                  new Expanded(
//                                    child: new FlatButton(
//                                      shape: new RoundedRectangleBorder(
//                                        borderRadius: new BorderRadius.circular(30.0),
//                                      ),
//                                      color: Color(0Xff3B5998),
//                                      onPressed: () => {},
//                                      child: new Container(
//                                        child: new Row(
//                                          mainAxisAlignment: MainAxisAlignment.center,
//                                          children: <Widget>[
//                                            new Expanded(
//                                              child: new FlatButton(
//                                                onPressed: ()=>{},
//                                                padding: EdgeInsets.only(
//                                                  top: 20.0,
//                                                  bottom: 20.0,
//                                                ),
//                                                child: new Row(
//                                                  mainAxisAlignment:
//                                                  MainAxisAlignment.spaceEvenly,
//                                                  children: <Widget>[
//                                                    Icon(
//                                                      const IconData(0xea90,
//                                                          fontFamily: 'icomoon'),
//                                                      color: Colors.white,
//                                                      size: 15.0,
//                                                    ),
//                                                    Text(
//                                                      "FACEBOOK",
//                                                      textAlign: TextAlign.center,
//                                                      style: TextStyle(
//                                                          color: Colors.white,
//                                                          fontWeight: FontWeight.bold),
//                                                    ),
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      ),
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                          ),
//                          new Expanded(
//                            child: new Container(
//                              margin: EdgeInsets.only(left: 8.0),
//                              alignment: Alignment.center,
//                              child: new Row(
//                                children: <Widget>[
//                                  new Expanded(
//                                    child: new FlatButton(
//                                      shape: new RoundedRectangleBorder(
//                                        borderRadius: new BorderRadius.circular(30.0),
//                                      ),
//                                      color: Color(0Xffdb3236),
//                                      onPressed: () => {},
//                                      child: new Container(
//                                        child: new Row(
//                                          mainAxisAlignment: MainAxisAlignment.center,
//                                          children: <Widget>[
//                                            new Expanded(
//                                              child: new FlatButton(
//                                                onPressed: ()=>{},
//                                                padding: EdgeInsets.only(
//                                                  top: 20.0,
//                                                  bottom: 20.0,
//                                                ),
//                                                child: new Row(
//                                                  mainAxisAlignment:
//                                                  MainAxisAlignment.spaceEvenly,
//                                                  children: <Widget>[
//                                                    Icon(
//                                                      const IconData(0xea88,
//                                                          fontFamily: 'icomoon'),
//                                                      color: Colors.white,
//                                                      size: 15.0,
//                                                    ),
//                                                    Text(
//                                                      "GOOGLE",
//                                                      textAlign: TextAlign.center,
//                                                      style: TextStyle(
//                                                          color: Colors.white,
//                                                          fontWeight: FontWeight.bold),
//                                                    ),
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                          ],
//                                        ),
//                                      ),
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                          ),
//                        ],
//                      ),
//                    )
                  ],
                ),
              ],
            )));
//    return loading ? Loading() : Scaffold(
//      backgroundColor: Colors.brown[100],
//      appBar: AppBar(
//        backgroundColor: Colors.brown[400],
//        elevation: 0.0,
//        title: Text('Sign in to Brew Crew'),
//        actions: <Widget>[
//          FlatButton.icon(
//            icon: Icon(Icons.person),
//            label: Text('Register'),
//            onPressed: () => widget.toggleView(),
//          ),
//        ],
//      ),
//      body: Container(
//        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
//        child: Form(
//          key: _formKey,
//          child: Column(
//            children: <Widget>[
//              SizedBox(height: 20.0),
//              TextFormField(
//                decoration: textInputDecoration.copyWith(hintText: 'email'),
//                validator: (val) => val.isEmpty ? 'Enter an email' : null,
//                onChanged: (val) {
//                  setState(() => email = val);
//                },
//              ),
//              SizedBox(height: 20.0),
//              TextFormField(
//                obscureText: true,
//                decoration: textInputDecoration.copyWith(hintText: 'password'),
//                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
//                onChanged: (val) {
//                  setState(() => password = val);
//                },
//              ),
//              SizedBox(height: 20.0),
//              RaisedButton(
//                  color: Colors.pink[400],
//                  child: Text(
//                    'Sign In',
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  onPressed: () async {
//                    if(_formKey.currentState.validate()){
//                      setState(() => loading = true);
//                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
//                      if(result == null) {
//                        setState(() {
//                          loading = false;
//                          error = 'Could not sign in with those credentials';
//                        });
//                      }
//                    }
//                  }
//              ),
//              SizedBox(height: 12.0),
//              Text(
//                error,
//                style: TextStyle(color: Colors.red, fontSize: 14.0),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
  }
}
