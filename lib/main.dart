import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'screens/screens.dart';

import 'widgets/dismiss_focus_overlay.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      "pk_test_51HR70YEl4qWD7qdvRmXAQM14qlo2jaK2CbQXl5lB3jPfLp7omXF0qSmKxp2gO8CS6RUnlC1lkL4xt0ov2yMiBE8W00fGfIKxAp";
  Stripe.merchantIdentifier = 'MerchantIdentifier';
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DismissFocusOverlay(
      child: MaterialApp(
        //  theme: ThemeData.light(),
        //  theme: ThemeData.dark(),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Column(children: [
        ...ListTile.divideTiles(
          context: context,
          tiles: [
            for (final example in Example.values)
              ListTile(
                onTap: () {
                  final route = MaterialPageRoute(builder: example.builder);
                  Navigator.push(context, route);
                },
                title: Text(example.title),
                trailing: Icon(
                  Icons.chevron_right_rounded,
                ),
              ),
          ],
        ),
      ]),
    );
  }
}
