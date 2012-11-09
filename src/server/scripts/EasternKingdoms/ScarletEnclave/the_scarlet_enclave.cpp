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

#define SPELL_REVIVE 51918
#define VALK_WHISPER "It is not yet your time, champion. Rise! Rise and fight once more!"

class npc_valkyr_battle_maiden : public CreatureScript
{
public:
    npc_valkyr_battle_maiden() : CreatureScript("npc_valkyr_battle_maiden") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new npc_valkyr_battle_maidenAI(pCreature);
    }

    struct npc_valkyr_battle_maidenAI : public PassiveAI
    {
        npc_valkyr_battle_maidenAI(Creature* c) : PassiveAI(c) { }

        uint32 FlyBackTimer;
        float x, y, z;
        uint32 phase;

        void Reset()
        {
            me->setActive(true);
            me->SetVisible(false);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            me->SetFlying(true);
            FlyBackTimer = 500;
            phase = 0;

            me->GetPosition(x, y, z);
            z += 4; x -= 3.5; y -= 5;
            me->GetMotionMaster()->Clear(false);
            me->GetMap()->CreatureRelocation(me, x, y, z, 0.0f);
        }

        void UpdateAI(const uint32 diff)
        {
            if(FlyBackTimer <= diff)
            {
                Player* player = NULL;
                if(me->isSummon())
                    if(Unit* summoner = me->ToTempSummon()->GetSummoner())
                        if(summoner->GetTypeId() == TYPEID_PLAYER)
                            player = CAST_PLR(summoner);

                if(!player)
                    phase = 3;

                switch(phase)
                {
                    case 0:
                        me->RemoveUnitMovementFlag(MOVEMENTFLAG_WALKING);
                        me->HandleEmoteCommand(EMOTE_STATE_FLYGRABCLOSED);
                        FlyBackTimer = 500;
                        break;
                    case 1:
                        player->GetClosePoint(x, y, z, me->GetObjectSize());
                        z += 2.5; x -= 2; y -= 1.5;
                        me->GetMotionMaster()->MovePoint(0, x, y, z);
                        me->SetTarget(player->GetGUID());
                        me->SetVisible(true);
                        FlyBackTimer = 4500;
                        break;
                    case 2:
                        if(!player->isRessurectRequested())
                        {
                            me->HandleEmoteCommand(EMOTE_ONESHOT_CUSTOMSPELL01);
                            DoCast(player, SPELL_REVIVE, true);
                            me->MonsterWhisper(VALK_WHISPER, player->GetGUID());
                        }
                        FlyBackTimer = 5000;
                        break;
                    case 3:
                        me->SetVisible(false);
                        FlyBackTimer = 3000;
                        break;
                    case 4:
                        me->DisappearAndDie();
                        break;
                    default:
                        //Nothing To DO
                        break;
                }
                ++phase;
            } else FlyBackTimer-=diff;
        }
    };
};

void AddSC_the_scarlet_enclave()
{
    new npc_valkyr_battle_maiden;
}
