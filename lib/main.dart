import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mayank_form_app/app/autofill.dart';
import 'package:mayank_form_app/app/form_widgets.dart';
import 'package:mayank_form_app/app/http/mockclient.dart';
import 'package:mayank_form_app/app/sign_in_http.dart';
import 'package:mayank_form_app/app/validation.dart';

// Set up a mock HTTP client.
final http.Client httpClient = MockClient();

void main() {
  runApp(FormApp());
}

final demos = [
  Demo(
    name: 'Sign in with HTTP',
    route: '/signin_http',
    builder: (context) => SignInHttpDemo(
      httpClient: httpClient,
    ),
  ),
  Demo(
    name: 'Autofill',
    route: '/autofill',
    builder: (context) => AutofillDemo(),
  ),
  Demo(
    name: 'Form widgets',
    route: '/form_widgets',
    builder: (context) => FormWidgetsDemo(),
  ),
  Demo(
    name: 'Validation',
    route: '/validation',
    builder: (context) => FormValidationDemo(),
  ),
];

class FormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Samples',
      theme: ThemeData(primarySwatch: Colors.teal),
      routes: Map.fromEntries(demos.map((d) => MapEntry(d.route, d.builder))),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Samples'),
      ),
      body: ListView(
        children: [...demos.map((d) => DemoTile(d))],
      ),
    );
  }
}

class DemoTile extends StatelessWidget {
  final Demo demo;

  DemoTile(this.demo);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(demo.name),
      onTap: () {
        Navigator.pushNamed(context, demo.route);
      },
    );
  }
}

class Demo {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const Demo({this.name, this.route, this.builder});
}