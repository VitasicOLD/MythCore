-- Исправление пушек!
UPDATE `creature_template` SET `exp` = 2, `VehicleId` = 554, `RegenHealth` = 0, `npcflag` = 16777216, `spell1` = 69399, `spell2` = 69401 WHERE entry = 36839;
UPDATE `creature_template` SET `exp` = 2, `VehicleId` = 554, `RegenHealth` = 0, `npcflag` = 16777216, `spell1` = 70172, `spell2` = 70174 WHERE entry = 36838;
REPLACE INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `quest_start`, `cast_flags`) VALUES
('36838', '46598', '0', '1'),
('36839', '46598', '0', '1');