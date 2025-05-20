
#J5A/J5B:
# POC 1V8 1V2 1V0 EN, enable i2c 0,1,3,4  al,6,7, i2c bus exp: 2,5, POC output mode
i2cset -y -f 6 0x27 0x06 0xd600 w
# PWDNB max96712 enable
i2cset -y -f 8 0x27 0x7 0xf8 b
sleep 0.1

# PWDNB reset
i2cset -y -f 8 0x27 0x3 0xf8 b
sleep 0.1
i2cset -y -f 8 0x27 0x3 0xff b

# POC reset
i2cset -y -f 6 0x27 0x03 0xd6 b
sleep 0.1
i2cset -y -f 6 0x27 0x03 0xff b
