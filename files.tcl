set bd_path proj

set bd_name c2cSlave

set bd_files "\
    src/c2cSlave/createC2CSlaveInterconnect.tcl
    "

set vhdl_files "\
     src/top.vhd \
     src/misc/pass_time_domain.vhd \ 
     src/misc/pacd.vhd \
     src/misc/types.vhd \
     src/misc/capture_CDC.vhd \
     src/misc/counter_clock.vhd \         
     src/axiReg/axiRegPkg.vhd \
     src/axiReg/axiReg.vhd \
     src/uut_pkg.vhd \
     src/myReg/myReg.vhd \
     src/misc/RGB_PWM.vhd \
     src/misc/LED_PWM.vhd \
     src/FW_info/FW_info.vhd \
     src/PRMEMCTest.vhd \
     src/uut.vhd \ 
     src/TCDS/TCDS.vhd \
     src/TCDS/VIRTEX_TCDS_map.vhd \
     src/TCDS/VIRTEX_TCDS_PKG.vhd \
     src/top.vhd \  
     "

set verilog_files "\
    src/misc/Memory.v \
    src/misc/MemoryBinned.v \
    src/TCDS/TCDS_TxRx_example_stimulus_64b66b.v \
    src/TCDS/TCDS_TxRx_example_reset_sync.v \
    src/TCDS/TCDS_TxRx_prbs_any.v \

    "

set xdc_files "\
    src/top_pins.xdc \
    src/top_timing.xdc	\
    "	    

set xci_files "\
    	      cores/Local_Clocking/Local_Clocking.xci \
              cores/PR_L3PHIA/PR_L3PHIA.xci \
              cores/PR_L3PHIB/PR_L3PHIB.xci \
              cores/PR_L3PHIC/PR_L3PHIC.xci \
              cores/PR_L3PHID/PR_L3PHID.xci \
              cores/MatchEngineTopL3_0/MatchEngineTopL3_0.xci \
              cores/MC_L3PHIC/MC_L3PHIC.xci \
              cores/in_system_ibert_0/in_system_ibert_0.xci \
              cores/TCDS_TxRx/TCDS_TxRx.xci  \
    	      "
set data_files "\
               emData/TrackletProjections_TPROJ_L1L2B_L3PHIA_04MOD.dat \
               emData/TrackletProjections_TPROJ_L1L2B_L3PHIB_04MOD.dat \
               emData/TrackletProjections_TPROJ_L1L2C_L3PHIA_04MOD.dat \
               emData/TrackletProjections_TPROJ_L1L2C_L3PHIB_04MOD.dat \
               emData/TrackletProjections_TPROJ_L1L2D_L3PHIA_04MOD.dat \
               emData/TrackletProjections_TPROJ_L1L2D_L3PHIB_04MOD.dat \
               emData/TrackletProjections_TPROJ_L1L2E_L3PHIB_04MOD.dat \
               emData/TrackletProjections_TPROJ_L1L2F_L3PHIB_04MOD.dat \
               emData/TrackletProjections_TPROJ_L1L2F_L3PHIC_04MOD.dat \
               emData/TrackletProjections_TPROJ_L1L2G_L3PHIB_04MOD.dat \
               emData/TrackletProjections_TPROJ_L1L2G_L3PHIC_04MOD.dat \
               emData/TrackletProjections_TPROJ_L1L2H_L3PHIC_04MOD.dat \
               emData/TrackletProjections_TPROJ_L1L2H_L3PHID_04MOD.dat \
               emData/TrackletProjections_TPROJ_L1L2I_L3PHIC_04MOD.dat \
               emData/TrackletProjections_TPROJ_L1L2I_L3PHID_04MOD.dat \
               emData/TrackletProjections_TPROJ_L1L2J_L3PHIC_04MOD.dat \
               emData/TrackletProjections_TPROJ_L1L2J_L3PHID_04MOD.dat \
               emData/TrackletProjections_TPROJ_L1L2K_L3PHID_04MOD.dat \
               emData/TrackletProjections_TPROJ_L1L2L_L3PHID_04MOD.dat \
               emData/TrackletProjections_TPROJ_L5L6A_L3PHIA_04MOD.dat \
               emData/TrackletProjections_TPROJ_L5L6A_L3PHIB_04MOD.dat \
               emData/TrackletProjections_TPROJ_L5L6B_L3PHIA_04MOD.dat \
               emData/TrackletProjections_TPROJ_L5L6B_L3PHIB_04MOD.dat \
               emData/TrackletProjections_TPROJ_L5L6B_L3PHIC_04MOD.dat \
               emData/TrackletProjections_TPROJ_L5L6C_L3PHIB_04MOD.dat \
               emData/TrackletProjections_TPROJ_L5L6C_L3PHIC_04MOD.dat \
               emData/TrackletProjections_TPROJ_L5L6C_L3PHID_04MOD.dat \
               emData/TrackletProjections_TPROJ_L5L6D_L3PHIC_04MOD.dat \
               emData/TrackletProjections_TPROJ_L5L6D_L3PHID_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIA1n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIA2n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIA3n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIA4n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIA5n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIA6n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIA7n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIA8n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIB10n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIB11n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIB12n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIB13n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIB14n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIB15n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIB16n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIB9n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIC17n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIC18n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIC19n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIC20n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIC21n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIC22n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIC23n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHIC24n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHID25n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHID26n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHID27n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHID28n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHID29n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHID30n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHID31n1_04MOD.dat \
               emData/VMStubs_VMSME_L3PHID32n1_04MOD.dat \
               emData/AllStubs_AS_L3PHIAn3_04MOD.dat \
               emData/AllStubs_AS_L3PHIBn4_04MOD.dat \
               emData/AllStubs_AS_L3PHICn4_04MOD.dat \
               emData/AllStubs_AS_L3PHIDn3_04MOD.dat \
               emData/FullMatches_FM_L1L2_L3PHIA_04MOD.dat \
               emData/FullMatches_FM_L1L2_L3PHIB_04MOD.dat \
               emData/FullMatches_FM_L1L2_L3PHIC_04MOD.dat \
               emData/FullMatches_FM_L1L2_L3PHID_04MOD.dat \
               emData/FullMatches_FM_L5L6_L3PHIA_04MOD.dat \
               emData/FullMatches_FM_L5L6_L3PHIB_04MOD.dat \
               emData/FullMatches_FM_L5L6_L3PHIC_04MOD.dat \
               emData/FullMatches_FM_L5L6_L3PHID_04MOD.dat \
               "

#	      cores/LHC/LHC.xci \
