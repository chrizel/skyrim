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
  {
    name: 'Enchanting'
    perks: [
      {
        name: 'Enchanter'
        levels: 5
        desc: ['New enchantments are 20% stronger.', 'New enchantments are 40% stronger.', 'New enchantments are 60% stronger.', 'New enchantments are 80% stronger.', 'New enchantments are 100% stronger.']
        req: [0, 0, 0, 0, 0]
        pos: [0, 0]
      }
      {
        name: 'Fire Enchanter'
        desc: ['Fire enchantments on weapons and armor are 25% stronger.']
        req: [30]
        pos: [-24, -69]
        deps: [0]
      }
      {
        name: 'Insightful Enchanter'
        desc: ['Skill enchantments on armor are 25% stronger.']
        req: [50]
        pos: [22, -69]
        deps: [0]
      }
      {
        name: 'Soul Squeezer'
        desc: ['Soul gems provide extra magicka for recharging.']
        req: [20]
        pos: [75, -69]
        deps: [0]
      }
      {
        name: 'Soul Siphon'
        desc: ["Death blows to creatures, but not people, trap 5% of the victim's soul, recharging the weapon."]
        req: [40]
        pos: [64, -141]
        captionOffset: [0, -13]
        deps: [3]
      }
      {
        name: 'Frost Enchanter'
        desc: ['Frost enchantments on weapons and armor are 25% stronger.']
        req: [40]
        pos: [-18, -108]
        deps: [1]
      }
      {
        name: 'Storm Enchanter'
        desc: ['Shock enchantments on weapons and armor are 25% stronger.']
        req: [50]
        pos: [-1, -139]
        deps: [5]
      }
      {
        name: 'Corpus Enchanter'
        desc: ['Health, magicka, and stamina enchantments on armor are 25% stronger.']
        req: [70]
        pos: [43, -108]
        deps: [2]
      }
      {
        name: 'Extra Effect'
        desc: ['Can put two enchantments on the same item.']
        req: [100]
        pos: [37, -166]
        captionOffset: [0, -13]
        deps: [6, 7]
      }
    ]
  }
  {
    name: 'Smithing'
    perks: [
      {
        name: 'Steel Smithing'
        desc: ['Can create Steel armor and weapons at forges, and improve them twice as much.']
        pos: [0, 0]
      }
      {
        name: 'Elven Smithing'
        desc: ['Can create Elven armor and weapons at forges, and improve them twice as much.']
        req: [30]
        pos: [-55, -46]
        deps: [0]
      }
      {
        name: 'Arcane Blacksmith'
        desc: ['You can improve magical weapons and armor.']
        req: [60]
        pos: [4, -45]
        deps: [0]
      }
      {
        name: 'Dwarven Smithing'
        desc: ['Can create Dwarven armor and weapons at forges, and improve them twice as much.']
        req: [30]
        pos: [42, -33]
        deps: [0]
      }
      {
        name: 'Advanced Armors'
        desc: ['Can create Scaled and Plate armor at forges, and improve them twice as much.']
        req: [50]
        pos: [-49, -57]
        captionOffset: [0, -13]
        deps: [1]
      }
      {
        name: 'Glass Smithing'
        desc: ['Can create Glass armor and weapons at forges, and improve them twice as much.']
        req: [70]
        pos: [-10, -70]
        captionOffset: [0, -13]
        deps: [4]
      }
      {
        name: 'Orcish Smithing'
        desc: ['Can create Orcish armor and weapons at forges, and improve them twice as much.']
        req: [50]
        pos: [81, -51]
        deps: [3]
      }
      {
        name: 'Ebony Smithing'
        desc: ['Can create Ebony armor and weapons at forges, and improve them twice as much.']
        req: [80]
        pos: [114, -50]
        captionOffset: [0, -13]
        deps: [6]
      }
      {
        name: 'Daedric Smithing'
        desc: ['Can create Daedric armor and weapons at forges, and improve them twice as much.']
        req: [90]
        pos: [59, -66]
        captionOffset: [0, -13]
        deps: [7]
      }
      {
        name: 'Dragon Armor'
        desc: ['Can create Dragon armor at forges, and improve them twice as much.']
        req: [100]
        pos: [27, -71]
        deps: [5, 8]
      }
    ]
  }
  {
    name: 'Heavy Armor'
    perks: [
      {
        name: 'Juggernaut'
        levels: 5
        desc: ['Increases armor rating for Heavy Armor by 20%.', 'Increases armor rating for Heavy Armor by 40%.', 'Increases armor rating for Heavy Armor by 60%.', 'Increases armor rating for Heavy Armor by 80%.', 'Increases armor rating for Heavy Armor by 100%.']
        req: [0, 0, 0, 0, 0]
        pos: [0, 0]
      }
      {
        name: 'Fists of Steel'
        desc: ['Unarmed attacks with Heavy Armor gauntlets do their armor rating in extra damage.']
        req: [30]
        pos: [-55, -56]
        deps: [0]
      }
      {
        name: 'Cushioned'
        desc: ['Half damage from falling if wearing all Heavy Armor: head, chest, hands, feet.']
        req: [50]
        pos: [-85, -111]
        deps: [1]
      }
      {
        name: 'Conditioning'
        desc: ["Heavy Armor weighs nothing and doesn't slow you down when worn."]
        req: [70]
        pos: [-81, -170]
        deps: [2]
      }
      {
        name: 'Well Fitted'
        desc: ['25% Armor bonus if wearing all Heavy Armor: head, chest, hands, feet.']
        req: [30]
        pos: [51, -56]
        deps: [0]
      }
      {
        name: 'Tower of Strength'
        desc: ['50% less stagger when wearing only Heavy Armor.']
        req: [50]
        pos: [70, -111]
        deps: [4]
      }
      {
        name: 'Matching Set'
        desc: ['Additional 25% Armor bonus if wearing a matched set of Heavy Armor.']
        req: [70]
        pos: [82, -143]
        deps: [5]
      }
      {
        name: 'Reflect Blows'
        desc: ['10% chance to reflect melee damage back to the enemy while wearing all Heavy Armor: head, chest, hands, feet.']
        req: [100]
        pos: [72, -198]
        deps: [6]
      }
    ]
  }
  {
    name: 'Block'
    perks: [
      {
        name: 'Shield Wall'
        levels: 5
        desc: ['Blocking is 20% more effective.', 'Blocking is 40% more effective.', 'Blocking is 60% more effective.', 'Blocking is 80% more effective.', 'Blocking is 100% more effective.']
        req: [0, 0, 0, 0, 0]
        pos: [0, 0]
      }
      {
        name: 'Deflect Arrows'
        desc: ['Arrows that hit the shield do no damage.']
        req: [30]
        pos: [-103, -53]
        deps: [0]
      }
      {
        name: 'Quick Reflexes'
        desc: ["Time slows down if you are blocking during an enemy's power attack."]
        req: [30]
        pos: [-24, -70]
        captionOffset: [0, -13]
        deps: [0]
      }
      {
        name: 'Power Bash'
        desc: ['Able to do a power bash.']
        req: [30]
        pos: [83, -54]
        deps: [0]
      }
      {
        name: 'Elemental Protection'
        desc: ['Blocking with a shield reduces incoming fire, frost, and shock damage by 50%.']
        req: [50]
        pos: [-72, -131]
        deps: [1]
      }
      {
        name: 'Block Runner'
        desc: ['Able to move faster with a shield raised.']
        req: [70]
        pos: [-43, -149]
        captionOffset: [0, -13]
        deps: [4]
      }
      {
        name: 'Deadly Bash'
        desc: ['Bashing does five times more damage.']
        req: [50]
        pos: [79, -109]
        deps: [3]
      }
      {
        name: 'Disarming Bash'
        desc: ['Chance to disarm when power bashing.']
        req: [70]
        pos: [60, -151]
        deps: [6]
      }
      {
        name: 'Shield Charge'
        desc: ['Sprinting with a shield raised knocks down most targets.']
        req: [100]
        pos: [1, -167]
        captionOffset: [0, -13]
        deps: [7]
      }
    ]
  }
  {
    name: 'Two-Handed'
    perks: [
      {
        name: 'Barbarian'
        levels: 5
        desc: ['Two-Handed weapons do 20% more damage.', 'Two-Handed weapons do 40% more damage.', 'Two-Handed weapons do 60% more damage.', 'Two-Handed weapons do 80% more damage.', 'Two-Handed weapons do 100% more damage.']
        req: [0, 0, 0, 0, 0]
        pos: [0, 0]
      }
      {
        name: 'Limbsplitter'
        levels: 3
        desc: ['Attacks with battle axes cause extra bleeding damage.', 'Attacks with battle axes cause extra bleeding damage.', 'Attacks with battle axes cause extra bleeding damage.']
        req: [30, 30, 30]
        pos: [-41, -90]
        deps: [0]
      }
      {
        name: "Champion's Stance"
        desc: ['Power attacks with two-handed weapons cost 25% less stamina.']
        req: [20]
        pos: [3, -60]
        deps: [0]
      }
      {
        name: 'Deep Wounds'
        levels: 3
        desc: ['Attacks with greatsword have a 10% chance of doing critical damage.', 'Attacks with greatsword have a 15% chance of doing critical damage.', 'Attacks with greatsword have a 20% chance of doing critical damage.']
        req: [30, 30, 30]
        pos: [43, -91]
        deps: [0]
      }
      {
        name: 'Skullcrusher'
        levels: 3
        desc: ['Attacks with warhammers ignore 25% of armor.', 'Attacks with warhammers ignore 50% of armor.', 'Attacks with warhammers ignore 75% of armor.']
        req: [30, 30, 30]
        pos: [74, -91]
        captionOffset: [0, -13]
        deps: [0]
      }
      {
        name: 'Great Critical Charge'
        desc: ['Can do a two-handed power attack while sprinting that does double critical damage.']
        req: [50]
        pos: [-13, -126]
        deps: [2]
      }
      {
        name: 'Devastating Blow'
        desc: ['Standing power attacks do 25% bonus damage with a chance to decapitate your enemies.']
        req: [50]
        pos: [17, -127]
        captionOffset: [0, -13]
        deps: [2]
      }
      {
        name: 'Sweep'
        desc: ['Sideways power attacks with two-handed weapons hit all targets in front of you.']
        req: [70]
        pos: [7, -189]
        deps: [5, 6]
      }
      {
        name: 'Warmaster'
        desc: ['Backwards power attack has a 25% chance to paralyze the target.']
        req: [100]
        pos: [8, -237]
        captionOffset: [0, -13]
        deps: [7]
      }
    ]
  }
  {
    name: 'One-Handed'
    perks: [
      {
        name: 'Armsman'
        levels: 5
        desc: ['One-Handed weapons do 20% more damage.', 'One-Handed weapons do 40% more damage.', 'One-Handed weapons do 60% more damage.', 'One-Handed weapons do 80% more damage.', 'One-Handed weapons do 100% more damage.']
        req: [0, 0, 0, 0, 0]
        pos: [0, 0]
      }
      {
        name: 'Hack and Slash'
        levels: 3
        desc: ['Attacks with war axes cause extra bleeding damage.', 'Attacks with war axes cause extra bleeding damage.', 'Attacks with war axes cause extra bleeding damage.']
        req: [30, 30, 30]
        pos: [-45, -86]
        deps: [0]
      }
      {
        name: 'Fighting Stance'
        desc: ['Power attacks with one-handed-weapons cost 25% less stamina.']
        req: [20]
        pos: [0, -56]
        deps: [0]
      }
      {
        name: 'Bone Breaker'
        levels: 3
        desc: ['Attacks with maces ignore 25% of armor.', 'Attacks with maces ignore 50% of armor.', 'Attacks with maces ignore 75% of armor.']
        req: [30]
        pos: [23, -86]
        deps: [0]
      }
      {
        name: 'Bladesman'
        levels: 3
        desc: ['Attacks with swords have a 10% chance of doing critical damage.', 'Attacks with swords have a 15% chance of doing critical damage.', 'Attacks with swords have a 20% chance of doing critical damage.']
        req: [30]
        pos: [46, -86]
        captionOffset: [0, -13]
        deps: [0]
      }
      {
        name: 'Dual Flurry'
        levels: 2
        desc: ['Dual wielding attacks are 20% faster.', 'Dual wielding attacks are 35% faster.']
        req: [30]
        pos: [88, -40]
        deps: [0]
      }
      {
        name: 'Dual Savagery'
        desc: ['Dual wielding power attacks do 50% bonus damage.']
        req: [70]
        pos: [62, -163]
        captionOffset: [0, -13]
        deps: [5]
      }
      {
        name: 'Savage Strike'
        desc: ['Standing power attacks do 25% bonus damage with a chance to decapitate your enemies.']
        req: [50]
        pos: [-20, -122]
        deps: [2]
      }
      {
        name: 'Critical Charge'
        desc: ['Can do a one-handed power attack while sprinting that does double critical damage.']
        req: [50]
        pos: [14, -122]
        captionOffset: [0, -13]
        deps: [2]
      }
      {
        name: 'Paralyzing Strike'
        desc: ['Backwards power attack has a 25% chance to paralyze the target.']
        req: [100]
        pos: [2, -216]
        captionOffset: [0, -13]
        deps: [7, 8]
      }
    ]
  }
  {
    name: 'Archery'
    perks: [
      {
        name: 'Overdraw'
        levels: 5
        desc: ['Bows do 20% more damage.', 'Bows do 40% more damage.', 'Bows do 60% more damage.', 'Bows do 80% more damage.', 'Bows do 100% more damage.']
        req: [0, 0, 0, 0, 0]
        pos: [0, 0]
      }
      {
        name: 'Eagle Eye'
        desc: ['Pressing Block while aiming will zoom in your view.']
        req: [30]
        pos: [-74, -54]
        deps: [0]
      }
      {
        name: 'Critical Shot'
        desc: ['10% chance of a critical hit that does extra damage.']
        req: [30]
        pos: [-15, -69]
        deps: [0]
      }
      {
        name: 'Steady Hand'
        levels: 2
        desc: ['Zooming in with a bow slows time by 25%.', 'Zooming in with a bow slows time by 50%.']
        req: [40]
        pos: [-49, -68]
        deps: [1]
      }
      {
        name: 'Power Shot'
        desc: ['Arrows stagger all but the largest opponents 50% of the time.']
        req: [50]
        pos: [-92, -97]
        deps: [1]
      }
      {
        name: 'Quick Shot'
        desc: ['Can draw a bow 30% faster.']
        req: [70]
        pos: [-91, -151]
        deps: [4]
      }
      {
        name: "Hunter's Discipline"
        desc: ['Recover twice as many arrows from dead bodies.']
        req: [50]
        pos: [-39, -121]
        deps: [2]
      }
      {
        name: 'Ranger'
        desc: ['Able to move faster with a drawn bow.']
        req: [60]
        pos: [-47, -141]
        deps: [6]
      }
      {
        name: 'Bullseye'
        desc: ['15% chance of paralyzing the target for a few seconds.']
        req: [100]
        pos: [-65, -166]
        deps: [5, 7]
      }
    ]
  }
  {
    name: 'Light Armor'
    perks: [
      {
        name: 'Agile Defender'
        desc: ['Increase armor rating for Light armor by 20%.']
        req: [0]
        pos: [0, 0]
      }
      {
        name: 'Custom Fit'
        desc: ['25% Armor bonus if wearing all Light Armor: head, chest, hands, feet.']
        req: [30]
        pos: [-15, -62]
        deps: [0]
      }
      {
        name: 'Unhindered'
        desc: ["Light Armor weighs nothing and doesn't slow you down when worn."]
        req: [50]
        pos: [-47, -110]
        deps: [1]
      }
      {
        name: 'Matching Set'
        desc: ['Additional 25% Armor bonus if wearing a matched set of Light Armor.']
        req: [70]
        pos: [8, -153]
        deps: [1]
      }
      {
        name: 'Wind Walker'
        desc: ['Stamina regenerates 50% faster in all Light Armor: head, chest, hands, feet.']
        req: [60]
        pos: [-42, -143]
        deps: [2]
      }
      {
        name: 'Deft Movement'
        desc: ['10% chance of avoiding all damage from a melee attack while wearing all Light Armor: head, chest, hands, feet.']
        req: [100]
        pos: [-15, -170]
        captionOffset: [0, -13]
        deps: [3, 4]
      }
    ]
  }
  {
    name: 'Sneak'
    perks: [
      {
        name: 'Stealth'
        levels: 5
        desc: ['You are 20% harder to detect when sneaking.', 'You are 40% harder to detect when sneaking.', 'You are 60% harder to detect when sneaking.', 'You are 80% harder to detect when sneaking.', 'You are 100% harder to detect when sneaking.']
        req: [0, 0, 0, 0, 0]
        pos: [0, 0]
      }
      {
        name: 'Backstab'
        desc: ['Sneak attacks with one-handed weapons now do six times damage.']
        req: [30]
        pos: [43, -55]
        deps: [0]
      }
      {
        name: 'Deadly Aim'
        desc: ['Sneak attacks with bows now do three times damage.']
        req: [40]
        pos: [48, -112]
        deps: [1]
      }
      {
        name: "Assassin's Blade"
        desc: ['Sneak attacks with daggers now do a total of fifteen times normal damage.']
        req: [50]
        pos: [27, -121]
        deps: [2]
      }
      {
        name: 'Muffled Movement'
        desc: ['Noise from armor is reduced 50%.']
        req: [30]
        pos: [-54, -56]
        deps: [0]
      }
      {
        name: 'Light Foot'
        desc: ["You won't trigger pressure plates."]
        req: [40]
        pos: [-32, -113]
        deps: [4]
      }
      {
        name: 'Silent Roll'
        desc: ['Sprinting while sneaking executes a silent forward roll.']
        req: [50]
        pos: [-9, -134]
        deps: [5]
      }
      {
        name: 'Silence'
        desc: ['Walking and running does not affect detection.']
        req: [70]
        pos: [21, -162]
        deps: [6]
      }
      {
        name: 'Shadow Warrior'
        desc: ['Crouching stops combat for a moment and forces distant opponents to search for a target.']
        req: [100]
        pos: [68, -176]
        deps: [7]
      }
    ]
  }
  {
    name: 'Lockpicking'
    perks: [
      {
        name: 'Novice Locks'
        desc: ['Novice locks are much easier to pick.']
        req: [0]
        pos: [0, 0]
      }
      {
        name: 'Apprentice Locks'
        desc: ['Apprentice locks are much easier to pick.']
        req: [25]
        pos: [31, -57]
        deps: [0]
      }
      {
        name: 'Quick Hands'
        desc: ['Able to pick locks without being noticed.']
        req: [40]
        pos: [-7, -87]
        deps: [1]
      }
      {
        name: 'Wax Key'
        desc: ["Automatically gives you a copy of a picked lock's key if it has one."]
        req: [50]
        pos: [-45, -106]
        deps: [2]
      }
      {
        name: 'Adept Locks'
        desc: ['Adept locks are much easier to pick.']
        req: [50]
        pos: [55, -111]
        deps: [1]
      }
      {
        name: 'Golden Touch'
        desc: ['Find more gold in chests.']
        req: [60]
        pos: [13, -124]
        deps: [4]
      }
      {
        name: 'Treasure Hunter'
        desc: ['50% greater chance of finding special treasure.']
        req: [70]
        pos: [-15, -145]
        deps: [5]
      }
      {
        name: 'Expert Locks'
        desc: ['Expert locks are much easier to pick.']
        req: [75]
        pos: [59, -143]
        deps: [4]
      }
      {
        name: 'Locksmith'
        desc: ['Pick starts close to the lock opening position.']
        req: [80]
        pos: [22, -162]
        deps: [7]
      }
      {
        name: 'Unbreakable'
        desc: ['Lockpicks never break.']
        req: [100]
        pos: [0, -177]
        deps: [8]
      }
      {
        name: 'Master Locks'
        desc: ['Master locks are much easier to pick.']
        req: [100]
        pos: [67, -193]
        deps: [7]
      }
    ]
  }
]
