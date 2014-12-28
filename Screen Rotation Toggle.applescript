-- Thanks to https://github.com/pykler/applescripts/blob/master/rotate_screen/RotateScreen.applescript
-- Had to add the "first" for the dropdown menu to work on 10.9

on assistive_access_check()
	tell application "System Events"
		if not (UI elements enabled) then
			return false
			else
			return true
		end if
	end tell
end assistive_access_check

on enable_assistive_access()
	-- Thanks to https://gist.github.com/iloveitaly/2ff08138091afd69cf2b
	set scriptRunner to name of current application
	display alert "GUI Scripting is not enabled for " & scriptRunner & "." message "Open System Preferences, unlock the Security & Privacy preference, select " & scriptRunner & " in the Privacy Pane's Accessibility list, and then run this script again." buttons {"Open System Preferences", "Cancel"} default button "Cancel"
	if button returned of result is "Open System Preferences" then
		tell application "System Preferences"
			tell pane id "com.apple.preference.security" to reveal anchor "Privacy_Accessibility"
			activate
		end tell
	end if
end enable_assistive_access

on main()
	if assistive_access_check() then
		set desktopList to {}
		tell application "System Events"
			set desktopList to a reference to every desktop
			set targetDisplay to display name of item 1 of desktopList
		end tell

		tell application "System Preferences"
			activate
			set current pane to pane "com.apple.preference.displays"
			tell application "System Events"
				tell process "System Preferences"
					tell window targetDisplay
						-- get the old value
						set oldval to value of pop up button "Rotation:" of tab group 1
						if oldval is equal to "Standard" then
							-- select the button, or it won't take a menu click
							click pop up button "Rotation:" of tab group 1
							set thedropdown to first menu of pop up button "Rotation:" of tab group 1
							click menu item 2 of thedropdown
							-- It takes a little while for confirm dialog to pop up
							delay 2
							click button "Confirm" of sheet 1
							else
							-- select the button, or it won't take a menu click
							click pop up button "Rotation:" of tab group 1
							set thedropdown to first menu of pop up button "Rotation:" of tab group 1
							click menu item 1 of thedropdown
							-- The sheet does not appear when switching to standard rotation
						end if
					end tell
				end tell
			end tell
			quit
		end tell
		else
		enable_assistive_access()
	end if
end main

main()
