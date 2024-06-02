![Alert preview](https://files.catbox.moe/30f8au.jpg)

# Swift Askpass Helper

This project aims to create a native-looking input alert for ASKPASS operations on macOS.

## Motivation

I started this project to add support for sudo operation to [Cork](https://github.com/buresdv/Cork). I was not satisfied with the way dialogs shown by AppleScript looked, and wanted a more native implementation

## Usage

Set the `SUDO_ASKPASS` environment variable in your Swift shell executor to the path of the compiled executable. For example, this is how it is used in Cork:
```swift
let task = Process()

// (Other code)

var finalEnvironment: [String: String] = .init()

// (Other code)

let sudoHelperURL: URL = Bundle.main.resourceURL!.appendingPathComponent("Sudo Helper", conformingTo: .executable)
    
finalEnvironment["SUDO_ASKPASS"] = sudoHelperURL.path // <-- HERE

// (Other code)

task.environment = finalEnvironment
```

## Customization

This project only supports hardcoded strings. In order to change what the alert says, change these variables in the source code before compiling:
```swift
alert.window.title // Line 17
alert.messageText // Line 18
alert.informativeText // Line 19
```

## System Requirements

This project supports macOS 10.13 and later.

## Technical Details

This project creates a `NSAlert` with a password input field. When the user submits the field, the program returns the submitted password to the caller of the `SUDO_ASKPASS` operation, and the app quits.