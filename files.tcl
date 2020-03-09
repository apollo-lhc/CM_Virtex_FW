set bd_path proj

set bd_name c2cSlave

set bd_files "\
    src/c2cSlave/createC2CSlaveInterconnect.tcl
    "

set vhdl_files "\
     src/top.vhd \
     src/misc/types.vhd \
     src/axiReg/axiRegPkg.vhd \
     src/axiReg/axiReg.vhd \
     src/uut_pkg.vhd \
     src/myReg/myReg.vhd \
     src/misc/RGB_PWM.vhd \
     src/misc/LED_PWM.vhd \
     src/FW_info/FW_info.vhd \
     src/uut.vhd \ 
     "

set verilog_files "\
    src/misc/Memory.v \
    src/misc/MemoryBinned.v \
    "

set xdc_files "\
    src/top_pins.xdc \
    src/top_timing.xdc	\
    "	    

set xci_files "\
    	      cores/Local_Clocking/Local_Clocking.xci \
              cores/PR_L3PHIC/PR_L3PHIC.xci \
              cores/MatchEngineTopL3_0/MatchEngineTopL3_0.xci \
              cores/MC_L3PHIC/MC_L3PHIC.xci \
    	      "
set data_files "\
               emData/AS_L3PHICn4.dat \
               emData/TrackletProjections_TPROJ_L1L2F_L3PHIC_04MOD.dat \
               emData/TrackletProjections_TPROJ_L1L2G_L3PHIC_04MOD.dat \
               emData/TrackletProjections_TPROJ_L1L2H_L3PHIC_04MOD.dat \
               emData/TrackletProjections_TPROJ_L1L2I_L3PHIC_04MOD.dat \
               emData/TrackletProjections_TPROJ_L1L2J_L3PHIC_04MOD.dat \
               emData/TrackletProjections_TPROJ_L5L6B_L3PHIC_04MOD.dat \
               emData/TrackletProjections_TPROJ_L5L6C_L3PHIC_04MOD.dat \
               emData/TrackletProjections_TPROJ_L5L6D_L3PHIC_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIC17n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIC18n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIC19n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIC20n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIC21n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIC22n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIC23n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIC24n1_04MOD.dat \
               emData/FullMatches_FM_L1L2_L3PHIC_04MOD.dat \
               emData/FullMatches_FM_L5L6_L3PHIC_04MOD.dat \
               "

#	      cores/LHC/LHC.xci \
