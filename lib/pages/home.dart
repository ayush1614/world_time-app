import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data ={};

  @override
  Widget build(BuildContext context) {

     data = (data.isNotEmpty?data:ModalRoute.of(context)!.settings.arguments) as Map;
     print(data);
     String bgImage = data['daytime'] ? 'day.jpg': 'night.jpg';
     Color? bgColor = data['daytime'] ? Colors.blue : Colors.indigo[900] ;

     return Scaffold(
       backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                  fit: BoxFit.cover
              )
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: <Widget>[
                  TextButton.icon(
                      onPressed: ()async {
                       dynamic res = await Navigator.pushNamed(context, '/location');
                       if(res!=Null)
                         {
                           setState(() {
                             data = {
                               'time': res['time'],
                               'location': res['location'],
                               'daytime': res['daytime'],
                               'flag': res['flag']
                             };
                           });
                         }
                      },
                      icon: Icon(
                          Icons.edit_location,
                        color: Colors.white70,
                      ),
                      label: Text(
                          'Edit Location',
                        style: TextStyle(
                          color: Colors.white70,
                          letterSpacing: 1
                        ),
                      )
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                      '${data['location']}',
                        style: TextStyle(
                          fontSize: 38.0,
                            color: Colors.blueAccent.shade200,
                          letterSpacing: 2.0
                        ),
                    ),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 58,
                      color: Colors.blueAccent.shade100,
                    ),
                  )
                ]
              ),
            ),
          ),
      ),
    );
  }
}