import 'package:flutter/material.dart';
import 'package:to_do/Views/page2.dart';
class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String choice;
  List listItems = ["food", "outing", "church", "games"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        title: Text(
          "ToDo List",
          style: TextStyle(
              color: Colors.white, fontSize: 60, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.yellow,
        actions: [
          IconButton(
            onPressed: () {
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                      color: Colors.black,
                      backgroundColor: Colors.white),
                ),
              );
            },
            icon: Icon(Icons.search),
          ),
          SizedBox(width: 5),
          DropdownButton(
            dropdownColor: Colors.yellow,
            iconSize:30,
            
            value: choice,
            icon: Icon(Icons.more_vert,color: Colors.white),
            onChanged: (valueChange) {
              setState(() {
                choice = valueChange;
              });
            },
            items: listItems.map((itemChange) {
              return DropdownMenuItem(
                  value: itemChange,
                  
                  child: Text(itemChange,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,)));
            }).toList(),
          )
        ],
      ),


      floatingActionButton:FloatingActionButton( 
        backgroundColor: Colors.yellow,
        child:Icon(Icons.add,color: Colors.white,),onPressed: (){
        Navigator.push((context), MaterialPageRoute(builder: (BuildContext context) => Page2()));
      },),
      

      
      
    );
  }
}
