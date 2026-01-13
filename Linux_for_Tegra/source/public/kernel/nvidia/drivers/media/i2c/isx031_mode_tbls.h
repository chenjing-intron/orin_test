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
#ifndef __ISX031_I2C_TABLES__
#define __ISX031_I2C_TABLES__

#include <media/camera_common.h>

#define ISX031_TABLE_WAIT_MS	0xff00
#define ISX031_TABLE_END	0xff01
#define ISX031_MAX_RETRIES	3
#define ISX031_WAIT_MS_STOP	1
#define ISX031_WAIT_MS_START	30
#define ISX031_WAIT_MS_STREAM	210
#define ISX031_GAIN_TABLE_SIZE 255

#define ovx3c_reg struct reg_8



enum {
	ISX031_MODE_640X1205_CROP_30FPS,
	ISX031_MODE_START_STREAM,
	ISX031_MODE_STOP_STREAM,
};

static const int isx031_30fps[] = {
	30,
};

static const int isx031_60fps[] = {
	60,
};

static const int isx031_120fps[] = {
	120,
};

static const struct camera_common_frmfmt isx031_frmfmt[] = {
	{{1920, 1536}, isx031_30fps, 1, 0, ISX031_MODE_640X1205_CROP_30FPS},
};
#endif /* __ISX031_I2C_TABLES__ */
