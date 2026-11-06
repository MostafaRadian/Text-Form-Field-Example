# Text Form Field Example

A small Flutter example showing how to describe form fields with data, render them through a reusable component, and assemble them into a screen with validation.

## How the code is organized

### 1. Data model — `lib/signupmodel.dart`

`SignUpData` holds the settings for one form field:

- `label` is the text shown in the field.
- `icon` is the suffix icon.
- `controller` is the `TextEditingController` that stores and exposes the entered text.
- `function` is the validator Flutter calls when the form is validated. It returns an error message for invalid input, or `null` when the input is valid.
- `obscureText` controls whether the field hides its text; it defaults to `false`.

This model does not draw anything. It packages the information needed to configure a field.

### 2. Reusable component — `lib/formfieldcomponenet.dart`

`MyTextFormFeild` receives one `SignUpData` object through its `data` parameter. Its `build` method creates a `TextFormField` and maps the model values to Flutter properties:

```dart
validator: data.function,
controller: data.controller,
obscureText: data.obscureText,
```

The label and icon are set in `InputDecoration`. The component is wrapped in padding so each field has space around it. Keeping this in one component avoids repeating the same field setup for email and password.

### 3. Screen and form assembly — `lib/textfield.dart`

`TextFieldTest` builds the screen. It creates an email controller, a password controller, and a `GlobalKey<FormState>`. Its `dataList` getter creates two `SignUpData` objects using those controllers and the appropriate labels, icons, and validators. The password field also sets `obscureText: true`.

The screen places both entries into the reusable component:

```dart
MyTextFormFeild(data: dataList[0]),
MyTextFormFeild(data: dataList[1]),
```

The controller is therefore passed from the screen, into `SignUpData`, into `MyTextFormFeild`, and finally to the `TextFormField`. This is how typing into the visible field updates the controller's text.

The submit button calls `formKey.currentState!.validate()`. Flutter runs each field's validator; if they all return `null`, the screen reads the entered values from `emailController.text` and `passController.text`.

### 4. App entry point — `lib/main.dart`

`main()` runs `MyApp`. `MyApp` returns a `MaterialApp` whose `home` is `TextFieldTest`, making the form screen the first screen shown by the app.

## Run and analyze

From the project directory, run:

```sh
flutter pub get
flutter run
flutter analyze
```

> Note: `TextFieldTest` currently remains a `StatelessWidget`, as in this example. For production code, controllers should be disposed of when no longer needed; managing that lifecycle is usually done by a `StatefulWidget` or another controller-owning object.
