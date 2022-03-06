import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DateOfPlans extends StatelessWidget {
  final Function  dateSelect;
  final DateTime markedDay;
  final Function nextDay;
  final Function beforetDay;
   DateOfPlans(this.dateSelect,this.markedDay,this.nextDay,this.beforetDay);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed:(){ beforetDay();},
            icon:const Icon(Icons.arrow_left,size: 35,)),
        TextButton(onPressed:(){ dateSelect(context);},
          child: RichText(
            text:  TextSpan(
              style: TextStyle(
                fontSize: 23,
                color: Colors.black,
                fontFamily: GoogleFonts.abhayaLibre().fontFamily,),
              children:  [
                TextSpan(
                    text: '${DateFormat.EEEE().format(markedDay)}, ',
                    style:const TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                    text: DateFormat('d MMM').format(markedDay)),
              ],
            ),
          ),
        ),
        IconButton(onPressed: (){nextDay();}, icon:const Icon(Icons.arrow_right,size: 35,))
      ],
    );
  }
}

