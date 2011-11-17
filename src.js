var transX = 400;
var transY = 800;
var zoom = 4;
var perkCircleRadius = 3;
var hoveredPerk = null;

var activePerkLevels = {};

var perkData = [
    {name: 'Destruction', perks: [
        {
            name: 'Novice Destruction', 
            desc: 'Cast Novice level Destruction spells for half magicka.',
            pos: [0, 0]
        },
        {
            name: 'Destruction Dual Casting',
            desc: 'Dual casting a Destruction spell overcharges the effects into an even more powerful version.',
            pos: [64, -21],
            deps: [0]
        },
        {
            name: 'Impact',
            desc: 'Most destruction spells will stagger an opponent when dual cast.',
            pos: [79, -56],
            deps: [1]
        },
        {
            name: 'Augmented Flames',
            levels: 2,
            desc: 'Fire spells do 25% more damage.',
            pos: [-44, -72],
            deps: [0]
        },
        {
            name: 'Intense Flames',
            desc: 'Fire damage causes targets to flee if their health is low.',
            pos: [-50, -111],
            deps: [3]
        },
        {
            name: 'Augmented Frost',
            levels: 2,
            desc: 'Frost spells do 25% more damage.',
            pos: [-12, -85],
            deps: [0]
        },
        {
            name: 'Deep Freeze',
            desc: 'Frost damage paralyzes targets if their health is low.',
            pos: [-16, -133],
            deps: [5]
        },
        {
            name: 'Augmented Shock',
            levels: 2,
            desc: 'Shock spells do 25% more damage.',
            pos: [13, -86],
            deps: [0]
        },
        {
            name: 'Disintegrate',
            desc: 'Shock damage disintegrates targets if their health is low.',
            pos: [13, -143],
            deps: [7]
        },
        {
            name: 'Apprentice Destruction',
            desc: 'Cast Apprentice level Destruction spells for half magicka.',
            pos: [42, -55],
            deps: [0]
        },
        {
            name: 'Rune Master',
            desc: 'Can place runes five times farther away.',
            pos: [67, -87],
            deps: [9]
        },
        {
            name: 'Adept Destruction',
            desc: 'Cast Adept level Destruction spells for half magicka.',
            pos: [38, -110],
            deps: [9]
        },
        {
            name: 'Expert Destruction',
            desc: 'Cast Expert level Destruction spells for half magicka.',
            pos: [52, -141],
            deps: [11]
        },
        {
            name: 'Master Destruction',
            desc: 'Cast Master level Destruction spells for half magicka.',
            pos: [51, -186],
            deps: [12]
        }
    ]}
];

function $(id) {
    return document.getElementById(id);
}

function perkId(perk) {
    for (var i = 0; i < perkData.length; i++)
        for (var j = 0; j < perkData[i].perks.length; j++)
            if (perkData[i].perks[j] == perk)
                return 'perk' + ((i * 100) + j);
    return '';
}

function forEachParentOfPerk(perk, func) {
    if (perk && perk.deps)
        for (var i = 0; i < perkData.length; i++)
            for (var j = 0; j < perkData[i].perks.length; j++)
                if (perkData[i].perks[j] == perk) {
                    for (var k = 0; k < perk.deps.length; k++)
                        func(perkData[i].perks[perk.deps[k]]);
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
    for (var i = 0; i < perkData.length; i++)
        for (var j = 0; j < perkData[i].perks.length; j++)
            if (perkData[i].perks[j] == perk) {
                for (var k = 0; k < perkData[i].perks.length; k++) {
                    var p = perkData[i].perks[k];
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

function drawPerkTree(ctx, perkArray) {
    ctx.save();
    ctx.translate(transX, transY);
    ctx.scale(zoom, zoom);

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

        ctx.save();

        var perkName = getPerkDisplayName(perk);

        ctx.font = "4px Arial";
        var w = ctx.measureText(perkName).width;
        ctx.translate(perk.pos[0], perk.pos[1]+10);
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

    ctx.restore();
}

function redraw() {
    var canvas = $('canvas');
    if (!canvas.getContext)
        return;

    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;

    var ctx = canvas.getContext("2d");
    ctx.fillStyle = 'rgb(0,0,0)';
    ctx.fillRect(0, 0, window.innerWidth, window.innerHeight);

    /*
    for (var i = 0; i < 6; i++) {
    }
    */

    drawPerkTree(ctx, perkData[0].perks);
}

function perkAtPosition(x, y) {
    var perkArray = perkData[0].perks;

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
    var perk = perkAtPosition(e.clientX, e.clientY);
    if (perk) {
        changePerkLevel(perk, e.button == 2 ? -1 : 1);
        redraw();
    }
}

function moveHandler(e) {
    e.preventDefault();
    var perk = perkAtPosition(e.clientX, e.clientY);
    if (perk) {
        document.body.style.cursor = 'pointer';
        hoveredPerk = perk;
        redraw();
    } else if (hoveredPerk) {
        document.body.style.cursor = 'default';
        hoveredPerk = null;
        redraw();
    }
}

function init() {
    var canvas = $('canvas');
    if (!canvas.getContext)
        return;

    canvas.onmousemove = moveHandler;
    canvas.onmousedown = downHandler;
    canvas.oncontextmenu = function(e) { e.preventDefault(); };
    window.onresize = function() {
        redraw();
    }
    redraw();
}
