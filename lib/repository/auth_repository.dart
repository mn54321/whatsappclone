// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dialog_alert/dialog_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsappclone/routes/routes.dart';

final authRepositoryProvider = Provider((ref) {
  return AuthRepository(
      auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance);
});

class AuthRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRepository({required this.auth, required this.firestore});

  void verifysmscode({
    required BuildContext context,
    required String smsCodeId,
    required String smsCode,
    required bool mounted,
  }) async {
    try {
      final Credential = PhoneAuthProvider.credential(
          verificationId: smsCodeId, smsCode: smsCode);
      await auth.signInWithCredential(Credential);
      if (!mounted) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(routes.profile, (route) => false);
      }
    } on FirebaseAuth catch (e) {
      showDialogAlert(
          context: context,
          title: '',
          message: e.toString(),
          actionButtonTitle: '');
    }
  }

  void sendSmsCode(
      {required BuildContext context, required String phoneNumber}) async {
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await auth.signInWithCredential(credential);
          },
          verificationFailed: (e) {
            showDialogAlert(
                context: context,
                title: 'Faild',
                message: e.toString(),
                actionButtonTitle: 'ok');
          },
          codeSent: (smsCodeId, resendSmsCodeId) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                routes.verification, (route) => false, arguments: {
              'phoneNumber': phoneNumber,
              'smsCodeId': smsCodeId
            });
          },
          codeAutoRetrievalTimeout: (String smsCodeId) {});
    } on FirebaseAuth catch (e) {
      showDialogAlert(
          context: context,
          title: 'OTP',
          message: e.toString(),
          actionButtonTitle: 'ok');
    }
  }
}
