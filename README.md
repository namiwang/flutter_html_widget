# flutter_html_widget

This widget turn html string into flutter widgets like Text, RichText and Table.

This is **so not a webview alternative**. Think this as a **read mode** for simple html elements.

The widget is extracted from [wiki-flutter](https://github.com/namiwang/wiki-flutter), and is initially designed for html segments in the mobile version of wikipedia articles only, so there's gonna be **many, many issues** for arbitrary html segments.

## demo

````dart
import 'package:flutter_html_widget/flutter_html_widget.dart';

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

new MaterialApp(
  home: new Material(
    child: new HtmlWidget(html: html, key: key)
  ),
);
````

will produce widgets like

```dart
new Wrap(
  children: <Widget>[
    new Container(
      padding: EdgeInsets.all(8.0),
      child: new RichText(
        text: new TextSpan(
          children: [
            new TextSpan(text: "Build beautiful native apps in record time")
          ]
        ),
      )
    )
  ],
)
```

## features

### supported

- basic text, link, paragraph, list, image, caption, etc.

### on the roadmap

- styles for `<b>` `<i>` `<small>` `<section>` `<h12345>` etc
- inline images
- video element
- more options

### not for now

- complex table
