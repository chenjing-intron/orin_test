/*
 * imx390c_mode_tbls.h - imx390c sensor mode tables
 *
 * Copyright (c) 2018-2019, NVIDIA CORPORATION.  All rights reserved.
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms and conditions of the GNU General Public License,
 * version 2, as published by the Free Software Foundation.
 *
 * This program is distributed in the hope it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
#ifndef __SZ220AT_I2C_TABLES__
#define __SZ220AT_I2C_TABLES__

#include <media/camera_common.h>

#define SZ220AT_TABLE_WAIT_MS	0xff00
#define SZ220AT_TABLE_END	0xff01
#define SZ220AT_MAX_RETRIES	3
#define SZ220AT_WAIT_MS_STOP	1
#define SZ220AT_WAIT_MS_START	30
#define SZ220AT_WAIT_MS_STREAM	210
#define SZ220AT_GAIN_TABLE_SIZE 255

#define ovx3c_reg struct reg_8



enum {
	SZ220AT_MODE_640X1205_CROP_30FPS,
	SZ220AT_MODE_START_STREAM,
	SZ220AT_MODE_STOP_STREAM,
};

static const int sz220at_30fps[] = {
	30,
};

static const int sz220at_60fps[] = {
	60,
};

static const int sz220at_120fps[] = {
	120,
};

static const struct camera_common_frmfmt sz220at_frmfmt[] = {
	{{1920, 1080}, sz220at_30fps, 1, 0, SZ220AT_MODE_640X1205_CROP_30FPS},
};
#endif /* __SZ220AT_I2C_TABLES__ */
