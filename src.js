var $canvas = null;
var transX = 500;
var transY = 650;
var zoom = 3.0;
var perkCircleRadius = 3;
var hoveredPerk = null;
var activePerkTree = null;

var activePerkLevels = {};

var perkTrees = window.perkTrees;

function perkId(perk) {
    for (var i = 0; i < perkTrees.length; i++)
        for (var j = 0; j < perkTrees[i].perks.length; j++)
            if (perkTrees[i].perks[j] == perk)
                return 'perk' + ((i * 100) + j);
    return '';
}

function forEachParentOfPerk(perk, func) {
    if (perk && perk.deps)
        for (var i = 0; i < perkTrees.length; i++)
            for (var j = 0; j < perkTrees[i].perks.length; j++)
                if (perkTrees[i].perks[j] == perk) {
                    for (var k = 0; k < perk.deps.length; k++)
                        func(perkTrees[i].perks[perk.deps[k]]);
                    return;
                }
}

function isPerkChildOfParentWithIndex(perk, parentIndex) {
    if (perk && perk.deps)
        for (var i = 0; i < perk.deps.length; i++)
            if (perk.deps[i] == parentIndex)
                return true;
    return false;
}

function forEachChildOfPerk(perk, func) {
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
}

function getPerkLevel(perk) {
    var id = perkId(perk);
    if (activePerkLevels[id]) {
        return activePerkLevels[id];
    }
    return 0;
}

function getPerkDisplayName(perk) {
    var maxLevels = perk.levels || 1;
    if (maxLevels == 1)
        return perk.name;

    var activeLevel = getPerkLevel(perk);
    return perk.name + ' (' + activeLevel + '/' + maxLevels + ')';
}

function changePerkLevel(perk, inc) {
    var ok = true;

    var maxLevels = perk.levels || 1;
    var activeLevel = getPerkLevel(perk);
    var newLevel = Math.max(0, Math.min(activeLevel+inc, maxLevels));

    if (inc > 0) {
        forEachParentOfPerk(perk, function(parent) {
            if (getPerkLevel(parent) == 0) {
                changePerkLevel(parent, inc);
            }
        });
    } else if (newLevel == 0) {
        forEachChildOfPerk(perk, function(child) {
            changePerkLevel(child, inc*100);
        });
    }

    activePerkLevels[perkId(perk)] = newLevel;
}

function drawPerkTree(ctx, perkTree, captions, scale) {
    ctx.save();
    ctx.scale(scale, scale);

    var perkArray = perkTree.perks;

    // Draw dependency lines...
    for (var i = 0; i < perkArray.length; i++) {
        var perk = perkArray[i];
        var level = getPerkLevel(perk);

        if (perk.deps) {
            for (var j = 0; j < perk.deps.length; j++) {
                var depPerk = perkArray[perk.deps[j]];
                ctx.beginPath();
                ctx.lineWidth = level > 0 ? 1.5 : 0.5;
                ctx.strokeStyle = level > 0 ? 'rgba(100, 150, 230, 1.0)' : 'rgba(100, 150, 230, 0.5)';
                ctx.moveTo(depPerk.pos[0], depPerk.pos[1]);
                ctx.lineTo(perk.pos[0], perk.pos[1]);
                ctx.stroke();
            }
        }
    }

    // Draw perks ...
    var captionOffset;
    for (var i = 0; i < perkArray.length; i++) {
        var perk = perkArray[i];
        var level = getPerkLevel(perk);

        ctx.beginPath();
        if (perk == hoveredPerk) {
            ctx.fillStyle = 'rgb(255, 0, 0)';
        } else {
            ctx.fillStyle = level > 0 ? 'rgba(230, 230, 150, 1.0)' : 'rgba(230, 100, 150, 0.5)';
        }
        ctx.arc(perk.pos[0], perk.pos[1], perkCircleRadius * (level > 0 ? 1 : 0.5), 0, Math.PI*2, true);
        ctx.fill();

        if (captions) {
            ctx.save();

            var perkName = getPerkDisplayName(perk);

            ctx.font = "bold 4px Arial";
            var w = ctx.measureText(perkName).width;

            captionOffset = perk.captionOffset || [0, 0];

            ctx.translate(perk.pos[0]+captionOffset[0], perk.pos[1]+8+captionOffset[1]);
            //ctx.rotate(Math.PI/4-0.2);
            //ctx.rotate(0.2);
            ctx.translate(-w/2, 0);

            ctx.fillStyle = level > 0 ? 'rgba(255, 255, 255, 1.0)' : 'rgba(200, 200, 200, 0.5)';

            ctx.shadowColor = 'rgb(0,0,0)';
            ctx.shadowOffsetX = 2;
            ctx.shadowOffsetY = 2;
            ctx.shadowBlur = 2;


            ctx.fillText(perkName, 0, 0, 0);
            ctx.restore();
        }
    }

    ctx.fillStyle = 'rgb(200,200,200)';
    ctx.font = 'bold 12px Arial';
    var w = ctx.measureText(perkTree.name).width;
    ctx.fillText(perkTree.name, -w/2, 30, 0);

    ctx.restore();
}

function redraw() {
    if (!$canvas) return;

    var ctx = $canvas[0].getContext("2d");
    ctx.save();
    ctx.fillStyle = 'rgb(0,0,0)';
    ctx.fillRect(0, 0, $canvas.width(), $canvas.height());

    if (activePerkTree) {
        ctx.translate(transX, transY);
        drawPerkTree(ctx, activePerkTree, true, zoom);
    } else {
        ctx.translate(100, 200);

        drawPerkTree(ctx, perkTrees[0], false, 0.8);

        ctx.translate(200, 0);
        drawPerkTree(ctx, perkTrees[1], false, 0.8);

        ctx.translate(200, 0);
        drawPerkTree(ctx, perkTrees[2], false, 0.8);
    }

    ctx.restore();
}

function perkAtPosition(x, y) {
    if (!activePerkTree)
        return null;

    var perkArray = activePerkTree.perks;

    var perkSize = perkCircleRadius * zoom;
    for (var i = 0; i < perkArray.length; i++) {
        var perk = perkArray[i];
        var perkX = perk.pos[0]*zoom+transX;
        var perkY = perk.pos[1]*zoom+transY;

        if ((x >= (perkX-perkSize)) && (x <= (perkX+perkSize)) &&
            (y >= (perkY-perkSize)) && (y <= (perkY+perkSize))) 
        {
            return perk;
        }
    }

    return null;
}

function downHandler(e) {
    e.preventDefault();

    var off = $canvas.offset();
    var x = e.pageX - off.left;
    var y = e.pageY - off.top;

    if (activePerkTree) {
        var perk = perkAtPosition(x, y);
        if (perk) {
            changePerkLevel(perk, e.button == 2 ? -1 : 1);
            redraw();
        }
    } else {
        var col = Math.floor(x / 200);
        if (col >= perkTrees.length) {
            alert('TODO!');
            return;
        }

        activePerkTree = perkTrees[col];
        redraw();
    }
}

function moveHandler(e) {
    e.preventDefault();

    var off = $canvas.offset();
    var x = e.pageX - off.left;
    var y = e.pageY - off.top;

    if (activePerkTree) {
        var perk = perkAtPosition(x, y);
        if (perk) {
            document.body.style.cursor = 'pointer';
            hoveredPerk = perk;
            redraw();
        } else if (hoveredPerk) {
            document.body.style.cursor = 'default';
            hoveredPerk = null;
            redraw();
        }
    } else {
        //TODO
    }
}

function showAll() {
    activePerkTree = null;
    redraw();
}

function init() {
    $canvas = $('#canvas');
    if (!$canvas[0].getContext) {
        $canvas = null;
        return;
    }

    $canvas
        .mousemove(moveHandler)
        .mousedown(downHandler)
        .contextmenu(function(e) { e.originalEvent.preventDefault(); });
    redraw();
}
