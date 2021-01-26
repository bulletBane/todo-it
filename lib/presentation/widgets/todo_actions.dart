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

  Widget dateButton(BuildContext context) {
    return FlatButton(
        padding: EdgeInsets.all(3.ssp),
        onPressed: () {},
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
              'Сегодня',
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
