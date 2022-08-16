#--hint:"Conf:off"
--verbosity:1

var opt = "size"

const TARGET    = "life26nim"
const FLTO = true

const
    CC = "gcc"
    #CC = "clang"
    #CC = "tcc"

if opt == "size":
    opt = "-Os"
    --opt:size
else:
    opt = "-O3"
    --opt:speed

--d:danger
--gc:orc
--passL:"-s"

switch "nimcache",".nimcache"
#switch "gcc.options.always" , ""
switch "gcc.options.debug" ,""
switch "gcc.options.size" , opt
switch "gcc.options.speed" , opt

if CC == "gcc" or CC == "clang":
    --passC:"-ffunction-sections -fdata-sections"
    --passL:"-Wl,--gc-sections"

when FLTO:
    if CC == "gcc":
        --passC:"-flto"
        --passL:"-flto"

task make,"make":
    exec "nim c " & TARGET

task clean,"clean":
    rmFile TARGET.toEXE()
    rmDir nimcacheDir()

task build,"build":
    makeTask()

