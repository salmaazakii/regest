import 'package:regest/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:regest/screens/home/chatbot.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            "We're Caring",
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 20,
            ),
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 10.0, top: 10.0),
                child: FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('logout'),
                  onPressed: () async {
                    await _auth.signOut();
                  },
                ),)
          ],
        ),
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListView(children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        child:
                          Container(
                              width: 150.0,
                              height: 170.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(10.0),
                                child: Image.asset("assets/images/chatbot.jpg",
                                    fit: BoxFit.cover),
                              )),
                        onTap:() => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ChatBot()),
                        )
                        }
                      ),
                    ],
                  ),
                  ])])))


    );
  }
}

