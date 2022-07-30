import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/user.service.dart';



class UserView extends StatefulWidget
{
  const UserView({Key? key}) : super(key: key);
   @override
   _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<UserView>
{
  List<User> data=[];
  UserService userService =  UserService();
  @override
  void initState() 
  {
    userService.getAll().then((response) 
    {
      setState((){
        data = response;
      });
    });
    super.initState();
  }

    @override
    Widget build(BuildContext context) 
    {
      return Scaffold(
          appBar: AppBar(
              title: const Text('Users'),),
              body: ListView.builder(
                  itemCount: data.length,
                  itemBuilder:(context, index){
                    User item = data[index]; 
                    return Card(child: ListTile(
                      title: Text(item.name??""),
                      trailing: Row(
                          mainAxisSize: MainAxisSize.min, 
                        ),
                      onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => PageDetails(index),));
                      },
                    ),
                  );
                },
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, 'create');
          },
        child: const Icon(Icons.add),
        ),
    );
    }
}





























