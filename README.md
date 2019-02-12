# Style Framework

[Demo](https://lucamug.github.io/style-framework/)

## Version 2.0.0

**Summary:** All new files are named filenameNew. ColorNew, ConfigurationNew, ButtonNew are mostly complete, still need to revamp Color, Form, Typography, Spinner/Icon/Logo into one module (maybe SVG?). The Style Guide needs to be completely revamped, remove introspection. See usage of new Configuration, Color and Button by running `npm install` followed by `cmd/start-example-button`.

### Main concepts for 2.0.0

### Consistent API with elm-ui

Have a consistent API with elm-ui. Remove any functions that do not have functional differences from elm-ui. For example, rather than `Framework.Button.button`, which simply creates a nicely styled `Element.Input.button`, use

```elm
Element.Input.button (Framework.Modifier.toAttrButton [Modifiers...] ) [...]
```

Only have a new API for new elements introduced in the Framework, such as fancy input boxes or cards.

#### Customizability and Configuartion/Palette

Define a record type that holds things like font size, button height, colors, etc. These can be used on their own, like `Font.size <| Configuration.default.font.small`, or with the Modifier system. This allows for easy customizability of the farmework.

Perhaps a better name for this is "Palette", as mdgriffith has called his experimental system.

A customized Configuration can be stored in an application's model and passed in to the respective functions to easily customize the framework to your needs while still having a lot of the 'dirty work' done for you (like nicely shaped buttons, border, opacity, etc.).

### Modifiers

A semantic way of describing what an element should be styled like. For example, a button that has the Modifiers `Large` and `Primary` would be a large size and of the primary color.

This is similar to what most CSS Frameworks do, like Bulma and Bootstrap, and are in fact heavily inspired by them.

There are functions provided to convert Modifiers into elm-ui attributes. By default they use the default configuration (palette), but a custom Configuration can be given.

For example:

```elm
Element.Input.button (Modifier.toButtonAttr Nothing [Primary]) {onPress = ...}
```

But you could also do:

```elm
Element.link (Modifier.toButtonAttr Nohting [Primary]) {url = ...}
```

to make a link that looks like a button. Remember, Modifiers simply **style** an element according to what the element is. Can easily be combined with other elm-ui Attributes (the Attributes take precdence by reverse order (last ones added get precedence)).

#### Colors

A new Color system that uses elm-ui Color. Contextual colors are taken from Bulma.

#### Better Style Guide

* Rewrite the Style Guide without introspection. Offer better code previews (possibly syntax highlighting), as well as a way to easily preview what an element looks with applied Modifiers.

### Completed

* A new Color system
* New Modifier system
* New Configuration/Palette system
* Rewritten buttons module that follow the idea of using the elm-ui API with Modifiers and Configuration

### TO-DO

* Improved Style Guide
* Rewrite Input, Typography, Card modules
* Complete new Button module, mostly the different button sizes
* Complete new Color module (hex color if there's time, color manipulation)

## An experimental Style Framework built on top of elm-ui

This is a Style Framework built on top of the great library [elm-ui](https://package.elm-lang.org/packages/mdgriffith/elm-ui/latest/). It is still experimental. Major changes may happen at any time to this Repo. Feedbacks and contributions are welcome.

## Customization

The framework allows customization on several levels. Have a look at this [example code](https://github.com/lucamug/style-framework/tree/master/examples/exampleCustomized/src) to see how the customization is made.

In the image below: on the top left, the default version. On the bottom right the customized version.

[![Customization](https://lucamug.github.io/style-framework/images/framework-customizations-600.png)](https://lucamug.github.io/style-framework/)

## Style guide generator

The framework has a built-in style guide generator that can be used as a quick reference during the UI design. The style guide is generated using functions called `introspection` present in each module of the framework.

## Usage

This is a minimal example of the framework usage, it just displays a green button:

```elm
module Main exposing (main)

import Element exposing (layout)
import Framework.Button as Button
import Framework.Modifier exposing (Modifier(..))
import Html


main : Html.Html a
main =
    layout [] <|
        Button.button
            [ Medium
            , Success
            , Outlined
            ]
            Nothing
            "Button"
```

This is [the result](https://lucamug.github.io/style-framework/exampleButton.html):

[![Button](https://lucamug.github.io/style-framework/images/framework-button-example.png)](https://lucamug.github.io/style-framework/exampleButton.html)

## Examples

For the entire list of examples, have a look at the [examples](https://github.com/lucamug/style-framework/tree/master/examples/) folder in the repo. It contains:

* [Button Example](https://lucamug.github.io/style-framework/generated-exampleSPA.html)
* [Customized Framework Example](https://lucamug.github.io/style-framework/generated-exampleCustomized.html)
* [Single Page Application Example](https://lucamug.github.io/style-framework/generated-exampleSPA.html)
