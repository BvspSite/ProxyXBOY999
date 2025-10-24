  -- Script remade by XBOY

  SleepS = function(int_s)
    sleep(int_s * 1000)
  end

  local proxy = {} 
  local command = {}  
  local PlayerList = {}
  local LogSpin = {}
  proxy.dev = "XBOY"
  proxy.name = "XBOYProxy"
  proxy.version = "BETA" 
  version="BETA"
  proxy.support = "undefined"
  command.var = {} 
  command.var.taptp = false
  command.var.rfspin = false
  data = {}
  Tax = 0
  local rfspin = true
  local reme = true
  local qeme

-- New Feature Variables
local webhookURL = ""
local magnetMode = false
local autoHarvestMode = false
local autoPlantID = 0
local SpinStats = {total = 0, wins = 0, losses = 0}
local TrackedPlayers = {}
local CheatStates = {}
local autoCollectActive = false
local autoCollectRange = 5
local bscanPage = 1
local dscanPage = 1
local bscanData = {}
local dscanData = {}

-- Auto Find World Variables
local world_type = "nn"
local world_len = 12
local findWorldActive = false

-- Anti Gravity Variables
local antiGravityActive = false
local gravityThread = nil

-- Relog Variables
local currentWorldName = ""
local isRelogging = false

loginp = [[
set_border_color|112,86,191,255
set_bg_color|43,34,74,200
set_default_color|`9
add_label_with_icon|big|`c=============================|left|9474|
add_label_with_icon|big|    `c[`2XBOY PROXY`c]    |left|9474|
add_label_with_icon|big|`c=============================|left|9474|
add_spacer|small|
add_label_with_icon|big|`2Version: `cBETA `9Enhanced Edition|left|5016|
add_label_with_icon|big|`2Developer: `cXBOY|left|12436|
add_label_with_icon|big|`2Total Commands: `c40+|left|32|
add_spacer|small|
add_label_with_icon|big|`2=============================|left|758|
add_textbox|`9The most `2ADVANCED `9proxy script!|
add_textbox|`9Perfect for `2FARMING`9, `2HOSTING`9, & `2GAMBLING`9!|
add_spacer|small|
add_label_with_icon|big|`2MAIN FEATURES:|left|9474|
add_spacer|small|
add_label_with_icon|small|`2★ `9Auto Farming System|left|5526|
add_smalltext|`2/plant`9, `2/harvest`9, `2/break `9- Full automation!|
add_spacer|small|
add_label_with_icon|small|`2★ `9World Scanner (GrowScan Style)|left|3898|
add_smalltext|`2/bscan`9, `2/dscan `9- Scan all blocks & drops!|
add_spacer|small|
add_label_with_icon|small|`2★ `9Auto Collect System|left|1452|
add_smalltext|`2/ac <range> `9- Auto collect with custom range!|
add_spacer|small|
add_label_with_icon|small|`2★ `9Advanced Inventory Manager|left|242|
add_smalltext|`2/inv`9, `2/findinv`9, `2/trash `9- Full control!|
add_spacer|small|
add_label_with_icon|small|`2★ `9Hosting & Gamble Helper|left|758|
add_smalltext|`2/pos`9, `2/take`9, `2/win`9, `2/spin `9- Easy hosting!|
add_spacer|small|
add_label_with_icon|small|`2★ `9Player Tracker & Cheats|left|6016|
add_smalltext|`2/players`9, `2/track`9, `2/ghost`9, `2/modfly|
add_spacer|small|
add_label_with_icon|small|`2★ `9Discord Webhook & More!|left|1432|
add_smalltext|`2/webhook`9, `2/log `9- Send to Discord!|
add_spacer|small|
add_label_with_icon|big|`2=============================|left|32|
add_textbox|`9Type `2/help `9or `2/proxy `9to see all commands!|
add_spacer|small|
add_label_with_icon|big|`9Support: Contact `2XBOY|left|1432|
add_spacer|small|
end_dialog|loginpend|`2Let's Go!||
add_quick_exit|
]]

proxy = [[
set_border_color|112,86,191,255
set_bg_color|43,34,74,200
set_default_color|`9
add_label_with_icon|big|[`cXBOY`2Proxy`9] `2Command Menu|left|9474|
add_smalltext|Version `2BETA `9- Enhanced Edition|
add_spacer|small|
add_label_with_icon|small|Proxy made by `cXBOY `9| `240+ Commands|left|12436|
add_spacer|small|
add_label_with_icon|big|`2Select Category `9:|left|32|
add_spacer|small|
add_button|cmd_drop|`2Drop & Inventory|noflags|0|0|
add_button|cmd_hosting|`2Hosting Helper|noflags|0|0|
add_button|cmd_gamble|`2Gamble & Spin|noflags|0|0|
add_button|cmd_scanner|`2World Scanner|noflags|0|0|
add_button|cmd_farming|`2Auto Farming|noflags|0|0|
add_button|cmd_collect|`2Auto Collect|noflags|0|0|
add_button|cmd_player|`2Player Tracker|noflags|0|0|
add_button|cmd_cheats|`2Cheats Toggle|noflags|0|0|
add_button|cmd_utility|`2Utility Tools|noflags|0|0|
add_button|cmd_advanced|`2Advanced Features|noflags|0|0|
add_spacer|small|
add_label_with_icon|small|`9Click category to view commands|left|482|
add_spacer|small|
add_label_with_icon|small|Have Problem? Contact `cXBOY|left|1432|
add_spacer|small|
end_dialog|bye|Close|
add_quick_exit|
]]

function dext()
return [[
set_border_color|112,86,191,255
set_bg_color|43,34,74,200
set_default_color|`9
add_label_with_icon|big|`2Spin Cheats   |left|758|
text_scaling_string|iprogramtext
add_spacer|small|
add_checkbox|realfakespin|`2REAL`0-`4FAKE `0Spin Detector|]]..realfakes..[[|
add_checkbox|gamereme|`^REME `0Spin Counter|]]..remeg..[[|
add_checkbox|gameqeme|`9QEME `0Spin Counter|]]..qemeg..[[|
add_spacer|small|
end_dialog|proxywrenchend|Close|Enable|
]]
end

-- Command Category Dialogs
function showDropCommands()
local dialog = [[
set_border_color|112,86,191,255
set_bg_color|43,34,74,200
set_default_color|`9
add_label_with_icon|big|`2Drop & Inventory Commands|left|13810|
add_spacer|small|
add_label_with_icon|small|`2Drop Commands:|left|242|
add_textbox|`2/db `9<Amount> [Drop `eBlue Gem Lock`9]|
add_textbox|`2/dd `9<Amount> [Drop `1Diamond Lock`9]|
add_textbox|`2/dw `9<Amount> [Drop World Lock]|
add_textbox|`2/cd `9<Amount> [Custom Drop]|
add_textbox|`2/daw `9[Drop All Locks]|
add_textbox|`2/trash `9<ItemID> [Drop Specific Item]|
add_textbox|`2/dropall `9[Drop ALL Items in Backpack]|
add_spacer|small|
add_label_with_icon|small|`2Inventory Commands:|left|242|
add_textbox|`2/inv `9[Show Detailed Inventory]|
add_textbox|`2/findinv `9<Name> [Search Item in Inv]|
add_textbox|`2/balance `9[Show Your Balance]|
add_spacer|small|
add_button|backtomenu|<< Back to Menu|noflags|0|0|
add_quick_exit||Close|
end_dialog|dropcmd||
]]
sendVariant({[0] = "OnDialogRequest", [1] = dialog}, -1, 200)
end

function showHostingCommands()
local dialog = [[
set_border_color|112,86,191,255
set_bg_color|43,34,74,200
set_default_color|`9
add_label_with_icon|big|`2Hosting Helper Commands|left|758|
add_spacer|small|
add_textbox|`2/pos `9<1-2> [Set Take & Drop Bets Position]|
add_textbox|`2/tax `9<Amount> [Set Tax]|
add_textbox|`2/bet `9<Amount> [Set Bet]|
add_textbox|`2/take `9[Take Bets From Position 1 & 2]|
add_textbox|`2/win `9<1-2> [Drop Bets to Winner]|
add_spacer|small|
add_button|backtomenu|<< Back to Menu|noflags|0|0|
add_quick_exit||Close|
end_dialog|hostcmd||
]]
sendVariant({[0] = "OnDialogRequest", [1] = dialog}, -1, 200)
end

function showGambleCommands()
local dialog = [[
set_border_color|112,86,191,255
set_bg_color|43,34,74,200
set_default_color|`9
add_label_with_icon|big|`2Gamble & Spin Commands|left|32|
add_spacer|small|
add_textbox|`2/spin `9[Show Spin Cheats Menu]|
add_textbox|`2/slog `9[Show Spin History]|
add_textbox|`2/spinstat `9[Show Spin Statistics]|
add_textbox|`2/export `9[Export Spin History]|
add_textbox|`2/time `9[Show Your Region Time]|
add_spacer|small|
add_button|backtomenu|<< Back to Menu|noflags|0|0|
add_quick_exit||Close|
end_dialog|gamblecmd||
]]
sendVariant({[0] = "OnDialogRequest", [1] = dialog}, -1, 200)
end

function showScannerCommands()
local dialog = [[
set_border_color|112,86,191,255
set_bg_color|43,34,74,200
set_default_color|`9
add_label_with_icon|big|`2World Scanner Commands|left|3898|
add_spacer|small|
add_textbox|`2/bscan `9[Scan All Blocks in World]|
add_textbox|`2/dscan `9[Scan All Dropped Items]|
add_textbox|`2/scan `9<ItemID> [Scan World for Item]|
add_textbox|`2/tiles `9[Show World Statistics]|
add_textbox|`2/ready `9[Show Ready to Harvest Trees]|
add_spacer|small|
add_button|backtomenu|<< Back to Menu|noflags|0|0|
add_quick_exit||Close|
end_dialog|scancmd||
]]
sendVariant({[0] = "OnDialogRequest", [1] = dialog}, -1, 200)
end

function showFarmingCommands()
local dialog = [[
set_border_color|112,86,191,255
set_bg_color|43,34,74,200
set_default_color|`9
add_label_with_icon|big|`2Auto Farming Commands|left|5526|
add_spacer|small|
add_textbox|`2/plant `9<ItemID> [Auto Plant Seeds]|
add_textbox|`2/harvest `9[Auto Harvest Ready Trees]|
add_textbox|`2/break `9<X> <Y> [Break Block at Position]|
add_spacer|small|
add_button|backtomenu|<< Back to Menu|noflags|0|0|
add_quick_exit||Close|
end_dialog|farmcmd||
]]
sendVariant({[0] = "OnDialogRequest", [1] = dialog}, -1, 200)
end

function showCollectCommands()
local dialog = [[
set_border_color|112,86,191,255
set_bg_color|43,34,74,200
set_default_color|`9
add_label_with_icon|big|`2Auto Collect Commands|left|1452|
add_spacer|small|
add_textbox|`2/ac `9[Toggle Auto Collect On/Off]|
add_textbox|`2/ac `9<Range> [Auto Collect Range 1-20]|
add_textbox|`2/collect `9<ItemID> [Collect Specific Item]|
add_textbox|`2/vacuum `9<Range> [Collect All in Range]|
add_textbox|`2/mag `9[Toggle Magnet Mode]|
add_spacer|small|
add_button|backtomenu|<< Back to Menu|noflags|0|0|
add_quick_exit||Close|
end_dialog|collectcmd||
]]
sendVariant({[0] = "OnDialogRequest", [1] = dialog}, -1, 200)
end

function showPlayerCommands()
local dialog = [[
set_border_color|112,86,191,255
set_bg_color|43,34,74,200
set_default_color|`9
add_label_with_icon|big|`2Player Tracker Commands|left|6016|
add_spacer|small|
add_textbox|`2/players `9[List All Players in World]|
add_textbox|`2/track `9<Name> [Track Player Position]|
add_spacer|small|
add_button|backtomenu|<< Back to Menu|noflags|0|0|
add_quick_exit||Close|
end_dialog|playercmd||
]]
sendVariant({[0] = "OnDialogRequest", [1] = dialog}, -1, 200)
end

function showCheatsCommands()
local dialog = [[
set_border_color|112,86,191,255
set_bg_color|43,34,74,200
set_default_color|`9
add_label_with_icon|big|`2Cheats Toggle Commands|left|11304|
add_spacer|small|
add_textbox|`2/ghost `9[Toggle Ghost Mode]|
add_textbox|`2/modfly `9[Toggle Mod Fly]|
add_textbox|`2/noclip `9[Toggle No Clip]|
add_textbox|`2/antiportal `9[Toggle Anti Portal]|
add_textbox|`2/antibounce `9[Toggle Anti Bounce]|
add_textbox|`2/freecam `9[Toggle Free Camera]|
add_spacer|small|
add_button|backtomenu|<< Back to Menu|noflags|0|0|
add_quick_exit||Close|
end_dialog|cheatscmd||
]]
sendVariant({[0] = "OnDialogRequest", [1] = dialog}, -1, 200)
end

function showUtilityCommands()
local dialog = [[
set_border_color|112,86,191,255
set_bg_color|43,34,74,200
set_default_color|`9
add_label_with_icon|big|`2Utility Tools Commands|left|5480|
add_spacer|small|
add_textbox|`2/tp `9<X> <Y> [Teleport to Position]|
add_textbox|`2/camera `9<X> <Y> [Set Camera Position]|
add_textbox|`2/wrench `9<X> <Y> [Wrench Tile]|
add_textbox|`2/place `9<ID> <X> <Y> [Place Block]|
add_textbox|`2/item `9<Name> [Get Item Information]|
add_spacer|small|
add_textbox|`2/warp `9<World> [Warp to World]|
add_textbox|`2/rr `9[Relog World - Exit & Rejoin]|
add_textbox|`2/findworld `9or `2/fw `9[Find Random World]|
add_textbox|`2/setlength `9<1-24> [Set World Length]|
add_textbox|`2/worldtype `9<wn/nn> [Set World Type]|
add_spacer|small|
add_button|backtomenu|<< Back to Menu|noflags|0|0|
add_quick_exit||Close|
end_dialog|utilitycmd||
]]
sendVariant({[0] = "OnDialogRequest", [1] = dialog}, -1, 200)
end

function showAdvancedCommands()
local dialog = [[
set_border_color|112,86,191,255
set_bg_color|43,34,74,200
set_default_color|`9
add_label_with_icon|big|`2Advanced Features|left|6954|
add_spacer|small|
add_textbox|`2/webhook `9<URL> [Set Webhook URL]|
add_textbox|`2/log `9<Message> [Send to Discord]|
add_textbox|`2/randomgid `9[Randomize Device GID]|
add_textbox|`2/randommac `9[Randomize Device MAC]|
add_textbox|`2/threads `9[Show Active Threads]|
add_textbox|`2/killthread `9<ID> [Kill Specific Thread]|
add_textbox|`2/killall `9[Kill All Threads]|
add_spacer|small|
add_button|backtomenu|<< Back to Menu|noflags|0|0|
add_quick_exit||Close|
end_dialog|advancedcmd||
]]
sendVariant({[0] = "OnDialogRequest", [1] = dialog}, -1, 200)
end

  function DropItem(id, count)
  sendPacket(2, "action|drop\n|itemID|"..id.."\n")
  sendPacket(2, "action|dialog_return\ndialog_name|drop_item\nitemID|"..id.."|\ncount|"..count.."\n")
  end

  function checkitm(id)
  for _, inv in pairs(getInventory()) do 
  if inv.id == id then 
  return inv.amount 
  end 
  end 
  return 0 
  end

  function wear(id)
  pkt = {}
  pkt.type = 10
  pkt.value = id
  sendPacketRaw(false, pkt)
  end

  function ovlay(str)
  var = {}
  var[0] = "OnTextOverlay"
  var[1] = "`9[`cXBOY`2Proxy`9] " .. str
  sendVariant(var)
  end

  function tol(txt)
  logToConsole("`9[`cXBOY`2Proxy`9] `o"..txt)
  end

  function Data()
  Amount = 0
  for _, list in pairs(data) do
  Name = ""
  if list.id == 7188 then
  Name = "Blue Gem Lock"
  Amount = Amount + list.count * 10000
  elseif list.id == 1796 then
  Name = "Diamond Lock"
  Amount = Amount + list.count * 100
  elseif list.id == 242 then
  Name = "World Lock"
  Amount = Amount + list.count
  end
  end
  data = {}
  end

  function collect()
  tiles = {
  {PX1, PY1}, {PX2, PY2}
  }
  for _, obj in pairs(getWorldObject()) do
  for _, tiles in pairs(tiles) do
  if math.floor(obj.pos.x/32) == tiles[1] and math.floor(obj.pos.y/32) == tiles[2] then
  sendPacketRaw(false, {type=11,value=obj.oid,x=obj.pos.x,y=obj.pos.y})
  table.insert(data, {id=obj.id, count=obj.amount})
  end
  end
  end
  Data()
  data = {}
  end

  function GetName(id)
  for _, name in pairs(PlayerList) do
  if name.netid == id then
  return name.name
  end
  end
  end

  function multiboxChecker(boolean)
  local hasil = ""
  if boolean then
  hasil = "1"
  else
  hasil = "0"
  end
  return hasil
  end

  function remefunc(number)
  if number == 19 or number == 28 or number == 0 then
  hasil = 0
  else
  num1 = math.floor(number / 10)
  num2 = number % 10
  hasil = string.sub(tostring(num1 + num2), -1)
  end
  return hasil
  end
  
  function qemefunc(number)
  if number >= 10 then
  hasil = string.sub(number, -1)
  else
  hasil = number
  end
  return hasil
  end

  function getGame(num)
  if reme and not qeme then
  return " `^REME `6"..remefunc(tonumber(num))..""
  elseif not reme and qeme then
  return " `9QEME `6"..qemefunc(tonumber(num))..""
  elseif reme and qeme then
  return " `^REME `6"..remefunc(num).." `0| `9QEME `6"..qemefunc(num)..""
  else
  return ""
  end
  end

  function logspin()
  dialogSpin = {}
  for _,spin in pairs(LogSpin) do
  table.insert(dialogSpin,spin.spin)
  end
  sendVariant({
  [0] = "OnDialogRequest",
  [1] = "set_border_color|112,86,191,255\nset_bg_color|43,34,74,200\nset_default_color|`0\nadd_label_with_icon|big|`2Spin History|left|1436|\nadd_spacer|small|\nadd_smalltext|`9Click the wheel icon to filter player spins|\n"..table.concat(dialogSpin).."\nadd_spacer|small|\nadd_quick_exit|||\nend_dialog|world_spin|Close||", },-1,200)
  end

  function filterspin(id)
  filterLog = {}
  for _,log in pairs(LogSpin) do
  if log.netid == id then
  table.insert(filterLog,"\nadd_label_with_icon|small|"..log.spin.."|left|758|\n")
  end
  end
  sendVariant({
  [0] = "OnDialogRequest",
  [1] = "set_border_color|112,86,191,255\nset_bg_color|43,34,74,200\nset_default_color|`0\nadd_label_with_icon|big|"..GetName(id).."`2's Spin History|left|1436|\nadd_spacer|small|\n"..table.concat(filterLog).."|\nadd_spacer|small|\nadd_quick_exit|||\nadd_button|backtospin|Back||", },-1,200)
  end

  function AddOrUpdatePlayer(name, netid)
  if PlayerList[netid] == nil or PlayerList[netid].name ~= name then
  PlayerList[netid] = {name = name, netid = netid}
  end
  end

  -- ============== NEW HELPER FUNCTIONS ==============

  -- World Scanner Functions
  function scanWorld(itemID)
  local count = 0
  local locations = {}
  for _, tile in pairs(getTile()) do
  if tile.fg == itemID or tile.bg == itemID then
  count = count + 1
  table.insert(locations, {x = tile.pos.x, y = tile.pos.y})
  end
  end
  return count, locations
  end

  -- Block Scan Function (All Blocks in World)
  function scanAllBlocks()
  local blockCount = {}
  local totalBlocks = 0
  for _, tile in pairs(getTile()) do
  -- Count foreground blocks
  if tile.fg ~= 0 then
  if blockCount[tile.fg] then
  blockCount[tile.fg] = blockCount[tile.fg] + 1
  else
  blockCount[tile.fg] = 1
  end
  totalBlocks = totalBlocks + 1
  end
  -- Count background blocks
  if tile.bg ~= 0 and tile.bg ~= 14 then -- Exclude blank cave bg
  if blockCount[tile.bg] then
  blockCount[tile.bg] = blockCount[tile.bg] + 1
  else
  blockCount[tile.bg] = 1
  end
  totalBlocks = totalBlocks + 1
  end
  end
  -- Convert to sorted array
  local blockList = {}
  for itemID, count in pairs(blockCount) do
  local item = getItemByID(itemID)
  local itemName = item and item.name or "Unknown"
  table.insert(blockList, {id = itemID, name = itemName, count = count})
  end
  -- Sort by count descending
  table.sort(blockList, function(a, b) return a.count > b.count end)
  return blockList, totalBlocks
  end

  -- Drop Scan Function (All Dropped Items in World)
  function scanAllDrops()
  local dropCount = {}
  local totalDrops = 0
  for _, obj in pairs(getWorldObject()) do
  if dropCount[obj.id] then
  dropCount[obj.id] = dropCount[obj.id] + obj.amount
  else
  dropCount[obj.id] = obj.amount
  end
  totalDrops = totalDrops + obj.amount
  end
  -- Convert to sorted array
  local dropList = {}
  for itemID, count in pairs(dropCount) do
  local item = getItemByID(itemID)
  local itemName = item and item.name or "Unknown"
  table.insert(dropList, {id = itemID, name = itemName, count = count})
  end
  -- Sort by count descending
  table.sort(dropList, function(a, b) return a.count > b.count end)
  return dropList, totalDrops
  end

  -- Display Block Scan Dialog with Pagination
  function showBlockScan(page)
  if not page then page = 1 end
  bscanPage = page
  local blockList, totalBlocks = scanAllBlocks()
  bscanData = blockList
  local itemsPerPage = 15
  local totalPages = math.ceil(#blockList / itemsPerPage)
  if bscanPage > totalPages then bscanPage = totalPages end
  if bscanPage < 1 then bscanPage = 1 end
  local startIdx = (bscanPage - 1) * itemsPerPage + 1
  local endIdx = math.min(bscanPage * itemsPerPage, #blockList)
  local dialog = "set_border_color|112,86,191,255\n"
  dialog = dialog .. "set_bg_color|43,34,74,200\n"
  dialog = dialog .. "set_default_color|`0\n"
  dialog = dialog .. "add_label_with_icon|big|`2Block Scan Results|left|3898|\n"
  dialog = dialog .. "add_smalltext|`9Total Blocks: `2"..totalBlocks.." `9| Unique: `2"..#blockList.."|\n"
  dialog = dialog .. "add_smalltext|`9Page `2"..bscanPage.." `9of `2"..totalPages.."|\n"
  dialog = dialog .. "add_spacer|small|\n"
  dialog = dialog .. "add_textbox|`9Blocks in world:|\n"
  dialog = dialog .. "add_spacer|small|\n"
  for i = startIdx, endIdx do
  if blockList[i] then
  dialog = dialog .. "add_label_with_icon|small|`2"..blockList[i].name.." `9x`2"..blockList[i].count.."|left|"..blockList[i].id.."|\n"
  end
  end
  dialog = dialog .. "add_spacer|small|\n"
  -- Pagination buttons
  if totalPages > 1 then
  local buttons = ""
  if bscanPage > 1 then
  buttons = buttons .. "add_button|bscan_prev|<< Previous|noflags|0|0|\n"
  end
  if bscanPage < totalPages then
  if bscanPage > 1 then
  buttons = buttons .. "add_button|bscan_next|Next >>|noflags|0|0|\n"
  else
  buttons = buttons .. "add_button|bscan_next|Next >>|noflags|0|0|\n"
  end
  end
  dialog = dialog .. buttons
  dialog = dialog .. "add_spacer|small|\n"
  end
  dialog = dialog .. "add_quick_exit|||\n"
  dialog = dialog .. "end_dialog|blockscan|Close||\n"
  sendVariant({[0] = "OnDialogRequest", [1] = dialog}, -1, 200)
  end

  -- Display Drop Scan Dialog with Pagination
  function showDropScan(page)
  if not page then page = 1 end
  dscanPage = page
  local dropList, totalDrops = scanAllDrops()
  dscanData = dropList
  local itemsPerPage = 15
  local totalPages = math.ceil(#dropList / itemsPerPage)
  if dscanPage > totalPages then dscanPage = totalPages end
  if dscanPage < 1 then dscanPage = 1 end
  local startIdx = (dscanPage - 1) * itemsPerPage + 1
  local endIdx = math.min(dscanPage * itemsPerPage, #dropList)
  local dialog = "set_border_color|112,86,191,255\n"
  dialog = dialog .. "set_bg_color|43,34,74,200\n"
  dialog = dialog .. "set_default_color|`0\n"
  dialog = dialog .. "add_label_with_icon|big|`2Drop Scan Results|left|1452|\n"
  dialog = dialog .. "add_smalltext|`9Total Dropped: `2"..totalDrops.." `9| Types: `2"..#dropList.."|\n"
  if #dropList > 0 then
  dialog = dialog .. "add_smalltext|`9Page `2"..dscanPage.." `9of `2"..totalPages.."|\n"
  end
  dialog = dialog .. "add_spacer|small|\n"
  if #dropList > 0 then
  dialog = dialog .. "add_textbox|`9Items on ground:|\n"
  dialog = dialog .. "add_spacer|small|\n"
  for i = startIdx, endIdx do
  if dropList[i] then
  dialog = dialog .. "add_label_with_icon|small|`2"..dropList[i].name.." `9x`2"..dropList[i].count.."|left|"..dropList[i].id.."|\n"
  end
  end
  dialog = dialog .. "add_spacer|small|\n"
  -- Pagination buttons
  if totalPages > 1 then
  local buttons = ""
  if dscanPage > 1 then
  buttons = buttons .. "add_button|dscan_prev|<< Previous|noflags|0|0|\n"
  end
  if dscanPage < totalPages then
  if dscanPage > 1 then
  buttons = buttons .. "add_button|dscan_next|Next >>|noflags|0|0|\n"
  else
  buttons = buttons .. "add_button|dscan_next|Next >>|noflags|0|0|\n"
  end
  end
  dialog = dialog .. buttons
  dialog = dialog .. "add_spacer|small|\n"
  end
  else
  dialog = dialog .. "add_textbox|`4No items dropped in world!|\n"
  dialog = dialog .. "add_spacer|small|\n"
  end
  dialog = dialog .. "add_quick_exit|||\n"
  dialog = dialog .. "end_dialog|dropscan|Close||\n"
  sendVariant({[0] = "OnDialogRequest", [1] = dialog}, -1, 200)
  end

  function getReadyTrees()
  local readyList = {}
  for _, tile in pairs(getTile()) do
  local extra = getExtraTile(tile.pos.x, tile.pos.y)
  if extra and extra.valid and extra.ready then
  local item = getItemByID(tile.fg)
  if item then
  table.insert(readyList, {x = tile.pos.x, y = tile.pos.y, name = item.name})
  end
  end
  end
  return readyList
  end

  function getWorldStats()
  local world = getWorld()
  local objects = getWorldObject()
  local npcs = getNpc()
  local players = getPlayerlist()
  local objectCount = 0
  for _ in pairs(objects) do objectCount = objectCount + 1 end
  local npcCount = 0
  for _ in pairs(npcs) do npcCount = npcCount + 1 end
  local playerCount = 0
  for _ in pairs(players) do playerCount = playerCount + 1 end
  return {
  name = world.name,
  width = world.width,
  height = world.height,
  objects = objectCount,
  npcs = npcCount,
  players = playerCount
  }
  end

  -- Inventory Functions
  function getItemCount(itemID)
  return checkitm(itemID)
  end

  function findItemByName(searchName)
  local results = {}
  for _, inv in pairs(getInventory()) do
  local item = getItemByID(inv.id)
  if item and string.lower(item.name):find(string.lower(searchName)) then
  table.insert(results, {id = inv.id, name = item.name, amount = inv.amount})
  end
  end
  return results
  end

  function getTotalInventoryValue()
  local total = 0
  total = total + checkitm(7188) * 10000  -- BGL
  total = total + checkitm(1796) * 100     -- DL
  total = total + checkitm(242)            -- WL
  return total
  end

  -- Auto Collect Functions
  function collectItemInRange(itemID, range)
  local collected = 0
  local myPos = getLocal().pos
  for _, obj in pairs(getWorldObject()) do
  if itemID == 0 or obj.id == itemID then
  local distance = math.sqrt((obj.pos.x - myPos.x)^2 + (obj.pos.y - myPos.y)^2)
  if distance <= range * 32 then
  sendPacketRaw(false, {type=11, value=obj.oid, x=obj.pos.x, y=obj.pos.y})
  collected = collected + 1
  end
  end
  end
  return collected
  end

  -- Continuous Auto Collect Function
  function startAutoCollect()
  if autoCollectActive then
  tol("`4Auto Collect is already running!")
  return
  end
  autoCollectActive = true
  runThread(function()
  tol("`2Auto Collect Started! `9Range: `2"..autoCollectRange.." `9tiles")
  ovlay("`2Auto Collect ON `9| Range: `2"..autoCollectRange)
  while autoCollectActive do
  if not autoCollectActive then
  break
  end
  local myPos = getLocal().pos
  for _, obj in pairs(getWorldObject()) do
  if not autoCollectActive then
  break
  end
  local distance = math.sqrt((obj.pos.x - myPos.x)^2 + (obj.pos.y - myPos.y)^2)
  if distance <= autoCollectRange * 32 then
  sendPacketRaw(false, {type=11, value=obj.oid, x=obj.pos.x, y=obj.pos.y})
  sleep(50)
  end
  end
  sleep(100)
  end
  end, "autocollect")
  end

  function stopAutoCollect()
  if not autoCollectActive then
  tol("`4Auto Collect is not running!")
  return
  end
  autoCollectActive = false
  sleep(200)
  tol("`4Auto Collect Stopped!")
  ovlay("`4Auto Collect OFF")
  end

  -- Auto Harvest Functions
  function harvestReadyTrees()
  local harvested = 0
  for _, tree in pairs(getReadyTrees()) do
  local distance = math.sqrt((tree.x*32 - getLocal().pos.x)^2 + (tree.y*32 - getLocal().pos.y)^2)
  if distance <= 4 * 32 then
  requestTileChange(tree.x, tree.y, 18)
  harvested = harvested + 1
  sleep(150)
  end
  end
  return harvested
  end

  function autoPlantTree(itemID)
  local planted = 0
  local myPos = getLocal().pos
  for x = 0, getWorld().width - 1 do
  for y = 0, getWorld().height - 1 do
  local tile = checkTile(x, y)
  if tile and tile.fg == 0 and tile.bg ~= 0 then
  local distance = math.sqrt((x*32 - myPos.x)^2 + (y*32 - myPos.y)^2)
  if distance <= 4 * 32 then
  findPath(x, y)
  sleep(100)
  requestTileChange(x, y, itemID)
  planted = planted + 1
  sleep(150)
  if checkitm(itemID) <= 0 then
  return planted
  end
  end
  end
  end
  end
  return planted
  end

  -- Player Tracker Functions
  function getAllPlayers()
  local playerList = {}
  for _, player in pairs(getPlayerlist()) do
  table.insert(playerList, {
  name = player.name,
  netid = player.netId,
  pos = player.pos,
  country = player.country,
  gems = player.gems
  })
  end
  return playerList
  end

  -- Discord Webhook Function
  function sendDiscordWebhook(content)
  if webhookURL == "" then
  tol("`4Webhook URL not set! Use `2/webhook <url>")
  return false
  end
  local webhook = {}
  webhook.username = "XBOY Proxy"
  webhook.avatar_url = ""
  webhook.content = content
  webhook.useEmbeds = false
  sendWebhook(webhookURL, webhook)
  return true
  end

  -- Cheat Toggle Functions
  function toggleCheatByName(cheatName, state)
  local cheats = {
  ["ghost"] = 1,
  ["nightvision"] = 2,
  ["seeghost"] = 3,
  ["antibounce"] = 4,
  ["noclip"] = 6,
  ["antiportal"] = 10,
  ["fastwheel"] = 12,
  ["antiresp"] = 20,
  ["modfly"] = 26,
  ["freecam"] = 30,
  ["harvest"] = 31
  }
  if cheats[string.lower(cheatName)] then
  toggleCheat(cheats[string.lower(cheatName)], state)
  return true
  end
  return false
  end

-- Fast Action Functions
function placeBlock(x, y, itemID)
findPath(x, y)
sleep(100)
requestTileChange(x, y, itemID)
end

function breakBlock(x, y)
findPath(x, y)
sleep(100)
requestTileChange(x, y, 18)
end

function wrenchTile(x, y)
sendPacketRaw(false, {type=7, value=18, x=x*32, y=y*32, state=32})
end

-- Auto Find World Functions
function generateRandomWorld(len, typ)
local chars = (typ == "wn") and "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890" or "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
local world = ""
for i = 1, len do
local r = math.random(1, #chars)
world = world .. string.sub(chars, r, r)
end
return world
end

function findRandomWorld()
if world_len > 24 then
tol("`4World length cannot be more than 24 letters!")
return
end
local worldName = generateRandomWorld(world_len, world_type)
tol("`9Searching world: `2"..worldName)
ovlay("`9Finding: `2"..worldName)
sendPacket(3, "action|join_request\nname|"..worldName.."\ninvitedWorld|0")
end

function warpToWorld(worldName)
if worldName == "" or not worldName then
tol("`4Please provide a world name!")
return false
end
tol("`9Warping to world: `2"..worldName)
ovlay("`9Warping to: `2"..worldName)
sendPacket(3, "action|join_request\nname|"..worldName.."\ninvitedWorld|0")
return true
end

-- Anti Gravity Functions
function startAntiGravity()
if antiGravityActive then
tol("`4Anti Gravity is already active!")
return
end
antiGravityActive = true
tol("`2Anti Gravity Enabled!")
ovlay("`2Anti Gravity ON")
runThread(function()
while antiGravityActive do
local pkt = {}
pkt.type = 0
pkt.netid = getLocal().netId
pkt.state = 16
pkt.x = getLocal().pos.x
pkt.y = getLocal().pos.y
pkt.speedx = 0
pkt.speedy = -350
sendPacketRaw(false, pkt)
sleep(100)
end
end, "antigravity")
end

function stopAntiGravity()
if not antiGravityActive then
tol("`4Anti Gravity is not active!")
return
end
antiGravityActive = false
sleep(200)
tol("`4Anti Gravity Disabled!")
ovlay("`4Anti Gravity OFF")
end

-- Relog Functions
function relogWorld()
local world = getWorld()
if not world or world.name == "" or world.name == "EXIT" then
tol("`4You're not in any world!")
ovlay("`4Not in world!")
return false
end
currentWorldName = world.name
isRelogging = true
tol("`9Relogging world: `2"..currentWorldName)
ovlay("`9Relogging...")
runThread(function()
-- Leave world
sendPacket(3, "action|quit_to_exit")
sleep(2000)
-- Rejoin world
sendPacket(3, "action|join_request\nname|"..currentWorldName.."\ninvitedWorld|0")
sleep(500)
isRelogging = false
tol("`2Rejoined world: `2"..currentWorldName)
ovlay("`2Relog Complete!")
end, "relogworld")
return true
end


  AddHook("onTouch", "on_touch", on_touchpacket)
  AddHook("OnVarlist", "variants", function(var) 
  varcontent = var[1] 
  if var[0] == "OnConsoleMessage" then 
  tol(varcontent) 
  return true 
  end
      
  if rfspin == true then
  if var[0] == "OnTalkBubble" then
  if var[2]:find("spun the wheel") then
  if var[2]:find("OID:") then
  sendVariant({
  [0] = "OnTalkBubble",
  [1] = var[1],
  [2] = "[`4FAKE``] "..var[2]:match("player_chat=(.+)"),
  [3] = 0, }, -1)
  table.insert(LogSpin, {spin = "\nadd_label_with_icon_button|small|[`4FAKE``] " .. var[2] .. "|left|758|" .. var[1] .. "|\n", netid = var[1],spins = "[`4FAKE``] "..var[2]})
  return true
  else
  local num = string.gsub(string.gsub(var[2]:match("and got (.+)"), "!%]", ""), "`", "")
  local onlynumber = string.sub(num, 2)
  local clearspace = string.gsub(onlynumber, " ", "")
  local h = string.gsub(string.gsub(clearspace, "!7", ""), "]", "")
  if var[1] ~= getLocal().netid then
  table.insert(PlayerList, {name = var[2]:match("%[``(.+) spun the"), netid = var[1]})
  else
  AddOrUpdatePlayer(getLocal().name:gsub("%[(.+)%]", ""), var[1])
  end
  local name = {}
  name[0] = "OnNameChanged"
  name[1] = GetName(var[1]) .. " `b[`c" .. h .. "``]"
  sendVariant(name, tonumber(var[1]))
  if var[1] ~= getLocal().netid then
  sendVariant({
  [0] = "OnTalkBubble",
  [1] = var[1],
  [2] = "[`2REAL``] "..var[2].. getGame(tonumber(h)),
  [3] = 0, }, -1)
  else
  sendVariant({
  [0] = "OnTalkBubble",
  [1] = getLocal().netid,
  [2] = "[`2REAL``] " .. getLocal().name:gsub("%[(.-)%]", ""):gsub("`.","") .. " spun the wheel and got " .. var[2]:match("and got (.+)%!]") .. "!]" .. getGame(tonumber(h)), }, -1)
  end
  table.insert(LogSpin, {spin = "\nadd_label_with_icon_button|small|[`2REAL``] " .. var[2] .. "|left|758|" .. var[1] .. "|\n", netid = var[1],spins = var[2]})
  return true
  end
  end
  return false
  end
  end
  return false
  end)

  AddHook("onVarlist", "var", function(var)
  if var[0] == "OnConsoleMessage" then
  if var[1]:find("Collected") and var[1]:find("(%d+) Blue Gem Lock") then
  bgl = var[1]:match("(%d+) Blue Gem Lock")
  tol("`9Collected `2"..bgl.." `eBlue Gem Lock`9.")
  ovlay("`9Collected `2"..bgl.." `eBlue Gem Lock")
  return true
  end
  end

  if var[0] == "OnConsoleMessage" then
  if var[1]:find("Collected") and var[1]:find("(%d+) Diamond Lock") then
  dl = var[1]:match("(%d+) Diamond Lock")
  tol("`9Collected `2"..dl.." `1Diamond Lock`9.")
  ovlay("`9Collected `2"..dl.." `1Diamond Lock")
  return true
  end
  end

  if var[0] == "OnConsoleMessage" then
  if var[1]:find("Collected") and var[1]:find("(%d+) World Lock") then
  wl = var[1]:match("(%d+) World Lock")
  tol("`9Collected `2"..wl.." `9World Lock.")
  ovlay("`9Collected `2"..wl.." `9World Lock")
  wear(242)
  return true
  end
  end
  return false
  end)

  AddHook("OnVarlist", "Hook", function(var)
  if var[0] == "OnDialogRequest" then
  if var[1]:find("Drop Blue Gem Lock") or
  var[1]:find("Drop Diamond Lock") or
  var[1]:find("Drop World Lock") then
  return true
  end
  end

  if var[0] == "OnDialogRequest" then
  if var[1]:find("Telephone") then
  sendPacket(2, "action|dialog_return\ndialog_name|3898\nbuttonClicked|chc2_2_1\n\n")
  return true
  end
  end
  end)

  AddHook("onTextPacket", "packet", function(type,packet)
  if packet:find("realfakespin|1") then
  rfspin = true
  tol("`2REAL`o-`4FAKE `oSpin Detector `2Enabled`o.")
  else if packet:find("realfakespin|0") then
  rfspin = false
  tol("`2REAL`o-`4FAKE `oSpin Detector `4Disabled`o.")
  end
  end

  if packet:find("gamereme|1") then
  reme = true
  tol("`^REME `oSpin Counter `2Enabled`o.")
  else if packet:find("gamereme|0") then
  reme = false
  tol("`^REME `oSpin Counter `4Disabled`o.")
  end
  end

  if packet:find("gameqeme|1") then
  qeme = true
  tol("`9QEME `oSpin Counter `2Enabled`o.")
  else if packet:find("gameqeme|0") then
  qeme = false
  tol("`9QEME `oSpin Counter `4Disabled`o.")
  end
  end

  if packet:find("buttonClicked|proxylogspin") then
  logspin()
  return true
  end

  if packet:find("dialog_name|world_spin\nbuttonClicked|(%d+)") then
  netid = packet:match("buttonClicked|(%d+)")
  filterspin(tonumber(netid))
  end

  if packet:find("buttonClicked|backtospin") then
  logspin()
  return true
  end

  if packet:find("action|input\n|text|/spin") then
  realfakes = multiboxChecker(rfspin)
  remeg = multiboxChecker(reme)
  qemeg = multiboxChecker(qeme)
  sendVariant({
  [0] = "OnDialogRequest",
  [1] = dext(), }, -1, 100)
  logToConsole("`6/spin")
  return true
  end

  if packet:find("action|input\n|text|/proxy") then
  var = {}
  var[0] = "OnDialogRequest"
  var[1] = proxy
  sendVariant (var);
  logToConsole("`6/proxy")
  return true
  end

  if packet:find("action|input\n|text|/news") then
  var = {}
  var[0] = "OnDialogRequest"
  var[1] = loginp
  sendVariant (var);
  logToConsole("`6/news")
  return true
  end

  if packet:find("action|input\n|text|/db (%d+)") then
  txt = packet:match("action|input\n|text|/db (%d+)")
  DropItem(7188, txt)
  logToConsole("`6/db "..txt.."")
  tol("`9Dropped `2"..txt.." `eBlue Gem Lock`9.")
  ovlay("`9Dropped `2"..txt.." `eBlue Gem Lock")
  return true
  end

  if packet:find("action|input\n|text|/dd (%d+)") then
  txt = packet:match("action|input\n|text|/dd (%d+)")
  DropItem(1796, txt)
  logToConsole("`6/dd "..txt.."")
  tol("`9Dropped `2"..txt.." `1Diamond Lock`9.")
  ovlay("`9Dropped `2"..txt.." `1Diamond Lock")
  return true
  end

  if packet:find("action|input\n|text|/dw (%d+)") then
  txt = packet:match("action|input\n|text|/dw (%d+)")
  DropItem(242, txt)
  logToConsole("`6/dw "..txt.."")
  tol("`9Dropped `2"..txt.." `9World Lock.")
  ovlay("`9Dropped `2"..txt.." `9World Lock")
  return true
  end

  if packet:find("action|input\n|text|/cd (%d+)") then
  total = packet:match("action|input\n|text|/cd (%d+)")
  count = packet:match("action|input\n|text|/cd (%d+)")
  bgl =math.floor(total/10000)
  total = total - bgl*10000 
  dl = math.floor(total/100)
  wl = total % 100
  if checkitm(242) < wl then
  wear(1796)
  end
  if checkitm(1796) < dl then
  wear(7188)
  end
  if bgl > 0 then
  DropItem(7188, bgl)
  end
  if dl > 0 then
  DropItem(1796, dl)
  end
  if wl > 0 then
  DropItem(242, wl)
  end
  hasil = (bgl ~= 0 and bgl.." `eBlue Gem Lock`9." or "").." `2"..(dl ~= 0 and dl.." `1Diamond Lock`9." or "").." `2"..(wl ~= 0 and wl.." `9World Lock." or "")
  logToConsole("`6/cd "..count.."")
  tol("`9Dropped `2"..hasil.."")
  ovlay("`9Dropped `2"..hasil.."")
  return true
  end

  if packet:find("action|input\n|text|/daw") then
  if checkitm(7188) > 0 then
  DropItem(7188, checkitm(7188))
  end
  if checkitm(1796) > 0 then
  DropItem(1796, checkitm(1796))
  end
  if checkitm(242) > 0 then
  DropItem(242, checkitm(242))
  end
  hasil = (checkitm(7188) ~= 0 and checkitm(7188).." `eBlue Gem Lock`9." or "").." `2"..(checkitm(1796) ~= 0 and checkitm(1796).." `1Diamond Lock`9." or "").." `2"..(checkitm(242) ~= 0 and checkitm(242).." `9World Lock." or "")
  logToConsole("`6/daw")
  tol("`9Dropped `2"..hasil.."")
  return true
  end

  -- Drop All Items Command
  if packet:find("action|input\n|text|/dropall") then
  logToConsole("`6/dropall")
  tol("`9Starting to drop all items...")
  ovlay("`9Preparing to drop...")
  
  -- Run in thread to prevent blocking
  runThread(function()
  local totalDropped = 0
  local itemList = {}
  
  -- Get all items from inventory
  for _, inv in pairs(getInventory()) do
  if inv.id and inv.amount and inv.amount > 0 then
  local itemName = getItemByID(inv.id)
  local name = itemName and itemName.name or "Item "..inv.id
  table.insert(itemList, {id = inv.id, amount = inv.amount, name = name})
  end
  end
  
  local totalItems = #itemList
  tol("`9Found `2"..totalItems.." `9different items to drop.")
  sleep(500) -- Initial delay
  
  -- Drop each item with smooth delay
  for i, item in pairs(itemList) do
  DropItem(item.id, item.amount)
  totalDropped = totalDropped + 1
  
  -- Show progress
  tol("`9[`2"..totalDropped.."`9/`2"..totalItems.."`9] Dropped: `2"..item.name.." `9x`2"..item.amount)
  ovlay("`9Dropping... `2"..totalDropped.."/"..totalItems)
  
  -- Smooth delay between drops (300-500ms)
  sleep(350)
  
  -- Extra delay every 10 items to prevent crash
  if totalDropped % 10 == 0 then
  tol("`9Pausing for safety... (`2"..totalDropped.."/"..totalItems.." `9completed)")
  sleep(800)
  end
  end
  
  -- Final message
  tol("`2Successfully dropped all items! `9Total: `2"..totalDropped.." `9different items.")
  ovlay("`2Drop Complete! "..totalDropped.." items")
  end, "dropall")
  
  return true
  end

  if packet:find("action|input\n|text|/pos 1")then
  PX1 = math.floor(getLocal().pos.x/32)
  PY1 = math.floor(getLocal().pos.y/32)
  logToConsole("`6/pos 1")
  tol("`9Set Position 1 to (`2"..PX1.."`9, `2"..PY1.."`9).")
  ovlay("`9Set Position 1 to (`2"..PX1.."`9, `2"..PY1.."`9)")
  return true
  end

  if packet:find("action|input\n|text|/pos 2") then
  PX2 = math.floor(getLocal().pos.x/32)
  PY2 = math.floor(getLocal().pos.y/32)
  logToConsole("`6/pos 2")
  tol("`9Set Position 2 to (`2"..PX2.."`9, `2"..PY2.."`9).")
  ovlay("`9Set Position 2 to (`2"..PX2.."`9, `2"..PY2.."`9)")
  return true
  end

  if packet:find("action|input\n|text|/tax (%d+)") then
  pler = packet:match("action|input\n|text|/tax (%d+)")
  Tax = ""..pler..""
  logToConsole("`6/tax "..Tax.."")
  tol("`9Set Tax to : `2"..Tax.."%%`9.")
  ovlay("`9Set Tax to : `2"..Tax.."%")
  return true
  end

  if packet:find("action|input\n|text|/bet (%d+)") then
  TotalBet = packet:match("action|input\n|text|/bet (%d+)")
  logToConsole("`6/bet "..TotalBet.."")
  tol("`9Set Bet to : `2"..TotalBet.."`9.")
  ovlay("`9Set Bet to : `2"..TotalBet.."")
  return true
  end

  if packet:find("action|input\n|text|/take") then
  collect()
  tax = math.floor(Amount * Tax / 100)
  drop = Amount - tax
  bets = Amount//2
  logToConsole("`6/take")
  tol("`9Tax : `2"..Tax.."%%`9.")
  tol("`9Drop to Winner : `2"..drop.."`9.")
  tol("`9Successfully Took All Bets`9.")
  ovlay("`9Tax (`2"..Tax.."%`9) Drop to Winner (`2"..drop.."`9)")
  return true
  end

  if packet:find("action|input\n|text|/win 1") then
  tax = math.floor(Amount * Tax / 100)
  win = Amount - tax
  bgl =math.floor(drop/10000)
  drop = drop - bgl*10000 
  dl = math.floor(drop/100)
  wl = drop % 100
  sendPacketRaw(false, { type = 0, x = (PX1) * 32, y = (PY1) * 32, state = 48 })
  if checkitm(242) < wl then
  wear(1796)
  end
  if checkitm(1796) < dl then
  wear(7188)
  end
  if bgl > 0 then
  DropItem(7188, bgl)
  end
  if dl > 0 then
  DropItem(1796, dl)
  end
  if wl > 0 then
  DropItem(242, wl)
  end
  hasil = (bgl ~= 0 and bgl.." `eBlue Gem Lock`9." or "").." `2"..(dl ~= 0 and dl.." `1Diamond Lock`9." or "").." `2"..(wl ~= 0 and wl.." `9World Lock." or "")
  logToConsole("`6/win 1")
  tol("`9Total Bet : `2"..Amount.."`9.")
  tol("`9Tax : `2"..Tax.."%%`9.")
  tol("`9Drop to Winner : `2"..win.."`9.")
  tol("`9Dropped `2"..hasil.."")
  ovlay("`9Dropped `2"..hasil.."")
  return true
  end

  if packet:find("action|input\n|text|/win 2") then
  tax = math.floor(Amount * Tax / 100)
  win = Amount - tax
  bgl =math.floor(drop/10000)
  drop = drop - bgl*10000 
  dl = math.floor(drop/100)
  wl = drop % 100
  sendPacketRaw(false, { type = 0, x = (PX2) * 32, y = (PY2) * 32, state = 32 })
  if checkitm(242) < wl then
  wear(1796)
  end
  if checkitm(1796) < dl then
  wear(7188)
  end
  if bgl > 0 then
  DropItem(7188, bgl)
  end
  if dl > 0 then
  DropItem(1796, dl)
  end
  if wl > 0 then
  DropItem(242, wl)
  end
  hasil = (bgl ~= 0 and bgl.." `eBlue Gem Lock`9." or "").." `2"..(dl ~= 0 and dl.." `1Diamond Lock`9." or "").." `2"..(wl ~= 0 and wl.." `9World Lock." or "")
  logToConsole("`6/win 2")
  tol("`9Total Bet : `2"..Amount.."`9.")
  tol("`9Tax : `2"..Tax.."%%`9.")
  tol("`9Drop to Winner : `2"..win.."`9.")
  tol("`9Dropped `2"..hasil.."")
  ovlay("`9Dropped `2"..hasil.."")
  return true
  end

  if packet:find("action|input\n|text|/balance") then
  logToConsole("`6/balance")
  gems = getLocal().gems
  tol("`9Your Gems Amount : `2"..gems.."`9.")
  tol("`9Your Locks Amount : `2"..checkitm(7188).." `eBGL`9, `2"..checkitm(1796).." `1DL`9, `2"..checkitm(242).." `9WL.")
  ovlay("`9Your Locks Amount : `2"..checkitm(7188).." `eBGL`9, `2"..checkitm(1796).." `1DL`9, `2"..checkitm(242).." `9WL.")
  return true
  end

  if packet:find("action|input\n|text|/slog") then
  logToConsole("`6/slog")
  logspin()
  return true
  end

  if packet:find("action|input\n|text|/time") then
  date = os.date("%D")
  time = os.date("%H:%M:%S")
  logToConsole("`6/time")
  tol("`9Your Region Date : `2"..date.."`9.")
  tol("`9Your Region Time : `2"..time.."`9.")
  ovlay("`9Your Region Time : `2"..time.."`9, `2"..date.."")
  return true
  end

  -- ============== NEW COMMANDS ==============

  -- World Scanner Commands
  if packet:find("action|input\n|text|/bscan") then
  logToConsole("`6/bscan")
  tol("`9Scanning all blocks in world...")
  ovlay("`9Scanning blocks...")
  bscanPage = 1
  showBlockScan(1)
  return true
  end

  if packet:find("action|input\n|text|/dscan") then
  logToConsole("`6/dscan")
  tol("`9Scanning all dropped items...")
  ovlay("`9Scanning drops...")
  dscanPage = 1
  showDropScan(1)
  return true
  end

  -- Block Scan Pagination Handlers
  if packet:find("buttonClicked|bscan_next") then
  bscanPage = bscanPage + 1
  showBlockScan(bscanPage)
  return true
  end

  if packet:find("buttonClicked|bscan_prev") then
  bscanPage = bscanPage - 1
  showBlockScan(bscanPage)
  return true
  end

  -- Drop Scan Pagination Handlers
  if packet:find("buttonClicked|dscan_next") then
  dscanPage = dscanPage + 1
  showDropScan(dscanPage)
  return true
  end

  if packet:find("buttonClicked|dscan_prev") then
  dscanPage = dscanPage - 1
  showDropScan(dscanPage)
  return true
  end

  if packet:find("action|input\n|text|/scan (%d+)") then
  local itemID = tonumber(packet:match("action|input\n|text|/scan (%d+)"))
  local count, locs = scanWorld(itemID)
  local item = getItemByID(itemID)
  local itemName = item and item.name or "Unknown"
  logToConsole("`6/scan "..itemID)
  tol("`9Found `2"..count.." `9"..itemName.." `9in world.")
  ovlay("`9Found `2"..count.." `9"..itemName)
  return true
  end

  if packet:find("action|input\n|text|/tiles") then
  local stats = getWorldStats()
  logToConsole("`6/tiles")
  tol("`9World: `2"..stats.name)
  tol("`9Size: `2"..stats.width.."x"..stats.height)
  tol("`9Objects: `2"..stats.objects.." `9NPCs: `2"..stats.npcs.." `9Players: `2"..stats.players)
  ovlay("`9World Info: `2"..stats.width.."x"..stats.height.." `9| Objects: `2"..stats.objects)
  return true
  end

  if packet:find("action|input\n|text|/ready") then
  local readyTrees = getReadyTrees()
  logToConsole("`6/ready")
  if #readyTrees > 0 then
  tol("`9Found `2"..#readyTrees.." `9ready trees:")
  for i, tree in pairs(readyTrees) do
  if i <= 5 then
  tol("`2"..tree.name.." `9at (`2"..tree.x.."`9, `2"..tree.y.."`9)")
  end
  end
  if #readyTrees > 5 then
  tol("`9... and `2"..#readyTrees - 5 .." `9more.")
  end
  ovlay("`9Found `2"..#readyTrees.." `9ready trees")
  else
  tol("`4No ready trees found!")
  ovlay("`4No ready trees found!")
  end
  return true
  end

  -- Inventory Manager Commands
  if packet:find("action|input\n|text|/trash (%d+)") then
  local itemID = tonumber(packet:match("action|input\n|text|/trash (%d+)"))
  local amount = checkitm(itemID)
  if amount > 0 then
  DropItem(itemID, amount)
  local item = getItemByID(itemID)
  local itemName = item and item.name or "Unknown"
  logToConsole("`6/trash "..itemID)
  tol("`9Dropped `2"..amount.." `9"..itemName)
  ovlay("`9Dropped `2"..amount.." `9"..itemName)
  else
  tol("`4Item not found in inventory!")
  end
  return true
  end

  if packet:find("action|input\n|text|/findinv (.+)") then
  local searchName = packet:match("action|input\n|text|/findinv (.+)")
  local results = findItemByName(searchName)
  logToConsole("`6/findinv "..searchName)
  if #results > 0 then
  tol("`9Found `2"..#results.." `9items in inventory matching '"..searchName.."':")
  for i, item in pairs(results) do
  if i <= 5 then
  tol("`2"..item.name.." `9x`2"..item.amount.." `9(ID: `2"..item.id.."`9)")
  end
  end
  if #results > 5 then
  tol("`9... and `2"..#results - 5 .." `9more.")
  end
  else
  tol("`4No items found in inventory matching '"..searchName.."'!")
  end
  return true
  end

  if packet:find("action|input\n|text|/inv") then
  local totalValue = getTotalInventoryValue()
  local bgl = checkitm(7188)
  local dl = checkitm(1796)
  local wl = checkitm(242)
  logToConsole("`6/inv")
  tol("`9=== `2Inventory Details `9===")
  tol("`eBlue Gem Lock: `2"..bgl.." `9(Value: `2"..bgl*10000 .." WL`9)")
  tol("`1Diamond Lock: `2"..dl.." `9(Value: `2"..dl*100 .." WL`9)")
  tol("`9World Lock: `2"..wl)
  tol("`9Total Value: `2"..totalValue.." WL")
  ovlay("`9Total Value: `2"..totalValue.." WL")
  return true
  end

  -- Auto Collect Commands
  if packet:find("action|input\n|text|/ac (%d+)") then
  local range = tonumber(packet:match("action|input\n|text|/ac (%d+)"))
  if range >= 1 and range <= 20 then
  logToConsole("`6/ac "..range)
  if autoCollectActive then
  stopAutoCollect()
  sleep(300)
  end
  autoCollectRange = range
  startAutoCollect()
  else
  tol("`4Range must be between 1-20 tiles!")
  ovlay("`4Invalid range! Use 1-20")
  end
  return true
  end

  if packet:find("action|input\n|text|/ac$") then
  logToConsole("`6/ac")
  if autoCollectActive then
  stopAutoCollect()
  else
  startAutoCollect()
  end
  return true
  end

  if packet:find("action|input\n|text|/collect (%d+)") then
  local itemID = tonumber(packet:match("action|input\n|text|/collect (%d+)"))
  local collected = collectItemInRange(itemID, 10)
  local item = getItemByID(itemID)
  local itemName = item and item.name or "Unknown"
  logToConsole("`6/collect "..itemID)
  tol("`9Collected `2"..collected.." `9"..itemName)
  ovlay("`9Collected `2"..collected.." `9items")
  return true
  end

  if packet:find("action|input\n|text|/vacuum (%d+)") then
  local range = tonumber(packet:match("action|input\n|text|/vacuum (%d+)"))
  local collected = collectItemInRange(0, range)
  logToConsole("`6/vacuum "..range)
  tol("`9Collected `2"..collected.." `9items in `2"..range.." `9tile range")
  ovlay("`9Collected `2"..collected.." `9items")
  return true
  end

  if packet:find("action|input\n|text|/mag") then
  magnetMode = not magnetMode
  logToConsole("`6/mag")
  if magnetMode then
  tol("`2Magnet Mode Enabled")
  ovlay("`2Magnet Mode ON")
  toggleCheat(17, true) -- Enable pathfinder for better collection
  else
  tol("`4Magnet Mode Disabled")
  ovlay("`4Magnet Mode OFF")
  toggleCheat(17, false)
  end
  return true
  end

  -- Auto Farming Commands
  if packet:find("action|input\n|text|/plant (%d+)") then
  local itemID = tonumber(packet:match("action|input\n|text|/plant (%d+)"))
  local item = getItemByID(itemID)
  local itemName = item and item.name or "Unknown"
  logToConsole("`6/plant "..itemID)
  tol("`9Starting auto plant `2"..itemName.."...")
  runThread(function()
  local planted = autoPlantTree(itemID)
  tol("`9Planted `2"..planted.." `9trees!")
  ovlay("`9Planted `2"..planted.." `9trees")
  end, "autoplant")
  return true
  end

  if packet:find("action|input\n|text|/harvest") then
  logToConsole("`6/harvest")
  tol("`9Starting auto harvest...")
  runThread(function()
  toggleCheat(31, true) -- Show ready harvest
  sleep(500)
  local harvested = harvestReadyTrees()
  tol("`9Harvested `2"..harvested.." `9trees!")
  ovlay("`9Harvested `2"..harvested.." `9trees")
  end, "autoharvest")
  return true
  end

  if packet:find("action|input\n|text|/break (%d+) (%d+)") then
  local x = tonumber(packet:match("action|input\n|text|/break (%d+)"))
  local y = tonumber(packet:match("action|input\n|text|/break %d+ (%d+)"))
  logToConsole("`6/break "..x.." "..y)
  breakBlock(x, y)
  tol("`9Breaking block at (`2"..x.."`9, `2"..y.."`9)")
  return true
  end

  -- Player Tracker Commands
  if packet:find("action|input\n|text|/players") then
  local players = getAllPlayers()
  logToConsole("`6/players")
  tol("`9=== `2Players in World `9("..#players..") ===")
  for i, player in pairs(players) do
  tol("`2"..player.name.." `9| NetID: `2"..player.netid.." `9| Gems: `2"..player.gems)
  end
  return true
  end

  if packet:find("action|input\n|text|/track (.+)") then
  local targetName = packet:match("action|input\n|text|/track (.+)")
  local found = false
  for _, player in pairs(getPlayerlist()) do
  if string.lower(player.name):find(string.lower(targetName)) then
  logToConsole("`6/track "..targetName)
  tol("`9Tracking `2"..player.name)
  tol("`9Position: (`2"..math.floor(player.pos.x/32).."`9, `2"..math.floor(player.pos.y/32).."`9)")
  tol("`9Gems: `2"..player.gems)
  ovlay("`9Tracking `2"..player.name.." `9at (`2"..math.floor(player.pos.x/32).."`9, `2"..math.floor(player.pos.y/32).."`9)")
  found = true
  break
  end
  end
  if not found then
  tol("`4Player '"..targetName.."' not found!")
  end
  return true
  end

  -- Discord Webhook Commands
  if packet:find("action|input\n|text|/webhook (.+)") then
  webhookURL = packet:match("action|input\n|text|/webhook (.+)")
  logToConsole("`6/webhook")
  tol("`2Webhook URL set successfully!")
  ovlay("`2Webhook URL set!")
  return true
  end

  if packet:find("action|input\n|text|/log (.+)") then
  local message = packet:match("action|input\n|text|/log (.+)")
  logToConsole("`6/log")
  if sendDiscordWebhook(message) then
  tol("`2Message sent to Discord!")
  ovlay("`2Sent to Discord!")
  else
  ovlay("`4Failed to send!")
  end
  return true
  end

  -- Anti/Protection Commands
  if packet:find("action|input\n|text|/ghost") then
  local currentState = getCheat(1)
  local newState = not currentState
  toggleCheat(1, newState)
  logToConsole("`6/ghost")
  tol("`9Ghost Mode: "..(newState and "`2ON" or "`4OFF"))
  ovlay("`9Ghost Mode: "..(newState and "`2ON" or "`4OFF"))
  return true
  end

  if packet:find("action|input\n|text|/antiportal") then
  local currentState = getCheat(10)
  local newState = not currentState
  toggleCheat(10, newState)
  logToConsole("`6/antiportal")
  tol("`9Anti Portal: "..(newState and "`2ON" or "`4OFF"))
  ovlay("`9Anti Portal: "..(newState and "`2ON" or "`4OFF"))
  return true
  end

  if packet:find("action|input\n|text|/antibounce") then
  local currentState = getCheat(4)
  local newState = not currentState
  toggleCheat(4, newState)
  logToConsole("`6/antibounce")
  tol("`9Anti Bounce: "..(newState and "`2ON" or "`4OFF"))
  ovlay("`9Anti Bounce: "..(newState and "`2ON" or "`4OFF"))
  return true
  end

  if packet:find("action|input\n|text|/modfly") then
  local currentState = getCheat(26)
  local newState = not currentState
  toggleCheat(26, newState)
  logToConsole("`6/modfly")
  tol("`9Mod Fly: "..(newState and "`2ON" or "`4OFF"))
  ovlay("`9Mod Fly: "..(newState and "`2ON" or "`4OFF"))
  return true
  end

  if packet:find("action|input\n|text|/noclip") then
  local currentState = getCheat(6)
  local newState = not currentState
  toggleCheat(6, newState)
  logToConsole("`6/noclip")
  tol("`9No Clip: "..(newState and "`2ON" or "`4OFF"))
  ovlay("`9No Clip: "..(newState and "`2ON" or "`4OFF"))
  return true
  end

  if packet:find("action|input\n|text|/freecam") then
  local currentState = getCheat(30)
  local newState = not currentState
  toggleCheat(30, newState)
  logToConsole("`6/freecam")
  tol("`9Free Camera: "..(newState and "`2ON" or "`4OFF"))
  ovlay("`9Free Camera: "..(newState and "`2ON" or "`4OFF"))
  return true
  end

  -- Utility Commands
  if packet:find("action|input\n|text|/tp (%d+) (%d+)") then
  local x = tonumber(packet:match("action|input\n|text|/tp (%d+)"))
  local y = tonumber(packet:match("action|input\n|text|/tp %d+ (%d+)"))
  logToConsole("`6/tp "..x.." "..y)
  if findPath(x, y) then
  tol("`9Teleporting to (`2"..x.."`9, `2"..y.."`9)")
  ovlay("`9Teleporting to (`2"..x.."`9, `2"..y.."`9)")
  else
  tol("`4Failed to find path!")
  ovlay("`4Failed to teleport!")
  end
  return true
  end

  if packet:find("action|input\n|text|/camera (%d+) (%d+)") then
  local x = tonumber(packet:match("action|input\n|text|/camera (%d+)"))
  local y = tonumber(packet:match("action|input\n|text|/camera %d+ (%d+)"))
  logToConsole("`6/camera "..x.." "..y)
  setCamera(x * 32, y * 32)
  tol("`9Camera set to (`2"..x.."`9, `2"..y.."`9)")
  ovlay("`9Camera moved")
  return true
  end

  if packet:find("action|input\n|text|/randomgid") then
  logToConsole("`6/randomgid")
  randomGid()
  tol("`2Device GID randomized!")
  ovlay("`2GID Randomized!")
  return true
  end

  if packet:find("action|input\n|text|/randommac") then
  logToConsole("`6/randommac")
  randomMac()
  tol("`2Device MAC randomized!")
  ovlay("`2MAC Randomized!")
  return true
  end

  if packet:find("action|input\n|text|/item (.+)") then
  local searchName = packet:match("action|input\n|text|/item (.+)")
  local item = getItemByName(searchName)
  if item then
  logToConsole("`6/item "..searchName)
  tol("`9=== `2"..item.name.." `9===")
  tol("`9Action Type: `2"..item.actionType)
  tol("`9Rarity: `2"..item.rarity)
  tol("`9Collision Type: `2"..item.collisionType)
  tol("`9Category: `2"..item.itemCategory)
  ovlay("`9Item: `2"..item.name)
  else
  tol("`4Item '"..searchName.."' not found!")
  end
  return true
  end

  if packet:find("action|input\n|text|/threads") then
  local threads = getThreadsID()
  logToConsole("`6/threads")
  tol("`9=== `2Active Threads `9===")
  for _, threadID in pairs(threads) do
  tol("`2"..threadID)
  end
  tol("`9Total: `2"..#threads.." `9threads")
  return true
  end

  if packet:find("action|input\n|text|/killthread (.+)") then
  local threadID = packet:match("action|input\n|text|/killthread (.+)")
  logToConsole("`6/killthread "..threadID)
  killThread(threadID)
  tol("`9Killed thread: `2"..threadID)
  ovlay("`9Thread killed")
  return true
  end

  if packet:find("action|input\n|text|/killall") then
  logToConsole("`6/killall")
  killAllThread()
  tol("`4All threads terminated!")
  ovlay("`4All threads killed!")
  return true
  end

  -- Fast Action Commands
  if packet:find("action|input\n|text|/wrench (%d+) (%d+)") then
  local x = tonumber(packet:match("action|input\n|text|/wrench (%d+)"))
  local y = tonumber(packet:match("action|input\n|text|/wrench %d+ (%d+)"))
  logToConsole("`6/wrench "..x.." "..y)
  wrenchTile(x, y)
  tol("`9Wrenching tile at (`2"..x.."`9, `2"..y.."`9)")
  return true
  end

  if packet:find("action|input\n|text|/place (%d+) (%d+) (%d+)") then
  local itemID = tonumber(packet:match("action|input\n|text|/place (%d+)"))
  local x = tonumber(packet:match("action|input\n|text|/place %d+ (%d+)"))
  local y = tonumber(packet:match("action|input\n|text|/place %d+ %d+ (%d+)"))
  local item = getItemByID(itemID)
  local itemName = item and item.name or "Unknown"
  logToConsole("`6/place "..itemID.." "..x.." "..y)
  placeBlock(x, y, itemID)
  tol("`9Placing `2"..itemName.." `9at (`2"..x.."`9, `2"..y.."`9)")
  return true
  end

  -- Enhanced Spin Commands
  if packet:find("action|input\n|text|/spinstat") then
  logToConsole("`6/spinstat")
  local winrate = SpinStats.total > 0 and (SpinStats.wins / SpinStats.total * 100) or 0
  tol("`9=== `2Spin Statistics `9===")
  tol("`9Total Spins: `2"..SpinStats.total)
  tol("`9Wins: `2"..SpinStats.wins.." `9| Losses: `2"..SpinStats.losses)
  tol("`9Win Rate: `2"..string.format("%.2f", winrate).."%")
  ovlay("`9Win Rate: `2"..string.format("%.2f", winrate).."%")
  return true
  end

  if packet:find("action|input\n|text|/export") then
  logToConsole("`6/export")
  local exportData = "=== XBOY Proxy Spin History Export ===\n"
  for i, log in pairs(LogSpin) do
  exportData = exportData .. log.spins .. "\n"
  end
  tol("`2Spin history exported!")
  tol("`9Total entries: `2"..#LogSpin)
  ovlay("`2Spin history exported!")
  return true
  end

if packet:find("action|input\n|text|/help") then
var = {}
var[0] = "OnDialogRequest"
var[1] = proxy
sendVariant(var)
logToConsole("`6/help")
return true
end

-- Category Menu Handlers
if packet:find("buttonClicked|cmd_drop") then
showDropCommands()
return true
end

if packet:find("buttonClicked|cmd_hosting") then
showHostingCommands()
return true
end

if packet:find("buttonClicked|cmd_gamble") then
showGambleCommands()
return true
end

if packet:find("buttonClicked|cmd_scanner") then
showScannerCommands()
return true
end

if packet:find("buttonClicked|cmd_farming") then
showFarmingCommands()
return true
end

if packet:find("buttonClicked|cmd_collect") then
showCollectCommands()
return true
end

if packet:find("buttonClicked|cmd_player") then
showPlayerCommands()
return true
end

if packet:find("buttonClicked|cmd_cheats") then
showCheatsCommands()
return true
end

if packet:find("buttonClicked|cmd_utility") then
showUtilityCommands()
return true
end

if packet:find("buttonClicked|cmd_advanced") then
showAdvancedCommands()
return true
end

if packet:find("buttonClicked|backtomenu") then
var = {}
var[0] = "OnDialogRequest"
var[1] = proxy
sendVariant(var)
return true
end

-- Auto Find World Commands
if packet:find("action|input\n|text|/findworld") or packet:find("action|input\n|text|/fw") then
logToConsole("`6/findworld")
findRandomWorld()
return true
end

if packet:find("action|input\n|text|/setlength (%d+)") then
local len = tonumber(packet:match("action|input\n|text|/setlength (%d+)"))
if len and len >= 1 and len <= 24 then
world_len = len
logToConsole("`6/setlength "..len)
tol("`9World length set to: `2"..len)
ovlay("`9World length: `2"..len)
else
tol("`4Invalid length! Must be between 1-24")
ovlay("`4Invalid length!")
end
return true
end

if packet:find("action|input\n|text|/worldtype wn") then
world_type = "wn"
logToConsole("`6/worldtype wn")
tol("`9World type set to: `2With Number `9(A-Z0-9)")
ovlay("`9Type: `2With Number")
return true
end

if packet:find("action|input\n|text|/worldtype nn") then
world_type = "nn"
logToConsole("`6/worldtype nn")
tol("`9World type set to: `2No Number `9(A-Z only)")
ovlay("`9Type: `2No Number")
return true
end

-- Warp Command
if packet:find("action|input\n|text|/warp (.+)") then
local worldName = packet:match("action|input\n|text|/warp (.+)")
logToConsole("`6/warp "..worldName)
warpToWorld(worldName)
return true
end

-- Relog Command
if packet:find("action|input\n|text|/rr") then
logToConsole("`6/rr")
relogWorld()
return true
end


-- Shortcut: Friend button for auto find world
if packet:find("action|friends") then
findRandomWorld()
return true
end

end)

  sendVariant({ 
  [0] = "OnDialogRequest", 
  [1] = loginp, }, -1, 3500)

  ovlay("`2Activated")
  SleepS(5)
  ovlay("`9Have Problem? Contact XBOY")
