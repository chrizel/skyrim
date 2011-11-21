###
Skyrim Perk Calculator
Copyright (C) 2011  Christian Zeller <chrizel@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
###
$canvas = null
perkCircleRadius = 3
hoveredPerk = null
activePerkTreeView = null
workspace = null

activePerkLevels = {}

perkTrees = window.perkTrees
perkTreeViews = []

perkTreeId = (perkTree) ->
  i = 0
  for pt in perkTrees
    if pt == perkTree
      return i
    i++
  return 0


perkId = (perk) ->
  i = 0
  for perkTree in perkTrees
    j = 0
    for p in perkTree.perks
      if p == perk
        return "perk#{(i * 100) + j}"
      j++
    i++
  return ''


forEachParentOfPerk = (perk, func) ->
  `
  if (perk && perk.deps) {
    for (var i = 0; i < perkTrees.length; i++)
      for (var j = 0; j < perkTrees[i].perks.length; j++)
        if (perkTrees[i].perks[j] == perk) {
          for (var k = 0; k < perk.deps.length; k++)
            func(perkTrees[i].perks[perk.deps[k]]);
          return;
        }
  }
  `
  return

isPerkChildOfParentWithIndex = (perk, parentIndex) ->
  `
  if (perk && perk.deps)
      for (var i = 0; i < perk.deps.length; i++)
          if (perk.deps[i] == parentIndex)
              return true;
  `
  return false


forEachChildOfPerk = (perk, func) ->
  `
  for (var i = 0; i < perkTrees.length; i++)
    for (var j = 0; j < perkTrees[i].perks.length; j++)
      if (perkTrees[i].perks[j] == perk) {
        for (var k = 0; k < perkTrees[i].perks.length; k++) {
          var p = perkTrees[i].perks[k];
          if (isPerkChildOfParentWithIndex(p, j)) {
            forEachChildOfPerk(p, func);
            func(p);
          }
        }
        return;
      }
  `
  return

getPerkLevel = (perk) ->
  id = perkId perk
  activePerkLevels[id] ? 0

countActivePerks = ->
  result = 0
  for own key, value of activePerkLevels
    result += value
  return result

activeData = ->
  bitArray = new BitArray(255)
  i = 0
  for perkTree in perkTrees
    for perk in perkTree.perks
      maxLevels = perk.levels || 1
      activeLevel = getPerkLevel(perk)
      j = 0
      while j < maxLevels
        bitArray.set i++, activeLevel-1 == j++
  return bitArray.toString()


readActiveData = (str) ->
  activePerkLevels = {}
  bitArray = new BitArray(255)
  bitArray.parse(str)
  i = 0
  for perkTree in perkTrees
    for perk in perkTree.perks
      maxLevels = perk.levels || 1
      j = 0
      while j < maxLevels
        if bitArray.get i++
          activePerkLevels[perkId(perk)] = j+1
        j++


getPerkDisplayName = (perk) ->
  maxLevels = perk.levels || 1
  return perk.name if maxLevels == 1
  activeLevel = getPerkLevel(perk)
  "#{perk.name} (#{activeLevel}/#{maxLevels})"


getPerkInfos = (perkTree) ->
  result =
    active: 0
    max: 0
    req: 0
  for perk in perkTree.perks
    maxLevels = perk.levels || 1
    req = perk.req || [0]
    level = getPerkLevel(perk)
    result.active += level
    result.max += maxLevels
    result.req = Math.max(result.req, req[level-1]) if level > 0
  result

changePerkLevel = (perk, inc) ->
  ok = true

  maxLevels = perk.levels || 1
  activeLevel = getPerkLevel(perk)
  newLevel = Math.max(0, Math.min(activeLevel+inc, maxLevels))

  if inc > 0
    parentOk = false
    forEachParentOfPerk perk, (parent) ->
      parentOk = true if getPerkLevel(parent) > 0
    if not parentOk
      forEachParentOfPerk perk, (parent) ->
        if not parentOk
          changePerkLevel(parent, inc)
          parentOk = true
  else if newLevel == 0
    forEachChildOfPerk perk, (child) ->
      changePerkLevel(child, inc*100)

  activePerkLevels[perkId(perk)] = newLevel


class PerkTreeView
  constructor: (@model, @frame, @scale) ->

  perkTreeFrame: ->
    minx = maxx = miny = maxy = 0
    for perk in @model.perks
      minx = perk.pos[0] if perk.pos[0] < minx
      maxx = perk.pos[0] if perk.pos[0] > maxx
      miny = perk.pos[1] if perk.pos[1] < miny
      maxy = perk.pos[1] if perk.pos[1] > maxy
    return [Math.abs(minx)*@scale, Math.abs(miny)*@scale,
            Math.abs(minx-maxx)*@scale, Math.abs(miny-maxy)*@scale]

  hitFrame: (x, y) ->
    (x >= @frame[0]) &&
    (x <= @frame[0]+@frame[2]) &&
    (y >= @frame[1]) &&
    (y <= @frame[1]+@frame[3])

  perkAtPosition: (x, y) ->
    return null if not @model
    result = null
    perkSize = perkCircleRadius * @scale
    root = @root()
    for perk in @model.perks
      perkX = perk.pos[0]*@scale+root[0]
      perkY = perk.pos[1]*@scale+root[1]

      if x >= (perkX-perkSize) &&
         x <= (perkX+perkSize) &&
         y >= (perkY-perkSize) &&
         y <= (perkY+perkSize)
        result = perk
        break

    return result

  root: ->
    perkTreeFrame = @perkTreeFrame()
    x = @frame[0] + @frame[2]/2 - perkTreeFrame[2]/2 + perkTreeFrame[0]
    y = @frame[1] + ((@frame[3]/2 + perkTreeFrame[3]/2) * 0.98)
    return [x, y]

  draw: (ctx, captions, title) ->
    ctx.save()

    isActivePerkTree = activePerkTreeView && activePerkTreeView.model == @model
    
    ctx.fillStyle = if isActivePerkTree then 'rgb(0,0,0)' else 'rgb(30,30,30)'
    ctx.fillRect(@frame[0], @frame[1], @frame[2], @frame[3])

    if not @model
      ctx.restore()
      return

    root = @root()
    ctx.translate(root[0], root[1])
    ctx.scale(@scale, @scale)

    # Draw dependency lines...
    for perk in @model.perks
      if perk.deps
        level = getPerkLevel(perk)
        for dep in perk.deps
          depPerk = @model.perks[dep]
          connected = (level > 0) and (getPerkLevel(depPerk) > 0)
          ctx.beginPath()
          ctx.lineWidth = if connected then 1.5 else 0.5
          ctx.strokeStyle = if connected then 'rgba(100, 150, 230, 1.0)' else 'rgba(100, 150, 230, 0.5)'
          ctx.moveTo(depPerk.pos[0], depPerk.pos[1])
          ctx.lineTo(perk.pos[0], perk.pos[1])
          ctx.stroke()

    # Draw perks ...
    for perk in @model.perks
      level = getPerkLevel(perk)

      ctx.beginPath()
      if perk == hoveredPerk
        ctx.fillStyle = 'rgb(255, 0, 0)'
      else
        ctx.fillStyle = if level > 0 then 'rgba(230, 230, 150, 1.0)' else 'rgba(230, 100, 150, 0.5)'

      radius = perkCircleRadius * if level > 0 then 1 else 0.5
      ctx.arc(perk.pos[0], perk.pos[1], radius, 0, Math.PI*2, true)
      ctx.fill()

      if captions
        ctx.save()

        perkName = getPerkDisplayName(perk)

        ctx.font = "4px Arial"
        w = ctx.measureText(perkName).width

        captionOffset = perk.captionOffset || [0, 0]

        ctx.translate(perk.pos[0]+captionOffset[0], perk.pos[1]+8+captionOffset[1])
        #ctx.rotate(Math.PI/4-0.2)
        #ctx.rotate(0.2)
        ctx.translate(-w/2, 0)

        ctx.fillStyle = if level > 0 then 'rgba(255, 255, 255, 1.0)' else 'rgba(200, 200, 200, 0.5)'

        ctx.shadowColor = 'rgb(0,0,0)'
        ctx.shadowOffsetX = 2
        ctx.shadowOffsetY = 2
        ctx.shadowBlur = 2

        ctx.fillText(perkName, 0, 0)
        ctx.restore()

    ctx.restore()
  
    if title
      perkInfos = getPerkInfos(@model)

      ctx.save()
      if perkInfos.active > 0
        ctx.shadowColor = 'rgb(10,10,10)'
        ctx.shadowOffsetX = 2
        ctx.shadowOffsetY = 2
        ctx.shadowBlur = 2
        ctx.fillStyle = 'rgba(100,100,100,0.8)'
        ctx.font = 'bold 30px Arial'
        ctx.fillText(perkInfos.active, @frame[0]+8, @frame[1]+30)

      if perkInfos.active > 0
        ctx.fillStyle = 'rgb(100,150,230)'
      else
        ctx.fillStyle = 'rgb(200,200,200)'

      ctx.shadowColor = 'rgb(10,10,10)'
      ctx.shadowOffsetX = 2
      ctx.shadowOffsetY = 2
      ctx.shadowBlur = 2

      ctx.font = '12px Arial'
      w = ctx.measureText(@model.name).width
      ctx.fillText(@model.name, @frame[0]+@frame[2]/2-w/2, @frame[1]+@frame[3]-5)

      ctx.restore()
    if hoveredPerk and (not title)
      ctx.save()

      maxLevels = hoveredPerk.levels || 1
      activeLevel = getPerkLevel(hoveredPerk)

      # Perk Name
      ctx.font = 'bold 14px Arial'
      ctx.fillStyle = 'rgba(255,255,255,0.7)'
      displayName = getPerkDisplayName(hoveredPerk)
      w = ctx.measureText(displayName).width
      ctx.fillText(displayName, 335, 743)

      # Requires
      if hoveredPerk.req
        ctx.font = '12px Arial'
        ctx.fillStyle = 'rgba(200,200,200,0.7)'
        ctx.fillText("Requires: #{hoveredPerk.req[Math.max(0, activeLevel-1)]}", 345+w, 743)

      # Perk Description
      ctx.font = '12px Arial'
      ctx.fillText(hoveredPerk.desc[Math.max(0, activeLevel-1)], 335, 760)

      # Next Level Description
      if activeLevel > 0 and activeLevel < maxLevels
        t = "Next Rank: #{hoveredPerk.desc[Math.max(0, activeLevel)]}"
        w = ctx.measureText(t).width
        ctx.fillText(t, 335, 777)
        if hoveredPerk.req
          t = "Requires: #{hoveredPerk.req[Math.max(0, activeLevel)]}"
          ctx.fillText(t, 340+w, 777)

      ctx.restore()


redraw = ->
  if !$canvas then return

  ctx = $canvas[0].getContext("2d")
  ctx.save()
  ctx.fillStyle = 'rgb(20,20,20)'
  ctx.fillRect(0, 0, $canvas.width(), $canvas.height())

  for perkTreeView in perkTreeViews
    perkTreeView.draw ctx, false, true
  if activePerkTreeView
    activePerkTreeView.draw ctx, true, false

    if activePerkTreeView.model
      perkInfos = getPerkInfos(activePerkTreeView.model)

      ctx.fillStyle = 'rgba(255,255,255,0.7)'
      ctx.font = 'bold 20px Arial'
      ctx.fillText(activePerkTreeView.model.name, 335, 40)
      ctx.font = 'bold 10px Arial'
      ctx.fillText("Active perks: #{perkInfos.active} of #{perkInfos.max}", 335, 60)
      ctx.fillText("Required skill level: #{perkInfos.req}", 335, 75)

  ctx.restore()

  activePerks = countActivePerks()
  $('#active-perks').html(activePerks)
  if activePerks == 0
    $('.clear-perks').fadeOut('fast')
  else
    $('.clear-perks').fadeIn('fast')


downHandler = (e) ->
  e.originalEvent.preventDefault()
  offset = $canvas.offset()
  x = e.pageX - offset.left
  y = e.pageY - offset.top

  if activePerkTreeView && activePerkTreeView.hitFrame(x, y)
    perk = activePerkTreeView.perkAtPosition(x, y)
    if perk
      changePerkLevel(perk, if e.button == 2 then -1 else 1)
      workspace.navigate "t/#{perkTreeId(activePerkTreeView.model)}/#{activeData()}"
      redraw()
  else
    for perkTreeView in perkTreeViews
      if perkTreeView.hitFrame(x, y)
        activePerkTreeView.model = perkTreeView.model
        workspace.navigate "t/#{perkTreeId(activePerkTreeView.model)}/#{activeData()}"
        redraw()
        break


setCursor = (pointer) ->
  document.body.style.cursor = if pointer then 'pointer' else 'default'


moveHandler = (e) ->
  offset = $canvas.offset()
  x = e.pageX - offset.left
  y = e.pageY - offset.top

  if activePerkTreeView && activePerkTreeView.hitFrame(x, y)
    perk = activePerkTreeView.perkAtPosition(x, y)
    if perk
      setCursor true
      hoveredPerk = perk
      redraw()
    else if hoveredPerk
      setCursor false
      hoveredPerk = null
      redraw()
  else
    setCursor false
    for perkTreeView in perkTreeViews
      if perkTreeView.hitFrame(x, y)
        document.body.style.cursor = 'pointer'
        setCursor true
        break


class Workspace extends Backbone.Router
  routes:
    't/:tree/:data':  'tree'
    't/:tree':        'tree'
    '':               'tree'

  tree: (tree = '0', data = '') ->
    i = Math.min(Math.max(0, parseInt(tree, 10)), perkTrees.length-1)
    activePerkTreeView.model = perkTrees[i]
    if data != ''
      readActiveData(data)
    redraw()


$ ->
  $canvas = $('#canvas')
  if !$canvas[0].getContext
    $canvas = null
    return

  perkTreeViews = []
  cols = 3
  padding = 5
  i = 0
  x = padding
  y = padding
  width = 100
  height = 127
  activePerkTreeView = new PerkTreeView(null, [320, padding, 675, 787], 2.8)
  for perkTree in perkTrees
    perkTreeViews.push new PerkTreeView(perkTree, [x, y, width, height], 0.4)
    i++
    x += width + padding
    if (i % cols) == 0
      x = padding
      y += height + padding

  $('.clear-perks').click ->
    if confirm('Really clear all perks?')
      activePerkLevels = {}
      workspace.navigate "t/#{perkTreeId(activePerkTreeView.model)}/#{activeData()}", true

  $canvas
    .mousemove(moveHandler)
    .mousedown(downHandler)
    .contextmenu (e) -> e.originalEvent.preventDefault()
  redraw()

  workspace = new Workspace
  Backbone.history.start()
