window.perkTrees = [
  {
    name: 'Alchemy'
    perks: [
      {
        name: 'Alchemist'
        levels: 5
        desc: ['Potions and poisons you make are 20% stronger.', 'Potions and poisons you make are 40% stronger.', 'Potions and poisons you make are 60% stronger.', 'Potions and poisons you make are 80% stronger.', 'Potions and poisons you make are 100% stronger.']
        req: [0, 0, 0, 0, 0]
        pos: [0, 0]
      }
      {
        name: 'Physician'
        desc: ['Potions you mix that restore Health, Magicka or Stamina are 25% more powerful.']
        req: [20]
        pos: [110, -21]
        deps: [0]
      }
      {
        name: 'Poisoner'
        desc: ['Poisons you mix are 25% more effective.']
        req: [30]
        pos: [20, -70]
        deps: [1]
      }
      {
        name: 'Benefactor'
        desc: ['Potions you mix with beneficial effects have an additional 25% greater magnitude.']
        req: [30]
        pos: [87, -71]
        deps: [1]
      }
      {
        name: 'Concentrated Poison'
        desc: ['Poisins applied to weapons last for twice as many hits.']
        req: [60]
        pos: [24, -110]
        deps: [2]
      }
      {
        name: 'Experimenter'
        levels: 3
        desc: ['Eating an ingredient reveals first two effects.', 'Eating an ingredient reveals first three effects.', 'Eating an ingredient reveals first two effects.']
        req: [50, 50, 50]
        pos: [77, -111]
        deps: [3]
      }
      {
        name: 'Green Thumb'
        desc: ['Two ingredients are gathered from plants.']
        req: [70]
        pos: [31, -163]
        deps: [4]
      }
      {
        name: 'Snakeblood'
        desc: ['50% resistance to all poisons.']
        req: [80]
        pos: [70, -178]
        deps: [4, 5]
      }
      {
        name: 'Purity'
        desc: ['All negative effects are removed from created potions, and all positive effects are removed from created poisons.']
        req: [100]
        pos: [58, -216]
        deps: [7]
      }
    ]
  }
  {
    name: 'Illusion'
    perks: [
      {
        name: 'Novice Illusion'
        desc: ['Cast Novice level Illusion spells for half magicka.']
        pos: [0, 0]
      }
      {
        name: 'Illusion Dual Casting'
        desc: ['Dual casting an Illusion spell overcharges the effects into an even more powerful version.']
        req: [20]
        pos: [-87, -3]
        deps: [0]
      }
      {
        name: 'Apprentice Illusion'
        desc: ['Cast Apprentice level Illusion spells for half magicka.']
        req: [25]
        pos: [-59, -56]
        deps: [0]
      }
      {
        name: 'Hypnotic Gaze'
        desc: ['Calm spells now work on higher level opponents. Cumulative with Kindred Mage and Animage.']
        req: [30]
        pos: [-8, -72]
        deps: [0]
      }
      {
        name: 'Animage'
        desc: ['Illusion spells now work on higher level animals.']
        req: [20]
        pos: [63, -40]
        deps: [0]
      }
      {
        name: 'Adept Illusion'
        desc: ['Cast Adept level Illusion spells for half magicka.']
        req: [50]
        pos: [-57, -100]
        deps: [2]
      }
      {
        name: 'Expert Illusion'
        desc: ['Cast Expert level Illusion spells for half magicka.']
        req: [75]
        pos: [-60, -123]
        deps: [5]
      }
      {
        name: 'Master Illusion'
        desc: ['Cast Master level Illusion spells for half magicka.']
        req: [100]
        pos: [-32, -153]
        deps: [6]
      }
      {
        name: 'Aspect of Terror'
        desc: ['Fear spells work on higher level opponents. Cumulative with Kindred Mage and Animage.']
        req: [50]
        pos: [-27, -112]
        deps: [3]
      }
      {
        name: 'Rage'
        desc: ['Frenzy spells work on higher level opponents. Cumulative with Kindred Mage and Animage.']
        req: [70]
        pos: [-12, -122]
        deps: [8]
      }
      {
        name: 'Kindred Mage'
        desc: ['All Illusion spells work on higher level people.']
        req: [40]
        pos: [26, -86]
        deps: [4]
      }
      {
        name: 'Quiet Casting'
        desc: ['All spells you cast from any school of magic are silent to others.']
        req: [50]
        pos: [23, -124]
        deps: [10]
      }
      {
        name: 'Master of the Mind'
        desc: ['Illusion spells work on undead, daedra and automatons.']
        req: [90]
        pos: [7, -154]
        deps: [9, 11]
      }
    ]
  }
  {
    name: 'Conjuration'
    perks: [
      {
        name: 'Novice Conjuration'
        desc: ['Cast Novice level Conjuration spells for half magicka.']
        pos: [0, 0]
      }
      {
        name: 'Summoner'
        levels: 2
        desc: ['Can summon atronachs or raise undead twice as far away.', 'Can summon atronachs or raise undead three times as far away.']
        req: [30, 30]
        pos: [-72, -70]
        deps: [0]
      }
      {
        name: 'Conjuration Dual Casting'
        desc: ['Dual casting a Conjuration spell overcharges the spell, allowing it to last longer.']
        req: [20]
        pos: [-30, -54]
        deps: [0]
      }
      {
        name: 'Necromancy'
        desc: ['Greater duration for reanimated undead.']
        req: [40]
        pos: [-44, -133]
        deps: [0]
      }
      {
        name: 'Mystic Binding'
        desc: ['Bound weapons do more damage.']
        req: [20]
        pos: [9, -55]
        deps: [0]
      }
      {
        name: 'Apprentice Conjuration'
        desc: ['Cast Apprentice level Conjuration spells for half magicka.']
        req: [25]
        pos: [45, -70]
        deps: [0]
      }
      {
        name: 'Atromancy'
        desc: ['Double duration for conjured Atronachs.']
        req: [40]
        pos: [-80, -134]
        deps: [1]
      }
      {
        name: 'Elemental Potency'
        desc: ['Conjured Atronachs are 50% more powerful.']
        req: [80]
        pos: [-75, -161]
        deps: [6]
      }
      {
        name: 'Dark Souls'
        desc: ['Reanimated undead have 100 points more health.']
        req: [70]
        pos: [-45, -162]
        deps: [3]
      }
      {
        name: 'Twin Souls'
        desc: ['You can have two atronachs or reanimated zombies.']
        req: [100]
        pos: [-39, -175]
        captionOffset: [0, -13]
        deps: [7, 8]
      }
      {
        name: 'Soul Stealer'
        desc: ['Bound weapons cast Soul Trap on targets.']
        req: [30]
        pos: [15, -123]
        deps: [4]
      }
      {
        name: 'Oblivion Binding'
        desc: ['Bound weapons will banish summoned creatures and turn raised ones.']
        req: [50]
        pos: [14, -143]
        captionOffset: [0, -13]
        deps: [10]
      }
      {
        name: 'Adept Conjuration'
        desc: ['Cast Adept level Conjuration spells for half magicka.']
        req: [50]
        pos: [52, -109]
        deps: [5]
      }
      {
        name: 'Expert Conjuration'
        desc: ['Cast Expert level Conjuration spells for half magicka.']
        req: [75]
        pos: [45, -141]
        deps: [12]
      }
      {
        name: 'Master Conjuration'
        desc: ['Cast Master level Conjuration spells for half magicka.']
        req: [100]
        pos: [19, -175]
        captionOffset: [0, -13]
        deps: [13]
      }
    ]
  }
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
