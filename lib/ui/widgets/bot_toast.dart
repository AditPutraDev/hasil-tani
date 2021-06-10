part of 'widgets.dart';

void showBotToastText(text) {
  BotToast.showText(
    text: text.toString(),
    textStyle: titleToastStyle,
    duration: Duration(seconds: 3),
    borderRadius: BorderRadius.all(Radius.circular(25)),
    clickClose: true,
    contentColor: Colors.grey.shade300,
    contentPadding: EdgeInsets.fromLTRB(20, 12.5, 20, 12.5),
  );
}
