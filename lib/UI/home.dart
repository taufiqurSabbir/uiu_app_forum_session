import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> todos = [];
  TextEditingController taskcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('MyToDo'),
       centerTitle: false,
       actions: [
         Icon(Icons.add),
       ],

     ),
     body: SafeArea(
       child: Container(
         child: SingleChildScrollView(
           child: Column(
             children: [
               TextField(
                 controller:taskcontroller ,
                 decoration: InputDecoration(
                   labelText: 'Enter your task',
                 ),
                 onSubmitted: (value){

                   setState(() {
                     if(value != ''){
                       todos.add(value);
                       taskcontroller.clear();
                     }else{
                      
                       ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text('Empty value not allow')));
                     }

                   });
                 },
               ),
               SizedBox(height: 10,),
               SizedBox(
                  height: 700,
                 width: 500,
                 child: Expanded(
                   child: ListView.builder(
                     itemCount: todos.length,
                       itemBuilder: (context,index){
                         return Padding(
                           padding: const EdgeInsets.symmetric(vertical: 15.0),
                           child: Container(
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(20),
                                 boxShadow: [
                                   BoxShadow(
                                     color: Colors.grey.withOpacity(0.5),
                                     spreadRadius: 5,
                                     blurRadius: 7,
                                     offset: Offset(0, 3), // changes position of shadow
                                   ),
                                 ],

                               ),
                             child: ListTile(
                               title: Text(todos[index],style: TextStyle(fontSize: 19),),
                               trailing: IconButton( onPressed: () {
                                 setState(() {
                                   todos.removeAt(index);
                                 });

                               }, icon: Icon(Icons.delete),)
                             ),
                           ),
                         );
                       }

                   ),
                 ),
               )
             ],
           ),
         ),
       ),
     ),
     floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),
   );
  }
}
