# raavailability

A flutter plugin that check if AR is available for Android and IOS. To check for android we use
com.google.ar.core, for IOS isnt implemented yet.

## Getting Started
- You need to add <meta-data android:name="com.google.ar.core" android:value="required" /> to AndroidManifest.xml. Otherwise the plugin wont work.
Take care when you do this, because some plugins can do the same and conflict with your manifest. If that happens, you just need to secure that is the same value for all.
See the example file.
