import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoAction {
  Widget priorityButton(BuildContext context) {
    return FlatButton(
        focusColor: Theme.of(context).primaryColor.withOpacity(0.3),
        padding: EdgeInsets.all(3.ssp),
        onPressed: () {},
        child: Row(
          children: [
            Icon(
              Icons.flag_outlined,
              size: 25.ssp,
            ),
            SizedBox(
              width: 3.w,
            ),
            Text(
              'Приоритет',
              style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.ssp),
            )
          ],
        ));
  }

  Widget dateButton(
      {BuildContext context, VoidCallback onPressed, int dif = 0}) {
    return FlatButton(
        padding: EdgeInsets.all(3.ssp),
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(
              Icons.calendar_today_outlined,
              size: 25.ssp,
            ),
            SizedBox(
              width: 3.w,
            ),
            Text(
              dif == null
                  ? 'Сегодня'
                  : '${dif.toString()} ${((dif.abs() % 10 < 5 && dif.abs() % 10 > 1)) ? 'дня' : dif.abs() % 10 == 1 ? 'день' : dif.abs() % 10 == 0 || (dif.abs() % 10 > 5 && dif.abs() % 10 < 10) ? 'дней' : ''}',
              style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.ssp),
            )
          ],
        ));
  }

  Widget listButton(BuildContext context) {
    return FlatButton(
        padding: EdgeInsets.all(3.ssp),
        onPressed: () {},
        child: Row(
          children: [
            Icon(
              Icons.list_rounded,
              size: 25.ssp,
            ),
            SizedBox(
              width: 3.w,
            ),
            Text(
              'Список',
              style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.ssp),
            )
          ],
        ));
  }
}
