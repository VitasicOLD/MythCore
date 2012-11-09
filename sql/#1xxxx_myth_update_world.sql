/* Copyright (C) 2010 - 2012 Myth Project <https://bitbucket.org/MythProject/myth-core>
 *
 * Myth Project's source is based on the Trinity Project source, you can find the
 * link to that easily in Trinity Copyrights. Myth Project is a private community.
 * To get access, you either have to donate or pass a developer test.
 * You can't share Myth Project's sources! Only for personal use. */
-- -------------------------------------------------------------------------}
-- ----------------- Myth Project "World" Database Update ------------------
-- -------------------------------------------------------------------------{
 TRUNCATE `version`;
INSERT INTO `version` VALUES (NULL, NULL,'MythDB v20.39','MythAI v20.39', 630);
ALTER TABLE `conditions` CHANGE `SourceId` `SourceId` INT(10) DEFAULT 0;
-- -------------------------------------------------------------------------}
-- ----------------------------- Icecrown Citadel --------------------------
-- -------------------------------------------------------------------------{
-- NPC: Deathbringer Saurfang, http://www.wowhead.com/npc=37813
UPDATE `creature_template` SET `unit_flags` = `unit_flags`|0x00000102,`type_flags` = `type_flags`|0x00000004 WHERE `entry` IN (37813, 38402, 38582, 38583);
DELETE FROM `creature_template` WHERE `entry` IN (50004, 50006);
INSERT INTO `creature_template`(`entry`,`difficulty_entry_1`,`difficulty_entry_2`,`difficulty_entry_3`,`KillCredit1`,`KillCredit2`,`modelid1`,`modelid2`,`modelid3`,`modelid4`,`name`,`subname`,`IconName`,`gossip_menu_id`,`minlevel`,`maxlevel`,`exp`,`faction_A`,`faction_H`,`npcflag`,`speed_walk`,`speed_run`,`scale`,`rank`,`mindmg`,`maxdmg`,`dmgschool`,`attackpower`,`dmg_multiplier`,`baseattacktime`,`rangeattacktime`,`unit_class`,`unit_flags`,`dynamicflags`,`family`,`trainer_type`,`trainer_spell`,`trainer_class`,`trainer_race`,`minrangedmg`,`maxrangedmg`,`rangedattackpower`,`type`,`type_flags`,`lootid`,`pickpocketloot`,`skinloot`,`resistance1`,`resistance2`,`resistance3`,`resistance4`,`resistance5`,`resistance6`,`spell1`,`spell2`,`spell3`,`spell4`,`spell5`,`spell6`,`spell7`,`spell8`,`PetSpellDataId`,`VehicleId`,`mingold`,`maxgold`,`AIName`,`MovementType`,`InhabitType`,`Health_mod`,`Mana_mod`,`Armor_mod`,`RacialLeader`,`questItem1`,`questItem2`,`questItem3`,`questItem4`,`questItem5`,`questItem6`,`movementId`,`RegenHealth`,`equipment_id`,`mechanic_immune_mask`,`flags_extra`,`ScriptName`,`WDBVerified`) VALUES 
 (50004, 0, 0, 0, 0, 0, 11686, 0, 0, 0, 'High Overlord Saurfang', '', '', 0, 80, 80, 2, 1802, 1802, 0, 0, 0, 1, 1, 252, 357, 0, 304, '7.5', 2000, 0, 1, 33554432, 8, 0, 0, 0, 0, 0, 215, 320, 44, 7, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1000, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, '', 12340),
 (50006, 0, 0, 0, 0, 0, 11686, 0, 0, 0, 'Muradin Bronzebeard', '', '', 10875, 83, 83, 2, 1802, 1802, 1, 1, '1.14286', 1, 1, 468, 702, 0, 175, '47.2', 2000, 2000, 1, 33554432, 8, 0, 0, 0, 0, 0, 374, 562, 140, 7, 76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15284, 70309, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 175, 1, 1, 0, 0, 0, 0, 0, 0, 0, 164, 1, 0, 0, 0, '', 12340);
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` IN (50004, 50006);
UPDATE `creature_template` SET `npcflag` = 1 WHERE `entry` IN (36939, 38156, 38637, 38638);
UPDATE `creature_template` SET `faction_A` = 1801,`faction_H` = 1801,`baseattacktime` = 2000,`rangeattacktime` = 2000,`unit_flags` = 32832,`spell1` = 71339,`spell2` = 70161,`spell3` = 72539,`mechanic_immune_mask` = 73745 WHERE `entry` IN (36968, 38403, 38675, 38676);
UPDATE `creature_template` SET `faction_A` = 1802,`faction_H` = 1802,`baseattacktime` = 2000,`rangeattacktime` = 2000,`unit_flags` = 32832,`spell1` = 71335,`spell2` = 70162,`spell3` = 72566,`mechanic_immune_mask` = 73745 WHERE `entry` IN (36969, 38408, 38689, 38690);
DELETE FROM `creature` WHERE `id` IN (37003, 37026);
INSERT INTO `creature`(`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
 (190000, 37026, 631, 15, 1, 0, 0, -571.091, 2219.71, 199.969, 5.06842, 86400, 0, 0, 269600, 91600, 0, 0, 0, 0),
 (190001, 37003, 631, 15, 1, 0, 0, -562.385, 2217.58, 199.969, 3.46228, 86400, 0, 0, 398434, 41690, 0, 0, 0, 0);
UPDATE `creature_template` SET `ScriptName` = 'npc_muradin_gunship' WHERE `entry` = 36948;
UPDATE `creature_template` SET `ScriptName` = 'npc_saurfang_gunship' WHERE `entry` = 36939;
UPDATE `creature_template` SET `ScriptName` = 'npc_zafod_boombox' WHERE `entry` = 37184;
UPDATE `creature_template` SET `ScriptName` = 'npc_korkron_defender' WHERE `entry` = 37032;
UPDATE `creature_template` SET `ScriptName` = 'npc_korkron_primalist' WHERE `entry` = 37030;
UPDATE `creature_template` SET `ScriptName` = 'npc_skybreaker_vindicator' WHERE `entry` = 37003;
UPDATE `creature_template` SET `ScriptName` = 'npc_skybreaker_protector' WHERE `entry` = 36998;
UPDATE `creature_template` SET `ScriptName` = 'npc_icc_spire_frostwyrm' WHERE `entry` = 37230;
UPDATE `creature_template` SET `ScriptName` = 'npc_korkron_axethrower_rifleman' WHERE `entry` IN (36968, 36969);
UPDATE `creature_template` SET `ScriptName` = 'npc_mortar_soldier_or_rocketeer', AIName = '' WHERE `entry` IN (36982, 36978);
UPDATE `creature_template` SET `ScriptName` = 'npc_gunship_mage' WHERE `entry`IN (37117, 37116);
UPDATE `creature_template` SET `ScriptName` = 'npc_gunship_trigger' WHERE `entry` = 37547;
UPDATE `creature_template` SET `ScriptName` = 'npc_gunship_portal' WHERE `entry` = 37227;
UPDATE `creature_template` SET `ScriptName` = 'npc_marine_or_reaver' WHERE `entry` IN (36957, 36950);
UPDATE `creature_template` SET `ScriptName` = 'npc_sergeant' WHERE `entry` IN (36960, 36961);
UPDATE `creature_template` SET `ScriptName` = 'npc_gunship_skybreaker' WHERE `entry` = 37540;
UPDATE `creature_template` SET `ScriptName` = 'npc_gunship_orgrimmar' WHERE `entry` = 37215;
UPDATE `creature_template` SET `ScriptName` = 'npc_gunship_cannon' WHERE `entry` IN (36838, 36839);
UPDATE `gameobject_template` SET `ScriptName` = 'transport_gunship' WHERE `entry` IN (201580, 201812);
DELETE FROM `areatrigger_scripts` WHERE `entry` IN (5630, 5628);
INSERT INTO `areatrigger_scripts`(`entry`,`ScriptName`) VALUES
 (5628,'at_icc_land_frostwyrm'),    (5630,'at_icc_land_frostwyrm');
DELETE FROM `spell_script_names` WHERE `spell_id` IN (70713, 68645, 69471, 69488, 69402, 70175, 71335, 71339);
INSERT INTO `spell_script_names`(`spell_id`,`ScriptName`) VALUES
 (70713, 'spell_icc_remove_rocket_pack'),   (68645, 'spell_rocket_pack'),           (69471, 'spell_gb_heat_drain'),     (69488, 'spell_gb_overheat_drain'),
 (69402, 'spell_gb_incinerating_blast'),    (70175, 'spell_gb_incinerating_blast'), (71335, 'spell_gb_burning_pitch'),  (71339, 'spell_gb_burning_pitch');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` IN (69400, 70173, 69402, 70175, 70374, 70383, 72959);
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`) VALUES
 (13, 69400, 18, 1, 37540), (13, 70173, 18, 1, 37215),  (13, 69402, 18, 1, 37540),  (13, 70175, 18, 1, 37215),
 (13, 70374, 18, 1, 37540), (13, 70383, 18, 1, 37215),  (13, 72959, 18, 1, 0);
-- 201812,201581,201811,201580 DELETE? = INVISIBLE SHIP!
DELETE FROM `transports` WHERE entry IN (201580, 201581, 201811, 201812);
DELETE FROM `creature` WHERE id IN (37230, 36838, 36839, 36948, 36939);
DELETE FROM `creature_template_addon` WHERE (`entry` = 37547);
UPDATE `creature_template` SET `flags_extra` = 130 WHERE `entry` = 37547;
UPDATE `creature_template` SET `exp` = 2,`speed_run` = 0,`VehicleId` = 554,`RegenHealth` = 0,`npcflag` = 16777216,`spell1` = 69399,`spell2` = 69401 WHERE entry IN (36839,
-- for prevent error
 35427);
UPDATE `creature_template` SET `exp` = 2,`speed_run` = 0,`VehicleId` = 554,`RegenHealth` = 0,`npcflag` = 16777216,`spell1` = 70172,`spell2` = 70174 WHERE entry = 36838;
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (36838, 36839);
INSERT INTO `npc_spellclick_spells`(`npc_entry`,`spell_id`,`quest_start`,`cast_flags`) VALUES
--
--(35427, 46598, 0, 1),
 (36838, 46598, 0, 1),
 (36839, 46598, 0, 1);
DELETE FROM `creature_template_addon` WHERE `entry` IN (36838, 36839);
INSERT INTO `creature_template_addon`(`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
 (36838, 0, 0, 0, 1, 0, 69470),
 (36839, 0, 0, 0, 1, 0, 69470);
UPDATE `creature_template` SET `difficulty_entry_1` = 38129,`difficulty_entry_2` = 38701,`difficulty_entry_3` = 38702 WHERE `entry` =37215;
UPDATE `creature_template` SET `faction_A` = 35,`faction_H` = 35,`minlevel` = 83,`maxlevel` = 83,`unit_flags` = 4,`flags_extra` = 2,`modelid1` = 1126,`modelid2` = 11686 WHERE `entry` IN (37215, 38129, 38701, 38702, 37540, 38128, 38699, 38700);
-- Add spell conditions for 69705 (Below Zero)
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 69705;
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
 (13, 0, 69705, 0, 18, 1, 36838, 0, 0,'','Gunship Battle - Spell 69705 (Below Zero) target creature 36838'),
 (13, 0, 69705, 0, 18, 1, 36839, 0, 0,'','Gunship Battle - Spell 69705 (Below Zero) target creature 36839');
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 71193 AND `spell_effect` = -71188;
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 71195 AND `spell_effect` = -71193;
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 68645 AND `spell_effect` = 69193;
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 73077 AND `spell_effect` IN (68721, 69188);
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 69193 AND `spell_effect` = 69192;
INSERT INTO `spell_linked_spell`(`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
 (71193, -71188, 0, 'Gunship Battle - Veteran removes Experimented'),
 (71195, -71193, 0, 'Gunship Battle - Elite removes Veteran'),
 (73077, 69188, 2, 'Gunship Battle - Fix visual for Rocket Pack'),
 (68645, 69193, 0, 'Gunship Battle - Fix visual for Rocket Pack'),
 (69193, 69192, 0, 'Gunship Battle - Cast Rocket Burst when landing with Rocket Pack');
-- Battle Standards Spells
UPDATE `creature_template` SET `unit_flags` = 33554564,`flags_extra` = 2,`AIName` = 'SmartAI' WHERE `entry` IN (37044, 37041);
UPDATE `creature_template` SET `faction_A` = 1801,`faction_H` = 1801 WHERE `entry` = 37044;
UPDATE `creature_template` SET `faction_A` = 1802,`faction_H` = 1802 WHERE `entry` = 37041;
DELETE FROM `creature_template_addon` WHERE `entry` IN (37044, 37041);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (37044, 37041);
INSERT INTO `smart_scripts`(`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- NPC: Kor'kron Battle Standard, http://old.wowhead.com/npc=37044
 (37044, 0, 0, 0, 25, 0, 100, 1, 0, 0, 0, 0, 11, 69809, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Kor''kron Battle Standard - On spawn & reset - Cast spell 69809'),
-- NPC: Skybreaker Battle Standard, http://old.wowhead.com/npc=37041
 (37041, 0, 0, 0, 25, 0, 100, 1, 0, 0, 0, 0, 11, 69808, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Skybreaker Battle Standard - On spawn & reset - Cast spell 69808');
DELETE FROM `creature_text` WHERE `entry` IN (36948, 36939, 37030, 37033, 37032, 37003, 37026, 36998, 37230, 50004, 50006);
INSERT INTO `creature_text`(`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
 (50004, 1, 0, 'Reavers, Sergeants, attack!.', 14, 0, 0, 0, 0, 17081, ''),
 (50004, 0, 0, 'This is not your battle, dwarf. Back down or we will be forced to destroy your ship.', 14, 0, 0, 0, 0, 17093, ''),
 (50006, 1, 0, 'Marines! Sergeants! Attack!', 14, 0, 0, 0, 0, 16956, ''),
 (50006, 0, 0, 'Move yer jalopy or well blow it out of the sky, orc! The Hordes got no business here!', 14, 0, 0, 0, 0, 16969, ''),
 (36948, 0, 0, 'Fire up the engines! We got a meetin'' with destiny, lads!', 14, 0, 100, 0, 0, 16962, 'Muradin Bronzebeard - SAY_INTRO_ALLIANCE_0'),
 (36948, 1, 0, 'Hold on to yer hats!', 14, 0, 100, 0, 0, 16963, 'Muradin Bronzebeard - SAY_INTRO_ALLIANCE_1'),
 (36948, 2, 0, 'What in the world is that? Grab me spyglass, crewman!', 14, 0, 100, 0, 0, 16964, 'Muradin Bronzebeard - SAY_INTRO_ALLIANCE_2'),
 (36948, 3, 0, 'By me own beard! HORDE SAILIN'' IN FAST ''N HOT!', 14, 0, 100, 0, 0, 16965, 'Muradin Bronzebeard - SAY_INTRO_ALLIANCE_3'),
 (36948, 4, 0, 'EVASIVE ACTION! MAN THE GUNS!', 14, 0, 100, 0, 0, 16966, 'Muradin Bronzebeard - SAY_INTRO_ALLIANCE_4'),
 (36948, 5, 0, 'Cowardly dogs! Ye blindsided us!', 14, 0, 100, 0, 0, 16967, 'Muradin Bronzebeard - SAY_INTRO_ALLIANCE_5'),
 (36948, 6, 0, 'Not me battle? I dunnae who ye? think ye are, mister, but I got a score to settle with Arthas and yer not gettin'' in me way! FIRE ALL GUNS! FIRE! FIRE!', 14, 0, 100, 0, 0, 16968, 'Muradin Bronzebeard - SAY_INTRO_ALLIANCE_7'),
 (36948, 7, 0, 'Move yer jalopy or we''ll blow it out of the sky, orc! The Horde''s got no business here!', 14, 0, 100, 0, 0, 16969, 'Muradin Bronzebeard - SAY_INTRO_HORDE_3'),
 (36948, 8, 0, 'What''s this then?! Ye won''t be takin'' this son o'' Ironforge''s vessel without a fight!.', 14, 0, 100, 0, 0, 16958, 'Muradin Bronzebeard - SAY_BOARDING_SKYBREAKER_1'),
 (36948, 9, 0, 'Marines, Sergeants, attack!', 14, 0, 100, 0, 0, 16956, 'Muradin Bronzebeard - SAY_BOARDING_ORGRIMS_HAMMER_0'),
 (36948, 10, 0, 'Riflemen, shoot faster!', 14, 0, 100, 0, 0, 16954, 'Muradin Bronzebeard - SAY_NEW_RIFLEMEN_SPAWNED'),
 (36948, 11, 0, 'Mortar team, reload!', 14, 0, 100, 0, 0, 16955, 'Muradin Bronzebeard - SAY_NEW_MORTAR_TEAM_SPAWNED'),
 (36948, 12, 0, 'We''re taking hull damage, get a sorcerer out here to shut down those cannons!', 14, 0, 100, 0, 0, 16957, 'Muradin Bronzebeard - SAY_NEW_MAGE_SPAWNED'),
 (36948, 13, 0, 'Don''t say I didn''t warn ya, scoundrels! Onward, brothers and sisters!', 14, 0, 100, 0, 0, 16959, 'Muradin Bronzebeard - SAY_ALLIANCE_VICTORY'),
 (36948, 14, 0, 'Captain Bartlett, get us out of here! We''re taken too much damage to stay afloat!', 14, 0, 100, 0, 0, 16960, 'Muradin Bronzebeard - SAY_ALLIANCE_DEFEAT'),
 (36939, 0, 0, 'Rise up, sons and daughters of the Horde! Today we battle a hated enemy of the Horde! LOK''TAR OGAR!', 14, 0, 100, 0, 0, 17087, 'High Overlord Saurfang - SAY_INTRO_HORDE_0'),
 (36939, 1, 0, 'Kor''kron, take us out!', 14, 0, 100, 0, 0, 17088, 'High Overlord Saurfang - SAY_INTRO_HORDE_1_1'),
 (36939, 2, 0, 'What is that?! Something approaching in the distance!', 14, 0, 100, 0, 0, 17089, 'High Overlord Saurfang - SAY_INTRO_HORDE_1'),
 (36939, 3, 0, 'ALLIANCE GUNSHIP! ALL HANDS ON DECK!', 14, 0, 100, 0, 0, 17090, 'High Overlord Saurfang - SAY_INTRO_HORDE_2'),
 (36939, 4, 0, 'You will know our business soon! KOR''KRON, ANNIHILATE THEM!', 14, 0, 100, 0, 0, 17092, 'High Overlord Saurfang - SAY_INTRO_HORDE_4'),
 (36939, 5, 0, 'Reavers, Sergeants, attack!', 14, 0, 100, 0, 0, 17081, 'High Overlord Saurfang - SAY_BOARDING_SKYBREAKER_0'),
 (36939, 6, 0, 'You DARE board my ship? Your death will come swiftly.', 14, 0, 100, 0, 0, 17083, 'High Overlord Saurfang - SAY_BOARDING_ORGRIMS_HAMMER_1'),
 (36939, 7, 0, 'Axethrowers, hurl faster!', 14, 0, 100, 0, 0, 17079, 'High Overlord Saurfang - SAY_NEW_AXETHROWER_SPAWNED'),
 (36939, 8, 0, 'Rocketeers, reload!', 14, 0, 100, 0, 0, 17080, 'High Overlord Saurfang - SAY_NEW_ROCKETEERS_SPAWNED'),
 (36939, 9, 0, 'We''re taking hull damage, get a battle-mage out here to shut down those cannons!', 14, 0, 100, 0, 0, 17082, 'High Overlord Saurfang - SAY_NEW_BATTLE_MAGE_SPAWNED'),
 (36939, 10, 0, 'The Alliance falter. Onward to the Lich King!', 14, 0, 100, 0, 0, 17084, 'High Overlord Saurfang - SAY_HORDE_VICTORY'),
 (36939, 11, 0, 'Damage control! Put those fires out! You haven''t seen the last of the Horde!', 14, 0, 100, 0, 0, 17085, 'High Overlord Saurfang - SAY_HORDE_DEFEAT'),
 (36939, 12, 0, 'This is not your battle, dwarf. Back down or we will be forced to destroy your ship.', 14, 0, 100, 0, 0, 17093, 'High Overlord Saurfang - SAY_INTRO_ALLIANCE_6'),
 (37030, 0, 0, 'Thank the spirits for you, brothers and sisters. The Skybreaker has already left. Quickly now, to Orgrim''s Hammer! If you leave soon, you may be able to catch them.', 12, 0, 100, 0, 0, 0, 'Kor''kron Primalist - SAY_FIRST_SQUAD_RESCUED_HORDE_0'),
 (37033, 0, 0, 'This should be helpin''ya!', 12, 0, 100, 0, 0, 0, 'Kor''kron Invoker - SAY_FIRST_SQUAD_RESCUED_HORDE_1'),
 (37033, 1, 0, '%s summons a Kor''kron Battle Standard.', 16, 0, 100, 0, 0, 0, 'Kor''kron Invoker - SAY_SUMMON_BATTLE_STANDARD'),
 (37032, 0, 0, 'Aka''Magosh, brave warriors. The alliance is in great number here.', 12, 0, 100, 0, 0, 0, 'Kor''kron Defender - SAY_SECOND_SQUAD_RESCUED_HORDE_0'),
 (37032, 1, 0, 'Captain Saurfang will be pleased to see you aboard Orgrim''s Hammer. Make haste, we will secure the area until you are ready for take-off.', 12, 0, 100, 0, 0, 0, 'Kor''kron Defender - SAY_SECOND_SQUAD_RESCUED_HORDE_1'),
 (37032, 2, 0, 'A screeching cry pierces the air above!', 41, 0, 100, 0, 0, 0, 'Frostwyrm - SAY_FROSTWYRM_SUMMON_0'),
 (37003, 0, 0, 'Thank goodness you arrived when you did, heroes. Orgrim''s Hammer has already left. Quickly now, to The Skybreaker! If you leave soon, you may be able to catch them.', 12, 0, 100, 0, 0, 0, 'Skybreaker Vindicator - SAY_FIRST_SQUAD_RESCUED_ALLIANCE_0'),
 (37026, 0, 0, 'This ought to help!', 12, 0, 100, 0, 0, 0, 'Skybreaker Sorcerer - SAY_FIRST_SQUAD_RESCUED_ALLIANCE_1'),
 (37026, 1, 0, '%s summons a Skybreaker Battle Standard.', 16, 0, 100, 0, 0, 0, 'Skybreaker Sorcerer - SAY_SUMMON_BATTLE_STANDARD'),
 (36998, 0, 0, 'You have my thanks. We were outnumbered until you arrived.', 12, 0, 100, 0, 0, 0, 'Skybreaker Protector - SAY_SECOND_SQUAD_RESCUED_ALLIANCE_0'),
 (36998, 1, 0, 'Captain Muradin is waiting aboard The Skybreaker. We''ll secure the area until you are ready for take off.', 12, 0, 100, 0, 0, 0, 'Skybreaker Protector - SAY_SECOND_SQUAD_RESCUED_ALLIANCE_1'),
 (36998, 2, 0, 'Skybreaker infantry, hold position!', 12, 0, 100, 0, 0, 0, 'Skybreaker Protector - SAY_SECOND_SQUAD_RESCUED_ALLIANCE_2'),
 (36998, 3, 0, 'A screeching cry pierces the air above!', 41, 0, 100, 0, 0, 0, 'Frostwyrm - SAY_FROSTWYRM_SUMMON_0'),
 (37230, 0, 0, 'A Spire Frostwyrm lands just before Orgrim''s Hammer.', 16, 0, 100, 0, 0, 0, 'Frostwyrm - SAY_FROSTWYRM_LAND_H_1'),
 (37230, 1, 0, 'A Spire Frostwyrm lands just before The Skybreaker. ', 16, 0, 100, 0, 0, 0, 'Frostwyrm - SAY_FROSTWYRM_LAND_A_2');
DELETE FROM `gameobject_loot_template` WHERE `entry` IN (201872, 201873, 201874, 201875);
INSERT INTO `gameobject_loot_template` VALUES 
 (201872, 49426, 100, 1, 0, 2, 2),  (201872, 50340, 0, 1, 1, 1, 1),     (201872, 50787, 0, 1, 1, 1, 1),     (201872, 50788, 0, 1, 1, 1, 1),
 (201872, 50789, 0, 1, 2, 1, 1),    (201872, 50790, 0, 1, 2, 1, 1),     (201872, 50791, 0, 1, 1, 1, 1),     (201872, 50792, 0, 1, 2, 1, 1),
 (201872, 50793, 0, 1, 1, 1, 1),    (201872, 50794, 0, 1, 1, 1, 1),     (201872, 50795, 0, 1, 2, 1, 1),     (201872, 50796, 0, 1, 2, 1, 1),
 (201872, 50797, 0, 1, 2, 1, 1),    (201873, 49426, 100, 1, 0, 2, 2),   (201873, 49908, 10, 1, 0, 1, 1),    (201873, 49998, 0, 1, 1, 1, 1),
 (201873, 49999, 0, 1, 2, 1, 1),    (201873, 50000, 0, 1, 2, 1, 1),     (201873, 50001, 0, 1, 3, 1, 1),     (201873, 50002, 0, 1, 2, 1, 1),
 (201873, 50003, 0, 1, 3, 1, 1),    (201873, 50005, 0, 1, 1, 1, 1),     (201873, 50006, 0, 1, 3, 1, 1),     (201873, 50008, 0, 1, 1, 1, 1),
 (201873, 50009, 0, 1, 3, 1, 1),    (201873, 50010, 0, 1, 2, 1, 1),     (201873, 50011, 0, 1, 1, 1, 1),     (201873, 50274, 37.5, 1, 0, 1, 1),
 (201873, 50352, 0, 1, 1, 1, 1),    (201873, 50359, 0, 1, 2, 1, 1),     (201873, 50411, 0, 1, 3, 1, 1),     (201874, 49426, 100, 1, 0, 2, 2),
 (201874, 49908, 10, 1, 0, 1, 1),   (201874, 50345, 0, 1, 2, 1, 1),     (201874, 51906, 0, 1, 1, 1, 1),     (201874, 51907, 0, 1, 1, 1, 1),
 (201874, 51908, 0, 1, 1, 1, 1),    (201874, 51909, 0, 1, 2, 1, 1),     (201874, 51910, 0, 1, 2, 1, 1),     (201874, 51911, 0, 1, 2, 1, 1),
 (201874, 51912, 0, 1, 2, 1, 1),    (201874, 51913, 0, 1, 1, 1, 1),     (201874, 51914, 0, 1, 2, 1, 1),     (201874, 51915, 0, 1, 1, 1, 1),
 (201874, 51916, 0, 1, 1, 1, 1),    (201875, 49426, 100, 1, 0, 2, 2),   (201875, 49908, 10, 1, 0, 1, 1),    (201875, 50274, 75, 1, 0, 1, 1),
 (201875, 50349, 0, 1, 2, 1, 1),    (201875, 50366, 0, 1, 1, 1, 1),     (201875, 50653, 0, 1, 3, 1, 1),     (201875, 50654, 0, 1, 3, 1, 1),
 (201875, 50655, 0, 1, 3, 1, 1),    (201875, 50656, 0, 1, 2, 1, 1),     (201875, 50657, 0, 1, 3, 1, 1),     (201875, 50658, 0, 1, 1, 1, 1),
 (201875, 50659, 0, 1, 2, 1, 1),    (201875, 50660, 0, 1, 1, 1, 1),     (201875, 50661, 0, 1, 1, 1, 1),     (201875, 50663, 0, 1, 2, 1, 1),
 (201875, 50664, 0, 1, 2, 1, 1),    (201875, 50665, 0, 1, 1, 1, 1),     (201875, 50667, 0, 1, 3, 1, 1);
UPDATE `gameobject_template` SET `data1` = 201872 WHERE `entry` IN (201872, 202177);
UPDATE `gameobject_template` SET `data1` = 201873 WHERE `entry` IN (201873, 202178);
UPDATE `gameobject_template` SET `data1` = 201874 WHERE `entry` IN (201874, 202179);
UPDATE `gameobject_template` SET `data1` = 201875 WHERE `entry` IN (201875, 202180);
UPDATE item_template SET ScriptName = 'item_icc_rocket_pack' WHERE entry = 49278;
-- -------------------------------------------------------------------------}
-- NPC: Volatile Ooze, http://old.wowhead.com/npc=37697
-- NPC: Little Ooze, http://old.wowhead.com/npc=36897
-- NPC: Precious, http://old.wowhead.com/npc=37217
-- NPC: Stinky, http://old.wowhead.com/npc=37025
UPDATE `creature_template` SET `mechanic_immune_mask` = 667631615 WHERE `entry` IN (36899, 37562, 37697, 36897, 37217, 37025);
-- -------------------------------------------------------------------------}
-- -------------------- Myth Project "Achievements" Update -----------------
-- -------------------------------------------------------------------------{
-- Achievement: Burning Hot Pole Dance, http://old.wowhead.com/achievement=271
DELETE FROM `spell_dbc` WHERE `Id` IN (29710, 58934);
INSERT INTO `spell_dbc`(`Id`,`Dispel`,`Mechanic`,`Attributes`,`AttributesEx`,`AttributesEx2`,`AttributesEx3`,`AttributesEx4`,`AttributesEx5`,`Stances`,`StancesNot`,`Targets`,`CastingTimeIndex`,`AuraInterruptFlags`,`ProcFlags`,`ProcChance`,`ProcCharges`,`MaxLevel`,`BaseLevel`,`SpellLevel`,`DurationIndex`,`RangeIndex`,`StackAmount`,`EquippedItemClass`,`EquippedItemSubClassMask`,`EquippedItemInventoryTypeMask`,`Effect1`,`Effect2`,`Effect3`,`EffectDieSides1`,`EffectDieSides2`,`EffectDieSides3`,`EffectRealPointsPerLevel1`,`EffectRealPointsPerLevel2`,`EffectRealPointsPerLevel3`,`EffectBasePoints1`,`EffectBasePoints2`,`EffectBasePoints3`,`EffectMechanic1`,`EffectMechanic2`,`EffectMechanic3`,`EffectImplicitTargetA1`,`EffectImplicitTargetA2`,`EffectImplicitTargetA3`,`EffectImplicitTargetB1`,`EffectImplicitTargetB2`,`EffectImplicitTargetB3`,`EffectRadiusIndex1`,`EffectRadiusIndex2`,`EffectRadiusIndex3`,`EffectApplyAuraName1`,`EffectApplyAuraName2`,`EffectApplyAuraName3`,`EffectAmplitude1`,`EffectAmplitude2`,`EffectAmplitude3`,`EffectMultipleValue1`,`EffectMultipleValue2`,`EffectMultipleValue3`,`EffectMiscValue1`,`EffectMiscValue2`,`EffectMiscValue3`,`EffectMiscValueB1`,`EffectMiscValueB2`,`EffectMiscValueB3`,`EffectTriggerSpell1`,`EffectTriggerSpell2`,`EffectTriggerSpell3`,`EffectSpellClassMaskA1`,`EffectSpellClassMaskA2`,`EffectSpellClassMaskA3`,`EffectSpellClassMaskB1`,`EffectSpellClassMaskB2`,`EffectSpellClassMaskB3`,`EffectSpellClassMaskC1`,`EffectSpellClassMaskC2`,`EffectSpellClassMaskC3`,`MaxTargetLevel`,`SpellFamilyName`,`SpellFamilyFlags1`,`SpellFamilyFlags2`,`SpellFamilyFlags3`,`MaxAffectedTargets`,`DmgClass`,`PreventionType`,`DmgMultiplier1`,`DmgMultiplier2`,`DmgMultiplier3`,`AreaGroupId`,`SchoolMask`,`Comment`) VALUES
 (29710, 0, 0, 256, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 101, 0, 0, 0, 0, 0, 1, 0, -1, 0, 0, 140, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 29531, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 'Ribbon Pole - Force Cast Ribbon Pole Channel'), 
 (58934, 0, 0, 536870912, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 101, 0, 0, 0, 0, 0, 1, 0, -1, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Burning Hot Pole Dance credit marker');
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (29531, 45390);
INSERT INTO `spell_linked_spell`(`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
 (29531, 45390, 0, 'Ribbon Pole - Dancer Check Aura'), 
 (45390, 45406, 2, 'Ribbon Pole - Periodic Visual');
DELETE FROM `spell_script_names` WHERE `spell_id` = 45390;
INSERT INTO `spell_script_names`(`spell_id`,`ScriptName`) VALUES
 (45390, 'spell_gen_ribbon_pole_dancer_check');
-- -------------------------------------------------------------------------}
-- ----------------------- Myth Project "Quests" Update --------------------
-- -------------------------------------------------------------------------{
-- Quest: Strengthen the Ancients (Alliance), http://old.wowhead.com/quest=12092
-- Quest: Strengthen the Ancients (Horde), http://old.wowhead.com/quest=12096
-- NPC: Woodlands Walker, http://old.wowhead.com/npc=26421
UPDATE `creature_template` SET `IconName` = '',`npcflag` = 1 WHERE `entry` = 26421;
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = 26421;
DELETE FROM `creature_ai_scripts` WHERE `id` = 264210 AND `creature_id` = 26421;
INSERT INTO `creature_ai_scripts`(`id`,`creature_id`,`event_type`,`event_flags`,`action1_type`,`action1_param1`) VALUES
 (264210, 26421, 11, 1, 2, 35);
-- Quest: Garments of the Light, http://old.wowhead.com/quest=5624
-- NPC: Guard Roberts, http://old.wowhead.com/npc=12423
UPDATE `creature_template` SET `unit_flags` = 4104 WHERE `entry` = 12423;
-- Quest: An Innocent Disguise, http://old.wowhead.com/quest=11891
-- NPC: Ice Caller Briatha, http://old.wowhead.com/npc=25949
-- NPC: Heretic Emissary, http://old.wowhead.com/npc=25951
SET @Briatha := 25949;
SET @Emissary := 25951;
SET @QuestEventCredit := 46375;
UPDATE `creature_template` SET `AIName` =  'SmartAI' WHERE `entry` = @Briatha;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = @Briatha;
INSERT INTO `smart_scripts`(`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@Briatha, 0, 0, 0, 60, 0, 100, 0, 0, 60000, 60000, 80001, 1, 0, 4000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Briatha - On event update /60 secs/ - Say text 0 /to trigger spy event dialogue/'), 
(@Briatha, 0, 1, 0, 52, 0, 100, 0, 0, @Briatha, 0, 0, 1, 0, 4000, 0, 0, 0, 0, 9, @Emissary, 0, 15, 0, 0, 0, 0, 'Emissary - On creature text end /Briatha 0/ - Say text 0'), 
(@Briatha, 0, 2, 0, 52, 0, 100, 0, 0, @Emissary, 0, 0, 1, 1, 4000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Briatha - On creature text end /Emissary 0/ - Say text 1'), 
(@Briatha, 0, 3, 0, 52, 0, 100, 0, 1, @Briatha, 0, 0, 1, 1, 4000, 0, 0, 0, 0, 9, @Emissary, 0, 15, 0, 0, 0, 0, 'Emissary - On creature text end /Briatha 1/ - Say text 1'), 
(@Briatha, 0, 4, 0, 52, 0, 100, 0, 1, @Emissary, 0, 0, 1, 2, 3500, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Briatha - On creature text end /Emisary 1/ - Say text 2'), 
(@Briatha, 0, 5, 0, 52, 0, 100, 0, 2, @Briatha, 0, 0, 11, @QuestEventCredit, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Briatha - On creature text end /Briatha 2/ - Cast spell quest credit on self');
DELETE FROM `creature_text` WHERE `entry` = @Briatha;
INSERT INTO `creature_text`(`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@Briatha, 0, 0, 'These stones should be the last of them. Our coordination with Neptulon''s forces will be impeccable.', 12, 0, 100, 1, 1000, 0, 'Briatha - Spy event'), 
(@Briatha, 1, 0, 'And your own preparations? Will the Frost Lord have a path to the portal?', 12, 0, 100, 1, 1000, 0, 'Briatha - Spy event'), 
(@Briatha, 2, 0, 'The ritual in coilfang will bring Ahune through once he is fully prepared, and the resulting clash between Firelord and Frostlord will rend the foundations of this world. Our ultimate goals are in reach at last...', 12, 0, 100, 1, 3500, 0, 'Briatha - Spy event');
DELETE FROM `creature_text` WHERE `entry` = @Emissary;
INSERT INTO `creature_text`(`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@Emissary, 0, 0, 'Yess. The Tidehunter will be pleased at this development. The Firelord''s hold will weaken.', 12, 0, 100, 1, 1000, 0, 'Heretic Emissary - Spy event'), 
(@Emissary, 1, 0, 'Skar''this has informed us well. We have worked our way into the slave pens and await your cryomancerss.', 12, 0, 100, 1, 1000, 0, 'Heretic Emissary - Spy event');
-- -------------------------------------------------------------------------}
-- ---------------------- Myth Project "NPCs" Update -----------------------
-- -------------------------------------------------------------------------{
-- NPC: Drakkari Guardian, http://old.wowhead.com/npc=26620
UPDATE `creature_template` SET `unit_flags` = 0,`dynamicflags` = 8,`type_flags` = 128 WHERE `entry` = 26620;
-- -------------------------------------------------------------------------}
-- ----------------------- Myth Project "GO" Update ------------------------
-- -------------------------------------------------------------------------{
-- -------------------------------------------------------------------------}
-- --------------------- Myth Project "Events" Update ----------------------
-- -------------------------------------------------------------------------{
-- -------------------------------------------------------------------------}
-- --------------------- Myth Project "Spells" Update ----------------------
-- -------------------------------------------------------------------------{
-- -------------------------------------------------------------------------}
-- --------------------- Myth Project "Items" Update -----------------------
-- -------------------------------------------------------------------------{
-- Item: Black Bruise, http://old.wowhead.com/item=50035
-- Item: Black Bruise (Heroic), http://old.wowhead.com/item=50692
-- UNKNOWN SPELL: Necrotic Touch, http://old.wowhead.com/spell=71875
-- UNKNOWN SPELL: Necrotic Touch, http://old.wowhead.com/spell=71877
DELETE FROM `spell_bonus_data` WHERE `entry` IN (71875, 71877);
INSERT INTO `spell_bonus_data` VALUES
 (71875, -1, 0, -1, -1,''),
 (71877, -1, 0, -1, -1,'');
-- Item: Rocket Boots Xtreme, http://old.wowhead.com/item=23824
-- Item: Rocket Boots Xtreme Lite, http://old.wowhead.com/item=35581
-- UNKNOWN SPELL: Rocket Boots Engaged, http://old.wowhead.com/spell=51582
DELETE FROM `spell_script_names` WHERE `spell_id` IN (51582);
INSERT INTO `spell_script_names`(`spell_id`,`ScriptName`) VALUES 
 (51582,'spell_item_rocket_boots');
-- -------------------------------------------------------------------------}
-- --------------- Myth Project "World" Database Cleaner -------------------
-- -------------------------------------------------------------------------{
 DROP TABLE IF EXISTS
 `db_version_ytdb`,         -- DEPRICATED TABLE
 `npc_gossip`,              -- DEPRICATED TABLE
 `game_event_npc_gossip`,   -- DEPRICATED TABLE
 `lfg_dungeon_encounters`,  -- DEPRICATED TABLE
 `gameobject_respawn`,      -- DEPRICATED TABLE
 `creature_respawn`,        -- DEPRICATED TABLE
 `reserved_name`,           -- DEPRICATED TABLE
 `custom_texts`,            -- DEPRICATED TABLE
 `id`,                      -- DEPRICATED TABLE
 `locales_item_set_name`;   -- DEPRICATED TABLE
/* -- -------------------------------------------------------------------------
SET @MINUS := xxx; SET @MAXG := xxx;
-- CREATURES
UPDATE `creature` SET `guid` = `guid` - @MINUS WHERE `guid` > @MAXG;
UPDATE `creature_addon` SET `guid` = `guid` - @MINUS WHERE `guid` > @MAXG;
UPDATE `creature_formations` SET `leaderGUID` = `leaderGUID` - @MINUS WHERE `leaderGUID` > @MAXG;
UPDATE `creature_formations` SET `memberGUID` = `memberGUID` - @MINUS WHERE `memberGUID` > @MAXG;
-- GAMEOBJECTS
UPDATE `gameobject` SET `guid` = `guid` - @MINUS WHERE `guid` > @MAXG;
UPDATE `pool_gameobject` SET `guid` = `guid` - @MINUS WHERE `guid` > @MAXG; */
-- -------------------------------------------------------------------------
-- CREATURES
 DELETE FROM `creature` WHERE `id` NOT IN (SELECT `entry` FROM `creature_template`);                            -- Dinamic // "creature" table
 DELETE FROM `creature_template_addon` WHERE `entry` NOT IN (SELECT `entry` FROM `creature_template`);          -- Dinamic // "creature_template_addon" table
 DELETE FROM `creature_formations` WHERE `leaderGUID` NOT IN (SELECT `guid` FROM `creature`)
OR `memberGUID` NOT IN (SELECT `guid` FROM `creature`);                                                         -- Dinamic // "creature_formations" table
 DELETE FROM `creature_onkill_reputation` WHERE `creature_id` NOT IN (SELECT `entry` FROM `creature_template`); -- Dinamic // "creature_onkill_reputation" table
 DELETE FROM `linked_respawn` WHERE `linkedguid` NOT IN (SELECT `guid` FROM `creature`);                        -- Dinamic // "linked_respawn" table
 DELETE FROM `creature_addon` WHERE `guid` NOT IN (SELECT `guid` FROM `creature`);                              -- Dinamic // "creature_addon" table
 DELETE FROM `battlemaster_entry` WHERE `entry` NOT IN (SELECT `entry` FROM `creature_template`);               -- Dinamic // "battlemaster_entry" table
-- -------------------------------------------------------------------------
-- GAMEOBJECTS
 DELETE FROM `gameobject` WHERE `id` NOT IN (SELECT `entry` FROM `gameobject_template`);                        -- Dinamic // "gameobject" table
 DELETE FROM `gameobject_scripts` WHERE `id` NOT IN (SELECT `guid` FROM `gameobject`);                          -- Dinamic // "gameobject_scripts" table
 DELETE FROM `gameobject_involvedrelation` WHERE `id` NOT IN (SELECT `entry` FROM `gameobject_template`);       -- Dinamic // "gameobject_involvedrelation" table
 DELETE FROM `gameobject_loot_template` WHERE `entry` NOT IN (SELECT `entry` FROM `gameobject_template`);       -- Dinamic // "gameobject_loot_template" table
 DELETE FROM `gameobject_questrelation` WHERE `id` NOT IN (SELECT `entry` FROM `gameobject_template`);          -- Dinamic // "gameobject_questrelation" table
-- -------------------------------------------------------------------------
-- EVENT AI
 DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (
SELECT `entry` FROM `creature_template` WHERE `AIName` NOT IN ("EventAI"));                                     -- Dinamic // "creature_ai_scripts" table
-- -------------------------------------------------------------------------
-- POOLS
 DELETE FROM `pool_creature` WHERE `guid` NOT IN (SELECT `guid` FROM `creature`);                               -- Dinamic // "creature_pool" table
 DELETE FROM `pool_gameobject` WHERE `guid` NOT IN (SELECT `guid` FROM `gameobject`);                           -- Dinamic // "gameobject_pool" table