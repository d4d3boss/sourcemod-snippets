/**
 * vim: set ts=4 :
 * =============================================================================
 * Wheel of Doom Dance Detector
 * Detect when the Wheel of Doom causes players to dance.
 *
 * Wheel of Doom Dance Detector (C)2014 Powerlord (Ross Bemrose).
 * All rights reserved.
 * =============================================================================
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License, version 3.0, as published by the
 * Free Software Foundation.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * As a special exception, AlliedModders LLC gives you permission to link the
 * code of this program (as well as its derivative works) to "Half-Life 2," the
 * "Source Engine," the "SourcePawn JIT," and any Game MODs that run on software
 * by the Valve Corporation.  You must obey the GNU General Public License in
 * all respects for all other code used.  Additionally, AlliedModders LLC grants
 * this exception to all derivative works.  AlliedModders LLC defines further
 * exceptions, found in LICENSE.txt (as of this writing, version JULY-31-2007),
 * or <http://www.sourcemod.net/license.php>.
 *
 * Version: $Id$
 */
#include <sourcemod>
#include <tf2>
#pragma semicolon 1

#define VERSION "1.0.0"

new Handle:g_Cvar_Enabled;

new bool:g_bDancing = false;

public Plugin:myinfo = {
	name			= "Wheel of Doom Dance Detector",
	author			= "Powerlord",
	description		= "Detect when the Wheel of Doom causes players to dance.",
	version			= VERSION,
	url				= ""
};
  
public OnPluginStart()
{
	CreateConVar("wod_dancedetector_version", VERSION, "Wheel of Doom Dance Detector version", FCVAR_PLUGIN|FCVAR_NOTIFY|FCVAR_DONTRECORD|FCVAR_SPONLY);
	g_Cvar_Enabled = CreateConVar("wod_dancedetector_enable", "1", "Enable ?", FCVAR_PLUGIN|FCVAR_NOTIFY|FCVAR_DONTRECORD, true, 0.0, true, 1.0);
	
}

public OnMapStart()
{
	g_bDancing = false;
}

public TF2_OnConditionAdded(client, TFCond:condition)
{
	if (!g_bDancing && condition == TFCond_HalloweenThriller)
	{
		g_bDancing = true;
		// Put code here to run when dancing starts.
	}
}

public TF2_OnConditionRemoved(client, TFCond:condition)
{
	if (g_bDancing && condition == TFCond_HalloweenThriller)
	{
		g_bDancing = false;
		// Put code here to run when dancing stops.
	}
}
