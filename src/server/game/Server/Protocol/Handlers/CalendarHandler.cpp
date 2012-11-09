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

#include "Common.h"
#include "WorldPacket.h"
#include "WorldSession.h"

#include "InstanceSaveMgr.h"
#include "Log.h"
#include "Opcodes.h"
#include "Player.h"

void WorldSession::HandleCalendarGetCalendar(WorldPacket & /*recv_data*/)
{
    sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: CMSG_CALENDAR_GET_CALENDAR");     // empty

    time_t cur_time = time(NULL);

    WorldPacket data(SMSG_CALENDAR_SEND_CALENDAR, 4+4*0+4+4*0+4+4);

    data << uint32(0);                                      // invite count
    data << uint32(0);                                      // event count
    data << uint32(0);                                      // unk
    data << uint32(secsToTimeBitFields(cur_time));          // current time

    uint32 counter = 0;
    size_t p_counter = data.wpos();
    data << uint32(counter);                                // instance save count

    for(int i = 0; i < MAX_DIFFICULTY; ++i)
    {
        for(Player::BoundInstancesMap::const_iterator itr = _player->m_boundInstances[i].begin(); itr != _player->m_boundInstances[i].end(); ++itr)
        {
            if(itr->second.perm)
            {
                InstanceSave *save = itr->second.save;
                data << uint32(save->GetMapId());
                data << uint32(save->GetDifficulty());
                data << uint32(save->GetResetTime() - cur_time);
                data << uint64(save->GetInstanceId());      // instance save id as unique instance copy id
                ++counter;
            }
        }
    }

    data.put<uint32>(p_counter, counter);

    data << uint32(1135753200);                             // unk (28.12.2005 12:00)

    counter = 0;
    p_counter = data.wpos();
    data << uint32(counter);                                // raid reset count

    ResetTimeByMapDifficultyMap const& resets = sInstanceSaveMgr->GetResetTimeMap();
    for(ResetTimeByMapDifficultyMap::const_iterator itr = resets.begin(); itr != resets.end(); ++itr)
    {
        uint32 mapid = PAIR32_LOPART(itr->first);
        MapEntry const* mapEnt = sMapStore.LookupEntry(mapid);
        if(!mapEnt || !mapEnt->IsRaid())
            continue;

        data << uint32(mapid);
        data << uint32(itr->second - cur_time);
        data << uint32(mapEnt->unk_time);
        ++counter;
    }

    data.put<uint32>(p_counter, counter);

    data << uint32(0);                                      // holiday count?

    sLog->outDebug(LOG_FILTER_NETWORKIO, "Sending calendar");
    data.hexlike();
    SendPacket(&data);
}

void WorldSession::HandleCalendarGetEvent(WorldPacket &recv_data)
{
    sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: CMSG_CALENDAR_GET_EVENT");
    recv_data.hexlike();
    recv_data.read_skip<uint64>();                          // unk
}

void WorldSession::HandleCalendarGuildFilter(WorldPacket &recv_data)
{
    sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: CMSG_CALENDAR_GUILD_FILTER");
    recv_data.hexlike();
    recv_data.read_skip<uint32>();                          // unk1
    recv_data.read_skip<uint32>();                          // unk2
    recv_data.read_skip<uint32>();                          // unk3
}

void WorldSession::HandleCalendarArenaTeam(WorldPacket &recv_data)
{
    sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: CMSG_CALENDAR_ARENA_TEAM");
    recv_data.hexlike();
    recv_data.read_skip<uint32>();                          // unk
}

void WorldSession::HandleCalendarAddEvent(WorldPacket &recv_data)
{
    sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: CMSG_CALENDAR_ADD_EVENT");
    recv_data.hexlike();
    recv_data.rpos(recv_data.wpos());                       // set to end to avoid warnings spam
}

void WorldSession::HandleCalendarUpdateEvent(WorldPacket &recv_data)
{
    sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: CMSG_CALENDAR_UPDATE_EVENT");
    recv_data.hexlike();
    recv_data.rpos(recv_data.wpos());                       // set to end to avoid warnings spam
}

void WorldSession::HandleCalendarRemoveEvent(WorldPacket &recv_data)
{
    sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: CMSG_CALENDAR_REMOVE_EVENT");
    recv_data.hexlike();
    recv_data.rpos(recv_data.wpos());                       // set to end to avoid warnings spam
}

void WorldSession::HandleCalendarCopyEvent(WorldPacket &recv_data)
{
    sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: CMSG_CALENDAR_COPY_EVENT");
    recv_data.hexlike();
    recv_data.rpos(recv_data.wpos());                       // set to end to avoid warnings spam
}

void WorldSession::HandleCalendarEventInvite(WorldPacket &recv_data)
{
    sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: CMSG_CALENDAR_EVENT_INVITE");
    recv_data.hexlike();
    recv_data.rpos(recv_data.wpos());                       // set to end to avoid warnings spam
}

void WorldSession::HandleCalendarEventRsvp(WorldPacket &recv_data)
{
    sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: CMSG_CALENDAR_EVENT_RSVP");
    recv_data.hexlike();
    recv_data.rpos(recv_data.wpos());                       // set to end to avoid warnings spam
}

void WorldSession::HandleCalendarEventRemoveInvite(WorldPacket &recv_data)
{
    sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: CMSG_CALENDAR_EVENT_REMOVE_INVITE");
    recv_data.hexlike();
    recv_data.rpos(recv_data.wpos());                       // set to end to avoid warnings spam
}

void WorldSession::HandleCalendarEventStatus(WorldPacket &recv_data)
{
    sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: CMSG_CALENDAR_EVENT_STATUS");
    recv_data.hexlike();
    recv_data.rpos(recv_data.wpos());                       // set to end to avoid warnings spam
}

void WorldSession::HandleCalendarEventModeratorStatus(WorldPacket &recv_data)
{
    sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: CMSG_CALENDAR_EVENT_MODERATOR_STATUS");
    recv_data.hexlike();
    recv_data.rpos(recv_data.wpos());                       // set to end to avoid warnings spam
}

void WorldSession::HandleCalendarComplain(WorldPacket &recv_data)
{
    sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: CMSG_CALENDAR_COMPLAIN");
    recv_data.hexlike();
    recv_data.rpos(recv_data.wpos());                       // set to end to avoid warnings spam
}

void WorldSession::HandleCalendarGetNumPending(WorldPacket & /*recv_data*/)
{
    sLog->outDebug(LOG_FILTER_NETWORKIO, "WORLD: CMSG_CALENDAR_GET_NUM_PENDING");  // empty

    WorldPacket data(SMSG_CALENDAR_SEND_NUM_PENDING, 4);
    data << uint32(0);                                      // 0 - no pending invites, 1 - some pending invites
    SendPacket(&data);
}
