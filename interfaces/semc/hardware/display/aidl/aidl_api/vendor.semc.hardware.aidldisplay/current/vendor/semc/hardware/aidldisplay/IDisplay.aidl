/*
 * Copyright (C) 2024 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

package vendor.semc.hardware.aidldisplay;

import vendor.semc.hardware.aidldisplay.IDisplayCallback;
import vendor.semc.hardware.aidldisplay.PccLimits;
import vendor.semc.hardware.aidldisplay.PccMatrix;

@VintfStability
interface IDisplay {
    PccMatrix get_primary_pcc_matrix();
    PccLimits get_wp_limits_pcc();
    int notify_ambientlight_value(double value);
    int notify_hbm_status(int index);
    int notify_sbm_status(int index);
    void registerCallback(IDisplayCallback iDisplayCallback);
    int save_primary_pcc_matrix(in PccMatrix pccMatrix);
    int set_color_mode(int index);
    int set_hdr_tm_mode(boolean enable);
    int set_primary_pcc_matrix(in PccMatrix pccMatrix);
    int set_sspp_color_mode(int index);
    int setup();
}
