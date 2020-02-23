
import 'package:flutter/material.dart';
import 'package:hr/Component/progress.dart';
import 'package:hr/Provider/Colors.dart';

class CustomProgressBar extends StatefulWidget {
  final int currentpage;
  final int custom;
  CustomProgressBar(this.currentpage,this.custom);
  @override
  _CustomProgressBarState createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends State<CustomProgressBar> {
  var _stepsText = [ "Personal", "Experiences", "Account"];
  @override
  void initState() {
    if(widget.custom==1){
      _stepsText = [ "Personal", "Experiences", "Account"];
    }else if(widget.custom==2){
      _stepsText = [ "Information", "AD Details"];
    }
    super.initState();
  }


  final _stepCircleRadius = 14.0;

  final _stepProgressViewHeight = 70.0;

  Color _activeColor = ColorsProvider().primary;

  Color _inactiveColor = Color(0xffe3eaff);

  // TextStyle _headerStyle =
  //     TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);

  TextStyle _stepStyle = TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      color: ColorsProvider().primary);
  int _curPage = 1;
  ProgressBar _getStepProgress() {
    setState(() {
      _curPage = widget.currentpage;
    });
    return ProgressBar(
      _stepsText,
      _curPage,
      _stepProgressViewHeight,
      double.infinity,
      _stepCircleRadius,
      _activeColor,
      _inactiveColor,
      _stepStyle,
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.only(
        top: 14.0,
        left: 14.0,
        right: 14.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(height: 70.0, child: _getStepProgress());
  }
}
