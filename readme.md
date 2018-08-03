
## MediaInfo for LuaJit

MediaInfo library for use in LuaJit FFI.

* MediaInfo - https://mediaarea.net/en/MediaInfo
* LuaJIT - http://luajit.org/

### Note

``` lua

--====================================================================
local ffi =require("ffi");
local mediaInfo = require("ffi-mediaInfo");
--====================================================================

-- set filePath
local filePath ="sampleWav//Alarm3_01.wav";

--  print Mediainfo version  to console
print ( ffi.string(mediaInfo.MediaInfoA_Option(nil,"Info_Version", "") ));

-- create MediaInfo Instance
local mi = mediaInfo.MediaInfoA_New();

-- open target File
mediaInfo.MediaInfoA_Open (mi,filePath);

-- set option
mediaInfo.MediaInfoA_Option(mi,"Inform","");

-- get propety
local generalInfo = ffi.string(mediaInfo.MediaInfoA_Inform(mi,1));

-- close
mediaInfo.MediaInfoA_Close (mi);  

-- delete MediaInfo instance
mediaInfo.MediaInfoA_Delete (mi);

--====================================================================

-- print to console
print ( generalInfo);

```

### Result

```  lua
-- result
--====================================================================
-- MediaInfoLib - v0.7.90
-- General
-- Complete name                            : sampleWav//Alarm3_01.wav
-- Format                                   : Wave
-- File size                                : 1.22 MiB
-- Duration                                 : 7 s 272 ms
-- Overall bit rate mode                    : Constant
-- Overall bit rate                         : 1 411 kb/s
--
-- Audio
-- Format                                   : PCM
-- Format settings, Endianness              : Little
-- Format settings, Sign                    : Signed
-- Codec ID                                 : 1
-- Duration                                 : 7 s 272 ms
-- Bit rate mode                            : Constant
-- Bit rate                                 : 1 411.2 kb/s
-- Channel(s)                               : 2 channels
-- Sampling rate                            : 44.1 kHz
-- Bit depth                                : 16 bits
-- Stream size                              : 1.22 MiB (100%)
--====================================================================
```

## Licenses

this FFI Library is Free License. Its not have any limit.

## Third Party License

* Mediainfo ( MediaInfo(Lib) License ) : ( https://mediaarea.net/en/MediaInfo/License )
* LuaJit ( Mit License) : http://luajit.org/luajit.html 


