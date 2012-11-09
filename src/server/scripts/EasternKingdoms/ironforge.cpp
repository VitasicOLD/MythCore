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

#include "ScriptPCH.h"

#define GOSSIP_ITEM_ROYAL   "I am ready to listen"
#define GOSSIP_ITEM_ROYAL_1 "That is tragic. How did this happen?"
#define GOSSIP_ITEM_ROYAL_2 "Interesting, continue please."
#define GOSSIP_ITEM_ROYAL_3 "Unbelievable! How dare they??"
#define GOSSIP_ITEM_ROYAL_4 "Of course I will help!"

class npc_royal_historian_archesonus : public CreatureScript
{
public:
    npc_royal_historian_archesonus() : CreatureScript("npc_royal_historian_archesonus") { }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*uiSender*/, uint32 uiAction)
    {
        player->PlayerTalkClass->ClearMenus();
        switch(uiAction)
        {
            case GOSSIP_ACTION_INFO_DEF:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_ROYAL_1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
                player->SEND_GOSSIP_MENU(2236, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+1:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_ROYAL_2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
                player->SEND_GOSSIP_MENU(2237, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+2:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_ROYAL_3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
                player->SEND_GOSSIP_MENU(2238, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+3:
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_ROYAL_4, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
                player->SEND_GOSSIP_MENU(2239, creature->GetGUID());
                break;
            case GOSSIP_ACTION_INFO_DEF+4:
                player->CLOSE_GOSSIP_MENU();
                player->AreaExploredOrEventHappens(3702);
                break;
        }
        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if(creature->isQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if(player->GetQuestStatus(3702) == QUEST_STATUS_INCOMPLETE)
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_ROYAL, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
            player->SEND_GOSSIP_MENU(2235, creature->GetGUID());
        }
        else
            player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());

        return true;
    }
};

class npc_captain_tread_sparknozzle : public CreatureScript
{
public:
    npc_captain_tread_sparknozzle() : CreatureScript("npc_captain_tread_sparknozzle") { }

    struct npc_captain_tread_sparknozzleAI : public ScriptedAI
    {
        npc_captain_tread_sparknozzleAI(Creature* pCreature) : ScriptedAI(pCreature) { }

        void MoveInLineOfSight(Unit* who)
        {
            ScriptedAI::MoveInLineOfSight(who);

            if(who->GetTypeId() == TYPEID_PLAYER)
            {
                if(((Player*)who)->GetQuestStatus(25229) == QUEST_STATUS_INCOMPLETE)
                {
                    std::list<Creature*> GnomeList;
                    me->GetCreatureListWithEntryInGrid(GnomeList, 39623, 7.5f);
                    if(!GnomeList.empty())
                    {
                        for(std::list<Creature*>::const_iterator itr = GnomeList.begin(); itr != GnomeList.end(); ++itr)
                        {
                            if(Creature* pCreature = *itr)
                            {
                                pCreature->ForcedDespawn();
                                ((Player*)who)->KilledMonsterCredit(39466,0);
                            }
                        }
                    }
                }
            }
        }
    };

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_captain_tread_sparknozzleAI(pCreature);
    }
};

#define GOSSIP_ITEM_START   "I am ready"

class npc_drill_sergeant_steamcrank : public CreatureScript
{
public:
    npc_drill_sergeant_steamcrank() : CreatureScript("npc_drill_sergeant_steamcrank") { }

    struct npc_drill_sergeant_steamcrankAI : public ScriptedAI
    {
        npc_drill_sergeant_steamcrankAI(Creature* pCreature) : ScriptedAI(pCreature) { }

        uint32 start_event;
        uint32 step_event;
        uint32 event_timer;
        std::list<Creature*> NpcList;

        void Reset()
        {
            start_event=true;
            step_event = 0;
        }

        void ReceiveEmote(Player* player, uint32 emote)
        {
            me->GetCreatureListWithEntryInGrid(NpcList, 39349, 7.5f);
            switch(emote)
            {
                case TEXT_EMOTE_SALUTE:
                    if(step_event == 1)
                    {
                        player->KilledMonsterCredit(39355, 0);
                        if(!NpcList.empty())
                        {
                            for(std::list<Creature*>::const_iterator itr = NpcList.begin(); itr != NpcList.end(); ++itr)
                                if(Creature* pCreature = *itr)
                                    pCreature->HandleEmoteCommand(EMOTE_ONESHOT_ROAR);
                            step_event = 2;
                        }
                    break;
                case TEXT_EMOTE_ROAR:
                    if(step_event == 2)
                    {
                        player->KilledMonsterCredit(39356, 0);
                        if(!NpcList.empty())
                        for(std::list<Creature*>::const_iterator itr = NpcList.begin(); itr != NpcList.end(); ++itr)
                            if(Creature* pCreature = *itr)
                                pCreature->HandleEmoteCommand(EMOTE_ONESHOT_CHEER);
                        step_event = 3;
                    }
                    break;
                case TEXT_EMOTE_CHEER:
                    if(step_event == 3)
                    {
                        player->KilledMonsterCredit(39362, 0);
                        if(!NpcList.empty())
                        {
                            for(std::list<Creature*>::const_iterator itr = NpcList.begin(); itr != NpcList.end(); ++itr)
                                if(Creature* pCreature = *itr)
                                    pCreature->HandleEmoteCommand(EMOTE_ONESHOT_CHEER);
                        }
                        step_event = 4;
                    }
                    break;
                case TEXT_EMOTE_DANCE:
                    if(step_event == 4)
                        player->KilledMonsterCredit(39361, 0);
                    break;
                }
            }
        }

        bool OnGossipHello(Player* player, Creature* pCreature)
        {
            if(player->GetQuestStatus(25199) == QUEST_STATUS_INCOMPLETE && CAST_AI(npc_drill_sergeant_steamcrank::npc_drill_sergeant_steamcrankAI, pCreature->AI())->step_event<2)
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_ITEM_START, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF+1);
            player->SEND_GOSSIP_MENU(10600, pCreature->GetGUID());
            return true;
        }

        bool OnGossipSelect(Player* player, Creature* pCreature, uint32 /*uiSender*/, uint32 uiAction)
        {
            if(uiAction==GOSSIP_ACTION_INFO_DEF+1)
            {
                CAST_AI(npc_drill_sergeant_steamcrank::npc_drill_sergeant_steamcrankAI, pCreature->AI())->step_event=1;
                std::list<Creature*> NpcList;
                pCreature->GetCreatureListWithEntryInGrid(NpcList, 39349, 7.5f);
                player->CLOSE_GOSSIP_MENU();
                if(!NpcList.empty())
                {
                    for(std::list<Creature*>::const_iterator itr = NpcList.begin(); itr != NpcList.end(); ++itr)
                        if(Creature* pNpc = *itr)
                            pNpc->HandleEmoteCommand(EMOTE_ONESHOT_SALUTE);
                }
            }
            return true;
        }
    };

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_drill_sergeant_steamcrankAI(pCreature);
    }
};

void AddSC_ironforge()
{
    new npc_captain_tread_sparknozzle;
    new npc_royal_historian_archesonus;
    new npc_drill_sergeant_steamcrank;
}