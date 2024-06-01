//
//  main.swift
//  Sudo Helper
//
//  Created by David Bureš on 01.06.2024.
//

import Cocoa
import Foundation

let application = NSApplication.shared
NSApp.setActivationPolicy(.accessory)
NSApp.activate(ignoringOtherApps: true)

let alert = NSAlert()

alert.window.title = "Cork Password Helper"
alert.messageText = "Homebrew action requires elevated privileges"
alert.informativeText = "Input your administrator password to let Cork perform this privileged task on your behalf"

alert.icon = NSImage(named: "NSSecurity")

alert.alertStyle = .informational

let submitButton = alert.addButton(withTitle: "Submit")
submitButton.tag = NSApplication.ModalResponse.OK.rawValue

let cancelButton = alert.addButton(withTitle: "Cancel")
cancelButton.tag = NSApplication.ModalResponse.cancel.rawValue

let passwordField = NSSecureTextField(frame: NSRect(x: 0, y: 0, width: 200, height: 24))

alert.accessoryView = passwordField
alert.window.initialFirstResponder = passwordField

let response = alert.runModal()

switch response
{
case .OK:
    print(passwordField.stringValue)
    exit(0)
default:
    print("")
    exit(-1)
}
