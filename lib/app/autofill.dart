import 'package:flutter/material.dart';

// Demonstrates how to use autofill hints. The full list of hints is here:
// https://github.com/flutter/engine/blob/master/lib/web_ui/lib/src/engine/text_editing/autofill_hint.dart
class AutofillDemo extends StatefulWidget {
  @override
  _AutofillDemoState createState() => _AutofillDemoState();
}

class _AutofillDemoState extends State<AutofillDemo> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Autofill'),
      ),
      body: Form(
        key: _formKey,
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: AutofillGroup(
              child: Column(
                children: [
                  ...[
                    Text('This sample demonstrates autofill. '),
                    TextFormField(
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Jane',
                        labelText: 'First Name',
                      ),
                      autofillHints: [AutofillHints.givenName],
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Doe',
                        labelText: 'Last Name',
                      ),
                      autofillHints: [AutofillHints.familyName],
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'foo@example.com',
                        labelText: 'Email',
                      ),
                      autofillHints: [AutofillHints.email],
                    ),
                    TextField(
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: '(123) 456-7890',
                        labelText: 'Telephone',
                      ),
                      autofillHints: <String>[AutofillHints.telephoneNumber],
                    ),
                    TextField(
                      keyboardType: TextInputType.streetAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: '123 4th Ave',
                        labelText: 'Street Address',
                      ),
                      autofillHints: <String>[AutofillHints.streetAddressLine1],
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: '12345',
                        labelText: 'Postal Code',
                      ),
                      autofillHints: <String>[AutofillHints.postalCode],
                    ),
                    TextField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'United States',
                        labelText: 'Country',
                      ),
                      autofillHints: <String>[AutofillHints.countryName],
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '1',
                        labelText: 'Country Code',
                      ),
                      autofillHints: <String>[AutofillHints.countryCode],
                    ),
                  ].expand(
                        (widget) => [
                      widget,
                      SizedBox(
                        height: 24,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}