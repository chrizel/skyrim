$canvas = null
transX = 500
transY = 650
zoom = 3.0
perkCircleRadius = 3
hoveredPerk = null
activePerkTree = null

activePerkLevels = {}

perkTrees = window.perkTrees


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

getPerkDisplayName = (perk) ->
  maxLevels = perk.levels || 1
  return perk.name if maxLevels == 1
  activeLevel = getPerkLevel(perk)
  "#{perk.name} (#{activeLevel}/#{maxLevels})"


changePerkLevel = (perk, inc) ->
  ok = true

  maxLevels = perk.levels || 1
  activeLevel = getPerkLevel(perk)
  newLevel = Math.max(0, Math.min(activeLevel+inc, maxLevels))

  if inc > 0
    forEachParentOfPerk perk, (parent) ->
      changePerkLevel(parent, inc) if getPerkLevel(parent) == 0
  else if newLevel == 0
    forEachChildOfPerk perk, (child) ->
      changePerkLevel(child, inc*100)

  activePerkLevels[perkId(perk)] = newLevel


drawPerkTree = (ctx, perkTree, captions, scale) ->
  ctx.save()
  ctx.scale(scale, scale)

  # Draw dependency lines...
  for perk in perkTree.perks
    if perk.deps
      level = getPerkLevel(perk)
      for dep in perk.deps
        depPerk = perkTree.perks[dep]
        ctx.beginPath()
        ctx.lineWidth = if level > 0 then 1.5 else 0.5
        ctx.strokeStyle = if level > 0 then 'rgba(100, 150, 230, 1.0)' else 'rgba(100, 150, 230, 0.5)'
        ctx.moveTo(depPerk.pos[0], depPerk.pos[1])
        ctx.lineTo(perk.pos[0], perk.pos[1])
        ctx.stroke()

  # Draw perks ...
  for perk in perkTree.perks
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

      ctx.font = "bold 4px Arial"
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

      ctx.fillText(perkName, 0, 0, 0)
      ctx.restore()

  ctx.fillStyle = 'rgb(200,200,200)'
  ctx.font = 'bold 12px Arial'
  w = ctx.measureText(perkTree.name).width
  ctx.fillText(perkTree.name, -w/2, 30, 0)

  ctx.restore()


redraw = ->
  if !$canvas then return

  ctx = $canvas[0].getContext("2d")
  ctx.save()
  ctx.fillStyle = 'rgb(0,0,0)'
  ctx.fillRect(0, 0, $canvas.width(), $canvas.height())

  if activePerkTree
    ctx.translate(transX, transY)
    drawPerkTree(ctx, activePerkTree, true, zoom)
  else
    ctx.translate(100, 200)

    drawPerkTree(ctx, perkTrees[0], false, 0.8)

    ctx.translate(200, 0)
    drawPerkTree(ctx, perkTrees[1], false, 0.8)

    ctx.translate(200, 0)
    drawPerkTree(ctx, perkTrees[2], false, 0.8)

  ctx.restore()


perkAtPosition = (x, y) ->
  if !activePerkTree
    return null

  result = null
  perkSize = perkCircleRadius * zoom
  for perk in activePerkTree.perks
    perkX = perk.pos[0]*zoom+transX
    perkY = perk.pos[1]*zoom+transY

    if x >= (perkX-perkSize) &&
       x <= (perkX+perkSize) &&
       y >= (perkY-perkSize) &&
       y <= (perkY+perkSize)
      result = perk
      break

  return result


downHandler = (e) ->
  offset = $canvas.offset()
  x = e.pageX - offset.left
  y = e.pageY - offset.top

  if activePerkTree
    perk = perkAtPosition(x, y)
    if perk
      changePerkLevel(perk, if e.button == 2 then -1 else 1)
      redraw()
  else
    col = Math.floor(x / 200)
    if col >= perkTrees.length
      alert('TODO!')
      return

    activePerkTree = perkTrees[col]
    redraw()


moveHandler = (e) ->
  offset = $canvas.offset()
  x = e.pageX - offset.left
  y = e.pageY - offset.top

  if activePerkTree
    perk = perkAtPosition(x, y)
    if perk
      document.body.style.cursor = 'pointer'
      hoveredPerk = perk
      redraw()
    else if hoveredPerk
      document.body.style.cursor = 'default'
      hoveredPerk = null
      redraw()
  else
    return #TODO

window.showAllPerks = ->
  activePerkTree = null
  redraw()

$ ->
  $canvas = $('#canvas')
  if !$canvas[0].getContext
    $canvas = null
    return

  $canvas
    .mousemove(moveHandler)
    .mousedown(downHandler)
    .contextmenu (e) -> e.originalEvent.preventDefault()
  redraw()
