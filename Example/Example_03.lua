
--====================================================================
local ffi =require("ffi")
local mediaInfo = require("ffi-mediaInfo");
--====================================================================

-- set filePath
local filePath ="SampleWav//Alarm6_01.wav"

-- print Mediainfo version  to console
print ( ffi.string(mediaInfo.MediaInfoA_Option(nil,"Info_Version", "") ));

-- create MediaInfo Instance
local mi = mediaInfo.MediaInfoA_New();

-- to print list of all Parameters.
local parameters = ffi.string(mediaInfo.MediaInfoA_Option(mi,"Info_Parameters",""));

-- close 
mediaInfo.MediaInfoA_Close (mi);  

-- delete MediaInto instance
mediaInfo.MediaInfoA_Delete (mi);

--====================================================================

-- formating string
parameters = string.gsub(parameters,"\n","");

-- print to console
print(parameters);

--====================================================================
