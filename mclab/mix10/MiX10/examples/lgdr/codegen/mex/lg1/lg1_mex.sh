MATLAB="/usr/local/pkgs/MATLAB/R2013a"
Arch=glnxa64
ENTRYPOINT=mexFunction
MAPFILE=$ENTRYPOINT'.map'
PREFDIR="/home/sable/vkumar5/.matlab/R2013a"
OPTSFILE_NAME="./mexopts.sh"
. $OPTSFILE_NAME
COMPILER=$CC
. $OPTSFILE_NAME
echo "# Make settings for lg1" > lg1_mex.mki
echo "CC=$CC" >> lg1_mex.mki
echo "CFLAGS=$CFLAGS" >> lg1_mex.mki
echo "CLIBS=$CLIBS" >> lg1_mex.mki
echo "COPTIMFLAGS=$COPTIMFLAGS" >> lg1_mex.mki
echo "CDEBUGFLAGS=$CDEBUGFLAGS" >> lg1_mex.mki
echo "CXX=$CXX" >> lg1_mex.mki
echo "CXXFLAGS=$CXXFLAGS" >> lg1_mex.mki
echo "CXXLIBS=$CXXLIBS" >> lg1_mex.mki
echo "CXXOPTIMFLAGS=$CXXOPTIMFLAGS" >> lg1_mex.mki
echo "CXXDEBUGFLAGS=$CXXDEBUGFLAGS" >> lg1_mex.mki
echo "LD=$LD" >> lg1_mex.mki
echo "LDFLAGS=$LDFLAGS" >> lg1_mex.mki
echo "LDOPTIMFLAGS=$LDOPTIMFLAGS" >> lg1_mex.mki
echo "LDDEBUGFLAGS=$LDDEBUGFLAGS" >> lg1_mex.mki
echo "Arch=$Arch" >> lg1_mex.mki
echo OMPFLAGS= >> lg1_mex.mki
echo OMPLINKFLAGS= >> lg1_mex.mki
echo "EMC_COMPILER=" >> lg1_mex.mki
echo "EMC_CONFIG=optim" >> lg1_mex.mki
"/usr/local/pkgs/MATLAB/R2013a/bin/glnxa64/gmake" -B -f lg1_mex.mk
