#! /bin/bash

function usage() {
    cat <<USAGE

    Usage: $0 [cells number_of_cells] [ues number_of_ues] [ul uplink_value] [dl downlink_value] [FSM|FLEXRAN platform]

    Options:
        cells:		  number of cells
        ues:		  number of ues
        ul:		  uplink value
        dl:		  downlink value
        FSM | FLEXRAN:	  platform 

USAGE
    exit 1
}

if [ $# -eq 0 ]; then
    usage
    exit 1
fi

SKIP_VERIFICATION=false
CELLS=
UES=
PLATFORM=
UL=
DL=

argumentsArray=( "$@" )
#echo "THE ARGUMENT ARE: $@"

while [ "$1" != "" ]; do
    case $1 in
    FSM)
        PLATFORM="FSM"
        ;;
    FLEXRAN)
        PLATFORM="FLEXRAN"
        ;;
    cells)
        shift
        CELLS=$1
        ;;
    ues)
        shift
        UES=$1
        ;;
    ul)
        shift
        UL=$1
        ;;
    dl)
        shift
        DL=$1
        ;;
    -h | --help)
        usage
        ;;
    *)
        usage
        exit 1
        ;;
    esac
    shift
done

# Default values

if [[ $CELLS == "" ]]; then
    CELLS=1	#The defult cells number
fi

if [[ $PLATFORM == "" ]]; then
    PLATFORM="FLEXRAN"	#The default platform
fi


echo "Your argument: PLATFORM="$PLATFORM" CELLS="$CELLS "UES="$UES "UL="$UL "DL="$DL

echo "Run your tests: "
./run_gt
