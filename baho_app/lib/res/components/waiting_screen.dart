


import 'package:baho_app/consts/consts.dart';

class WaitingScreen extends StatefulWidget {
  const WaitingScreen({super.key});
  @override
  State<WaitingScreen> createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}