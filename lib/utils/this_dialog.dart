

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class ADialog {
  ADialog._privateConstructor();

  // static final ChacaDialog instance = ChacaDialog._privateConstructor();
  static bool _isAppCurrentlyShowingDialog = false;

  static void showSuccessDialog(
      BuildContext context, {
        String? descText,
        String? titleText,
        Function(DismissType type)? onDismissCallback,
        Function? btnOkOnPressCallback,
      }) {
    if (!_isAppCurrentlyShowingDialog) {
      _isAppCurrentlyShowingDialog = true;
      AwesomeDialog(
        dismissOnTouchOutside: false,
        dismissOnBackKeyPress: false,
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.bottomSlide,
        title: titleText ?? 'Success',
        desc: descText ?? 'Success',
        btnOkOnPress: () {
          if (btnOkOnPressCallback != null) btnOkOnPressCallback();
        },
        onDismissCallback: (_) {
          _isAppCurrentlyShowingDialog = false;
          if (onDismissCallback != null) onDismissCallback(_);
        },
      ).show();
    }
  }

  static void showErrorDialog(
      BuildContext context, {
        String? titleText,
        String? descText,
        String? customBtnOkText,
        Function(DismissType type)? onDismissCallback,
      }) {
    if (!_isAppCurrentlyShowingDialog) {
      _isAppCurrentlyShowingDialog = true;
      AwesomeDialog(
        dismissOnTouchOutside: false,
        dismissOnBackKeyPress: false,
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.bottomSlide,
        title: titleText ?? 'Failed',
        desc: descText ?? 'Please contact support or try again later',
        btnOkText: customBtnOkText,
        btnOkOnPress: () {},
        onDismissCallback: (_) {
          _isAppCurrentlyShowingDialog = false;
          if (onDismissCallback != null) onDismissCallback(_);
        },
      ).show();
    }
  }

  static void showWarningDialog(
      BuildContext context, {
        String? titleText,
        required String descText,
        Function(DismissType type)? onDismissCallback,
        required dynamic Function() btnOkOnPressCallback,
      }) {
    if (!_isAppCurrentlyShowingDialog) {
      _isAppCurrentlyShowingDialog = true;
      AwesomeDialog(
        dismissOnTouchOutside: false,
        dismissOnBackKeyPress: false,
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.bottomSlide,
        title: titleText ?? 'Warning',
        desc: descText,
        btnOkOnPress: btnOkOnPressCallback,
        btnCancelOnPress: () {},
        onDismissCallback: (_) {
          _isAppCurrentlyShowingDialog = false;
          if (onDismissCallback != null) onDismissCallback(_);
        },
      ).show();
    }
  }
  
  
  // static void showMockedLocationWarnDialog(
  //     BuildContext context, {
  //       VoidCallback? onClose,
  //     }) {
  //   print('showMockedLocationWarnDialog triggered');
  //   if (!_isAppCurrentlyShowingDialog) {
  //     _isAppCurrentlyShowingDialog = true;
  //     showDialog(
  //       // useRootNavigator: true,
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (ctx) => WillPopScope(
  //         onWillPop: () {
  //           // Navigator.pop(context);
  //           return Future.value(false);
  //         },
  //         child: AlertDialog(
  //           actionsPadding: EdgeInsets.all(8.0),
  //           content: Text(
  //             "mock_location_detected_desc_text".tr(),
  //             style: GoogleFonts.mulish(
  //               fontSize: 16,
  //               color: Colors.black,
  //             ),
  //           ),
  //           actions: [
  //             InkWell(
  //               onTap: () {
  //                 onClose?.call();
  //                 Navigator.pop(
  //                   ctx,
  //                 );
  //                 Navigator.pop(
  //                   context,
  //                 );
  //               },
  //               child: Padding(
  //                 padding: EdgeInsets.all(8.0),
  //                 child: Text(
  //                   'cancel_text'.tr().toUpperCase(),
  //                   style: GoogleFonts.mulish(
  //                     fontSize: 14,
  //                     color: kChacaYellowColor,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             InkWell(
  //               onTap: () async {
  //                 Navigator.pop(
  //                   ctx,
  //                 );
  //                 onClose?.call();
  //                 Geolocator.openAppSettings();
  //               },
  //               child: Padding(
  //                 padding: EdgeInsets.all(8.0),
  //                 child: Text(
  //                   'go_to_settings_text'.tr().toUpperCase(),
  //                   style: GoogleFonts.mulish(
  //                     fontSize: 14,
  //                     color: kChacaYellowColor,
  //                   ),
  //                 ),
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     );
  //   }
  // }
  
}
