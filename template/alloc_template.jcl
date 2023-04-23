//ALLOC JOB CLASS=A,MSGCLASS=X,MSGLEVEL=(1,1)
//*********************************************************************
//DELETE   EXEC PGM=IDCAMS,REGION=1M                        @P4C
//SYSPRINT DD SYSOUT=*
//SYSIN    DD *
         DELETE {{ datasetName }} NONVSAM
         SET MAXCC=0
//*
//ALLOC    EXEC PGM=IEFBR14
//DUMMY    DD SPACE=(TRK,(10,1,1)),
//            UNIT=3390,
{% if (useVolser is defined) and (useVolser) and (volser is defined) %}//*
//            VOL=SER={{ volser }},
{% endif %}
{% if (useStorageClass is defined) and (useStorageClass) and (storageClass is defined) %}//*
//            STORCLAS={{ storageClass }},
{% endif %}
//            DISP=(NEW,CATLG),
//            DSNTYPE=LIBRARY,
//            RECFM=FB,
//            LRECL=80,
//            BLKSIZE=32720,
//            DSN={{ datasetName }}
//*
