import 'package:sdbapp/form/leasescreen1.dart';
import 'package:sdbapp/form/leasescreen2.dart';
import 'package:sdbapp/form/leasescreen3.dart';
import 'package:sdbapp/form/leasescreen4.dart';
import 'package:sdbapp/form/successscreen.dart';
import 'package:sdbapp/home/home.dart';

var appRoute = {
  '/': (context) => const HomeScreen(),
  '/leasescreen1': (context) => const LeaseDetailsScreen(),
  '/leasescreen2': (context) => const LesseeDetailsScreen(),
  '/leasescreen3': (context) => const LesseeSignatureScreen(),
  '/leasescreen4': (context) => const LeaseReviewScreen(),
  '/successscreen': (context) => const SuccessScreen(),
};
