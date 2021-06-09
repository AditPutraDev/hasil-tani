part of 'widgets.dart';

class Loading {
  static Widget circular({Color? color}) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? Colors.blue,
        ),
      ),
    );
  }

  static Widget threeBounce = SizedBox(
    height: 48,
    child: SpinKitThreeBounce(
      color: Color(0xFF43A8FC),
      size: 14,
    ),
  );
}
