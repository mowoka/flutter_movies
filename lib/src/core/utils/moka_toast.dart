import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum MessageStatus { success, warning, error }

class MokaToast {
  static void showToast({
    required FToast fToast,
    required String message,
    required MessageStatus messageStatus,
  }) {
    Widget messageComponent;

    switch (messageStatus) {
      case MessageStatus.success:
        messageComponent = successMesage(message);
        break;
      case MessageStatus.warning:
        messageComponent = warningMesage(message);
        break;
      case MessageStatus.error:
        messageComponent = errorMesage(message);
        break;
      default:
        messageComponent = successMesage(message);
    }

    fToast.showToast(
      child: messageComponent,
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 3),
    );
  }
}

Widget successMesage(String message) {
  return Container(
    transform: Matrix4.translationValues(0, -30, 0),
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.green,
    ),
    child: Row(
      children: [
        const Icon(
          Icons.check,
          color: Colors.white,
        ),
        const SizedBox(
          width: 12.0,
        ),
        Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

Widget errorMesage(String message) {
  return Container(
    transform: Matrix4.translationValues(0, -30, 0),
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.red,
    ),
    child: Row(
      children: [
        const Icon(
          Icons.error,
          color: Colors.white,
        ),
        const SizedBox(
          width: 12.0,
        ),
        Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

Widget warningMesage(String message) {
  return Container(
    transform: Matrix4.translationValues(0, -30, 0),
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.yellow,
    ),
    child: Row(
      children: [
        const Icon(
          Icons.warning,
          color: Colors.black,
        ),
        const SizedBox(
          width: 12.0,
        ),
        Text(
          message,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
