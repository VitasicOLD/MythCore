/*
 * Copyright (C) 2008 - 2011 Trinity <http://www.trinitycore.org/>
 *
 * Copyright (C) 2010 - 2012 Myth Project <http://mythprojectnetwork.blogspot.com/>
 *
 * Myth Project's source is based on the Trinity Project source, you can find the
 * link to that easily in Trinity Copyrights. Myth Project is a private community.
 * To get access, you either have to donate or pass a developer test.
 * You may not share Myth Project's sources! For personal use only.
 */

#include "ScriptLoader.h"

// spells
void AddSC_deathknight_spell_scripts();
void AddSC_druid_spell_scripts();
void AddSC_generic_spell_scripts();
void AddSC_hunter_spell_scripts();
void AddSC_mage_spell_scripts();
void AddSC_paladin_spell_scripts();
void AddSC_priest_spell_scripts();
void AddSC_rogue_spell_scripts();
void AddSC_shaman_spell_scripts();
void AddSC_warlock_spell_scripts();
void AddSC_warrior_spell_scripts();
void AddSC_quest_spell_scripts();
void AddSC_item_spell_scripts();

void AddSC_SmartSCripts();

//Commands
void AddSC_account_commandscript();
void AddSC_achievement_commandscript();
void AddSC_debug_commandscript();
void AddSC_event_commandscript();
void AddSC_gm_commandscript();
void AddSC_go_commandscript();
void AddSC_gobject_commandscript();
void AddSC_honor_commandscript();
void AddSC_learn_commandscript();
void AddSC_modify_commandscript();
void AddSC_npc_commandscript();
void AddSC_quest_commandscript();
void AddSC_reload_commandscript();
void AddSC_tele_commandscript();
void AddSC_titles_commandscript();
void AddSC_wp_commandscript();
void AddSC_gps_commandscript();
// custom
void AddSC_DuelReset();
//TeleNPC2
void AddSC_npc_teleport();

#ifdef SCRIPTS
//world
void AddSC_areatrigger_scripts();
void AddSC_emerald_dragons();
void AddSC_generic_creature();
void AddSC_go_scripts();
void AddSC_guards();
void AddSC_item_scripts();
void AddSC_npc_professions();
void AddSC_npc_innkeeper();
void AddSC_npcs_special();
void AddSC_npc_taxi();
void AddSC_achievement_scripts();
void AddSC_brewfest_event();
void AddSC_pilgrims_event();

// outdoor pvp
void AddSC_outdoorpvp_ep();
void AddSC_outdoorpvp_hp();
void AddSC_outdoorpvp_na();
void AddSC_outdoorpvp_si();
void AddSC_outdoorpvp_tf();
void AddSC_outdoorpvp_zm();
void AddSC_outdoorpvp_wg();
void AddSC_wintergrasp();

// player
void AddSC_chat_log();

#endif

void AddScripts()
{
    AddSpellScripts();
    AddSC_SmartSCripts();
    AddCommandScripts();
#ifdef SCRIPTS
    AddWorldScripts();
    AddOutdoorPvPScripts();
#endif
}

void AddSpellScripts()
{
    AddSC_deathknight_spell_scripts();
    AddSC_druid_spell_scripts();
    AddSC_generic_spell_scripts();
    AddSC_hunter_spell_scripts();
    AddSC_mage_spell_scripts();
    AddSC_paladin_spell_scripts();
    AddSC_priest_spell_scripts();
    AddSC_rogue_spell_scripts();
    AddSC_shaman_spell_scripts();
    AddSC_warlock_spell_scripts();
    AddSC_warrior_spell_scripts();
    AddSC_quest_spell_scripts();
    AddSC_item_spell_scripts();
}

void AddCommandScripts()
{
    AddSC_account_commandscript();
    AddSC_achievement_commandscript();
    AddSC_debug_commandscript();
    AddSC_event_commandscript();
    AddSC_gm_commandscript();
    AddSC_go_commandscript();
    AddSC_gobject_commandscript();
    AddSC_honor_commandscript();
    AddSC_learn_commandscript();
    AddSC_modify_commandscript();
    AddSC_npc_commandscript();
    AddSC_quest_commandscript();
    AddSC_reload_commandscript();
    AddSC_tele_commandscript();
    AddSC_titles_commandscript();
    AddSC_wp_commandscript();
    AddSC_gps_commandscript();
    // custom
    AddSC_DuelReset();
    //TeleNPC2
    AddSC_npc_teleport();
}

void AddWorldScripts()
{
#ifdef SCRIPTS
    AddSC_areatrigger_scripts();
    AddSC_emerald_dragons();
    AddSC_generic_creature();
    AddSC_go_scripts();
    AddSC_guards();
    AddSC_item_scripts();
    AddSC_npc_professions();
    AddSC_npc_innkeeper();
    AddSC_npcs_special();
    AddSC_npc_taxi();
    AddSC_achievement_scripts();
    AddSC_chat_log();
    AddSC_brewfest_event();
    AddSC_pilgrims_event();
#endif
}

void AddOutdoorPvPScripts()
{
#ifdef SCRIPTS
    AddSC_outdoorpvp_ep();
    AddSC_outdoorpvp_hp();
    AddSC_outdoorpvp_na();
    AddSC_outdoorpvp_si();
    AddSC_outdoorpvp_tf();
    AddSC_outdoorpvp_zm();
    AddSC_outdoorpvp_wg();
#endif
}
