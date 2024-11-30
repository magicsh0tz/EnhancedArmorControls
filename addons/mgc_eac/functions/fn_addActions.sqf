/*
 * Author: magicsh0tz
 * Adds user actions.
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call mgc_eac_fnc_addActions
 */

#include "script_component.hpp"

[] spawn {
    // Fix missing actions when adding immediately after player spawns
    waitUntil {sleep 1; alive player};
    
    player addAction [
        "Take controls",
        {
            params ["_target","_caller","_id"];
            
            [_caller] call FUNC(takeControls);
        },
        nil,
        999,
        false,
        true,
        "",
        QUOTE([_originalTarget] call FUNC(canTakeControls))
    ];
    
    player addAction [
        "Release controls",
        {
            params ["_target","_caller","_id"];
            
            [_caller] call FUNC(releaseControls);
        },
        nil,
        999,
        false,
        true,
        "",
        QUOTE([_originalTarget] call FUNC(canReleaseControls))
    ];
};
