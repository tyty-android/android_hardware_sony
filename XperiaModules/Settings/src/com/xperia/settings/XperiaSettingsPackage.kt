/*
 * Copyright (C) 2024 XperiaLabs Project
 * Copyright (C) 2022 Paranoid Android
 * SPDX-License-Identifier: Apache-2.0
 */

package com.xperia.settings

import android.os.Bundle
import android.content.Intent
import android.content.pm.PackageManager
import androidx.preference.*
import androidx.core.content.pm.PackageInfoCompat
 
import com.xperia.settings.R
 
class XperiaSettingsPackage(private val fragment: PreferenceFragmentCompat) {
    private val pm = fragment.activity?.packageManager
    private val displayPackageName = "com.xperia.settings.display"
    private val displayClassName = "com.xperia.settings.display.DisplaySettingsActivity"
    private val batteryPackageName = "com.xperia.settings.charger"
    private val batteryClassName = "com.xperia.settings.charger.ChargerSettingsActivity"
    fun setupDisplaySettings() {
        try {
            val packageInfo = pm?.getPackageInfo(displayPackageName, PackageManager.GET_ACTIVITIES)
            if (packageInfo != null && PackageInfoCompat.getLongVersionCode(packageInfo) >= 1) {
                fragment.findPreference<Preference>("display_settings")?.isVisible = true
                val intent = Intent().apply {
                    setClassName(displayPackageName, displayClassName)
                }
                fragment.findPreference<Preference>("display_settings")?.intent = intent
            } else {
                val category = fragment.findPreference<PreferenceCategory>("display")
                fragment.findPreference<Preference>("display_settings")?.isVisible = false
                category?.isVisible = false
            }
        } catch (e: PackageManager.NameNotFoundException) {
            val category = fragment.findPreference<PreferenceCategory>("display")
            fragment.findPreference<Preference>("display_settings")?.isVisible = false
            category?.isVisible = false
        }
    }

    fun setupBatterySettings() {
        try {
            val packageInfo = pm?.getPackageInfo(batteryPackageName, PackageManager.GET_ACTIVITIES)
            if (packageInfo != null && PackageInfoCompat.getLongVersionCode(packageInfo) >= 1) {
                fragment.findPreference<Preference>("charging_settings")?.isVisible = true
                val intent = Intent().apply {
                    setClassName(batteryPackageName, batteryClassName)
                }
                fragment.findPreference<Preference>("charging_settings")?.intent = intent
            } else {
                val category = fragment.findPreference<PreferenceCategory>("charger")
                fragment.findPreference<Preference>("charging_settings")?.isVisible = false
                category?.isVisible = false
            }
        } catch (e: PackageManager.NameNotFoundException) {
            val category = fragment.findPreference<PreferenceCategory>("charger")
            fragment.findPreference<Preference>("charging_settings")?.isVisible = false
            category?.isVisible = false
        }
    }
}