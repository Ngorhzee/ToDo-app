import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do/Views/edit_view.dart';
import 'package:to_do/Views/page2.dart';
import 'package:to_do/models/todo_model.dart';
import 'package:to_do/utils/colors.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List<Todo> todoList = [];

  save(Todo todo) {
    setState(() {
      todo.id = todoList.length.toString();
      print(todo.toMap());
      todoList.add(todo);
    });
  }

  edit(Todo todo) {
    print(todo.toMap());
    setState(() {
      todoList = todoList.map((element) {
        if (element.id == todo.id) {
          return todo;
        }
        return element;
      }).toList();
    });
  }

  String choice = "all";
  List listItems = ["all", "food", "outing", "church", "games"];
  @override
  Widget build(BuildContext context) {
    //creating a list to filter todo list
    List<Todo> showTodos = choice == "all"
        ? todoList
        : todoList
            .where((element) => element.category.toLowerCase() == choice)
            .toList();
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        title: Text(
          "ToDo List",
          style: TextStyle(
              color: Colors.white, fontSize: 60, fontWeight: FontWeight.bold),
        ),
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
            dropdownColor: kPrimaryColor,
            iconSize: 30,
            value: choice,
            icon: Icon(Icons.more_vert, color: Colors.white),
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
                        fontWeight: FontWeight.bold,
                      )));
            }).toList(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: goPageTwo),
      body:

          //check if show to is empty
          showTodos.isEmpty
              ? emptyState()
              : ListView.builder(
                  // count by nuber of item in showtodo
                  itemCount: showTodos.length,
                  itemBuilder: (context, index) {
                    Todo todo = showTodos[index];
                    return ListTile(
                      onTap: () => goEditView(todo),
                      title: Text(
                        todo.title,
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              todo.body,
                              style: TextStyle(color: Colors.blueGrey),
                              maxLines: 3,
                              textAlign: TextAlign.justify,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                todo.category,
                                style: TextStyle(color: Colors.yellow),
                              ),
                              Spacer(),
                              Text(
                                DateFormat("d-MM-y").format(todo.date),
                                style: TextStyle(color: Colors.yellow),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
    );
  }

  Widget emptyState() {
    return GestureDetector(
      onTap: goPageTwo,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.today_outlined,
              color: Colors.grey,
              size: 50,
            ),
            Text(
              "Add Todo",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 30,
              ),
            )
          ],
        ),
      ),
    );
  }

  void goPageTwo() {
    Navigator.push(
      (context),
      MaterialPageRoute(
        builder: (BuildContext context) => Page2(
          saveTodo: save,
        ),
      ),
    );
  }

  void goEditView(Todo todoToEdit) {
    Navigator.push(
      (context),
      MaterialPageRoute(
        builder: (BuildContext context) => EditView(
          editTodo: edit,
          todoToEdit: todoToEdit,
        ),
      ),
    );
  }
}
