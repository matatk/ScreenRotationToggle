Screen Rotation Toggle
======================

An OS X "Service" (to which you can assign a shortcut key) to switch
between Standard and 90-degree screen rotation (for the first monitor).

I knocked this up (based on other scripts I found arund GitHub, which
are credited in the source) for my Dad, as his monitor can be rotated.
Mine can't, so I don't intend to be actively developing this -- so
patches are very welcome :-).

Installation
------------

1.  Download the [latest
    release](https://github.com/matatk/ScreenRotationToggle/releases/latest)'s
    Zip file.
2.  Unzip the Zip file; you will have a folder containing an Application
    and a Service, which must be dragged to your personal Services
    folder in order for OS X to recognise them. A link to your personal
    Services folder is also provided in the Zip file, named
    "my-services-folder", so you can drag the Application and Service
    onto that link, and then remove the Zip file and unzipped folder.
3.  Visit System Preferences \> Keyboard \> Shortcuts \> Services and
    assign a shortcut key combination to the "Safari Zoom Mode Toggle"
    service (under "General" at the bottom of the list).

Usage
-----

Press the shortcut key combination. If the display is on Standard
rotation, it will be toggled to 90-degree rotation; if the display is on
90-degree rotation, it will be toggled to Standard rotation.

**Note:** the first time you use this (or a new version), it needs to be
granted access to GUI scripting (so that it can access and activate
System Preference's menus and menu items); instructions on how to do
this are given in a pop-up message.

Compiling
---------

0.  Ensure you hae Apple's Command Line Developer tools installed (for
    make).
1.  Clone the code.
2.  Run `make`; this will compile/build the helper app and put it and
    the Service in `~/Library/Services/` for you.
3.  Follow step 3 as above.

