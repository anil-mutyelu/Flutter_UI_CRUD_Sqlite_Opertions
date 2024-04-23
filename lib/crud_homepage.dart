

import 'package:cruduiapp/readoperation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'db_helper2.dart';


class homepagecrud extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
  return _homepagecrud();
  }


}


class _homepagecrud extends State<homepagecrud> {

  var dbquery;

  TextEditingController nameController = TextEditingController();

  TextEditingController IDControllerUpdate = TextEditingController();

  TextEditingController nameControllerUpdate = TextEditingController();

  TextEditingController IDControllerDelete = TextEditingController();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.cyanAccent,
      body: Center(
        child: Container(
          height:double.infinity,
          width:320,
          color: Colors.cyanAccent,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text('CRUD',style: TextStyle(color: Colors.orange,backgroundColor: Colors.white30,fontSize: 30                              )),
                          SizedBox(  height: 20        ),
                Center(
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Name',
                        hintText: 'Enter Your Name'
                    ),
                  ),
                ),

                SizedBox(height: 10,),

                ElevatedButton(onPressed: () async {
                  {
                    await DatabaseHelper.instance.insertRecord({

                      DatabaseHelper.columnName: nameController.text.toString()

                    });
                    print('inserted');
                    print(nameController);
                    //
                    // Navigator.push(context, MaterialPageRoute(
                    //   builder: (context)=>  DatabaseHelper(
                    //     name.text.toString(),),),);},
                  }
                },
                  child: Text('Insert', style: (TextStyle(color: Colors.orange)),),
                ),
                SizedBox(height: 10,),
                Center(
                  child: TextField(

                    controller:  IDControllerUpdate,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Id',
                        hintText: 'Enter Your Id'
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Center(
                  child: TextField(

                    controller: nameControllerUpdate,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Name',
                        hintText: 'Enter Your Update Name'
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                         onPressed: () async {

                       await DatabaseHelper.instance.updateRecord(
                      {
                       // DatabaseHelper.columnId : IDControllerUpdate,

                        DatabaseHelper.columnId: int.parse(IDControllerUpdate.text),

                        DatabaseHelper.columnName: nameControllerUpdate.text.toString(),
                      }
                           );
                       print("updated");
                         },
                       child:Text('Update', style: (TextStyle(color: Colors.orange)),)),
                SizedBox(height: 10,),
                Center(
                  child: TextField(

                    controller: IDControllerDelete,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Delete Id',
                        hintText: 'Enter Your Delete Id'
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                ElevatedButton(


                 onPressed: () async {

                   await DatabaseHelper.instance.deleteRecord(int.parse(IDControllerDelete.text));

                             },
                    child:Text('Delete', style: (TextStyle(color: Colors.orange)),)),


                SizedBox(height: 30,),

                ElevatedButton(
                  onPressed: () async {

                    // dbquery = await DatabaseHelper.instance.queryDatabase();
                    //
                    // print(' Save ${dbquery}');

                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => readd(),),);

                  },
                  child: Text('Read', style: (TextStyle(color: Colors.orange)),),
                ),
              ]
          ),
        ),
      ),

    );
  }
}

