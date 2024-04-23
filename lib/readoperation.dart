import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'db_helper2.dart';


class readd extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _readd();
  }

}

class _readd  extends State<readd>
{

  var dbquery;

  @override
  Widget build(BuildContext context) {
 return Scaffold(
   body: Container(
     width: double.infinity,
     height: double.infinity,
     color: Colors.brown,
     child: Column(
       children: [

         Center(

           child: Padding(
             padding: const EdgeInsets.only(top: 80),

             child: ElevatedButton(

               onPressed: () async {

                 dbquery = await DatabaseHelper.instance.queryDatabase();

                 print(' Show Data  databas=========  ${dbquery}');

                 dbquery = await DatabaseHelper.instance.queryDatabase();

                 setState(() {

                 });
             },

                   child: Text('Show Data  ',style: TextStyle(color: Colors.redAccent,),)),
             ),
           ),
         SizedBox(height: 20,),
         Center(
           child: Wrap(
              children: [

            Card(

              child: Container(
                  width: 300,
                  color: Colors.lightGreenAccent,
                  child: Text('${dbquery}',style: TextStyle(color: Colors.red),)),
            )

           ],


             ),
         ),


       ],
     ),
   ),
 );



  }

}