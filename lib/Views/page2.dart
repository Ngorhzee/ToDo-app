import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do/Views/page1.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController bodyController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String choice;
  List listItems = ["food", "outing", "church", "games"];
  bool categories = true;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black45,
        appBar: AppBar(
    backgroundColor: Colors.yellow,
    title: Text(
      "Create task",
      style: TextStyle(
          color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
    ),
        ),
        body: SingleChildScrollView(
        
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
    Text(
        "Title :",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.w900),
    ),
    SizedBox(height: 15),
    Container(
        
         width: double.infinity,
        decoration: BoxDecoration(
        border:Border.all(color:Colors.yellow),
        borderRadius: BorderRadius.circular(12)
        //color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
           
          validator: (String val) {
            if(val==""){
              
              return "    Title cannot be empty";
            }
            // else if(val.length<=15){
            //   return "    too many characters";
              
            // }
            return null;
             
            
          
          },
          
          maxLength: 15,
         // maxLines: 1,
          
          style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 22,
              color: Colors.white),
          controller: titleController,
          decoration: InputDecoration(
             border: InputBorder.none,
             counterText: "",
            hintText: "  Enter title here",
            hintStyle: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Colors.white70),
          ),
          ),
        ),
    ),
    SizedBox(height:10),
    
    DropdownButton(
      
    
        elevation: 20,
        underline:Container(height: 40,
         decoration: BoxDecoration(
        border:Border.all(color:Colors.yellow,),
       
        ),
        ),
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900,color: Colors.white),
        hint: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Categories',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900,color: Colors.white) ,),
        ),
        dropdownColor: Colors.yellow,
        iconSize: 35,
        value: choice,
        
        onChanged: (valueChange) {
         
         
          setState(() {
        
          //choiceState();
            choice = valueChange;
        
          
        });
         
        },
        
        items: listItems.map((itemChange) {
        return DropdownMenuItem(
          value: itemChange,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              itemChange,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
        }).toList(),
    ),
    SizedBox(height:5),
     Text(
        "Category Required",
        style: TextStyle(
          color: Colors.red,
          fontSize:10,
          fontWeight: FontWeight.w900),
    ),
    SizedBox(height:5),
    Text(
        "Tasks :",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.w900),
    ),
    SizedBox(height: 15),
    Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border:Border.all(color:Colors.yellow),
          borderRadius: BorderRadius.circular(12)
          //color: Colors.white
        )
        ,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
          maxLines: 8,
          
          
            validator: (String taskVal) {
              if (taskVal.isEmpty) {
    taskVal = "Enter task required";
    return taskVal;
              }
              else{
    return "";
     
              }
            },
            

            style: TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 22,
    color: Colors.white),
            controller: bodyController,
            decoration: InputDecoration(
            
            
              border: InputBorder.none,
              hintText: "Enter task here",
              
              hintStyle: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 20,
      color: Colors.white70),
            ),
          ),
        ),
        ),
    // Spacer(),
    RaisedButton(
        color: Colors.yellow,
        onPressed: () {
        ngo();
        },
        child: Text(
        "SAVE",
        style: TextStyle(color: Colors.white, fontSize: 18),
        ),
    )
        ],
        ),
      ),
                ),
    ),
      );
  }
   ngo(){
                       if (formKey.currentState.validate() ||
                      choice=="" || choice!="Categories"
                      ) {
                    

                    formKey.currentState.save();
                    print("form key");
                   
                  }
                 
                  else{
                    Navigator.pop(
                      context
                    );
                    print("popped");
                  }
  }

  // String choiceState(){
  //    
  //      else{
  //        choice=valueChange;
  //      }       
  // }
}
