#!/bin/bash
#COBALT -t 1560
#COBALT -n 8
#COBALT --attrs mcdram=cache:numa=quad
#COBALT -A AD_Brain_Imaging



cd /home/wangyun/ITA
singularity  run            poldracklab_fmriprep_latest-2018-04-11-b46f8842831b.img            /home/wangyun/ITA/Preprocess            /home/wangyun/ITA/fmriprep_test           participant              --participant-label 6416            --fs-license-file  freesurfer_license.txt










