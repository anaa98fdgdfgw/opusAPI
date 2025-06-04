# API Reference

## Array
- **filter**: No documentation available
- **removeByValue**: No documentation available

## Blit
- **init**: No documentation available
- **insert**: No documentation available
- **sub**: No documentation available
- **toblit**: convert a string of text to blit format doing color conversion and processing ansi color sequences
- **wrap**: No documentation available
- **write**: No documentation available

## BulkGet
- **download**: No documentation available

## Canvas
- **__blitRect**: No documentation available
- **__renderLayers**: regions are comprised of absolute values that correspond to the output device. canvases have coordinates relative to their parent. canvas layer's stacking order is determined by the position within the array. layers in the beginning of the array are overlayed by layers further down in the array.
- **addLayer**: No documentation available
- **applyPalette**: No documentation available
- **blit**: No documentation available
- **clean**: No documentation available
- **clear**: No documentation available
- **clearLine**: No documentation available
- **copy**: No documentation available
- **dirty**: No documentation available
- **init**: A canvas can have more lines than canvas.height in order to scroll

TODO: finish vertical scrolling
- **isDirty**: No documentation available
- **move**: No documentation available
- **raise**: Push a layer to the top
- **removeLayer**: No documentation available
- **render**: either render directly to the device or use another canvas as a backing buffer
- **resize**: No documentation available
- **resizeBuffer**: resize the canvas buffer - not the canvas itself
- **setVisible**: No documentation available
- **write**: No documentation available
- **writeLine**: No documentation available

## Config
- **load**: No documentation available
- **update**: No documentation available

## Entry
- **backspace**: No documentation available
- **clearLine**: No documentation available
- **copy**: No documentation available
- **copyMarked**: No documentation available
- **copyText**: No documentation available
- **cut**: No documentation available
- **cutFromStart**: No documentation available
- **cutNextWord**: No documentation available
- **cutPrevWord**: No documentation available
- **cutToEnd**: No documentation available
- **delete**: No documentation available
- **deleteText**: No documentation available
- **forcePaste**: No documentation available
- **init**: No documentation available
- **insertChar**: No documentation available
- **insertText**: No documentation available
- **markAll**: No documentation available
- **markAnchor**: No documentation available
- **markBegin**: No documentation available
- **markEnd**: No documentation available
- **markFinish**: No documentation available
- **markHome**: No documentation available
- **markLeft**: No documentation available
- **markNextWord**: No documentation available
- **markPrevWord**: No documentation available
- **markRight**: No documentation available
- **markTo**: No documentation available
- **markWord**: No documentation available
- **moveEnd**: No documentation available
- **moveHome**: No documentation available
- **moveLeft**: No documentation available
- **moveRight**: No documentation available
- **moveTo**: No documentation available
- **moveWordLeft**: No documentation available
- **moveWordRight**: No documentation available
- **nextWord**: No documentation available
- **paste**: No documentation available
- **prevWord**: No documentation available
- **process**: No documentation available
- **reset**: No documentation available
- **unmark**: No documentation available
- **updateScroll**: No documentation available

## Event
- **addRoutine**: No documentation available
- **exitPullEvents**: No documentation available
- **off**: No documentation available
- **on**: No documentation available
- **onInterval**: No documentation available
- **onTerminate**: Set a handler for the terminate event. Within the function, return true or false to indicate whether the event should be propagated to all sub-threads
- **onTimeout**: No documentation available
- **processEvent**: No documentation available
- **pullEvent**: No documentation available
- **pullEvents**: No documentation available
- **termFn**: No documentation available
- **trigger**: invoke the handlers registered for this event

## GPS
- **getPoint**: No documentation available
- **isAvailable**: No documentation available
- **locate**: No documentation available
- **trilaterate**: end stock gps api

## History
- **add**: No documentation available
- **back**: No documentation available
- **forward**: No documentation available
- **load**: No documentation available
- **reset**: No documentation available

## Map
- **prune**: remove table entries if passed function returns false
- **removeMatches**: No documentation available
- **size**: No documentation available

## NFT
- **load**: No documentation available
- **parse**: No documentation available
- **save**: No documentation available
- **transparency**: No documentation available

## Packages
- **downloadList**: No documentation available
- **downloadManifest**: No documentation available
- **getManifest**: No documentation available
- **installed**: No documentation available
- **installedSorted**: No documentation available
- **isInstalled**: No documentation available
- **list**: No documentation available

## Peripheral
- **addDevice**: No documentation available
- **get**: match any of the passed arguments
- **getByMethod**: No documentation available
- **getBySide**: No documentation available
- **getByType**: No documentation available
- **getList**: No documentation available

## Point
- **above**: No documentation available
- **adjacentPoints**: No documentation available
- **below**: No documentation available
- **calculateHeading**: No documentation available
- **calculateMoves**: Calculate distance to location including turns also returns the resulting heading
- **calculateTurns**: No documentation available
- **closest**: given a set of points, find the one taking the least moves
- **closestPointInBox**: No documentation available
- **copy**: No documentation available
- **distance**: Euclidian distance
- **eachClosest**: No documentation available
- **expandBox**: expand box to include point
- **inBox**: No documentation available
- **iterateClosest**: No documentation available
- **makeBox**: No documentation available
- **nearestTo**: get the point nearest A that is in the direction of B
- **normalizeBox**: No documentation available
- **rotate**: No documentation available
- **round**: No documentation available
- **same**: No documentation available
- **subtract**: No documentation available
- **turtleDistance**: turtle distance (manhattan)

## Region
- **andRect**: region:andRect(r1, r2, r3, r4): Logical ''and''s a rectange to a region
- **andRegion**: region:andRegion(r): Logically ''and''s a region to a region
- **checkIntersect**: success = region:checkIntersect(x0, y0, x1, y1): Returns a boolean indicating whether a rectangle specified by its coordinates overlaps with a region.
- **forEach**: region:forEach(func, obj, ...): For each rectangle in a region, calls the specified function according the following scheme: func(obj, x0, y0, x1, y1, ...) Extra arguments are passed through to the function.
- **get**: minx, miny, maxx, maxy = region:get(): Get region's min/max extents
- **getRects**: region:getRect - gets an iterator on the rectangles in a region [internal]
- **intersect**: x0, y0, x1, y1 = Region.intersect(d1, d2, d3, d4, s1, s2, s3, s4): Returns the coordinates of a rectangle where a rectangle specified by the coordinates s1, s2, s3, s4 overlaps with the rectangle specified by the coordinates d1, d2, d3, d4. The return value is '''nil''' if the rectangles do not overlap.
- **isEmpty**: region:isEmpty(): Returns '''true''' if a region is empty.
- **new**: region = Region.new(r1, r2, r3, r4): Creates a new region from the given coordinates.
- **orRect**: region:orRect(r1, r2, r3, r4): Logical ''or''s a rectangle to a region
- **orRegion**: region:orRegion(region): Logical ''or''s another region to a region
- **setRect**: self = region:setRect(r1, r2, r3, r4): Resets an existing region to the specified rectangle.
- **shift**: region:shift(dx, dy): Shifts a region by delta x and y.
- **subRect**: self = region:subRect(r1, r2, r3, r4): Subtracts a rectangle from a region
- **subRegion**: region:subRegion(region2): Subtracts {{region2}} from {{region}}.
- **xorRect**: region:xorRect(r1, r2, r3, r4): Logical ''xor''s a rectange to a region

## Routine
- **isDead**: No documentation available
- **resume**: No documentation available
- **terminate**: No documentation available

## Security
- **getIdentifier**: No documentation available
- **getPassword**: No documentation available
- **hasPassword**: No documentation available
- **updatePassword**: No documentation available
- **verifyPassword**: No documentation available

## Socket
- **connect**: No documentation available
- **server**: No documentation available

## Sound
- **play**: No documentation available
- **setVolume**: No documentation available

## Sync
- **isLocked**: No documentation available
- **lock**: No documentation available
- **release**: No documentation available
- **sync**: No documentation available

## Terminal
- **colorToGrayscale**: No documentation available
- **copy**: No documentation available
- **getContents**: get windows contents
- **getNullTerm**: No documentation available
- **mirror**: No documentation available
- **readPassword**: No documentation available
- **toGrayscale**: No documentation available
- **window**: Replacement for window api with scrolling and buffering

## Transition
- **expandUp**: No documentation available
- **shake**: No documentation available
- **shuffle**: No documentation available
- **slideLeft**: No documentation available
- **slideRight**: No documentation available

## Tween
- **reset**: No documentation available
- **set**: No documentation available
- **update**: No documentation available

## UI
- **addPage**: No documentation available
- **click**: No documentation available
- **configure**: No documentation available
- **disableEffects**: No documentation available
- **emitEvent**: No documentation available
- **generateTheme**: No documentation available
- **getActivePage**: No documentation available
- **getCurrentPage**: No documentation available
- **getDefaults**: No documentation available
- **getPage**: No documentation available
- **init**: No documentation available
- **loadTheme**: No documentation available
- **mergeProperties**: No documentation available
- **pullEvents**: No documentation available
- **setActivePage**: No documentation available
- **setDefaultDevice**: No documentation available
- **setPage**: No documentation available
- **setPages**: No documentation available
- **setPreviousPage**: No documentation available

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
- **any**: No documentation available
- **backup**: No documentation available
- **byteArrayToHex**: No documentation available
- **checkMinecraftVersion**: No documentation available
- **clamp**: No documentation available
- **clear**: [[ Table functions ]] --
- **contains**: No documentation available
- **deepCopy**: No documentation available
- **deepMerge**: No documentation available
- **download**: No documentation available
- **each**: No documentation available
- **empty**: No documentation available
- **every**: No documentation available
- **filter**: No documentation available
- **filterInplace**: http://snippets.luacode.org/?p=snippets/Filter_a_table_in-place_119
- **find**: No documentation available
- **findAll**: No documentation available
- **first**: No documentation available
- **getMinecraftVersion**: No documentation available
- **getOptions**: No documentation available
- **getVersion**: No documentation available
- **hexToByteArray**: No documentation available
- **httpGet**: [[ loading and running functions ]] --
- **insertString**: No documentation available
- **key**: No documentation available
- **keys**: No documentation available
- **loadTable**: No documentation available
- **loadUrl**: No documentation available
- **matches**: No documentation available
- **merge**: No documentation available
- **parse**: https://github.com/MightyPirates/OpenComputers
- **permutation**: https://www.lua.org/pil/9.3.html
- **print**: No documentation available
- **randomFloat**: No documentation available
- **readFile**: [[ File functions ]]--
- **readLines**: No documentation available
- **readTable**: No documentation available
- **reduce**: No documentation available
- **removeByValue**: No documentation available
- **round**: http://lua-users.org/wiki/SimpleRound
- **rpairs**: No documentation available
- **run**: No documentation available
- **runFunction**: No documentation available
- **runUrl**: No documentation available
- **shallowCopy**: No documentation available
- **showOptions**: No documentation available
- **signum**: No documentation available
- **size**: No documentation available
- **spairs**: http://stackoverflow.com/questions/15706270/sort-a-table-in-lua
- **split**: No documentation available
- **startsWith**: No documentation available
- **throttle**: No documentation available
- **timer**: No documentation available
- **toBytes**: [[ String functions ]] --
- **tostring**: No documentation available
- **transpose**: No documentation available
- **trim**: http://snippets.luacode.org/?p=snippets/trim_whitespace_from_string_76
- **triml**: trim whitespace from left end of string
- **trimr**: trim whitespace from right end of string
- **tryTimed**: No documentation available
- **tryTimes**: No documentation available
- **widthify**: return a fixed length string using specified alignment
- **wordWrap**: No documentation available
- **writeFile**: No documentation available
- **writeLines**: No documentation available
- **writeTable**: No documentation available

## Writer
- **finish**: No documentation available
- **init**: No documentation available
- **write**: No documentation available

## cbor
- **decode**: opts.more(n) -> want more data opts.simple -> decode simple value opts[int] -> tagged decoder
- **encode**: No documentation available
- **integer**: No documentation available
- **more**: No documentation available
- **read_array**: No documentation available
- **read_byte**: No documentation available
- **read_bytes**: Decoder Reads from a file-handle like object
- **read_double**: No documentation available
- **read_float**: No documentation available
- **read_half_float**: No documentation available
- **read_integer**: No documentation available
- **read_length**: No documentation available
- **read_map**: No documentation available
- **read_negative_integer**: No documentation available
- **read_object**: No documentation available
- **read_semantic**: No documentation available
- **read_simple**: No documentation available
- **read_string**: No documentation available
- **read_type**: No documentation available
- **read_unicode_string**: No documentation available
- **simple**: No documentation available
- **softreq**: Concise Binary Object Representation (CBOR) RFC 7049
- **tagged**: No documentation available

## compress.lzw
- **compress**: No documentation available
- **decompress**: No documentation available
- **dictAddA**: No documentation available
- **dictAddB**: No documentation available

## compress.tar
- **checksum_header**: No documentation available
- **create_header_block**: No documentation available
- **get_typeflag**: No documentation available
- **ins**: No documentation available
- **nullterm**: No documentation available
- **number_to_octal**: No documentation available
- **octal_to_number**: No documentation available
- **read_header_block**: No documentation available
- **recurse**: No documentation available
- **tar**: the bare minimum for this program to untar
- **tar_stream**: No documentation available
- **tar_string**: No documentation available
- **untar**: No documentation available
- **untar_stream**: No documentation available
- **untar_string**: No documentation available

## crypto.chacha20
- **LE_toInt**: No documentation available
- **crypt**: No documentation available
- **decrypt**: No documentation available
- **encrypt**: No documentation available
- **genNonce**: Helper functions
- **hashBlock**: No documentation available
- **initState**: No documentation available
- **newRNG**: No documentation available
- **quarterRound**: No documentation available
- **rotl**: No documentation available
- **serialize**: No documentation available

## crypto.ecc.elliptic
- **NAF**: No documentation available
- **expMod**: No documentation available
- **generator**: No documentation available
- **isOnCurve**: No documentation available
- **mods**: No documentation available
- **pointAdd**: No documentation available
- **pointDecode**: No documentation available
- **pointDouble**: We're using Projective Coordinates For Edwards curves The identity element is represented by (0:1:1)
- **pointEncode**: No documentation available
- **pointEq**: No documentation available
- **pointNeg**: No documentation available
- **pointScale**: No documentation available
- **pointSub**: No documentation available
- **scalarMul**: No documentation available
- **scalarMulG**: No documentation available

## crypto.ecc.fp
- **REDC**: No documentation available
- **add**: No documentation available
- **add384**: No documentation available
- **eq**: No documentation available
- **invMont**: No documentation available
- **mont**: No documentation available
- **mul**: No documentation available
- **mul384**: No documentation available
- **reduce**: No documentation available
- **shr**: No documentation available
- **sqr**: No documentation available
- **sub**: No documentation available
- **sub192**: No documentation available

## crypto.ecc.fq
- **add**: No documentation available
- **add384**: No documentation available
- **bytes**: No documentation available
- **cmp**: No documentation available
- **cmp384**: No documentation available
- **eq**: No documentation available
- **fromBytes**: No documentation available
- **mul**: No documentation available
- **mul384**: No documentation available
- **reduce**: No documentation available
- **reduce384**: No documentation available
- **sub**: No documentation available
- **sub192**: No documentation available
- **sub384**: No documentation available

## crypto.ecc.init
- **exchange**: No documentation available
- **hashModQ**: No documentation available
- **publicKey**: No documentation available
- **sign**: No documentation available
- **verify**: No documentation available

## crypto.sha2
- **BE_toInt**: No documentation available
- **brshift**: No documentation available
- **compute**: No documentation available
- **counter**: No documentation available
- **digest**: No documentation available
- **digestblock**: No documentation available
- **hmac**: No documentation available
- **pbkdf2**: No documentation available
- **preprocess**: No documentation available
- **rrotate**: No documentation available
- **toBytes**: No documentation available

## encoder
- **array**: Array or dict-only encoders, which can be set as __tocbor metamethod
- **boolean**: No documentation available
- **bytestring**: Major type 2 - byte strings
- **float**: No documentation available
- **integer**: Major types 0, 1
- **map**: No documentation available
- **number**: Number types dispatch
- **ordered_map**: No documentation available
- **table**: No documentation available
- **userdata**: No documentation available
- **utf8string**: Major type 3 - UTF-8 strings

## entry
- **_val**: convert value to a string (supporting nils or numbers in value)

## env
- **require**: No documentation available

## event
- **createCoroutine**: Use a pool of coroutines for event handlers
- **nextUID**: No documentation available
- **processHandlers**: No documentation available
- **processRoutines**: No documentation available
- **tokeys**: No documentation available

## fh
- **read**: No documentation available
- **write**: No documentation available

## fs.netfs
- **remoteCommand**: No documentation available
- **resolve**: No documentation available

## git
- **getContents**: No documentation available
- **list**: No documentation available

## gitfs
- **mount**: No documentation available

## gps
- **narrow**: No documentation available
- **trilaterate**: from stock gps API

## h
- **updateInterval**: No documentation available

## http.pastebin
- **download**: Download the contents of a paste
- **get**: Download the contents to a file from pastebin
- **parseCode**: - Parse the pastebin code from the given code or URL
- **put**: Upload a file to pastebin.com
- **upload**: Upload text to pastebin

## injector
- **helper**: No documentation available
- **insert**: No documentation available
- **pathSearcher**: No documentation available
- **preloadSearcher**: No documentation available
- **split**: No documentation available

## input
- **isCombo**: No documentation available
- **modifierPressed**: No documentation available
- **reset**: No documentation available
- **toCode**: No documentation available
- **translate**: No documentation available

## json
- **addnewline**: No documentation available
- **addnewline2**: No documentation available
- **addpair**: No documentation available
- **appendcustom**: No documentation available
- **decode**: No documentation available
- **decodeFromFile**: NOTE: added method - not in original source
- **encode**: No documentation available
- **encodeexception**: No documentation available
- **escapeutf8**: No documentation available
- **exception**: No documentation available
- **fsub**: No documentation available
- **isarray**: No documentation available
- **loc**: No documentation available
- **num2str**: No documentation available
- **optionalmetatables**: No documentation available
- **quotestring**: No documentation available
- **replace**: No documentation available
- **scanstring**: No documentation available
- **scantable**: No documentation available
- **scanwhite**: No documentation available
- **str2num**: No documentation available
- **unichar**: No documentation available
- **unterminated**: No documentation available
- **updatedecpoint**: No documentation available

## linkfs
- **copy**: No documentation available
- **delete**: No documentation available
- **find**: No documentation available
- **mount**: No documentation available
- **move**: No documentation available
- **resolve**: No documentation available

## map
- **matchAll**: No documentation available

## netfs
- **complete**: No documentation available
- **copy**: No documentation available
- **find**: No documentation available
- **getDrive**: No documentation available
- **getSize**: No documentation available
- **isDir**: No documentation available
- **isReadOnly**: No documentation available
- **mount**: No documentation available
- **move**: No documentation available
- **open**: No documentation available

## nft
- **getColourOf**: No documentation available

## obj
- **nextInt**: No documentation available

## ramfs
- **attributes**: No documentation available
- **delete**: No documentation available
- **exists**: No documentation available
- **getDrive**: No documentation available
- **getFreeSpace**: No documentation available
- **getSize**: No documentation available
- **isDir**: No documentation available
- **isReadOnly**: No documentation available
- **list**: No documentation available
- **makeDir**: No documentation available
- **mount**: No documentation available
- **open**: No documentation available

## self
- **render**: No documentation available

## simple_mt
- **__tocbor**: No documentation available
- **__tostring**: No documentation available

## socket
- **getIdentifier**: No documentation available
- **loopback**: No documentation available
- **newSocket**: No documentation available
- **setupCrypto**: No documentation available
- **trusted**: No documentation available

## socketClass
- **close**: No documentation available
- **ping**: No documentation available
- **read**: No documentation available
- **write**: No documentation available

## tagged_mt
- **__tocbor**: No documentation available
- **__tostring**: No documentation available

## terminal
- **newLine**: No documentation available
- **scrollTo**: No documentation available
- **translate**: No documentation available
- **update**: No documentation available

## trace
- **matchesFilter**: No documentation available
- **traceback**: No documentation available
- **trim_traceback**: No documentation available

## tween
- **new**: Public interface

## ui
- **calc**: No documentation available
- **focusSort**: No documentation available
- **getFocusable**: No documentation available
- **getName**: No documentation available
- **getPosition**: No documentation available
- **keyFunction**: No documentation available
- **load**: No documentation available
- **loadComponents**: lazy load components
- **resize**: No documentation available
- **setOffset**: TODO: fix

## ui.blit
- **replace**: No documentation available

## ui.canvas
- **genPalette**: No documentation available
- **replace**: No documentation available

## ui.components.CheckboxGrid
- **safeValue**: No documentation available

## ui.components.Grid
- **inverseSort**: No documentation available
- **safeValue**: No documentation available
- **sort**: No documentation available

## ui.components.MenuBar
- **getPosition**: No documentation available

## ui.components.Page
- **getNextFocus**: No documentation available
- **getPosition**: No documentation available
- **getPreviousFocus**: No documentation available

## ui.components.QuickSelect
- **recurse**: No documentation available

## ui.components.TextEntry
- **transform**: No documentation available

## ui.region
- **cutrect**: cutrect: cut rect d into table of new rects, using rect s as a punch
- **cutregion**: cutregion: cut region d, using s as a punch
- **insertrect**: insertrect: insert rect to table, merging with an existing one if possible

## ui.tween
- **calculatePAS**: elastic
- **checkNewParams**: No documentation available
- **checkSubjectAndTargetRecursively**: No documentation available
- **copyTables**: private stuff
- **getEasingFunction**: No documentation available
- **inBack**: back
- **inBounce**: No documentation available
- **inCirc**: circ
- **inCubic**: cubic
- **inElastic**: No documentation available
- **inExpo**: expo
- **inOutBack**: No documentation available
- **inOutBounce**: No documentation available
- **inOutCirc**: No documentation available
- **inOutCubic**: No documentation available
- **inOutElastic**: No documentation available
- **inOutExpo**: No documentation available
- **inOutQuad**: No documentation available
- **inOutQuart**: No documentation available
- **inOutQuint**: No documentation available
- **inOutSine**: No documentation available
- **inQuad**: quad
- **inQuart**: quart
- **inQuint**: quint
- **inSine**: sine
- **linear**: linear
- **outBack**: No documentation available
- **outBounce**: bounce
- **outCirc**: No documentation available
- **outCubic**: No documentation available
- **outElastic**: No documentation available
- **outExpo**: No documentation available
- **outInBack**: No documentation available
- **outInBounce**: No documentation available
- **outInCirc**: No documentation available
- **outInCubic**: No documentation available
- **outInElastic**: No documentation available
- **outInExpo**: No documentation available
- **outInQuad**: No documentation available
- **outInQuart**: No documentation available
- **outInQuint**: No documentation available
- **outInSine**: No documentation available
- **outQuad**: No documentation available
- **outQuart**: No documentation available
- **outQuint**: No documentation available
- **outSine**: No documentation available
- **performEasingOnSubject**: No documentation available

## urlfs
- **attributes**: No documentation available
- **delete**: No documentation available
- **exists**: No documentation available
- **getDrive**: No documentation available
- **getSize**: No documentation available
- **isDir**: No documentation available
- **isReadOnly**: No documentation available
- **mount**: No documentation available
- **open**: No documentation available

## util
- **convert**: No documentation available
- **getopt**: http://lua-users.org/wiki/AlternativeGetOpt
- **helper**: No documentation available
- **isArray**: No documentation available
- **permgen**: No documentation available
- **serialize**: No documentation available
- **wrap**: end http://snippets.luacode.org/?p=snippets/trim_whitespace_from_string_76
- **wrapRequest**: No documentation available

## win
- **blit**: No documentation available
- **clear**: No documentation available
- **clearLine**: No documentation available
- **getBackgroundColor**: No documentation available
- **getCanvas**: No documentation available
- **getCursorBlink**: No documentation available
- **getCursorPos**: No documentation available
- **getLine**: No documentation available
- **getPaletteColor**: No documentation available
- **getParent**: No documentation available
- **getPosition**: No documentation available
- **getSize**: No documentation available
- **getTextColor**: No documentation available
- **isColor**: No documentation available
- **print**: No documentation available
- **redraw**: No documentation available
- **reposition**: No documentation available
- **restoreCursor**: No documentation available
- **scroll**: No documentation available
- **scrollBottom**: No documentation available
- **scrollDown**: [[ Additional methods ]]--
- **scrollTop**: No documentation available
- **scrollUp**: No documentation available
- **setBackgroundColor**: No documentation available
- **setCursorBlink**: No documentation available
- **setCursorPos**: No documentation available
- **setMaxScroll**: No documentation available
- **setPaletteColor**: No documentation available
- **setTextColor**: No documentation available
- **setVisible**: No documentation available
- **write**: No documentation available
- **writeX**: No documentation available

