import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
class BuildButton extends StatefulWidget {

  double hight;
  String buttonname;
  Function function;
  BuildButton(this.hight,this.buttonname,this.function);
  @override
  _BuildButtonState createState() => _BuildButtonState();
}

class _BuildButtonState extends State<BuildButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.function,
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 4,
            ),
            shape: BoxShape.circle),
        child: CircleAvatar(
          radius: widget.hight * 0.5,
          child: Container(
            height: (MediaQuery.of(context).size.height * 0.63) * 0.3,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: ((MediaQuery.of(context).size.height * 0.63) * 0.3) *
                      0.22,
                ),
                Icon(
                  (widget.buttonname=="Camera")?Icons.camera_alt:Icons.photo,
                  size: ((MediaQuery.of(context).size.height * 0.5) * 0.3) *
                      0.45,
                  color: Colors.white,
                ),
                Container(
                  height:
                  ((MediaQuery.of(context).size.height * 0.63) * 0.3) * 0.15,
                  child: FittedBox(
                    child: AutoSizeText(
                      widget.buttonname,
                      style: TextStyle(fontSize: 7, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          backgroundColor: Colors.black.withOpacity(0.1),
        ),
      ),
    );
  }
}
