import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class ModalBottom extends StatefulWidget {
  final Function addPlan;

  @override
  State<ModalBottom> createState() => _ModalBottomState();
  ModalBottom(this.addPlan);

}
class _ModalBottomState extends State<ModalBottom> {
  DateTime? markedDayForAdd ;
  final _namePlanController = TextEditingController();
 void openCalendarForAddPlan(BuildContext context){
   showDatePicker(
     context: context,
     initialDate: DateTime.now(),
     firstDate: DateTime.now(),
     lastDate: DateTime(2030),
   ).then((selectedDay){
     if (selectedDay != null){
       setState(() {
         markedDayForAdd = selectedDay;
       });
     };
   });
 }
 void submit(){
   if (_namePlanController.text.isEmpty || markedDayForAdd == null){
     return;
   }
    widget.addPlan(_namePlanController.text,markedDayForAdd);
 }


 @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: Padding(
          padding:  EdgeInsets.only(
              top: 0,
              left: 16,
              right: 16,
              bottom:MediaQuery.of(context).viewInsets.bottom > 0?
          MediaQuery.of(context).viewInsets.bottom +16 :
          MediaQuery.of(context).size.height * 0.25),
          child: Column(
            children:   [
               TextField(
                decoration: const InputDecoration(
                  label:Text('Plan name'),
                ),
                controller: _namePlanController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text( markedDayForAdd == null ?'Plan day not selected':DateFormat.MMMMEEEEd().format(markedDayForAdd!),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.normal)),
                  TextButton(
                      onPressed: (){openCalendarForAddPlan(context);}, child: const Text('Choose the day',style: TextStyle(color: Colors.amber,fontSize: 15),)
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatButton(
                    onPressed: Navigator.of(context).pop,
                    child: const Text('Cancel',style: TextStyle(color: Colors.black54),),
                  ),
                  ElevatedButton(
                    onPressed:submit,
                    style: ButtonStyle(
                        backgroundColor:MaterialStateProperty.all<Color>(Colors.amber)),
                    child: const Text('Add',
                      style: TextStyle(
                          color: Colors.black),), ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
