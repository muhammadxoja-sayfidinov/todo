import 'package:flutter/material.dart';
import 'package:todo/models/plan_models.dart';

class PlansOfData extends StatelessWidget {
  final List plans;
  PlansOfData(this.plans);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(plans.length<10?'0${plans.length}':plans.length.toString(),style: const TextStyle(fontWeight:FontWeight.w600,fontSize: 17),),
              const Text('All your plans',style: TextStyle(fontSize: 15,color: Colors.black54),),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children:  [
              Text(plans.where((plan) => plan.isDone).length>10?
              '0${plans.where((plan) => plan.isDone).length}':
              '0${plans.where((plan) => plan.isDone).length}',
                  style: const TextStyle(fontWeight:FontWeight.w600,fontSize: 17)),
              const Text('Completed plans',style: TextStyle(fontSize: 15,color: Colors.black54),),
            ],
          ),
        ],
      ),
    );
  }
}
