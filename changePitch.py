import wave
import sys

# input:sys.argv[1] ex.girl1.wav
# output:sys.argv[2]

CHANNELS = 1
swidth = 2
Change_RATE = 1.18700888888
# 1.13550066666
# 1.18700888888 todayHigh
# 0.8445555555 todayLow

# 20160412083906.wav
spf = wave.open(sys.argv[1], 'rb')
# spf = wave.open('20160412083906.wav', 'rb')
RATE = spf.getframerate()
signal = spf.readframes(-1)

wf = wave.open(sys.argv[2], 'wb')
# wf = wave.open('todayPeople.wav', 'wb')
wf.setnchannels(CHANNELS)
wf.setsampwidth(swidth)
wf.setframerate(RATE*Change_RATE)
wf.writeframes(signal)
wf.close()
