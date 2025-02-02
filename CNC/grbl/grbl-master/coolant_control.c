/*
  coolant_control.c - coolant control methods
  Part of Grbl

  Copyright (c) 2012 Sungeun K. Jeon

  Grbl is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  Grbl is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with Grbl.  If not, see <http://www.gnu.org/licenses/>.
*/

#include <inttypes.h>

#include "coolant_control.h"
#include "settings.h"
#include "config.h"
#include "planner.h"

static uint8_t current_coolant_mode;

void coolant_init()
{
  current_coolant_mode = COOLANT_DISABLE;
  coolant_stop();
}

void coolant_stop()
{
  #ifdef ENABLE_M7
  coolant_mist_off();
  #endif
  coolant_flood_off();
}


void coolant_run(uint8_t mode)
{
  if (mode != current_coolant_mode)
  { 
    plan_synchronize(); // Ensure coolant turns on when specified in program.
    if (mode == COOLANT_FLOOD_ENABLE) { 
      coolant_flood_on();
    #ifdef ENABLE_M7  
      } else if (mode == COOLANT_MIST_ENABLE) {
          coolant_mist_on();
    #endif
    } else {
      coolant_stop();
    }
    current_coolant_mode = mode;
  }
}
