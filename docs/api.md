# API Reference

## Array
- **filter**
- **removeByValue**

## Blit
- **init**
- **insert**
- **sub**
- **toblit**
- **wrap**
- **write**

## BulkGet
- **download**

## Canvas
- **__blitRect**
- **__renderLayers**
- **addLayer**
- **applyPalette**
- **blit**
- **clean**
- **clear**
- **clearLine**
- **copy**
- **dirty**
- **init**
- **isDirty**
- **move**
- **raise**
- **removeLayer**
- **render**
- **resize**
- **resizeBuffer**
- **setVisible**
- **write**
- **writeLine**

## Config
- **load**
- **update**

## Entry
- **backspace**
- **clearLine**
- **copy**
- **copyMarked**
- **copyText**
- **cut**
- **cutFromStart**
- **cutNextWord**
- **cutPrevWord**
- **cutToEnd**
- **delete**
- **deleteText**
- **forcePaste**
- **init**
- **insertChar**
- **insertText**
- **markAll**
- **markAnchor**
- **markBegin**
- **markEnd**
- **markFinish**
- **markHome**
- **markLeft**
- **markNextWord**
- **markPrevWord**
- **markRight**
- **markTo**
- **markWord**
- **moveEnd**
- **moveHome**
- **moveLeft**
- **moveRight**
- **moveTo**
- **moveWordLeft**
- **moveWordRight**
- **nextWord**
- **paste**
- **prevWord**
- **process**
- **reset**
- **unmark**
- **updateScroll**

## Event
- **addRoutine**
- **exitPullEvents**
- **off**
- **on**
- **onInterval**
- **onTerminate**
- **onTimeout**
- **processEvent**
- **pullEvent**
- **pullEvents**
- **termFn**
- **trigger**

## GPS
- **getPoint**
- **isAvailable**
- **locate**
- **trilaterate**

## History
- **add**
- **back**
- **forward**
- **load**
- **reset**

## Map
- **prune**
- **removeMatches**
- **size**

## NFT
- **load**
- **parse**
- **save**
- **transparency**

## Packages
- **downloadList**
- **downloadManifest**
- **getManifest**
- **installed**
- **installedSorted**
- **isInstalled**
- **list**

## Peripheral
- **addDevice**
- **get**
- **getByMethod**
- **getBySide**
- **getByType**
- **getList**

## Point
- **above**
- **adjacentPoints**
- **below**
- **calculateHeading**
- **calculateMoves**
- **calculateTurns**
- **closest**
- **closestPointInBox**
- **copy**
- **distance**
- **eachClosest**
- **expandBox**
- **inBox**
- **iterateClosest**
- **makeBox**
- **nearestTo**
- **normalizeBox**
- **rotate**
- **round**
- **same**
- **subtract**
- **turtleDistance**

## Region
- **andRect**
- **andRegion**
- **checkIntersect**
- **forEach**
- **get**
- **getRects**
- **intersect**
- **isEmpty**
- **new**
- **orRect**
- **orRegion**
- **setRect**
- **shift**
- **subRect**
- **subRegion**
- **xorRect**

## Routine
- **isDead**
- **resume**
- **terminate**

## Security
- **getIdentifier**
- **getPassword**
- **hasPassword**
- **updatePassword**
- **verifyPassword**

## Socket
- **connect**
- **server**

## Sound
- **play**
- **setVolume**

## Sync
- **isLocked**
- **lock**
- **release**
- **sync**

## Terminal
- **colorToGrayscale**
- **copy**
- **getContents**
- **getNullTerm**
- **mirror**
- **readPassword**
- **toGrayscale**
- **window**

## Transition
- **expandUp**
- **shake**
- **shuffle**
- **slideLeft**
- **slideRight**

## Tween
- **reset**
- **set**
- **update**

## UI
- **addPage**
- **click**
- **configure**
- **disableEffects**
- **emitEvent**
- **generateTheme**
- **getActivePage**
- **getCurrentPage**
- **getDefaults**
- **getPage**
- **init**
- **loadTheme**
- **mergeProperties**
- **pullEvents**
- **setActivePage**
- **setDefaultDevice**
- **setPage**
- **setPages**
- **setPreviousPage**

## UI.Tabs
- **selectTab**: selectTab(TAB)
Make to the passed tab active.

## UI.TextEntry
- **reset**: reset()
Clears the value and resets the cursor.

## UI.Window
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

## Util
- **any**
- **backup**
- **byteArrayToHex**
- **checkMinecraftVersion**
- **clamp**
- **clear**
- **contains**
- **deepCopy**
- **deepMerge**
- **download**
- **each**
- **empty**
- **every**
- **filter**
- **filterInplace**
- **find**
- **findAll**
- **first**
- **getMinecraftVersion**
- **getOptions**
- **getVersion**
- **hexToByteArray**
- **httpGet**
- **insertString**
- **key**
- **keys**
- **loadTable**
- **loadUrl**
- **matches**
- **merge**
- **parse**
- **permutation**
- **print**
- **randomFloat**
- **readFile**
- **readLines**
- **readTable**
- **reduce**
- **removeByValue**
- **round**
- **rpairs**
- **run**
- **runFunction**
- **runUrl**
- **shallowCopy**
- **showOptions**
- **signum**
- **size**
- **spairs**
- **split**
- **startsWith**
- **throttle**
- **timer**
- **toBytes**
- **tostring**
- **transpose**
- **trim**
- **triml**
- **trimr**
- **tryTimed**
- **tryTimes**
- **widthify**
- **wordWrap**
- **writeFile**
- **writeLines**
- **writeTable**

## Writer
- **finish**
- **init**
- **write**

## cbor
- **decode**
- **encode**
- **integer**
- **more**
- **read_array**
- **read_byte**
- **read_bytes**
- **read_double**
- **read_float**
- **read_half_float**
- **read_integer**
- **read_length**
- **read_map**
- **read_negative_integer**
- **read_object**
- **read_semantic**
- **read_simple**
- **read_string**
- **read_type**
- **read_unicode_string**
- **simple**
- **softreq**
- **tagged**

## compress.lzw
- **compress**
- **decompress**
- **dictAddA**
- **dictAddB**

## compress.tar
- **checksum_header**
- **create_header_block**
- **get_typeflag**
- **ins**
- **nullterm**
- **number_to_octal**
- **octal_to_number**
- **read_header_block**
- **recurse**
- **tar**
- **tar_stream**
- **tar_string**
- **untar**
- **untar_stream**
- **untar_string**

## crypto.chacha20
- **LE_toInt**
- **crypt**
- **decrypt**
- **encrypt**
- **genNonce**
- **hashBlock**
- **initState**
- **newRNG**
- **quarterRound**
- **rotl**
- **serialize**

## crypto.ecc.elliptic
- **NAF**
- **expMod**
- **generator**
- **isOnCurve**
- **mods**
- **pointAdd**
- **pointDecode**
- **pointDouble**
- **pointEncode**
- **pointEq**
- **pointNeg**
- **pointScale**
- **pointSub**
- **scalarMul**
- **scalarMulG**

## crypto.ecc.fp
- **REDC**
- **add**
- **add384**
- **eq**
- **invMont**
- **mont**
- **mul**
- **mul384**
- **reduce**
- **shr**
- **sqr**
- **sub**
- **sub192**

## crypto.ecc.fq
- **add**
- **add384**
- **bytes**
- **cmp**
- **cmp384**
- **eq**
- **fromBytes**
- **mul**
- **mul384**
- **reduce**
- **reduce384**
- **sub**
- **sub192**
- **sub384**

## crypto.ecc.init
- **exchange**
- **hashModQ**
- **publicKey**
- **sign**
- **verify**

## crypto.sha2
- **BE_toInt**
- **brshift**
- **compute**
- **counter**
- **digest**
- **digestblock**
- **hmac**
- **pbkdf2**
- **preprocess**
- **rrotate**
- **toBytes**

## encoder
- **array**
- **boolean**
- **bytestring**
- **float**
- **integer**
- **map**
- **number**
- **ordered_map**
- **table**
- **userdata**
- **utf8string**

## entry
- **_val**

## env
- **require**

## event
- **createCoroutine**
- **nextUID**
- **processHandlers**
- **processRoutines**
- **tokeys**

## fh
- **read**
- **write**

## fs.netfs
- **remoteCommand**
- **resolve**

## git
- **getContents**
- **list**

## gitfs
- **mount**

## gps
- **narrow**
- **trilaterate**

## h
- **updateInterval**

## http.pastebin
- **download**
- **get**
- **parseCode**
- **put**
- **upload**

## injector
- **helper**
- **insert**
- **pathSearcher**
- **preloadSearcher**
- **split**

## input
- **isCombo**
- **modifierPressed**
- **reset**
- **toCode**
- **translate**

## json
- **addnewline**
- **addnewline2**
- **addpair**
- **appendcustom**
- **decode**
- **decodeFromFile**
- **encode**
- **encodeexception**
- **escapeutf8**
- **exception**
- **fsub**
- **isarray**
- **loc**
- **num2str**
- **optionalmetatables**
- **quotestring**
- **replace**
- **scanstring**
- **scantable**
- **scanwhite**
- **str2num**
- **unichar**
- **unterminated**
- **updatedecpoint**

## linkfs
- **copy**
- **delete**
- **find**
- **mount**
- **move**
- **resolve**

## map
- **matchAll**

## netfs
- **complete**
- **copy**
- **find**
- **getDrive**
- **getSize**
- **isDir**
- **isReadOnly**
- **mount**
- **move**
- **open**

## nft
- **getColourOf**

## obj
- **nextInt**

## ramfs
- **attributes**
- **delete**
- **exists**
- **getDrive**
- **getFreeSpace**
- **getSize**
- **isDir**
- **isReadOnly**
- **list**
- **makeDir**
- **mount**
- **open**

## self
- **render**

## simple_mt
- **__tocbor**
- **__tostring**

## socket
- **getIdentifier**
- **loopback**
- **newSocket**
- **setupCrypto**
- **trusted**

## socketClass
- **close**
- **ping**
- **read**
- **write**

## tagged_mt
- **__tocbor**
- **__tostring**

## terminal
- **newLine**
- **scrollTo**
- **translate**
- **update**

## trace
- **matchesFilter**
- **traceback**
- **trim_traceback**

## tween
- **new**

## ui
- **calc**
- **focusSort**
- **getFocusable**
- **getName**
- **getPosition**
- **keyFunction**
- **load**
- **loadComponents**
- **resize**
- **setOffset**

## ui.blit
- **replace**

## ui.canvas
- **genPalette**
- **replace**

## ui.components.CheckboxGrid
- **safeValue**

## ui.components.Grid
- **inverseSort**
- **safeValue**
- **sort**

## ui.components.MenuBar
- **getPosition**

## ui.components.Page
- **getNextFocus**
- **getPosition**
- **getPreviousFocus**

## ui.components.QuickSelect
- **recurse**

## ui.components.TextEntry
- **transform**

## ui.region
- **cutrect**
- **cutregion**
- **insertrect**

## ui.tween
- **calculatePAS**
- **checkNewParams**
- **checkSubjectAndTargetRecursively**
- **copyTables**
- **getEasingFunction**
- **inBack**
- **inBounce**
- **inCirc**
- **inCubic**
- **inElastic**
- **inExpo**
- **inOutBack**
- **inOutBounce**
- **inOutCirc**
- **inOutCubic**
- **inOutElastic**
- **inOutExpo**
- **inOutQuad**
- **inOutQuart**
- **inOutQuint**
- **inOutSine**
- **inQuad**
- **inQuart**
- **inQuint**
- **inSine**
- **linear**
- **outBack**
- **outBounce**
- **outCirc**
- **outCubic**
- **outElastic**
- **outExpo**
- **outInBack**
- **outInBounce**
- **outInCirc**
- **outInCubic**
- **outInElastic**
- **outInExpo**
- **outInQuad**
- **outInQuart**
- **outInQuint**
- **outInSine**
- **outQuad**
- **outQuart**
- **outQuint**
- **outSine**
- **performEasingOnSubject**

## urlfs
- **attributes**
- **delete**
- **exists**
- **getDrive**
- **getSize**
- **isDir**
- **isReadOnly**
- **mount**
- **open**

## util
- **convert**
- **getopt**
- **helper**
- **isArray**
- **permgen**
- **serialize**
- **wrap**
- **wrapRequest**

## win
- **blit**
- **clear**
- **clearLine**
- **getBackgroundColor**
- **getCanvas**
- **getCursorBlink**
- **getCursorPos**
- **getLine**
- **getPaletteColor**
- **getParent**
- **getPosition**
- **getSize**
- **getTextColor**
- **isColor**
- **print**
- **redraw**
- **reposition**
- **restoreCursor**
- **scroll**
- **scrollBottom**
- **scrollDown**
- **scrollTop**
- **scrollUp**
- **setBackgroundColor**
- **setCursorBlink**
- **setCursorPos**
- **setMaxScroll**
- **setPaletteColor**
- **setTextColor**
- **setVisible**
- **write**
- **writeX**

