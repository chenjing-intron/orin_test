set -x

# Reset deserializer
i2ctransfer -y -f 0 w3@0x29 0x00 0x13 0x40 && sleep 0.1 ## RESET_ALL
i2ctransfer -y -f 0 w3@0x29 0x00 0x18 0x0F && sleep 0.1 ## RESET_ONE_SHOT_A,B,C,D

i2ctransfer -y -f 0 w3@0x29 0x14 0x49 0x75 && sleep 0.1 ## Why not 0x04?
i2ctransfer -y -f 0 w3@0x29 0x15 0x49 0x75 && sleep 0.1
i2ctransfer -y -f 0 w3@0x29 0x16 0x49 0x75 && sleep 0.1
i2ctransfer -y -f 0 w3@0x29 0x17 0x49 0x75 && sleep 0.1

i2ctransfer -y -f 0 w3@0x29 0x09 0x73 0x10 && sleep 0.1 ## Alternative memory read mapping enable for 8-bit DT when sharing the same video pipe with RAW16

i2ctransfer -y -f 0 w3@0x29 0x04 0x0B 0x00 && sleep 0.1 ## Disable CSI output
i2ctransfer -y -f 0 w3@0x29 0x00 0x06 0xF0 && sleep 0.1 ## Disable all links, set all links to GMSL2

i2ctransfer -y -f 0 w3@0x29 0x00 0x06 0xF2 && sleep 0.1 ## Enable Link B, should see the serializer 0x40 at /dev/i2c-0
# i2ctransfer -y -f 0 w3@0x40 0x00 0x00 0xA8 && sleep 0.1 ## Change i2c address of serializer from 0x40 to 0x54[0xA8 = 0x54<<1], 0x40 now should be disappeared and 0x54 appears
# i2ctransfer -y -f 0 w3@0x54 0x00 0x42 0x68 && sleep 0.1 ## It means I will communicate with the sensor behind serializer through this address 0x34, 0x68 = 0x34<<1
# i2ctransfer -y -f 0 w3@0x54 0x00 0x43 0x34 && sleep 0.1 ## 0x1A is the default address of the senser, 0x1A<<1 = 0x34 is used here
i2ctransfer -y -f 0 w3@0x40 0x00 0x02 0x03 && sleep 0.1 ## Reference PLL output
i2ctransfer -y -f 0 w3@0x40 0x03 0x30 0x00 && sleep 0.1 ## Do not reset MIPI RX, Disable virtual channel mapping, enable MIPI continuous clock
i2ctransfer -y -f 0 w3@0x40 0x03 0x31 0x30 && sleep 0.1 ## Four data lanes
i2ctransfer -y -f 0 w3@0x40 0x03 0x08 0x64 && sleep 0.1 ## CSI enabled, Line start info frames enabled
i2ctransfer -y -f 0 w3@0x40 0x03 0x18 0x5e && sleep 0.1 ## Datatype enabled for datatype selected to route to video pipeline

i2ctransfer -y -f 0 w3@0x40 0x03 0x15 0x80 && sleep 0.1
i2ctransfer -y -f 0 w3@0x40 0x03 0x0D 0x01 && sleep 0.1

i2ctransfer -y -f 0 w3@0x40 0x03 0x11 0x40 && sleep 0.1 ## Start video pipe Z from CSI port
i2ctransfer -y -f 0 w3@0x40 0x00 0x02 0x43 && sleep 0.1 ## Video transmit Pipe Z enabled

# i2ctransfer -y -f 0 w3@0x40 0x02 0xc7 0x10 && sleep 0.1
# i2ctransfer -y -f 0 w3@0x40 0x02 0xc7 0x00 && sleep 0.1

# i2ctransfer -y -f 0 w3@0x40 0x02 0xbe 0x00 && sleep 0.1  
# i2ctransfer -y -f 0 w3@0x40 0x02 0xbe 0x10 && sleep 0.1

## YUV422 8bit  video pipe 1  map FS/FE
i2ctransfer -y -f 0 w3@0x29 0x09 0x4B 0x07 && sleep 0.1
i2ctransfer -y -f 0 w3@0x29 0x09 0x6D 0x15 && sleep 0.1 ## map to MIPI Controller 1
i2ctransfer -y -f 0 w3@0x29 0x09 0x4D 0x1E && sleep 0.1
i2ctransfer -y -f 0 w3@0x29 0x09 0x4E 0x1E && sleep 0.1 ## map to VC0 
i2ctransfer -y -f 0 w3@0x29 0x09 0x4F 0x00 && sleep 0.1 ## frame start	
i2ctransfer -y -f 0 w3@0x29 0x09 0x50 0x00 && sleep 0.1
i2ctransfer -y -f 0 w3@0x29 0x09 0x51 0x01 && sleep 0.1
i2ctransfer -y -f 0 w3@0x29 0x09 0x52 0x01 && sleep 0.1

i2ctransfer -y -f 0 w3@0x29 0x08 0xA0 0x04 && sleep 0.1 ## MIPI output configured as two 4-lane MIPI ports
i2ctransfer -y -f 0 w3@0x29 0x08 0xA3 0xE4 && sleep 0.1 ## PHY1 D1 to D3, PHY1 D0 to D2, PHY0 D1 to D1, PHY0 D0 to D0, CSI-2 Controller 1 is mapped to both PHY0 and PHY1
i2ctransfer -y -f 0 w3@0x29 0x08 0xA4 0xE4 && sleep 0.1 ## PHY3 D1 to D3, PHY3 D0 to D2, PHY2 D1 to D1, PHY2 D0 to D0, CSI-2 Controller 2 is mapped to both PHY2 and PHY3

i2ctransfer -y -f 0 w3@0x29 0x09 0x0A 0xC0 && sleep 0.1 ## Four data lanes, DPHY mode, Select 2-bit VC
i2ctransfer -y -f 0 w3@0x29 0x09 0x4A 0xC0 && sleep 0.1 ## Four data lanes, DPHY mode, Select 2-bit VC
i2ctransfer -y -f 0 w3@0x29 0x09 0x8A 0xC0 && sleep 0.1 ## Four data lanes, DPHY mode, Select 2-bit VC
i2ctransfer -y -f 0 w3@0x29 0x09 0xCA 0xC0 && sleep 0.1 ## Four data lanes, DPHY mode, Select 2-bit VC

i2ctransfer -y -f 0 w3@0x29 0x08 0xA2 0x34 && sleep 0.1 ## Enable MIPI PHY0 and PHY1

i2ctransfer -y -f 0 w3@0x29 0x04 0x15 0x2F && sleep 0.1
i2ctransfer -f -y 0 w3@0x29 0x04 0x18 0x2F && sleep 0.1 ## 1500Mbps/lane
i2ctransfer -y -f 0 w3@0x29 0x04 0x1B 0x2F && sleep 0.1
i2ctransfer -y -f 0 w3@0x29 0x04 0x1E 0x2F && sleep 0.1

i2ctransfer -f -y 0 w3@0x29 0x04 0x0B 0x02 && sleep 0.1 ## Enable CSI output

# i2ctransfer -y -f 0 w3@0x29 0x00 0x06 0xF0 && sleep 0.1
# i2ctransfer -y -f 0 w3@0x29 0x00 0x06 0xF2 && sleep 0.1 ## Enable Link B

i2ctransfer -f -y 0 w3@0x1A 0xBE 0xF0 0x53 && sleep 0.1
i2ctransfer -f -y 0 w3@0x1A 0x8A 0x01 0x80 && sleep 0.1 ## Start streaming

# i2ctransfer -y -f 0 w3@0x29 0x00 0x06 0xF0 && sleep 0.1
# i2ctransfer -y -f 0 w3@0x29 0x00 0x06 0xF4 && sleep 0.1 ## Enable Link C, should see the serializer 0x40 at /dev/i2c-0
# i2ctransfer -y -f 0 w3@0x40 0x00 0x00 0xAA && sleep 0.1 ## Change i2c address of serializer from 0x40 to 0x55[0xAA = 0x55<<1], 0x40 now should be disappeared and 0x55 appears
# i2ctransfer -y -f 0 w3@0x55 0x00 0x42 0x6A && sleep 0.1 ## It means I will communicate with the sensor behind serializer through this address 0x35, 0x6A = 0x35<<1
# i2ctransfer -y -f 0 w3@0x55 0x00 0x43 0x34 && sleep 0.1 ## 0x1A is the default address of the senser, 0x1A<<1 = 0x34 is used here
# i2ctransfer -y -f 0 w3@0x55 0x03 0x13 0x42 && sleep 0.1 ## Send 12-bit pixels as 24-bit and Send 10-bit pixels as 20-bit

# i2ctransfer -y -f 0 w3@0x29 0x04 0x0B 0x82 && sleep 0.1 ## CSI output enabled