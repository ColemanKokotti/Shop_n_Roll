Grocery List App

A Flutter project for managing a grocery shopping list.

Getting Started

This project is a simple grocery list app that helps users manage their shopping list efficiently with Firebase integration.

A few resources to get you started if you're setting up the project:

Flutter Documentation
Firebase Documentation
Features
Completed Features:

Floating Add Button: A floating action button that allows users to quickly add items to the list. (✅ Done)
Swipe to Delete with Confirmation: Swipe an item to the left to trigger a deletion request, which also deletes the item from Firebase. (✅ Done)
Theme Management: A settings button at the top of the app allows users to change the theme of the app. (✅ Done)
Icon Customization: Tap on the item icon to modify it. (✅ Done)
Undo Button: When an item is deleted, an "Undo" button appears at the bottom, which stays visible for 10 seconds before disappearing. (✅ Done)
Quantity Management: Add the ability to specify quantities for each item in the list. (✅ Done)
Upcoming Features:

Language Support: Add functionality to support multiple languages for better localization.
Image Upload for Detailed Items: Add a feature to upload and display images for detailed items in the list.
Image Upload from Gallery: Enable users to upload images from their device's gallery.
Item Status Icon: An icon that indicates whether a product is still to be bought or if it has already been purchased.
When the item is marked as purchased, the icon updates to reflect this status change.
Installation

To get started with the project:

Clone the repository:
git clone https://github.com/ColemanKokotti/Shop_n_Roll.git
Install dependencies:
flutter pub get
Run the app:
flutter run
Firebase Integration

This app uses Firebase for real-time data storage. To set it up:

Create a Firebase project from Firebase Console.
Follow the instructions to integrate Firebase with your Flutter app.
Replace the Firebase configuration in the project with your own credentials in the firebaseConfig.dart file.
Future Enhancements

User Authentication: Implement user authentication to allow users to manage their lists across multiple devices.
Item Categories: Categorize items (e.g., fruits, vegetables, dairy) for easier organization.
Contributing

If you'd like to contribute to the project, follow these steps:

Fork the repository.
Create a new branch for your feature (git checkout -b feature-name).
Commit your changes (git commit -am 'Add new feature').
Push to the branch (git push origin feature-name).
Open a pull request.
License

This project is licensed under the MIT License - see the LICENSE.md file for details.
