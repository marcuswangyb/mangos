ALTER TABLE db_version CHANGE COLUMN required_10786_02_mangos_spell_proc_event required_10788_01_mangos_creature_addon bit;

ALTER TABLE creature_addon
  ADD COLUMN b2_0_sheath tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER bytes1,
  ADD COLUMN b2_1_pvp_state tinyint(3) unsigned NOT NULL DEFAULT '0' AFTER b2_0_sheath;

UPDATE creature_addon SET b2_0_sheath = bytes2 & 0x000000FF;
UPDATE creature_addon SET b2_1_pvp_state = (bytes2 & 0x0000FF00) >> 8;

ALTER TABLE creature_addon
  DROP COLUMN bytes2;
