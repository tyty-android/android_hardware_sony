/*
 * Copyright (C) 2024 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

package vendor.semc.hardware.aidldisplay;

@VintfStability
interface IFramerateController {
     int set_displayport_mode(int index);
     int set_hmd_mode(int mode);
}
