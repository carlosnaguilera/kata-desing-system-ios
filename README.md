# Design System Technical Test - Solution

### **Implementation Instructions**

I've created the requested component in its UIKit and SwiftUI versions. In both cases, we need to pass two parameters to their initializers:

- Kind: it's an enum with three possible values (error, success and notification). From this value we get which colors we need to use and part of the text to be displayed
- Message: the text we display in the alert

### **Comments**

- The app is ready for dark mode: Color assets have their light and dark variant. Dark variants could look nicer, but the main point was to show how to make it ready for dark mode
- I'm using the images of the icons of every kind as templates. This makes easier keeping consistency between text and icon colors
- I've updated the showroom apps to display the components. However, I didn't put much effor there. I've only implemented something fast and functional. I understood the focus of codign challenge wasn't there.
- I've created some enums manually to handle colors and icons. As there were few elements, it was ok. In a bigger project we could use a generator as Swifgen or R.swift
- The solution includes a package with design tokens. Again no big issue with a small project. However, in an ideal world we should try to create them in some automatized way from Figma

