const String appbarDescription = '''A Material Design app bar.

An app bar consists of a toolbar and potentially other widgets, such as a
[TabBar] and a [FlexibleSpaceBar]. App bars typically expose one or more
common [actions] with [IconButton]s which are optionally followed by a
[PopupMenuButton] for less common operations (sometimes called the "overflow
menu").

App bars are typically used in the [Scaffold.appBar] property, which places
the app bar as a fixed-height widget at the top of the screen. For a scrollable
app bar, see [SliverAppBar], which embeds an [AppBar] in a sliver for use in
a [CustomScrollView].

The AppBar displays the toolbar widgets, [leading], [title], and [actions],
above the [bottom] (if any). The [bottom] is usually used for a [TabBar]. If
a [flexibleSpace] widget is specified then it is stacked behind the toolbar
and the bottom widget. The following diagram shows where each of these slots
appears in the toolbar when the writing language is left-to-right (e.g.
English):

The [AppBar] insets its content based on the ambient [MediaQuery]'s padding,
to avoid system UI intrusions. It's taken care of by [Scaffold] when used in
the [Scaffold.appBar] property. When animating an [AppBar], unexpected
[MediaQuery] changes (as is common in [Hero] animations) may cause the content
to suddenly jump. Wrap the [AppBar] in a [MediaQuery] widget, and adjust its
padding such that the animation is smooth.

![The leading widget is in the top left, the actions are in the top right,
the title is between them. The bottom is, naturally, at the bottom, and the
flexibleSpace is behind all of them.](https://flutter.github.io/assets-for-api-docs/assets/material/app_bar.png)

If the [leading] widget is omitted, but the [AppBar] is in a [Scaffold] with
a [Drawer], then a button will be inserted to open the drawer. Otherwise, if
the nearest [Navigator] has any previous routes, a [BackButton] is inserted
instead. This behavior can be turned off by setting the [automaticallyImplyLeading]
to false. In that case a null leading widget will result in the middle/title widget
stretching to start.''';

const String silverAppBarDescription = '''A Material Design app bar that integrates with a [CustomScrollView].

An app bar consists of a toolbar and potentially other widgets, such as a
[TabBar] and a [FlexibleSpaceBar]. App bars typically expose one or more
common actions with [IconButton]s which are optionally followed by a
[PopupMenuButton] for less common operations.

{@youtube 560 315 https://www.youtube.com/watch?v=R9C5KMJKluE}

Sliver app bars are typically used as the first child of a
[CustomScrollView], which lets the app bar integrate with the scroll view so
that it can vary in height according to the scroll offset or float above the
other content in the scroll view. For a fixed-height app bar at the top of
the screen see [AppBar], which is used in the [Scaffold.appBar] slot.

The AppBar displays the toolbar widgets, [leading], [title], and
[actions], above the [bottom] (if any). If a [flexibleSpace] widget is
specified then it is stacked behind the toolbar and the bottom widget.''';

const String textDescription = '''A run of text with a single style.

The [Text] widget displays a string of text with single style. The string
might break across multiple lines or might all be displayed on the same line
depending on the layout constraints.

The [style] argument is optional. When omitted, the text will use the style
from the closest enclosing [DefaultTextStyle]. If the given style's
[TextStyle.inherit] property is true (the default), the given style will
be merged with the closest enclosing [DefaultTextStyle]. This merging
behavior is useful, for example, to make the text bold while using the
default font family and size.''';

const String buttonsDescription = '''The following buttons have changed when updating from Flutter 2.0 to 3.0. 

FlatButton() -> TextButton()
RaisedButton() -> ElevatedButton()
OutlineButton() -> OutlinedButton()

Also, FilledButton was added in Flutter 3.0.
FilledButton(), FilledButton.tonal()''';
