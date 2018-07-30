#!/bin/bash



HBN_data_loc=/lus/theta-fs0/projects/AD_Brain_Imaging/anal/HBN/

HBN_job_loc=/lus/theta-fs0/projects/AD_Brain_Imaging/anal/HBN/job/

CMD_batch =${HBN_job_loc}/cmd.batch.hbn
rm -rf $CMD_batch

################################################################################

# Creating file that script below will put the job files in here

cat<<EOC >$CMD_batch
#!/bin/bash
#COBALT -t 26:00:00
#COBALT -n 8
#COBALT --attrs mcdram=cache:numa=quad
#COBALT -A AD_Brain_Imaging

echo Beginning fmriprep preprocessing

EOC

################################################################################


for s in `cat $list`
do

CMD=${HBN_job_loc}/cmd.fmriprep/${s}
rm -rf $CMD

cat<<EOA >$CMD
#!/bin/bash
source ~/.bashrc

ITA_loc=/home/wangyun/ITA
singularity run ${ITA_loc}/poldracklab_fmriprep_latest-2018-04-11-b46f8842831b.img ${ITA_loc}/Preprocess ${ITA_loc}/fmriprep_test participant --participant-label ${s} --fs-license-file ${ITA_loc}/freesurfer_license.txt

EOA

chmod +x $CMD

echo "aprun -n 1 -N 1 $CMD">>$CMD_batch

done

chmod +x $CMD_batch
# qsub $CMD_batch














