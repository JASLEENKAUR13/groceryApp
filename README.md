# Flutter BLoC Learning Project 🧠

**A practice e-commerce app built to master Flutter's BLoC state management pattern.**  
This was created for educational purposes to understand core BLoC concepts in a real-world scenario.

## Key Learning Objectives
- ✅ Implement BLoC architecture from scratch
- ✅ Manage complex state (products, wishlist, cart)
- ✅ Practice event-driven programming
- ✅ Understand `BlocProvider`, `BlocBuilder`, `BlocListener`

## Disclaimer
⚠️ **Note**: This is a learning project - not a production app.  
Some simplifications exist for educational clarity.

## Features
- 🛒 **Product Catalog** - Browse grocery items
- ❤️ **Wishlist** - Save favorite products
- 🧺 **Shopping Cart** - Add/remove items
- 🔄 **Real-time Updates** - Using BLoC state management
- 📱 **Responsive UI** - Works on mobile and web

## Tech Stack
- **Flutter** 3.x
- **BLoC** 8.x (State Management)
- **Dart** 3.x

## What I Learned
- ✅ BLoC separates business logic from UI, making code cleaner and more testable 
- ✅ Bloc plays the role of intermediate helped to passed the events to blocBuilder  and bloclistener.
- ✅ Provides a BLoC instance to the widget subtree.
- ✅ blocbuilder rebuilds the UI when a new state is passed using emit() , bloclistener listens the change in state and pass side effects like toast and scaffold.
- ✅ BLoC's Role: Acts as a middle layer that , Receives events from UI (like button presses) ,Processes logic ,Emits states back to update the UI
