import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTML Page"),
      ),
      body: Html(
        data: """
          <div>
            <h1>Hello, World!</h1>
            <p>This is HTML content</p>
          </div>
        """,
        style: {
          "html": Style(
            backgroundColor: Colors.black12,
          ),
          "h1": Style(
            textAlign: TextAlign.center,
          ),
        },
      ),
    );
  }
}
