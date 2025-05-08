# Flutter E-Commerce App

A modern e-commerce application built with Flutter, featuring a clean UI and core shopping functionalities. Ideal for learning Flutter development and e-commerce patterns.

![App Preview](https://via.placeholder.com/800x400.png?text=E-Commerce+App+Preview)

## Features

- **Product Catalog**: Grid/list views with product details
- **Shopping Cart**: Add/remove items with provider state management
- **User Authentication**: Login/register flows with form validation
- **Product Search**: Basic search functionality
- **Responsive Design**: Works on mobile and web
- **Modern UI**: Clean Material Design with orange theme

## Tech Stack

- **Frontend**: Flutter 3.19
- **State Management**: Provider
- **Image Handling**: Cached Network Images
- **Navigation**: Go Router (optional)

## Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/flutter-ecommerce-app.git
   cd flutter-ecommerce-app

2. **Install dependencies**
```bash
flutter pub get
```
3. **Run the app**
```bash
flutter run
```
**Configuration**
Backend Setup (Optional)
1. Create Firebase/Supabase project
2. Add config files to android/app and ios/Runner
3. Enable Authentication and Firestore/PostgreSQL
**Environment Variables**

Add to .env:
```env
SUPABASE_URL=your_supabase_url
SUPABASE_KEY=your_supabase_key
```

**Contributing**

Contributions welcome! Please:

- Fork the repository
- Create your feature branch
- Submit a pull request

Note: This project uses mock data - replace with real API endpoints for production use.
