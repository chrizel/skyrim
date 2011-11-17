window.perkTrees = [
  {
    name: 'Destruction'
    perks: [
      {
        name: 'Novice Destruction'
        desc: ['Cast Novice level Destruction spells for half magicka.']
        pos: [0, 0]
      }
      {
        name: 'Destruction Dual Casting'
        desc: ['Dual casting a Destruction spell overcharges the effects into an even more powerful version.']
        req: [20]
        pos: [64, -21]
        deps: [0]
      }
      {
        name: 'Impact'
        desc: ['Most destruction spells will stagger an opponent when dual cast.']
        req: [40]
        pos: [79, -56]
        deps: [1]
      }
      {
        name: 'Augmented Flames'
        levels: 2
        desc: ['Fire spells do 25% more damage.', 'Fire spells do 50% more damage.']
        req: [30, 60]
        pos: [-44, -72]
        deps: [0]
      }
      {
        name: 'Intense Flames'
        desc: ['Fire damage causes targets to flee if their health is low.']
        req: [50]
        pos: [-50, -111]
        deps: [3]
      }
      {
        name: 'Augmented Frost'
        levels: 2
        desc: ['Frost spells do 25% more damage.', 'Frost spells do 50% more damage.']
        req: [30, 60]
        pos: [-12, -85]
        deps: [0]
      }
      {
        name: 'Deep Freeze'
        desc: ['Frost damage paralyzes targets if their health is low.']
        req: [60]
        pos: [-16, -133]
        deps: [5]
      }
      {
        name: 'Augmented Shock'
        levels: 2
        desc: ['Shock spells do 25% more damage.', 'Shock spells do 50% more damage.']
        req: [30, 60]
        pos: [13, -86]
        captionOffset: [0, -13]
        deps: [0]
      }
      {
        name: 'Disintegrate'
        desc: ['Shock damage disintegrates targets if their health is low.']
        req: [70]
        pos: [13, -143]
        deps: [7]
      }
      {
        name: 'Apprentice Destruction'
        desc: ['Cast Apprentice level Destruction spells for half magicka.']
        req: [25]
        pos: [42, -55]
        deps: [0]
      }
      {
        name: 'Rune Master'
        desc: ['Can place runes five times farther away.']
        req: [40]
        pos: [67, -87]
        deps: [9]
      }
      {
        name: 'Adept Destruction'
        desc: ['Cast Adept level Destruction spells for half magicka.']
        req: [50]
        pos: [38, -110]
        deps: [9]
      }
      {
        name: 'Expert Destruction'
        desc: ['Cast Expert level Destruction spells for half magicka.']
        req: [75]
        pos: [52, -141]
        deps: [11]
      }
      {
        name: 'Master Destruction'
        desc: ['Cast Master level Destruction spells for half magicka.']
        req: [100]
        pos: [51, -186]
        deps: [12]
      }
    ]
  }
  {
    name: 'Restoration'
    perks: [
      {
        name: 'Novice Restoration'
        desc: ['Cast Novice level Restoration spells for half magicka.']
        pos: [0, 0]
      }
      {
        name: 'Respite'
        desc: ['Healing spells also restore Stamina.']
        req: [40]
        pos: [-117, -70]
        deps: [0]
      }
      {
        name: 'Regeneration'
        desc: ['Healing spells cure 50% more.']
        req: [20]
        pos: [-53, -58]
        deps: [0]
      }
      {
        name: 'Necromage'
        desc: ['All spells are more effective against undead.']
        req: [70]
        pos: [-103, -124]
        deps: [2]
      }
      {
        name: 'Ward Absorb'
        desc: ['Wards recharge your magicka when hit with spells.']
        req: [60]
        pos: [-46, -123]
        deps: [0]
      }
      {
        name: 'Apprentice Restoration'
        desc: ['Cast Apprentice level Restoration spells for half magicka.']
        req: [25]
        pos: [10, -55]
        deps: [0]
      }
      {
        name: 'Adept Restoration'
        desc: ['Cast Adept level Restoration spells for half magicka.']
        req: [50]
        pos: [-7, -113]
        deps: [5]
      }
      {
        name: 'Expert Restoration'
        desc: ['Cast Expert level Restoration spells for half magicka.']
        req: [75]
        pos: [-3, -161]
        deps: [6]
      }
      {
        name: 'Master Restoration'
        desc: ['Cast Master level Restoration spells for half magicka.']
        req: [100]
        pos: [-29, -177]
        deps: [7]
      }
      {
        name: 'Recovery'
        levels: 2
        desc: ['Magicka regenerates 25% faster.', 'Magicka regenerates 50% faster.']
        req: [30, 60]
        pos: [79, -71]
        deps: [0]
      }
      {
        name: 'Avoid Death'
        desc: ['Once a day, heals 250 points automatically if you fall below 10% health.']
        req: [90]
        pos: [100, -110]
        deps: [9]
      }
      {
        name: 'Restoration Dual Casting'
        desc: ['Dual casting a Restoration spell overcharges the effects into an even more powerful version.']
        req: [20]
        pos: [57, -40]
        deps: [0]
      }
    ]
  }
  {
    name: 'Alteration'
    perks: [
      {
        name: 'Novice Alteration'
        desc: ['Cast Novice level Alteration spells for half magicka.']
        pos: [0, 0]
      }
      {
        name: 'Alteration Dual Casting'
        desc: ['Dual casting an Alteration spell overcharges the effects into an even more powerful version.']
        req: [20]
        pos: [-32, -56]
        deps: [0]
      }
      {
        name: 'Apprentice Alteration'
        desc: ['Cast Apprentice level Alteration spells for half magicka.']
        req: [25]
        pos: [8, -72]
        deps: [0]
      }
      {
        name: 'Mage Armor'
        levels: 3
        desc: ['Protection spells like Stoneflesh are twice as strong if not wearing armor.', 'Protection spells like Stoneflesh are three times as strong if not wearing armor.', 'Protection spells like Stoneflesh are four times as strong if not wearing armor.']
        req: [30, 30, 30]
        pos: [-28, -124]
        deps: [2]
      }
      {
        name: 'Magic Resistance'
        levels: 3
        desc: ["Blocks 10% of a spell's effects.", "Blocks 15% of a spell's effects.", "Blocks 20% of a spell's effects."]
        req: [30, 30, 30]
        pos: [50, -124]
        deps: [2]
      }
      {
        name: 'Adept Alteration'
        desc: ['Cast Adept level Alteration spells for half magicka.']
        req: [50]
        pos: [8, -135]
        deps: [2]
      }
      {
        name: 'Stability'
        desc: ['Alteration spells have greater duration.']
        req: [70]
        pos: [-18, -162]
        deps: [5]
      }
      {
        name: 'Expert Alteration'
        desc: ['Cast Expert level Alteration spells for half magicka.']
        req: [75]
        pos: [30, -162]
        deps: [5]
      }
      {
        name: 'Atronach'
        desc: ['Absorb 30% of the magicka of any spells that hit you.']
        req: [100]
        pos: [-41, -198]
        deps: [7]
      }
      {
        name: 'Master Alteration'
        desc: ['Cast Master level Alteration spells for half magicka.']
        req: [100]
        pos: [70, -198]
        deps: [7]
      }
    ]
  }
]
