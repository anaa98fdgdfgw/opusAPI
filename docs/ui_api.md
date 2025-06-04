# UI API

## Tabs
- **selectTab**: selectTab(TAB)
Make to the passed tab active.

## TextEntry
- **reset**: reset()
Clears the value and resets the cursor.

## Window
- **add**: add(TABLE)
Add element(s) to a window. Example:
page:add({
	text = UI.Text {
	  x=5,value='help'
	}
})
- **capture**: capture(ELEMENT el)
Restricts input to the passed element's tree.
- **clear**: clear(opt COLOR bg, opt COLOR fg)
Clears the window using either the passed values or the defaults for that window.
- **clearLine**: clearLine(NUMBER y, opt COLOR bg)
Clears the specified line.
- **draw**: draw(VOID)
Redraws the window in the internal buffer.
- **emit**: emit(TABLE event)
Send an event to the element. The event handler for the element is called.
If the event handler returns true, then no further processing is done.
If the event handler does not return true, then the event is sent to the parent element
and continues up the element tree.
If an accelerator is defined, the accelerated event is processed in the same manner.
Accelerators are useful for making events unique.
- **focus**: focus(VOID)
If the function is present on a class, it indicates
that this element can accept focus. Called when receiving focus.
- **getDoc**: getDoc(STRING method)
Get the documentation for a method.
- **getFocusables**: getFocusables(VOID)
Returns a list of children that can accept focus.
- **postInit**: postInit(VOID)
Called once the window has all the properties set.
Override to calculate properties or to dynamically add children
- **raise**: raise(VOID)
Raise this window to the top
- **setFocus**: setFocus(ELEMENT el)
Set the page's focus to the passed element.
- **sync**: sync(VOID)
Invoke a screen update. Automatically called at top level after an input event.
Call to force a screen update.
- **write**: write(NUMBER x, NUMBER y, STRING text, opt COLOR bg, opt COLOR fg)
Write text to the canvas.
If colors are not specified, the colors from the base class will be used.
If the base class does not have colors defined, colors will be inherited from the parent container.

