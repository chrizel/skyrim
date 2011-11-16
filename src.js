var transX = 400;
var transY = 800;
var zoom = 4;

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

function drawPerk(ctx, perkArray) {
    ctx.save();
    ctx.translate(transX, transY);
    ctx.scale(zoom, zoom);

    // Draw dependency lines...
    for (var i = 0; i < perkArray.length; i++) {
        var perk = perkArray[i];

        if (perk.deps) {
            for (var j = 0; j < perk.deps.length; j++) {
                var depPerk = perkArray[perk.deps[j]];
                ctx.beginPath();
                ctx.strokeStyle = 'rgb(0, 0, 255)';
                ctx.moveTo(depPerk.pos[0], depPerk.pos[1]);
                ctx.lineTo(perk.pos[0], perk.pos[1]);
                ctx.stroke();
            }
        }
    }

    // Draw perks ...
    for (var i = 0; i < perkArray.length; i++) {
        var perk = perkArray[i];

        ctx.beginPath();
        ctx.fillStyle = 'rgb(255, 255, 255)';
        ctx.arc(perk.pos[0], perk.pos[1], 3, 0, Math.PI*2, true);
        ctx.fill();

        ctx.save();
        ctx.font = "4px Arial";
        var w = ctx.measureText(perk.name).width;
        ctx.translate(perk.pos[0], perk.pos[1]+10);
        //ctx.rotate(Math.PI/4-0.2);
        ctx.rotate(0.2);
        ctx.translate(-w/2, 0);
        /*
        */
        ctx.fillText(perk.name, 0, 0, 0);
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

    drawPerk(ctx, perkData[0].perks);
}

function perkAtPosition(x, y) {
    var perkArray = perkData[0].perks;

    for (var i = 0; i < perkArray.length; i++) {
        var perk = perkArray[i];

    }

    //TODO
    return null;
}

function downHandler(e) {
    e.preventDefault();
    console.log(e.button);
}

function moveHandler(e) {
    e.preventDefault();
    var perk = perkAtPosition(e.clientX, e.clientY);
    console.log(perk);
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
