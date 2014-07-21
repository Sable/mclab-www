MATLAB="/usr/local/pkgs/MATLAB/R2013a"
Arch=glnxa64
ENTRYPOINT=mexFunction
MAPFILE=$ENTRYPOINT'.map'
PREFDIR="/home/sable/vkumar5/.matlab/R2013a"
OPTSFILE_NAME="./mexopts.sh"
. $OPTSFILE_NAME
COMPILER=$CC
. $OPTSFILE_NAME
echo "# Make settings for drv_lgdr" > drv_lgdr_mex.mki
echo "CC=$CC" >> drv_lgdr_mex.mki
echo "CFLAGS=$CFLAGS" >> drv_lgdr_mex.mki
echo "CLIBS=$CLIBS" >> drv_lgdr_mex.mki
echo "COPTIMFLAGS=$COPTIMFLAGS" >> drv_lgdr_mex.mki
echo "CDEBUGFLAGS=$CDEBUGFLAGS" >> drv_lgdr_mex.mki
echo "CXX=$CXX" >> drv_lgdr_mex.mki
echo "CXXFLAGS=$CXXFLAGS" >> drv_lgdr_mex.mki
echo "CXXLIBS=$CXXLIBS" >> drv_lgdr_mex.mki
echo "CXXOPTIMFLAGS=$CXXOPTIMFLAGS" >> drv_lgdr_mex.mki
echo "CXXDEBUGFLAGS=$CXXDEBUGFLAGS" >> drv_lgdr_mex.mki
echo "LD=$LD" >> drv_lgdr_mex.mki
echo "LDFLAGS=$LDFLAGS" >> drv_lgdr_mex.mki
echo "LDOPTIMFLAGS=$LDOPTIMFLAGS" >> drv_lgdr_mex.mki
echo "LDDEBUGFLAGS=$LDDEBUGFLAGS" >> drv_lgdr_mex.mki
echo "Arch=$Arch" >> drv_lgdr_mex.mki
echo OMPFLAGS= >> drv_lgdr_mex.mki
echo OMPLINKFLAGS= >> drv_lgdr_mex.mki
echo "EMC_COMPILER=" >> drv_lgdr_mex.mki
echo "EMC_CONFIG=optim" >> drv_lgdr_mex.mki
"/usr/local/pkgs/MATLAB/R2013a/bin/glnxa64/gmake" -B -f drv_lgdr_mex.mk
