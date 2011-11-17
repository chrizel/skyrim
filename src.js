var transX = 500;
var transY = 620;
var zoom = 3.0;
var perkCircleRadius = 3;
var hoveredPerk = null;

var activePerkLevels = {};

var perkData = [
    {name: 'Destruction', perks: [
        {
            name: 'Novice Destruction', 
            desc: ['Cast Novice level Destruction spells for half magicka.'],
            pos: [0, 0]
        },
        {
            name: 'Destruction Dual Casting',
            desc: ['Dual casting a Destruction spell overcharges the effects into an even more powerful version.'],
            req: [20],
            pos: [64, -21],
            deps: [0]
        },
        {
            name: 'Impact',
            desc: ['Most destruction spells will stagger an opponent when dual cast.'],
            req: [40],
            pos: [79, -56],
            deps: [1]
        },
        {
            name: 'Augmented Flames',
            levels: 2,
            desc: ['Fire spells do 25% more damage.', 'Fire spells do 50% more damage.'],
            req: [30, 60],
            pos: [-44, -72],
            deps: [0]
        },
        {
            name: 'Intense Flames',
            desc: ['Fire damage causes targets to flee if their health is low.'],
            req: [50],
            pos: [-50, -111],
            deps: [3]
        },
        {
            name: 'Augmented Frost',
            levels: 2,
            desc: ['Frost spells do 25% more damage.', 'Frost spells do 50% more damage.'],
            req: [30, 60],
            pos: [-12, -85],
            deps: [0]
        },
        {
            name: 'Deep Freeze',
            desc: ['Frost damage paralyzes targets if their health is low.'],
            req: [60],
            pos: [-16, -133],
            deps: [5]
        },
        {
            name: 'Augmented Shock',
            levels: 2,
            desc: ['Shock spells do 25% more damage.', 'Shock spells do 50% more damage.'],
            req: [30, 60],
            pos: [13, -86],
            deps: [0]
        },
        {
            name: 'Disintegrate',
            desc: ['Shock damage disintegrates targets if their health is low.'],
            req: [70],
            pos: [13, -143],
            deps: [7]
        },
        {
            name: 'Apprentice Destruction',
            desc: ['Cast Apprentice level Destruction spells for half magicka.'],
            req: [25],
            pos: [42, -55],
            deps: [0]
        },
        {
            name: 'Rune Master',
            desc: ['Can place runes five times farther away.'],
            req: [40],
            pos: [67, -87],
            deps: [9]
        },
        {
            name: 'Adept Destruction',
            desc: ['Cast Adept level Destruction spells for half magicka.'],
            req: [50],
            pos: [38, -110],
            deps: [9]
        },
        {
            name: 'Expert Destruction',
            desc: ['Cast Expert level Destruction spells for half magicka.'],
            req: [75],
            pos: [52, -141],
            deps: [11]
        },
        {
            name: 'Master Destruction',
            desc: ['Cast Master level Destruction spells for half magicka.'],
            req: [100],
            pos: [51, -186],
            deps: [12]
        }
    ]},
    {name: 'Restoration', perks: [
        {
            name: 'Novice Restoration',
            desc: ['Cast Novice level Restoration spells for half magicka.'],
            pos: [0, 0]
        },
        {
            name: 'Respite',
            desc: ['Healing spells also restore Stamina.'],
            req: [40],
            pos: [-117, -70],
            deps: [0]
        },
        {
            name: 'Regeneration',
            desc: ['Healing spells cure 50% more.'],
            req: [20],
            pos: [-53, -58],
            deps: [0]
        },
        {
            name: 'Necromage',
            desc: ['All spells are more effective against undead.'],
            req: [70],
            pos: [-103, -124],
            deps: [2]
        },
        {
            name: 'Ward Absorb',
            desc: ['Wards recharge your magicka when hit with spells.'],
            req: [60],
            pos: [-46, -123],
            deps: [0]
        },
        {
            name: 'Apprentice Restoration',
            desc: ['Cast Apprentice level Restoration spells for half magicka.'],
            req: [25],
            pos: [10, -55],
            deps: [0]
        },
        {
            name: 'Adept Restoration',
            desc: ['Cast Adept level Restoration spells for half magicka.'],
            req: [50],
            pos: [-7, -113],
            deps: [5]
        },
        {
            name: 'Expert Restoration',
            desc: ['Cast Expert level Restoration spells for half magicka.'],
            req: [75],
            pos: [-3, -161],
            deps: [6]
        },
        {
            name: 'Master Restoration',
            desc: ['Cast Master level Restoration spells for half magicka.'],
            req: [100],
            pos: [-29, -177],
            deps: [7]
        },
        {
            name: 'Recovery',
            levels: 2,
            desc: ['Magicka regenerates 25% faster.', 'Magicka regenerates 50% faster.'],
            req: [30, 60],
            pos: [79, -71],
            deps: [0]
        },
        {
            name: 'Avoid Death',
            desc: ['Once a day, heals 250 points automatically if you fall below 10% health.'],
            req: [90],
            pos: [100, -110],
            deps: [9]
        },
        {
            name: 'Restoration Dual Casting',
            desc: ['Dual casting a Restoration spell overcharges the effects into an even more powerful version.'],
            req: [20],
            pos: [57, -40],
            deps: [0]
        }
    ]},
    {name: 'Alteration', perks: [
        {
            name: 'Novice Alteration',
            desc: ['Cast Novice level Alteration spells for half magicka.'],
            pos: [0, 0]
        },
        {
            name: 'Alteration Dual Casting',
            desc: ['Dual casting an Alteration spell overcharges the effects into an even more powerful version.'],
            req: [20],
            pos: [-32, -56],
            deps: [0]
        },
        {
            name: 'Apprentice Alteration',
            desc: ['Cast Apprentice level Alteration spells for half magicka.'],
            req: [25],
            pos: [8, -72],
            deps: [0]
        },
        {
            name: 'Mage Armor',
            levels: 3,
            desc: ['Protection spells like Stoneflesh are twice as strong if not wearing armor.', 'Protection spells like Stoneflesh are three times as strong if not wearing armor.', 'Protection spells like Stoneflesh are four times as strong if not wearing armor.'],
            req: [30, 30, 30],
            pos: [-28, -124],
            deps: [2]
        },
        {
            name: 'Magic Resistance',
            levels: 3,
            desc: ["Blocks 10% of a spell's effects.", "Blocks 15% of a spell's effects.", "Blocks 20% of a spell's effects."],
            req: [30, 30, 30],
            pos: [50, -124],
            deps: [2]
        },
        {
            name: 'Adept Alteration',
            desc: ['Cast Adept level Alteration spells for half magicka.'],
            req: [50],
            pos: [8, -135],
            deps: [2]
        },
        {
            name: 'Stability',
            desc: ['Alteration spells have greater duration.'],
            req: [70],
            pos: [-18, -162],
            deps: [5]
        },
        {
            name: 'Expert Alteration',
            desc: ['Cast Expert level Alteration spells for half magicka.'],
            req: [75],
            pos: [30, -162],
            deps: [5]
        },
        {
            name: 'Atronach',
            desc: ['Absorb 30% of the magicka of any spells that hit you.'],
            req: [100],
            pos: [-41, -198],
            deps: [7]
        },
        {
            name: 'Master Alteration',
            desc: ['Cast Master level Alteration spells for half magicka.'],
            req: [100],
            pos: [70, -198],
            deps: [7]
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

function drawPerkTree(ctx, perkTree) {
    ctx.save();
    ctx.translate(transX, transY);
    ctx.scale(zoom, zoom);


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


    ctx.fillStyle = 'rgb(200,200,200)';
    ctx.font = '12px Arial black';
    var w = ctx.measureText(perkTree.name).width;
    ctx.fillText(perkTree.name, -w/2, 30, 0);

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

    drawPerkTree(ctx, perkData[2]);
}

function perkAtPosition(x, y) {
    var perkArray = perkData[2].perks;

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
