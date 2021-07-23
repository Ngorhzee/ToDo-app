import 'package:flutter/material.dart';
import 'package:to_do/models/todo_model.dart';
import 'package:to_do/utils/colors.dart';

class EditView extends StatefulWidget {
  final Function(Todo) editTodo;
  final Todo todoToEdit;

  const EditView({
    @required this.editTodo,
    @required this.todoToEdit,
  });
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<EditView> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController bodyController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String choice;
  List listItems = ["food", "outing", "church", "games"];
  bool categories = true;

  @override
  void initState() {
    titleController.text = widget.todoToEdit.title;
    bodyController.text = widget.todoToEdit.body;
    choice = widget.todoToEdit.category;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        title: Text(
          "Edit task",
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
                      border: Border.all(color: kPrimaryColor),
                      borderRadius: BorderRadius.circular(12)
                      //color: Colors.white
                      ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      validator: (String val) {
                        if (val == "") {
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
                SizedBox(height: 10),

                DropdownButton(
                  elevation: 20,
                  underline: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                  hint: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Categories',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    ),
                  ),
                  dropdownColor: kPrimaryColor,
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
                SizedBox(height: 5),
                if (choice == null)
                  Text(
                    "Category Required",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 10,
                        fontWeight: FontWeight.w900),
                  ),
                SizedBox(height: 5),
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
                      border: Border.all(color: kPrimaryColor),
                      borderRadius: BorderRadius.circular(12)
                      //color: Colors.white
                      ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      maxLines: 8,
                      validator: (String taskVal) {
                        if (taskVal.isEmpty) {
                          taskVal = "Enter task required";
                          return taskVal;
                        } else {
                          return null;
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
                  color: kPrimaryColor,
                  onPressed: () {
                    ngo();
                  },
                  child: Text(
                    "EDIT",
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

  ngo() {
    if (formKey.currentState.validate() && choice != null) {
      // formKey.currentState.save();
      print("here");
      print("form key");

      Todo todo = Todo(
        id: widget.todoToEdit.id,
        title: titleController.text,
        category: choice,
        body: bodyController.text,
        date: DateTime.now(),
      );
      widget.editTodo(todo);
      Navigator.pop(context);
    }
  }

  // String choiceState(){
  //
  //      else{
  //        choice=valueChange;
  //      }
  // }
}
