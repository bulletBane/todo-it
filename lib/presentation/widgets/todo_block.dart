import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_it/presentation/widgets/todo_actions.dart';

class TodoBlock extends StatefulWidget {
  TodoBlock({Key key}) : super(key: key);

  @override
  _TodoBlockState createState() => _TodoBlockState();
}

class _TodoBlockState extends State<TodoBlock> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Container(
          width: 1.sw,
          child: InkWell(
            onTap: () => null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                        value: value,
                        onChanged: (val) {
                          setState(() {
                            value = val;
                          });
                        }),
                    Text(
                      'Скачать то то',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 20.ssp),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(right: 15.w),
                  height: 15.h,
                  width: 15.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.ssp),
                      color: Theme.of(context).primaryColor),
                )
              ],
            ),
          )),
    );
  }
}
