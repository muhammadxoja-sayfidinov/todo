import 'package:flutter/material.dart';
import 'package:todo/models/plan_models.dart';

class Plan extends StatelessWidget {
  final PlansModel plans;
  final Function markDone;
  final Function planDelete;
  Plan(this.plans, this.markDone, this.planDelete,);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
      leading: IconButton(
        onPressed: (){markDone(plans.id);},
        icon:plans.isDone?
        const Icon(Icons.check_circle_outline,color: Colors.green,) :
        const Icon(Icons.circle_outlined),),
      title:Text(plans.name,
        style:  TextStyle(

          fontSize: 16,
          fontWeight:FontWeight.w600,
          decoration:
          plans.isDone? TextDecoration.lineThrough :  TextDecoration.none,
          color:plans.isDone? Colors.black54: Colors.black )),
      trailing: IconButton(
        onPressed: (){planDelete(plans.id);},
        icon: const Icon(Icons.delete),
      ), );
  }
}
