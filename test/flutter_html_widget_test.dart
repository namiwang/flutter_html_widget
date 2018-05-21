import 'package:flutter_test/flutter_test.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_html_widget/flutter_html_widget.dart';

void main() {

  testWidgets('basic parsing', (WidgetTester tester) async {

    final html = """
    <section class="homepage__key_points card">
      <h1 class="homepage__title">
        Build beautiful native apps in record time
      </h1>

      <div class="homepage__tagline">
        Flutter is Google’s mobile app SDK for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.
      </div>
    </section>
    """;

    final key = new UniqueKey();

    await tester.pumpWidget(
      new StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return new MaterialApp(
            home: new Material(
              child: new HtmlWidget(html: html, key: key)
            ),
          );
        },
      ),
    );

    // NOTE an ugly way to get the rendered Wrap Element
    final renderedElement = find.byKey(key).evaluate().first;
    final Wrap renderedWrap = new HtmlWidget(html: html).build(renderedElement);

    expect(
      ( ( renderedWrap.children.first as Container ).child as RichText).text.children.first.text,
      "Build beautiful native apps in record time"
    );

    expect(
      ( ( renderedWrap.children[1] as Container ).child as RichText).text.children.first.text,
      "Flutter is Google’s mobile app SDK for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source."
    );

    // NOTE can't compare directly
    // expect(
    //   renderedWrap,
    //   new Wrap(
    //     children: <Widget>[
    //       new Container(
    //         padding: EdgeInsets.all(8.0),
    //         child: new RichText(
    //           text: new TextSpan(
    //             children: [
    //               new TextSpan(text: "Build beautiful native apps in record time")
    //             ]
    //           ),
    //         )
    //       )
    //     ],
    //   )
    // );
  });
}
