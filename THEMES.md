### What are Themes
PokeMMO uses a modified version of a library called [Themable Widget Library (TWL)](https://github.com/MatthiasMann/twl).  
A UI build with this library consists of Widgets. A Widget can be something simple like a Button, but also something complex like the PC. 
A widget can have child-widget that are contained, like how the Hotbar is in itself a complete widget, but consists of multiple buttons. A widget handles the layouting of it's child widgets.  
A widget defines it's looks like the background image, size, color, fonts and more. The complete definition of a widget is referred to as a "Theme". These properties are by default loaded from `xml` supplied with the game.  
Themes can modify the looks of a UI, but usually not the layout. Actions can be modified to a limited degree.  
Technically, every Widget has it's own "Theme" and a `xml` file changing multiple widgets would be multiple "Themes". This document will continue to use this naming, and refer to a bundle of Widget-Themes as a "UI-Theme". A xml file containing TWL Themes will be called a "Theming File".

### Theme basics
When the game loads it looks for a `theme.xml` file. This is the entry point for the loading of the themes.  
The base layout for every TWL Theming file is the same:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<themes>
    ...
</themes>
```
Inside the `themes` block you can start to define your actual content.  

A theming file can include and reference other theming files relative to itself:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<themes>
    <include filename="myOtherThemes.xml"/>
    ...
</themes>
```
Theming files are parsed sequentially from top to bottom, and a `include` theming file will be fully parsed before continuing with the parent file.

The following `xml` tags exist in the root block:
- [`<images/texture>`](#images-and-textures)


### XML Root Tags
#### Images and Textures
`<images>` and `<textures>` are aliases and work identically. We will use `images` from here on.  
The following attributes are supported:
- `file`: The file-path to an image file relative the location of the theming file. Only PNG files are supported
- `format`: Currently unused, don't be confused if you see it.
- `filter`: Defines the texture filtering algorithm applied. Valid input is `nearest` (default) and `linear`. See [Texture Filtering](https://learnopengl.com/Getting-started/Textures) for more explanation.
- `comment`: Unused

The following sub-tags are supported:
- `area`
- `alias`
- `composed`
- `select`
- `grid`
- `animation`
- `gradient`
- `cursor`