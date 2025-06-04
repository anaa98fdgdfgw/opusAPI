# API Reference

## Array
- **filter**:
  - Example: `neural/mobRancher.lua:114: return shuffle(Array.filter(neural.sense(), function(entity)`
- **removeByValue**:
  - Example: `common/edit.lua:573: Array.removeByValue(config.recent, path)`

## Blit
- **init**:
  - Definition: `ui/blit.lua:18: function Blit:init(t, args)`
- **insert**:
  - Definition: `ui/blit.lua:49: function Blit:insert(x, text, bg, fg)`
- **sub**:
  - Definition: `ui/blit.lua:91: function Blit:sub(s, e)`
- **toblit**: convert a string of text to blit format doing color conversion and processing ansi color sequences
  - Definition: `ui/blit.lua:128: function Blit.toblit(str, cs)`
- **wrap**:
  - Definition: `ui/blit.lua:99: function Blit:wrap(max)`
- **write**:
  - Definition: `ui/blit.lua:43: function Blit:write(x, text, bg, fg)`

## BulkGet
- **download**:
  - Definition: `bulkget.lua:7: function BulkGet.download(list, callback)`

## Canvas
- **__blitRect**:
  - Definition: `ui/canvas.lua:372: function Canvas:__blitRect(device, src, tgt, doubleBuffer)`
- **__renderLayers**: regions are comprised of absolute values that correspond to the output device. canvases have coordinates relative to their parent. canvas layer's stacking order is determined by the position within the array. layers in the beginning of the array are overlayed by layers further down in the array.
  - Definition: `ui/canvas.lua:325: function Canvas:__renderLayers(device, offset, doubleBuffer)`
- **addLayer**:
  - Definition: `ui/canvas.lua:126: function Canvas:addLayer(layer)`
- **applyPalette**:
  - Definition: `ui/canvas.lua:271: function Canvas:applyPalette(palette)`
- **blit**:
  - Definition: `ui/canvas.lua:175: function Canvas:blit(x, y, text, bg, fg)`
- **clean**:
  - Definition: `ui/canvas.lua:265: function Canvas:clean()`
- **clear**:
  - Definition: `ui/canvas.lua:234: function Canvas:clear(bg, fg)`
- **clearLine**:
  - Definition: `ui/canvas.lua:228: function Canvas:clearLine(y, bg, fg)`
- **copy**:
  - Definition: `ui/canvas.lua:110: function Canvas:copy()`
- **dirty**:
  - Definition: `ui/canvas.lua:251: function Canvas:dirty(includingChildren)`
- **init**: A canvas can have more lines than canvas.height in order to scroll

TODO: finish vertical scrolling
  - Definition: `ui/canvas.lua:32: function Canvas:init(args)`
- **isDirty**:
  - Definition: `ui/canvas.lua:243: function Canvas:isDirty()`
- **move**:
  - Definition: `ui/canvas.lua:59: function Canvas:move(x, y)`
- **raise**: Push a layer to the top
  - Definition: `ui/canvas.lua:154: function Canvas:raise()`
- **removeLayer**:
  - Definition: `ui/canvas.lua:135: function Canvas:removeLayer()`
- **render**: either render directly to the device or use another canvas as a backing buffer
  - Definition: `ui/canvas.lua:288: function Canvas:render(device, doubleBuffer)`
- **resize**:
  - Definition: `ui/canvas.lua:68: function Canvas:resize(w, h)`
- **resizeBuffer**: resize the canvas buffer - not the canvas itself
  - Definition: `ui/canvas.lua:78: function Canvas:resizeBuffer(w, h)`
- **setVisible**:
  - Definition: `ui/canvas.lua:145: function Canvas:setVisible(visible)`
- **write**:
  - Definition: `ui/canvas.lua:165: function Canvas:write(x, y, text, bg, fg)`
- **writeLine**:
  - Definition: `ui/canvas.lua:219: function Canvas:writeLine(y, text, fg, bg)`

## Config
- **load**:
  - Example: `swshop/shopView.lua:14: local config = Config.load('shop')`
- **update**:
  - Example: `swshop/Shoplogs.lua:148: Config.update('Shoplogs', config)`

## Entry
- **backspace**:
  - Definition: `entry.lua:121: function Entry:backspace()`
- **clearLine**:
  - Definition: `entry.lua:229: function Entry:clearLine()`
- **copy**:
  - Definition: `entry.lua:193: function Entry:copy()`
- **copyMarked**:
  - Definition: `entry.lua:211: function Entry:copyMarked()`
- **copyText**:
  - Definition: `entry.lua:64: function Entry:copyText(cx, ex)`
- **cut**:
  - Definition: `entry.lua:204: function Entry:cut()`
- **cutFromStart**:
  - Definition: `entry.lua:151: function Entry:cutFromStart()`
- **cutNextWord**:
  - Definition: `entry.lua:168: function Entry:cutNextWord()`
- **cutPrevWord**:
  - Definition: `entry.lua:177: function Entry:cutPrevWord()`
- **cutToEnd**:
  - Definition: `entry.lua:159: function Entry:cutToEnd()`
- **delete**:
  - Definition: `entry.lua:143: function Entry:delete()`
- **deleteText**:
  - Definition: `entry.lua:81: function Entry:deleteText(sx, ex)`
- **forcePaste**:
  - Definition: `entry.lua:225: function Entry.forcePaste()`
- **init**:
  - Definition: `entry.lua:12: function Entry:init(args)`
- **insertChar**:
  - Definition: `entry.lua:186: function Entry:insertChar(ie)`
- **insertText**:
  - Definition: `entry.lua:69: function Entry:insertText(x, text)`
- **markAll**:
  - Definition: `entry.lua:328: function Entry:markAll()`
- **markAnchor**:
  - Definition: `entry.lua:262: function Entry:markAnchor(ie)`
- **markBegin**:
  - Definition: `entry.lua:235: function Entry:markBegin()`
- **markEnd**:
  - Definition: `entry.lua:348: function Entry:markEnd()`
- **markFinish**:
  - Definition: `entry.lua:244: function Entry:markFinish()`
- **markHome**:
  - Definition: `entry.lua:339: function Entry:markHome()`
- **markLeft**:
  - Definition: `entry.lua:272: function Entry:markLeft()`
- **markNextWord**:
  - Definition: `entry.lua:310: function Entry:markNextWord()`
- **markPrevWord**:
  - Definition: `entry.lua:319: function Entry:markPrevWord()`
- **markRight**:
  - Definition: `entry.lua:281: function Entry:markRight()`
- **markTo**:
  - Definition: `entry.lua:357: function Entry:markTo(ie)`
- **markWord**:
  - Definition: `entry.lua:290: function Entry:markWord(ie)`
- **moveEnd**:
  - Definition: `entry.lua:110: function Entry:moveEnd()`
- **moveHome**:
  - Definition: `entry.lua:103: function Entry:moveHome()`
- **moveLeft**:
  - Definition: `entry.lua:89: function Entry:moveLeft()`
- **moveRight**:
  - Definition: `entry.lua:96: function Entry:moveRight()`
- **moveTo**:
  - Definition: `entry.lua:117: function Entry:moveTo(ie)`
- **moveWordLeft**:
  - Definition: `entry.lua:136: function Entry:moveWordLeft()`
- **moveWordRight**:
  - Definition: `entry.lua:129: function Entry:moveWordRight()`
- **nextWord**:
  - Definition: `entry.lua:30: function Entry:nextWord()`
- **paste**:
  - Definition: `entry.lua:216: function Entry:paste(ie)`
- **prevWord**:
  - Definition: `entry.lua:35: function Entry:prevWord()`
- **process**:
  - Definition: `entry.lua:405: function Entry:process(ie)`
- **reset**:
  - Definition: `entry.lua:23: function Entry:reset()`
- **unmark**:
  - Definition: `entry.lua:255: function Entry:unmark()`
- **updateScroll**:
  - Definition: `entry.lua:42: function Entry:updateScroll()`

## Event
- **addRoutine**:
  - Definition: `event.lua:167: function Event.addRoutine(fn)`
- **exitPullEvents**:
  - Definition: `event.lua:191: function Event.exitPullEvents()`
- **off**:
  - Definition: `event.lua:114: function Event.off(h)`
- **on**:
  - Definition: `event.lua:92: function Event.on(events, fn)`
- **onInterval**:
  - Definition: `event.lua:128: function Event.onInterval(interval, fn)`
- **onTerminate**: Set a handler for the terminate event. Within the function, return true or false to indicate whether the event should be propagated to all sub-threads
  - Definition: `event.lua:158: function Event.onTerminate(fn)`
- **onTimeout**:
  - Definition: `event.lua:141: function Event.onTimeout(timeout, fn)`
- **processEvent**:
  - Definition: `event.lua:242: function Event.processEvent(e)`
- **pullEvent**:
  - Definition: `event.lua:247: function Event.pullEvent(eventType)`
- **pullEvents**:
  - Definition: `event.lua:179: function Event.pullEvents(...)`
- **termFn**:
  - Definition: `event.lua:162: function Event.termFn()`
- **trigger**: invoke the handlers registered for this event
  - Definition: `event.lua:228: function Event.trigger(event, ...)`

## GPS
- **getPoint**:
  - Definition: `gps.lua:74: function GPS.getPoint(timeout, debug)`
- **isAvailable**:
  - Definition: `gps.lua:70: function GPS.isAvailable()`
- **locate**:
  - Definition: `gps.lua:9: function GPS.locate(timeout, debug)`
- **trilaterate**: end stock gps api
  - Definition: `gps.lua:146: function GPS.trilaterate(tFixes)`

## History
- **add**:
  - Definition: `history.lua:19: function History:add(line)`
- **back**:
  - Definition: `history.lua:36: function History:back()`
- **forward**:
  - Definition: `history.lua:43: function History:forward()`
- **load**:
  - Definition: `history.lua:6: function History.load(filename, limit)`
- **reset**:
  - Definition: `history.lua:32: function History:reset()`

## Map
- **prune**: remove table entries if passed function returns false
  - Definition: `map.lua:31: function Map.prune(t, fn)`
- **removeMatches**:
  - Definition: `map.lua:13: function Map.removeMatches(t, values)`
- **size**:
  - Definition: `map.lua:44: function Map.size(list)`

## NFT
- **load**:
  - Definition: `nft.lua:83: function NFT.load(path)`
- **parse**:
  - Definition: `nft.lua:19: function NFT.parse(imageText)`
- **save**:
  - Definition: `nft.lua:91: function NFT.save(image, filename)`
- **transparency**:
  - Definition: `nft.lua:68: function NFT.transparency(image)`

## Packages
- **downloadList**:
  - Definition: `packages.lua:57: function Packages:downloadList()`
- **downloadManifest**:
  - Definition: `packages.lua:68: function Packages:downloadManifest(package)`
- **getManifest**:
  - Definition: `packages.lua:84: function Packages:getManifest(package)`
- **installed**:
  - Definition: `packages.lua:10: function Packages:installed()`
- **installedSorted**:
  - Definition: `packages.lua:23: function Packages:installedSorted()`
- **isInstalled**:
  - Definition: `packages.lua:53: function Packages:isInstalled(package)`
- **list**:
  - Definition: `packages.lua:46: function Packages:list()`

## Peripheral
- **addDevice**:
  - Definition: `peripheral.lua:18: function Peripheral.addDevice(deviceList, side)`
- **get**: match any of the passed arguments
  - Example: `milo/storageGen.lua:71: self.storages = Util.filter(Peripheral.getList(), function(dev)`
- **getByMethod**:
  - Example: `core/apis/refinedAdapter.lua:17: controller = Peripheral.getByMethod('getCraftingTasks')`
- **getBySide**:
  - Example: `core/apis/refinedAdapter.lua:19: controller = Peripheral.getBySide(self.side)`
- **getByType**:
  - Example: `core/apis/meAdapter18.lua:20: controller = Peripheral.getByType(DEVICE_TYPE)`
- **getList**:
  - Example: `milo/storageGen.lua:71: self.storages = Util.filter(Peripheral.getList(), function(dev)`

## Point
- **above**:
  - Example: `common/Follow.lua:228: addBlocks(Point.above(pt))`
- **adjacentPoints**:
  - Example: `common/Follow.lua:220: local apts = Point.adjacentPoints(tpt)`
- **below**:
  - Example: `farms/superTreefarm.lua:152: local pt = Point.below(HOME_PT)`
- **calculateHeading**:
  - Example: `farms/apis/level.lua:82: local h = Point.calculateHeading(reference, pt)`
- **calculateMoves**: Calculate distance to location including turns also returns the resulting heading
  - Example: `turtle/apis/pathfind.lua:57: return Point.calculateMoves(node, n)`
- **calculateTurns**:
  - Example: `farms/apis/level.lua:83: local t = Point.calculateTurns(reference.heading, h)`
- **closest**: given a set of points, find the one taking the least moves
  - Example: `neural/mobPickup.lua:65: local b = Point.closest(pt, sensed)`
- **closestPointInBox**:
  - Definition: `point.lua:332: function Point.closestPointInBox(pt, box)`
- **copy**:
  - Example: `common/Follow.lua:131: pt = Point.copy(gpt)`
- **distance**: Euclidian distance
  - Example: `neural/shootingGallery.lua:34: return Point.distance(e1, pos) < Point.distance(e2, pos)`
- **eachClosest**:
  - Example: `turtle/lavaRefuel.lua:48: Point.eachClosest(turtle.point, t, function(b)`
- **expandBox**: expand box to include point
  - Example: `turtle/apis/pathfind.lua:22: Point.expandBox(box, dest)`
- **inBox**:
  - Example: `common/multiMiner.lua:68: return Point.inBox(pt, box)`
- **iterateClosest**:
  - Example: `farms/superTreefarm.lua:337: for pt in Point.iterateClosest(turtle.point, blocks) do`
- **makeBox**:
  - Example: `common/multiMiner.lua:155: local box = Point.makeBox(`
- **nearestTo**: get the point nearest A that is in the direction of B
  - Example: `turtle/apis/pathfind.lua:192: local bpt = Point.nearestTo(turtle.point, pt)`
- **normalizeBox**:
  - Example: `common/multiMiner.lua:161: pathingBox = Point.normalizeBox(box),`
- **rotate**:
  - Example: `turtle/canvasClient.lua:21: Point.rotate(c, rotated[reference.heading])`
- **round**:
  - Definition: `point.lua:51: function Point.round(pt)`
- **same**:
  - Example: `neural/mobFollow.lua:30: if pt and lpt and Point.same(pt, lpt) then`
- **subtract**:
  - Definition: `point.lua:72: function Point.subtract(a, b)`
- **turtleDistance**: turtle distance (manhattan)
  - Example: `miners/simpleMiner.lua:498: local veryMinFuel = Point.turtleDistance(turtle.point, { x = 0, y = 0, z = 0}) + 512`

## Region
- **andRect**: region:andRect(r1, r2, r3, r4): Logical ''and''s a rectange to a region
  - Definition: `ui/region.lua:132: function Region:andRect(s1, s2, s3, s4)`
- **andRegion**: region:andRegion(r): Logically ''and''s a region to a region
  - Definition: `ui/region.lua:205: function Region:andRegion(s)`
- **checkIntersect**: success = region:checkIntersect(x0, y0, x1, y1): Returns a boolean indicating whether a rectangle specified by its coordinates overlaps with a region.
  - Definition: `ui/region.lua:186: function Region:checkIntersect(s1, s2, s3, s4)`
- **forEach**: region:forEach(func, obj, ...): For each rectangle in a region, calls the specified function according the following scheme: func(obj, x0, y0, x1, y1, ...) Extra arguments are passed through to the function.
  - Definition: `ui/region.lua:224: function Region:forEach(func, obj, ...)`
- **get**: minx, miny, maxx, maxy = region:get(): Get region's min/max extents
  - Definition: `ui/region.lua:246: function Region:get()`
- **getRects**: region:getRect - gets an iterator on the rectangles in a region [internal]
  - Definition: `ui/region.lua:173: function Region:getRects()`
- **intersect**: x0, y0, x1, y1 = Region.intersect(d1, d2, d3, d4, s1, s2, s3, s4): Returns the coordinates of a rectangle where a rectangle specified by the coordinates s1, s2, s3, s4 overlaps with the rectangle specified by the coordinates d1, d2, d3, d4. The return value is '''nil''' if the rectangles do not overlap.
  - Definition: `ui/region.lua:34: function Region.intersect(d1, d2, d3, d4, s1, s2, s3, s4)`
- **isEmpty**: region:isEmpty(): Returns '''true''' if a region is empty.
  - Definition: `ui/region.lua:241: function Region:isEmpty()`
- **new**: region = Region.new(r1, r2, r3, r4): Creates a new region from the given coordinates.
  - Definition: `ui/region.lua:104: function Region.new(r1, r2, r3, r4)`
- **orRect**: region:orRect(r1, r2, r3, r4): Logical ''or''s a rectangle to a region
  - Definition: `ui/region.lua:119: function Region:orRect(s1, s2, s3, s4)`
- **orRegion**: region:orRegion(region): Logical ''or''s another region to a region
  - Definition: `ui/region.lua:125: function Region:orRegion(s)`
- **setRect**: self = region:setRect(r1, r2, r3, r4): Resets an existing region to the specified rectangle.
  - Definition: `ui/region.lua:113: function Region:setRect(r1, r2, r3, r4)`
- **shift**: region:shift(dx, dy): Shifts a region by delta x and y.
  - Definition: `ui/region.lua:231: function Region:shift(dx, dy)`
- **subRect**: self = region:subRect(r1, r2, r3, r4): Subtracts a rectangle from a region
  - Definition: `ui/region.lua:160: function Region:subRect(s1, s2, s3, s4)`
- **subRegion**: region:subRegion(region2): Subtracts {{region2}} from {{region}}.
  - Definition: `ui/region.lua:196: function Region:subRegion(region)`
- **xorRect**: region:xorRect(r1, r2, r3, r4): Logical ''xor''s a rectange to a region
  - Definition: `ui/region.lua:145: function Region:xorRect(s1, s2, s3, s4)`

## Routine
- **isDead**:
  - Definition: `event.lua:34: function Routine:isDead()`
- **resume**:
  - Definition: `event.lua:47: function Routine:resume(event, ...)`
- **terminate**:
  - Definition: `event.lua:41: function Routine:terminate()`

## Security
- **getIdentifier**:
  - Definition: `security.lua:14: function Security.getIdentifier()`
- **getPassword**:
  - Definition: `security.lua:36: function Security.getPassword()`
- **hasPassword**:
  - Definition: `security.lua:10: function Security.hasPassword()`
- **updatePassword**:
  - Definition: `security.lua:30: function Security.updatePassword(password)`
- **verifyPassword**:
  - Example: `secure/unlock.lua:22: if password and Security.verifyPassword(SHA.compute(password)) then`

## Socket
- **connect**:
  - Definition: `socket.lua:121: function Socket.connect(host, port, options)`
- **server**:
  - Definition: `socket.lua:209: function Socket.server(port, options)`

## Sound
- **play**:
  - Example: `swshop/shopView.lua:201: Sound.play('entity.player.levelup')`
- **setVolume**:
  - Example: `milo/plugins/speakerView.lua:11: Sound.setVolume(speakerNode.volume)`

## Sync
- **isLocked**:
  - Definition: `sync.lua:56: function Sync.isLocked(obj)`
- **lock**:
  - Definition: `sync.lua:30: function Sync.lock(obj)`
- **release**:
  - Definition: `sync.lua:43: function Sync.release(obj)`
- **sync**:
  - Definition: `sync.lua:7: function Sync.sync(obj, fn)`

## Terminal
- **colorToGrayscale**:
  - Definition: `terminal.lua:379: function Terminal.colorToGrayscale(c)`
- **copy**:
  - Definition: `terminal.lua:433: function Terminal.copy(it, ot)`
- **getContents**: get windows contents
  - Definition: `terminal.lua:359: function Terminal.getContents(win)`
- **getNullTerm**:
  - Definition: `terminal.lua:421: function Terminal.getNullTerm(ct)`
- **mirror**:
  - Definition: `terminal.lua:443: function Terminal.mirror(ct, dt)`
- **readPassword**:
  - Definition: `terminal.lua:457: function Terminal.readPassword(prompt)`
- **toGrayscale**:
  - Definition: `terminal.lua:383: function Terminal.toGrayscale(ct)`
- **window**: Replacement for window api with scrolling and buffering
  - Definition: `terminal.lua:29: function Terminal.window(parent, sx, sy, w, h, isVisible)`

## Transition
- **expandUp**:
  - Definition: `ui/transition.lua:37: function Transition.expandUp(canvas, args)`
- **shake**:
  - Definition: `ui/transition.lua:53: function Transition.shake(canvas, args)`
- **shuffle**:
  - Definition: `ui/transition.lua:67: function Transition.shuffle(canvas, args)`
- **slideLeft**:
  - Definition: `ui/transition.lua:5: function Transition.slideLeft(canvas, args)`
- **slideRight**:
  - Definition: `ui/transition.lua:21: function Transition.slideRight(canvas, args)`

## Tween
- **reset**:
  - Definition: `ui/tween.lua:326: function Tween:reset()`
- **set**:
  - Definition: `ui/tween.lua:301: function Tween:set(clock)`
- **update**:
  - Definition: `ui/tween.lua:330: function Tween:update(dt)`

## UI
- **addPage**:
  - Definition: `ui.lua:316: function UI:addPage(name, page)`
- **click**:
  - Definition: `ui.lua:259: function UI:click(target, ie)`
- **configure**:
  - Definition: `ui.lua:156: function UI:configure(appName, ...)`
- **disableEffects**:
  - Definition: `ui.lua:194: function UI:disableEffects()`
- **emitEvent**:
  - Definition: `ui.lua:252: function UI:emitEvent(event)`
- **generateTheme**:
  - Definition: `ui.lua:212: function UI:generateTheme(filename)`
- **getActivePage**:
  - Definition: `ui.lua:337: function UI:getActivePage(page)`
- **getCurrentPage**:
  - Definition: `ui.lua:378: function UI:getCurrentPage()`
- **getDefaults**:
  - Definition: `ui.lua:390: function UI:getDefaults(element, args)`
- **getPage**:
  - Definition: `ui.lua:327: function UI:getPage(pageName)`
- **init**:
  - Definition: `ui.lua:38: function UI:init()`
- **loadTheme**:
  - Definition: `ui.lua:198: function UI:loadTheme(filename)`
- **mergeProperties**:
  - Definition: `ui.lua:398: function UI:mergeProperties(obj, args)`
- **pullEvents**:
  - Definition: `ui.lua:414: function UI:pullEvents(...)`
- **setActivePage**:
  - Definition: `ui.lua:344: function UI:setActivePage(page)`
- **setDefaultDevice**:
  - Definition: `ui.lua:312: function UI:setDefaultDevice(dev)`
- **setPage**:
  - Definition: `ui.lua:348: function UI:setPage(pageOrName, ...)`
- **setPages**:
  - Definition: `ui.lua:323: function UI:setPages(pages)`
- **setPreviousPage**:
  - Definition: `ui.lua:382: function UI:setPreviousPage()`

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
  - Example: `milo/core/listing.lua:121: return UI.Window.draw(self)`
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
- **any**:
  - Definition: `util.lua:410: function Util.any(t, fn)`
- **backup**:
  - Definition: `util.lua:488: function Util.backup(fname)`
- **byteArrayToHex**:
  - Definition: `util.lua:86: function Util.byteArrayToHex(tbl)`
- **checkMinecraftVersion**:
  - Definition: `util.lua:196: function Util.checkMinecraftVersion(minVersion)`
- **clamp**:
  - Definition: `util.lua:216: function Util.clamp(num, low, high)`
- **clear**: [[ Table functions ]] --
  - Definition: `util.lua:233: function Util.clear(t)`
- **contains**:
  - Definition: `util.lua:292: function Util.contains(t, value)`
- **deepCopy**:
  - Definition: `util.lua:327: function Util.deepCopy(t)`
- **deepMerge**:
  - Definition: `util.lua:269: function Util.deepMerge(obj, args)`
- **download**:
  - Definition: `util.lua:578: function Util.download(url, filename)`
- **each**:
  - Definition: `util.lua:427: function Util.each(list, func)`
- **empty**:
  - Definition: `util.lua:240: function Util.empty(t)`
- **every**:
  - Definition: `util.lua:418: function Util.every(t, fn)`
- **filter**:
  - Definition: `util.lua:363: function Util.filter(it, f)`
- **filterInplace**: http://snippets.luacode.org/?p=snippets/Filter_a_table_in-place_119
  - Definition: `util.lua:344: function Util.filterInplace(t, predicate)`
- **find**:
  - Definition: `util.lua:300: function Util.find(t, name, value)`
- **findAll**:
  - Definition: `util.lua:308: function Util.findAll(t, name, value)`
- **first**:
  - Definition: `util.lua:468: function Util.first(t, order)`
- **getMinecraftVersion**:
  - Definition: `util.lua:185: function Util.getMinecraftVersion()`
- **getOptions**:
  - Definition: `util.lua:801: function Util.getOptions(options, args, ignoreInvalid)`
- **getVersion**:
  - Definition: `util.lua:172: function Util.getVersion()`
- **hexToByteArray**:
  - Definition: `util.lua:77: function Util.hexToByteArray(str)`
- **httpGet**: [[ loading and running functions ]] --
  - Definition: `util.lua:568: function Util.httpGet(url, headers, isBinary)`
- **insertString**:
  - Definition: `util.lua:633: function Util.insertString(str, istr, pos)`
- **key**:
  - Definition: `util.lua:244: function Util.key(t, value)`
- **keys**:
  - Definition: `util.lua:252: function Util.keys(t)`
- **loadTable**:
  - Definition: `util.lua:552: function Util.loadTable(fname)`
- **loadUrl**:
  - Definition: `util.lua:590: function Util.loadUrl(url, env)  -- loadfile equivalent`
- **matches**:
  - Definition: `util.lua:646: function Util.matches(str, pattern)`
- **merge**:
  - Definition: `util.lua:260: function Util.merge(obj, args)`
- **parse**: https://github.com/MightyPirates/OpenComputers
  - Definition: `util.lua:730: function Util.parse(...)`
- **permutation**: https://www.lua.org/pil/9.3.html
  - Definition: `util.lua:835: function Util.permutation(tbl)`
- **print**:
  - Definition: `util.lua:168: function Util.print(pattern, ...)`
- **randomFloat**:
  - Definition: `util.lua:226: function Util.randomFloat(max, min)`
- **readFile**: [[ File functions ]]--
  - Definition: `util.lua:479: function Util.readFile(fname, flags)`
- **readLines**:
  - Definition: `util.lua:516: function Util.readLines(fname)`
- **readTable**:
  - Definition: `util.lua:541: function Util.readTable(fname)`
- **reduce**:
  - Definition: `util.lua:373: function Util.reduce(t, fn, acc)`
- **removeByValue**:
  - Definition: `util.lua:397: function Util.removeByValue(t, e)`
- **round**: http://lua-users.org/wiki/SimpleRound
  - Definition: `util.lua:221: function Util.round(num, idp)`
- **rpairs**:
  - Definition: `util.lua:433: function Util.rpairs(t)`
- **run**:
  - Definition: `util.lua:606: function Util.run(env, path, ...)`
- **runFunction**:
  - Definition: `util.lua:615: function Util.runFunction(env, fn, ...)`
- **runUrl**:
  - Definition: `util.lua:598: function Util.runUrl(env, url, ...)   -- os.run equivalent`
- **shallowCopy**:
  - Definition: `util.lua:318: function Util.shallowCopy(t)`
- **showOptions**:
  - Definition: `util.lua:794: function Util.showOptions(options)`
- **signum**:
  - Definition: `util.lua:206: function Util.signum(num)`
- **size**:
  - Definition: `util.lua:381: function Util.size(list)`
- **spairs**: http://stackoverflow.com/questions/15706270/sort-a-table-in-lua
  - Definition: `util.lua:447: function Util.spairs(t, order)`
- **split**:
  - Definition: `util.lua:637: function Util.split(str, pattern)`
- **startsWith**:
  - Definition: `util.lua:655: function Util.startsWith(s, match)`
- **throttle**:
  - Definition: `util.lua:121: function Util.throttle(fn)`
- **timer**:
  - Definition: `util.lua:112: function Util.timer()`
- **toBytes**: [[ String functions ]] --
  - Definition: `util.lua:621: function Util.toBytes(n)`
- **tostring**:
  - Definition: `util.lua:136: function Util.tostring(pattern, ...)`
- **transpose**:
  - Definition: `util.lua:284: function Util.transpose(t)`
- **trim**: http://snippets.luacode.org/?p=snippets/trim_whitespace_from_string_76
  - Definition: `util.lua:684: function Util.trim(s)`
- **triml**: trim whitespace from left end of string
  - Definition: `util.lua:689: function Util.triml(s)`
- **trimr**: trim whitespace from right end of string
  - Definition: `util.lua:694: function Util.trimr(s)`
- **tryTimed**:
  - Definition: `util.lua:91: function Util.tryTimed(timeout, f, ...)`
- **tryTimes**:
  - Definition: `util.lua:101: function Util.tryTimes(attempts, f, ...)`
- **widthify**: return a fixed length string using specified alignment
  - Definition: `util.lua:660: function Util.widthify(s, len, align)`
- **wordWrap**:
  - Definition: `util.lua:719: function Util.wordWrap(str, limit)`
- **writeFile**:
  - Definition: `util.lua:496: function Util.writeFile(fname, data, flags)`
- **writeLines**:
  - Definition: `util.lua:530: function Util.writeLines(fname, lines)`
- **writeTable**:
  - Definition: `util.lua:548: function Util.writeTable(fname, data)`

## Writer
- **finish**:
  - Definition: `ui/components/Grid.lua:29: function Writer:finish(bg)`
- **init**:
  - Definition: `ui/components/Grid.lua:17: function Writer:init(element, y)`
- **write**:
  - Definition: `ui/components/Grid.lua:23: function Writer:write(s, width, align, bg, fg)`

## cbor
- **decode**: opts.more(n) -> want more data opts.simple -> decode simple value opts[int] -> tagged decoder
  - Definition: `cbor.lua:520: local function decode(s, opts)`
- **encode**:
  - Definition: `cbor.lua:55: local function encode(obj, opts)`
- **integer**:
  - Definition: `cbor.lua:94: function integer(num, m)`
- **more**:
  - Definition: `cbor.lua:533: function more()`
- **read_array**:
  - Definition: `cbor.lua:361: local function read_array(fh, mintyp, opts)`
- **read_byte**:
  - Definition: `cbor.lua:300: local function read_byte(fh)`
- **read_bytes**: Decoder Reads from a file-handle like object
  - Definition: `cbor.lua:296: local function read_bytes(fh, len)`
- **read_double**:
  - Definition: `cbor.lua:478: function read_double(fh) return s_unpack(">d", read_bytes(fh, 8)) end`
- **read_float**:
  - Definition: `cbor.lua:477: function read_float(fh) return s_unpack(">f", read_bytes(fh, 4)) end`
- **read_half_float**:
  - Definition: `cbor.lua:411: local function read_half_float(fh)`
- **read_integer**:
  - Definition: `cbor.lua:330: local function read_integer(fh, mintyp)`
- **read_length**:
  - Definition: `cbor.lua:304: local function read_length(fh, mintyp)`
- **read_map**:
  - Definition: `cbor.lua:379: local function read_map(fh, mintyp, opts)`
- **read_negative_integer**:
  - Definition: `cbor.lua:334: local function read_negative_integer(fh, mintyp)`
- **read_object**:
  - Definition: `cbor.lua:325: local function read_object(fh, opts)`
- **read_semantic**:
  - Definition: `cbor.lua:401: local function read_semantic(fh, mintyp, opts)`
- **read_simple**:
  - Definition: `cbor.lua:481: local function read_simple(fh, value, opts)`
- **read_string**:
  - Definition: `cbor.lua:338: local function read_string(fh, mintyp)`
- **read_type**:
  - Definition: `cbor.lua:320: local function read_type(fh)`
- **read_unicode_string**:
  - Definition: `cbor.lua:352: local function read_unicode_string(fh, mintyp)`
- **simple**:
  - Definition: `cbor.lua:116: local function simple(value, name, cbor)`
- **softreq**: Concise Binary Object Representation (CBOR) RFC 7049
  - Definition: `cbor.lua:4: local function softreq(pkg, field)`
- **tagged**:
  - Definition: `cbor.lua:125: local function tagged(tag, value)`

## compress.lzw
- **compress**:
  - Example: `compress/compress.lua:28: Util.writeFile(file, LZW.compress(c), 'wb')`
- **decompress**:
  - Example: `compress/uncompress.lua:43: local s, m = Tar.untar_string(LZW.decompress(c), outDir, true)`
- **dictAddA**:
  - Definition: `compress/lzw.lua:19: local function dictAddA(str, dict, a, b)`
- **dictAddB**:
  - Definition: `compress/lzw.lua:76: local function dictAddB(str, dict, a, b)`

## compress.tar
- **checksum_header**:
  - Definition: `compress/tar.lua:43: local function checksum_header(block)`
- **create_header_block**:
  - Definition: `compress/tar.lua:190: local function create_header_block(filename, abspath)`
- **get_typeflag**:
  - Definition: `compress/tar.lua:11: local function get_typeflag(flag)`
- **ins**:
  - Definition: `compress/tar.lua:197: local function ins(pos, istr)`
- **nullterm**:
  - Definition: `compress/tar.lua:56: local function nullterm(s)`
- **number_to_octal**:
  - Definition: `compress/tar.lua:193: local function number_to_octal(n)`
- **octal_to_number**:
  - Definition: `compress/tar.lua:28: local function octal_to_number(octal)`
- **read_header_block**:
  - Definition: `compress/tar.lua:60: local function read_header_block(block)`
- **recurse**:
  - Definition: `compress/tar.lua:213: local function recurse(rel)`
- **tar**: the bare minimum for this program to untar
  - Example: `compress/compress.lua:24: Tar.tar(file, dir)`
- **tar_stream**:
  - Definition: `compress/tar.lua:210: local function tar_stream(tar_handle, root, files)`
- **tar_string**:
  - Example: `compress/compress.lua:27: local c = Tar.tar_string(dir)`
- **untar**:
  - Example: `compress/uncompress.lua:31: local s, m = Tar.untar_string(string.char(table.unpack(t)), outDir, true)`
- **untar_stream**:
  - Definition: `compress/tar.lua:84: local function untar_stream(tar_handle, destdir, verbose)`
- **untar_string**:
  - Example: `compress/uncompress.lua:31: local s, m = Tar.untar_string(string.char(table.unpack(t)), outDir, true)`

## crypto.chacha20
- **LE_toInt**:
  - Definition: `crypto/chacha20.lua:48: local function LE_toInt(bs, i)`
- **crypt**:
  - Definition: `crypto/chacha20.lua:93: local function crypt(data, key, nonce, cntr, round)`
- **decrypt**:
  - Definition: `crypto/chacha20.lua:142: local function decrypt(data, key)`
- **encrypt**:
  - Definition: `crypto/chacha20.lua:133: local function encrypt(data, key)`
- **genNonce**: Helper functions
  - Definition: `crypto/chacha20.lua:125: local function genNonce(len)`
- **hashBlock**:
  - Definition: `crypto/chacha20.lua:35: local function hashBlock(state, rnd)`
- **initState**:
  - Definition: `crypto/chacha20.lua:55: local function initState(key, nonce, counter)`
- **newRNG**:
  - Definition: `crypto/chacha20.lua:171: local function newRNG(seed)`
- **quarterRound**:
  - Definition: `crypto/chacha20.lua:27: local function quarterRound(s, a, b, c, d)`
- **rotl**:
  - Definition: `crypto/chacha20.lua:21: local function rotl(n, b)`
- **serialize**:
  - Definition: `crypto/chacha20.lua:82: local function serialize(state)`

## crypto.ecc.elliptic
- **NAF**:
  - Definition: `crypto/ecc/elliptic.lua:181: local function NAF(d)`
- **expMod**:
  - Definition: `crypto/ecc/elliptic.lua:58: local function expMod(a, t)`
- **generator**:
  - Definition: `crypto/ecc/elliptic.lua:54: local function generator()`
- **isOnCurve**:
  - Definition: `crypto/ecc/elliptic.lua:155: local function isOnCurve(P1)`
- **mods**:
  - Definition: `crypto/ecc/elliptic.lua:170: local function mods(d)`
- **pointAdd**:
  - Definition: `crypto/ecc/elliptic.lua:94: local function pointAdd(P1, P2)`
- **pointDecode**:
  - Definition: `crypto/ecc/elliptic.lua:267: local function pointDecode(enc)`
- **pointDouble**: We're using Projective Coordinates For Edwards curves The identity element is represented by (0:1:1)
  - Definition: `crypto/ecc/elliptic.lua:75: local function pointDouble(P1)`
- **pointEncode**:
  - Definition: `crypto/ecc/elliptic.lua:250: local function pointEncode(P1)`
- **pointEq**:
  - Definition: `crypto/ecc/elliptic.lua:143: local function pointEq(P1, P2)`
- **pointNeg**:
  - Definition: `crypto/ecc/elliptic.lua:114: local function pointNeg(P1)`
- **pointScale**:
  - Definition: `crypto/ecc/elliptic.lua:130: local function pointScale(P1)`
- **pointSub**:
  - Definition: `crypto/ecc/elliptic.lua:126: local function pointSub(P1, P2)`
- **scalarMul**:
  - Definition: `crypto/ecc/elliptic.lua:199: local function scalarMul(s, P1)`
- **scalarMulG**:
  - Definition: `crypto/ecc/elliptic.lua:228: local function scalarMulG(s)`

## crypto.ecc.fp
- **REDC**:
  - Definition: `crypto/ecc/fp.lua:714: local function REDC(T)`
- **add**:
  - Definition: `crypto/ecc/fp.lua:91: local function add(a, b)`
- **add384**:
  - Definition: `crypto/ecc/fp.lua:342: local function add384(a, b)`
- **eq**:
  - Definition: `crypto/ecc/fp.lua:12: local function eq(a, b)`
- **invMont**:
  - Definition: `crypto/ecc/fp.lua:910: local function invMont(a)`
- **mont**:
  - Definition: `crypto/ecc/fp.lua:906: local function mont(a)`
- **mul**:
  - Definition: `crypto/ecc/fp.lua:721: local function mul(a, b)`
- **mul384**:
  - Definition: `crypto/ecc/fp.lua:466: local function mul384(a, b)`
- **reduce**:
  - Definition: `crypto/ecc/fp.lua:22: local function reduce(a)`
- **shr**:
  - Definition: `crypto/ecc/fp.lua:155: local function shr(a)`
- **sqr**:
  - Definition: `crypto/ecc/fp.lua:725: local function sqr(a)`
- **sub**:
  - Definition: `crypto/ecc/fp.lua:274: local function sub(a, b)`
- **sub192**:
  - Definition: `crypto/ecc/fp.lua:210: local function sub192(a, b)`

## crypto.ecc.fq
- **add**:
  - Definition: `crypto/ecc/fq.lua:142: local function add(a, b)`
- **add384**:
  - Definition: `crypto/ecc/fq.lua:216: local function add384(a, b)`
- **bytes**:
  - Definition: `crypto/ecc/fq.lua:45: local function bytes(x)`
- **cmp**:
  - Definition: `crypto/ecc/fq.lua:21: local function cmp(a, b)`
- **cmp384**:
  - Definition: `crypto/ecc/fq.lua:33: local function cmp384(a, b)`
- **eq**:
  - Definition: `crypto/ecc/fq.lua:11: local function eq(a, b)`
- **fromBytes**:
  - Definition: `crypto/ecc/fq.lua:57: local function fromBytes(enc)`
- **mul**:
  - Definition: `crypto/ecc/fq.lua:730: local function mul(a, b)`
- **mul384**:
  - Definition: `crypto/ecc/fq.lua:464: local function mul384(a, b)`
- **reduce**:
  - Definition: `crypto/ecc/fq.lua:132: local function reduce(a)`
- **reduce384**:
  - Definition: `crypto/ecc/fq.lua:712: local function reduce384(a)`
- **sub**:
  - Definition: `crypto/ecc/fq.lua:206: local function sub(a, b)`
- **sub192**:
  - Definition: `crypto/ecc/fq.lua:68: local function sub192(a, b)`
- **sub384**:
  - Definition: `crypto/ecc/fq.lua:340: local function sub384(a, b)`

## crypto.ecc.init
- **exchange**:
  - Definition: `crypto/ecc/init.lua:36: local function exchange(sk, pk)`
- **hashModQ**:
  - Definition: `crypto/ecc/init.lua:16: local function hashModQ(sk)`
- **publicKey**:
  - Definition: `crypto/ecc/init.lua:27: local function publicKey(sk)`
- **sign**:
  - Definition: `crypto/ecc/init.lua:47: local function sign(sk, message)`
- **verify**:
  - Definition: `crypto/ecc/init.lua:71: local function verify(pk, message, sig)`

## crypto.sha2
- **BE_toInt**:
  - Definition: `crypto/sha2.lua:50: local function BE_toInt(bs, i)`
- **brshift**:
  - Definition: `crypto/sha2.lua:19: local function brshift(int, by)`
- **compute**:
  - Example: `common/Appstore.lua:17: app.key = SHA.compute(key)`
- **counter**:
  - Definition: `crypto/sha2.lua:40: local function counter(incr)`
- **digest**:
  - Example: `swshop/apis/krist.lua:6: return sha2.digest(key):toHex()`
- **digestblock**:
  - Definition: `crypto/sha2.lua:70: local function digestblock(w, C)`
- **hmac**:
  - Definition: `crypto/sha2.lua:118: local function hmac(data, key)`
- **pbkdf2**:
  - Definition: `crypto/sha2.lua:149: local function pbkdf2(pass, salt, iter, dklen)`
- **preprocess**:
  - Definition: `crypto/sha2.lua:54: local function preprocess(data)`
- **rrotate**:
  - Definition: `crypto/sha2.lua:14: local function rrotate(n, b)`
- **toBytes**:
  - Definition: `crypto/sha2.lua:97: local function toBytes(t, n)`

## encoder
- **array**: Array or dict-only encoders, which can be set as __tocbor metamethod
  - Definition: `cbor.lua:253: function encoder.array(t, opts)`
- **boolean**:
  - Definition: `cbor.lua:202: function encoder.boolean(bool)`
- **bytestring**: Major type 2 - byte strings
  - Definition: `cbor.lua:190: function encoder.bytestring(s)`
- **float**:
  - Definition: `cbor.lua:183: function encoder.float(num)`
- **integer**: Major types 0, 1
  - Definition: `cbor.lua:140: function encoder.integer(num)`
- **map**:
  - Definition: `cbor.lua:261: function encoder.map(t, opts)`
- **number**: Number types dispatch
  - Definition: `cbor.lua:135: function encoder.number(num)`
- **ordered_map**:
  - Definition: `cbor.lua:274: function encoder.ordered_map(t, opts)`
- **table**:
  - Definition: `cbor.lua:219: function encoder.table(t, opts)`
- **userdata**:
  - Definition: `cbor.lua:208: function encoder.userdata(ud, opts)`
- **utf8string**: Major type 3 - UTF-8 strings
  - Definition: `cbor.lua:195: function encoder.utf8string(s)`

## entry
- **_val**: convert value to a string (supporting nils or numbers in value)
  - Definition: `entry.lua:6: local function _val(a)`

## env
- **require**:
  - Definition: `injector.lua:99: function env.require(modname)`

## event
- **createCoroutine**: Use a pool of coroutines for event handlers
  - Definition: `event.lua:13: local function createCoroutine(h)`
- **nextUID**:
  - Definition: `event.lua:87: local function nextUID()`
- **processHandlers**:
  - Definition: `event.lua:196: local function processHandlers(event)`
- **processRoutines**:
  - Definition: `event.lua:217: local function processRoutines(...)`
- **tokeys**:
  - Definition: `event.lua:209: local function tokeys(t)`

## fh
- **read**:
  - Definition: `cbor.lua:538: function fh:read(bytes)`
- **write**:
  - Definition: `cbor.lua:549: function fh:write(bytes) -- luacheck: no self`

## fs.netfs
- **remoteCommand**:
  - Definition: `fs/netfs.lua:8: local function remoteCommand(node, msg)`
- **resolve**:
  - Definition: `fs/netfs.lua:37: local function resolve(node, dir)`

## git
- **getContents**:
  - Definition: `git.lua:25: local function getContents()`
- **list**:
  - Definition: `git.lua:13: function git.list(repository)`

## gitfs
- **mount**:
  - Definition: `fs/gitfs.lua:7: function gitfs.mount(dir, repo)`

## gps
- **narrow**:
  - Definition: `gps.lua:132: local function narrow( p1, p2, fix )`
- **trilaterate**: from stock gps API
  - Example: `gps/gpsServer.lua:217: local pt = GPS.trilaterate(computer)`

## h
- **updateInterval**:
  - Definition: `event.lua:135: function h.updateInterval(i)`

## http.pastebin
- **download**: Download the contents of a paste
  - Definition: `http/pastebin.lua:22: local function download(code)`
- **get**: Download the contents to a file from pastebin
  - Definition: `http/pastebin.lua:80: local function get(code, path)`
- **parseCode**: - Parse the pastebin code from the given code or URL
  - Definition: `http/pastebin.lua:2: local function parseCode(paste)`
- **put**: Upload a file to pastebin.com
  - Definition: `http/pastebin.lua:102: local function put(path)`
- **upload**: Upload text to pastebin
  - Definition: `http/pastebin.lua:53: local function upload(name, text)`

## injector
- **helper**:
  - Definition: `injector.lua:9: local function helper(line) table.insert(t, line) return "" end`
- **insert**:
  - Definition: `injector.lua:14: local function insert(p)`
- **pathSearcher**:
  - Definition: `injector.lua:57: local function pathSearcher(modname)`
- **preloadSearcher**:
  - Definition: `injector.lua:49: local function preloadSearcher(modname)`
- **split**:
  - Definition: `injector.lua:7: local function split(str)`

## input
- **isCombo**:
  - Definition: `input.lua:80: local function isCombo()`
- **modifierPressed**:
  - Definition: `input.lua:26: function input:modifierPressed()`
- **reset**:
  - Definition: `input.lua:72: function input:reset()`
- **toCode**:
  - Definition: `input.lua:33: function input:toCode(ch, code)`
- **translate**:
  - Definition: `input.lua:86: function input:translate(event, code, p1, p2)`

## json
- **addnewline**:
  - Definition: `json.lua:182: function json.addnewline (state)`
- **addnewline2**:
  - Definition: `json.lua:175: local function addnewline2 (level, buffer, buflen)`
- **addpair**:
  - Definition: `json.lua:191: local function addpair (key, value, prev, indent, level, buffer, buflen, tables, globalorder, state)`
- **appendcustom**:
  - Definition: `json.lua:208: local function appendcustom(res, buffer, state)`
- **decode**:
  - Example: `core/apis/nameDB.lua:20: local blocks = JSON.decodeFromFile(fs.combine(directory, file))`
- **decodeFromFile**: NOTE: added method - not in original source
  - Example: `core/apis/nameDB.lua:20: local blocks = JSON.decodeFromFile(fs.combine(directory, file))`
- **encode**:
  - Definition: `json.lua:337: function json.encode (value, state)`
- **encodeexception**:
  - Definition: `json.lua:230: function json.encodeexception(reason, value, state, defaultmessage)`
- **escapeutf8**:
  - Definition: `json.lua:84: local function escapeutf8 (uchar)`
- **exception**:
  - Definition: `json.lua:217: local function exception(reason, value, state, buffer, buflen, defaultmessage)`
- **fsub**:
  - Definition: `json.lua:114: local function fsub (str, pattern, repl)`
- **isarray**:
  - Definition: `json.lua:55: local function isarray (tbl)`
- **loc**:
  - Definition: `json.lua:357: local function loc (str, where)`
- **num2str**:
  - Definition: `json.lua:162: local function num2str (num)`
- **optionalmetatables**:
  - Definition: `json.lua:568: local function optionalmetatables(...)`
- **quotestring**:
  - Definition: `json.lua:125: local function quotestring (value)`
- **replace**:
  - Definition: `json.lua:142: local function replace(str, o, n)`
- **scanstring**:
  - Definition: `json.lua:424: local function scanstring (str, pos)`
- **scantable**:
  - Definition: `json.lua:487: local function scantable (what, closechar, str, startpos, nullval, objectmeta, arraymeta)`
- **scanwhite**:
  - Definition: `json.lua:376: local function scanwhite (str, pos)`
- **str2num**:
  - Definition: `json.lua:166: local function str2num (str)`
- **unichar**:
  - Definition: `json.lua:402: local function unichar (value)`
- **unterminated**:
  - Definition: `json.lua:372: local function unterminated (str, what, where)`
- **updatedecpoint**:
  - Definition: `json.lua:154: local function updatedecpoint ()`

## linkfs
- **copy**:
  - Definition: `fs/linkfs.lua:43: function linkfs.copy(node, s, t)`
- **delete**:
  - Definition: `fs/linkfs.lua:49: function linkfs.delete(node, dir)`
- **find**:
  - Definition: `fs/linkfs.lua:58: function linkfs.find(node, spec)`
- **mount**:
  - Definition: `fs/linkfs.lua:21: function linkfs.mount(path, source)`
- **move**:
  - Definition: `fs/linkfs.lua:69: function linkfs.move(node, s, t)`
- **resolve**:
  - Definition: `fs/linkfs.lua:17: function linkfs.resolve(node, dir)`

## map
- **matchAll**:
  - Definition: `map.lua:14: local function matchAll(entry)`

## netfs
- **complete**:
  - Definition: `fs/netfs.lua:69: function netfs.complete(node, partial, dir, includeFiles, includeSlash)`
- **copy**:
  - Definition: `fs/netfs.lua:78: function netfs.copy(node, s, t)`
- **find**:
  - Definition: `fs/netfs.lua:118: function netfs.find(node, spec)`
- **getDrive**:
  - Definition: `fs/netfs.lua:65: function netfs.getDrive()`
- **getSize**:
  - Definition: `fs/netfs.lua:108: function netfs.getSize(node, dir)`
- **isDir**:
  - Definition: `fs/netfs.lua:88: function netfs.isDir(node, dir)`
- **isReadOnly**:
  - Definition: `fs/netfs.lua:98: function netfs.isReadOnly(node, dir)`
- **mount**:
  - Definition: `fs/netfs.lua:54: function netfs.mount(_, id, source)`
- **move**:
  - Definition: `fs/netfs.lua:132: function netfs.move(node, s, t)`
- **open**:
  - Definition: `fs/netfs.lua:142: function netfs.open(node, fn, fl)`

## nft
- **getColourOf**:
  - Definition: `nft.lua:15: local function getColourOf(hex)`

## obj
- **nextInt**:
  - Definition: `crypto/chacha20.lua:156: function obj:nextInt(byte)`

## ramfs
- **attributes**:
  - Definition: `fs/ramfs.lua:25: function ramfs.attributes(node)`
- **delete**:
  - Definition: `fs/ramfs.lua:34: function ramfs.delete(node, dir)`
- **exists**:
  - Definition: `fs/ramfs.lua:40: function ramfs.exists(node, fn)`
- **getDrive**:
  - Definition: `fs/ramfs.lua:62: function ramfs.getDrive()`
- **getFreeSpace**:
  - Definition: `fs/ramfs.lua:66: function ramfs.getFreeSpace()`
- **getSize**:
  - Definition: `fs/ramfs.lua:44: function ramfs.getSize(node)`
- **isDir**:
  - Definition: `fs/ramfs.lua:56: function ramfs.isDir(node, dir)`
- **isReadOnly**:
  - Definition: `fs/ramfs.lua:48: function ramfs.isReadOnly()`
- **list**:
  - Definition: `fs/ramfs.lua:70: function ramfs.list(node, dir)`
- **makeDir**:
  - Definition: `fs/ramfs.lua:52: function ramfs.makeDir(_, dir)`
- **mount**:
  - Definition: `fs/ramfs.lua:7: function ramfs.mount(_, nodeType)`
- **open**:
  - Definition: `fs/ramfs.lua:81: function ramfs.open(node, fn, fl)`

## self
- **render**:
  - Definition: `ui/components/Embedded.lua:22: function self.render()`

## simple_mt
- **__tocbor**:
  - Definition: `cbor.lua:114: function simple_mt:__tocbor() return self.cbor or integer(self.value, 224); end`
- **__tostring**:
  - Definition: `cbor.lua:113: function simple_mt:__tostring() return self.name or ("simple(%d)"):format(self.value); end`

## socket
- **getIdentifier**:
  - Definition: `socket.lua:180: local function getIdentifier()`
- **loopback**:
  - Definition: `socket.lua:79: local function loopback(port, sport, msg)`
- **newSocket**:
  - Definition: `socket.lua:83: local function newSocket(isLoopback)`
- **setupCrypto**:
  - Definition: `socket.lua:107: local function setupCrypto(socket, isClient)`
- **trusted**:
  - Definition: `socket.lua:179: local function trusted(socket, msg, options)`

## socketClass
- **close**:
  - Definition: `socket.lua:65: function socketClass:close()`
- **ping**:
  - Definition: `socket.lua:58: function socketClass:ping()`
- **read**:
  - Definition: `socket.lua:12: function socketClass:read(timeout)`
- **write**:
  - Definition: `socket.lua:47: function socketClass:write(data)`

## tagged_mt
- **__tocbor**:
  - Definition: `cbor.lua:123: function tagged_mt:__tocbor() return integer(self.tag, 192) .. encode(self.value); end`
- **__tostring**:
  - Definition: `cbor.lua:122: function tagged_mt:__tostring() return ("%d(%s)"):format(self.tag, tostring(self.value)); end`

## terminal
- **newLine**:
  - Definition: `terminal.lua:283: local function newLine()`
- **scrollTo**:
  - Definition: `terminal.lua:59: local function scrollTo(y)`
- **translate**:
  - Definition: `terminal.lua:408: local function translate(s)`
- **update**:
  - Definition: `terminal.lua:52: local function update()`

## trace
- **matchesFilter**:
  - Definition: `trace.lua:61: local function matchesFilter(line)`
- **traceback**:
  - Definition: `trace.lua:7: local function traceback(x)`
- **trim_traceback**:
  - Definition: `trace.lua:39: local function trim_traceback(stack)`

## tween
- **new**: Public interface
  - Definition: `ui/tween.lua:338: function tween.new(duration, subject, target, easing)`

## ui
- **calc**:
  - Definition: `ui.lua:514: local function calc(p, max)`
- **focusSort**:
  - Definition: `ui.lua:856: local function focusSort(a, b)`
- **getFocusable**:
  - Definition: `ui.lua:863: local function getFocusable(parent)`
- **getName**:
  - Definition: `ui.lua:215: local function getName(d)`
- **getPosition**:
  - Definition: `ui.lua:263: local function getPosition(element, x, y)`
- **keyFunction**:
  - Definition: `ui.lua:49: local function keyFunction(event, code, held)`
- **load**:
  - Definition: `ui.lua:1096: local function load(name)`
- **loadComponents**: lazy load components
  - Definition: `ui.lua:1095: local function loadComponents()`
- **resize**:
  - Definition: `ui.lua:60: local function resize(_, side)`
- **setOffset**: TODO: fix
  - Definition: `ui.lua:906: local function setOffset(y)`

## ui.blit
- **replace**:
  - Definition: `ui/blit.lua:66: local function replace(sstr, rstr)`

## ui.canvas
- **genPalette**:
  - Definition: `ui/canvas.lua:12: local function genPalette(map)`
- **replace**:
  - Definition: `ui/canvas.lua:192: local function replace(sstr, rstr)`

## ui.components.CheckboxGrid
- **safeValue**:
  - Definition: `ui/components/CheckboxGrid.lua:4: local function safeValue(v)`

## ui.components.Grid
- **inverseSort**:
  - Definition: `ui/components/Grid.lua:251: local function inverseSort(a, b)`
- **safeValue**:
  - Definition: `ui/components/Grid.lua:8: local function safeValue(v)`
- **sort**:
  - Definition: `ui/components/Grid.lua:242: local function sort(a, b)`

## ui.components.MenuBar
- **getPosition**:
  - Definition: `ui/components/MenuBar.lua:65: local function getPosition(element)`

## ui.components.Page
- **getNextFocus**:
  - Definition: `ui/components/Page.lua:92: local function getNextFocus(focused)`
- **getPosition**:
  - Definition: `ui/components/Page.lua:48: local function getPosition(element)`
- **getPreviousFocus**:
  - Definition: `ui/components/Page.lua:74: local function getPreviousFocus(focused)`

## ui.components.QuickSelect
- **recurse**:
  - Definition: `ui/components/QuickSelect.lua:63: local function recurse(dir)`

## ui.components.TextEntry
- **transform**:
  - Definition: `ui/components/TextEntry.lua:8: local function transform(directive)`

## ui.region
- **cutrect**: cutrect: cut rect d into table of new rects, using rect s as a punch
  - Definition: `ui/region.lua:67: local function cutrect(d1, d2, d3, d4, s1, s2, s3, s4)`
- **cutregion**: cutregion: cut region d, using s as a punch
  - Definition: `ui/region.lua:91: local function cutregion(d, s1, s2, s3, s4)`
- **insertrect**: insertrect: insert rect to table, merging with an existing one if possible
  - Definition: `ui/region.lua:41: local function insertrect(d, s1, s2, s3, s4)`

## ui.tween
- **calculatePAS**: elastic
  - Definition: `ui/tween.lua:129: local function calculatePAS(p,a,c,d)`
- **checkNewParams**:
  - Definition: `ui/tween.lua:263: local function checkNewParams(duration, subject, target, easing)`
- **checkSubjectAndTargetRecursively**:
  - Definition: `ui/tween.lua:247: local function checkSubjectAndTargetRecursively(subject, target, path)`
- **copyTables**: private stuff
  - Definition: `ui/tween.lua:231: local function copyTables(destination, keysTable, valuesTable)`
- **getEasingFunction**:
  - Definition: `ui/tween.lua:272: local function getEasingFunction(easing)`
- **inBack**: back
  - Definition: `ui/tween.lua:167: local function inBack(t, b, c, d, s)`
- **inBounce**:
  - Definition: `ui/tween.lua:203: local function inBounce(t, b, c, d) return c - outBounce(d - t, 0, c, d) + b end`
- **inCirc**: circ
  - Definition: `ui/tween.lua:115: local function inCirc(t, b, c, d) return(-c * (sqrt(1 - pow(t / d, 2)) - 1) + b) end`
- **inCubic**: cubic
  - Definition: `ui/tween.lua:45: local function inCubic (t, b, c, d) return c * pow(t / d, 3) + b end`
- **inElastic**:
  - Definition: `ui/tween.lua:134: local function inElastic(t, b, c, d, a, p)`
- **inExpo**: expo
  - Definition: `ui/tween.lua:94: local function inExpo(t, b, c, d)`
- **inOutBack**:
  - Definition: `ui/tween.lua:177: local function inOutBack(t, b, c, d, s)`
- **inOutBounce**:
  - Definition: `ui/tween.lua:204: local function inOutBounce(t, b, c, d)`
- **inOutCirc**:
  - Definition: `ui/tween.lua:117: local function inOutCirc(t, b, c, d)`
- **inOutCubic**:
  - Definition: `ui/tween.lua:47: local function inOutCubic(t, b, c, d)`
- **inOutElastic**:
  - Definition: `ui/tween.lua:151: local function inOutElastic(t, b, c, d, a, p)`
- **inOutExpo**:
  - Definition: `ui/tween.lua:102: local function inOutExpo(t, b, c, d)`
- **inOutQuad**:
  - Definition: `ui/tween.lua:34: local function inOutQuad(t, b, c, d)`
- **inOutQuart**:
  - Definition: `ui/tween.lua:61: local function inOutQuart(t, b, c, d)`
- **inOutQuint**:
  - Definition: `ui/tween.lua:74: local function inOutQuint(t, b, c, d)`
- **inOutSine**:
  - Definition: `ui/tween.lua:87: local function inOutSine(t, b, c, d) return -c / 2 * (cos(pi * t / d) - 1) + b end`
- **inQuad**: quad
  - Definition: `ui/tween.lua:29: local function inQuad(t, b, c, d) return c * pow(t / d, 2) + b end`
- **inQuart**: quart
  - Definition: `ui/tween.lua:59: local function inQuart(t, b, c, d) return c * pow(t / d, 4) + b end`
- **inQuint**: quint
  - Definition: `ui/tween.lua:72: local function inQuint(t, b, c, d) return c * pow(t / d, 5) + b end`
- **inSine**: sine
  - Definition: `ui/tween.lua:85: local function inSine(t, b, c, d) return -c * cos(t / d * (pi / 2)) + c + b end`
- **linear**: linear
  - Definition: `ui/tween.lua:26: local function linear(t, b, c, d) return c * t / d + b end`
- **outBack**:
  - Definition: `ui/tween.lua:172: local function outBack(t, b, c, d, s)`
- **outBounce**: bounce
  - Definition: `ui/tween.lua:190: local function outBounce(t, b, c, d)`
- **outCirc**:
  - Definition: `ui/tween.lua:116: local function outCirc(t, b, c, d)  return(c * sqrt(1 - pow(t / d - 1, 2)) + b) end`
- **outCubic**:
  - Definition: `ui/tween.lua:46: local function outCubic(t, b, c, d) return c * (pow(t / d - 1, 3) + 1) + b end`
- **outElastic**:
  - Definition: `ui/tween.lua:143: local function outElastic(t, b, c, d, a, p)`
- **outExpo**:
  - Definition: `ui/tween.lua:98: local function outExpo(t, b, c, d)`
- **outInBack**:
  - Definition: `ui/tween.lua:184: local function outInBack(t, b, c, d, s)`
- **outInBounce**:
  - Definition: `ui/tween.lua:208: local function outInBounce(t, b, c, d)`
- **outInCirc**:
  - Definition: `ui/tween.lua:123: local function outInCirc(t, b, c, d)`
- **outInCubic**:
  - Definition: `ui/tween.lua:53: local function outInCubic(t, b, c, d)`
- **outInElastic**:
  - Definition: `ui/tween.lua:161: local function outInElastic(t, b, c, d, a, p)`
- **outInExpo**:
  - Definition: `ui/tween.lua:109: local function outInExpo(t, b, c, d)`
- **outInQuad**:
  - Definition: `ui/tween.lua:39: local function outInQuad(t, b, c, d)`
- **outInQuart**:
  - Definition: `ui/tween.lua:66: local function outInQuart(t, b, c, d)`
- **outInQuint**:
  - Definition: `ui/tween.lua:79: local function outInQuint(t, b, c, d)`
- **outInSine**:
  - Definition: `ui/tween.lua:88: local function outInSine(t, b, c, d)`
- **outQuad**:
  - Definition: `ui/tween.lua:30: local function outQuad(t, b, c, d)`
- **outQuart**:
  - Definition: `ui/tween.lua:60: local function outQuart(t, b, c, d) return -c * (pow(t / d - 1, 4) - 1) + b end`
- **outQuint**:
  - Definition: `ui/tween.lua:73: local function outQuint(t, b, c, d) return c * (pow(t / d - 1, 5) + 1) + b end`
- **outSine**:
  - Definition: `ui/tween.lua:86: local function outSine(t, b, c, d) return c * sin(t / d * (pi / 2)) + b end`
- **performEasingOnSubject**:
  - Definition: `ui/tween.lua:284: local function performEasingOnSubject(subject, target, initial, clock, duration, easing)`

## urlfs
- **attributes**:
  - Definition: `fs/urlfs.lua:23: function urlfs.attributes(node, path)`
- **delete**:
  - Definition: `fs/urlfs.lua:32: function urlfs.delete(node, path)`
- **exists**:
  - Definition: `fs/urlfs.lua:38: function urlfs.exists(node, path)`
- **getDrive**:
  - Definition: `fs/urlfs.lua:54: function urlfs.getDrive()`
- **getSize**:
  - Definition: `fs/urlfs.lua:42: function urlfs.getSize(node, path)`
- **isDir**:
  - Definition: `fs/urlfs.lua:50: function urlfs.isDir()`
- **isReadOnly**:
  - Definition: `fs/urlfs.lua:46: function urlfs.isReadOnly()`
- **mount**:
  - Definition: `fs/urlfs.lua:8: function urlfs.mount(path, url, force)`
- **open**:
  - Definition: `fs/urlfs.lua:58: function urlfs.open(node, fn, fl)`

## util
- **convert**:
  - Definition: `util.lua:198: local function convert(v)`
- **getopt**: http://lua-users.org/wiki/AlternativeGetOpt
  - Definition: `util.lua:761: local function getopt( arg, options )`
- **helper**:
  - Definition: `util.lua:641: local function helper(line) table.insert(t, line) return "" end`
- **isArray**:
  - Definition: `util.lua:392: local function isArray(value)`
- **permgen**:
  - Definition: `util.lua:836: local function permgen(a, n)`
- **serialize**:
  - Definition: `util.lua:138: local function serialize(tbl, width)`
- **wrap**: end http://snippets.luacode.org/?p=snippets/trim_whitespace_from_string_76
  - Definition: `util.lua:699: local function wrap(text, max, lines)`
- **wrapRequest**:
  - Definition: `util.lua:20: local function wrapRequest(_url, ...)`

## win
- **blit**:
  - Definition: `terminal.lua:77: function win.blit(str, fg, bg)`
- **clear**:
  - Definition: `terminal.lua:83: function win.clear()`
- **clearLine**:
  - Definition: `terminal.lua:97: function win.clearLine()`
- **getBackgroundColor**:
  - Definition: `terminal.lua:181: function win.getBackgroundColor()`
- **getCanvas**:
  - Definition: `terminal.lua:272: function win.getCanvas()`
- **getCursorBlink**:
  - Definition: `terminal.lua:114: function win.getCursorBlink()`
- **getCursorPos**:
  - Definition: `terminal.lua:103: function win.getCursorPos()`
- **getLine**:
  - Definition: `terminal.lua:92: function win.getLine(n)`
- **getPaletteColor**:
  - Definition: `terminal.lua:135: function win.getPaletteColor(n)`
- **getParent**:
  - Definition: `terminal.lua:276: function win.getParent()`
- **getPosition**:
  - Definition: `terminal.lua:211: function win.getPosition()`
- **getSize**:
  - Definition: `terminal.lua:155: function win.getSize()`
- **getTextColor**:
  - Definition: `terminal.lua:176: function win.getTextColor()`
- **isColor**:
  - Definition: `terminal.lua:125: function win.isColor()`
- **print**:
  - Definition: `terminal.lua:335: function win.print(...)`
- **redraw**:
  - Definition: `terminal.lua:196: function win.redraw()`
- **reposition**:
  - Definition: `terminal.lua:215: function win.reposition(x, y, width, height)`
- **restoreCursor**:
  - Definition: `terminal.lua:203: function win.restoreCursor()`
- **scroll**:
  - Definition: `terminal.lua:159: function win.scroll(n)`
- **scrollBottom**:
  - Definition: `terminal.lua:264: function win.scrollBottom()`
- **scrollDown**: [[ Additional methods ]]--
  - Definition: `terminal.lua:252: function win.scrollDown()`
- **scrollTop**:
  - Definition: `terminal.lua:260: function win.scrollTop()`
- **scrollUp**:
  - Definition: `terminal.lua:256: function win.scrollUp()`
- **setBackgroundColor**:
  - Definition: `terminal.lua:150: function win.setBackgroundColor(c)`
- **setCursorBlink**:
  - Definition: `terminal.lua:118: function win.setCursorBlink(b)`
- **setCursorPos**:
  - Definition: `terminal.lua:107: function win.setCursorPos(x, y)`
- **setMaxScroll**:
  - Definition: `terminal.lua:268: function win.setMaxScroll(ms)`
- **setPaletteColor**:
  - Definition: `terminal.lua:143: function win.setPaletteColor(n, r, g, b)`
- **setTextColor**:
  - Definition: `terminal.lua:130: function win.setTextColor(c)`
- **setVisible**:
  - Definition: `terminal.lua:186: function win.setVisible(visible)`
- **write**:
  - Definition: `terminal.lua:70: function win.write(str)`
- **writeX**:
  - Definition: `terminal.lua:280: function win.writeX(sText)`

