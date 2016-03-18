#!/bin/bash
ym=201512

for i in {16..31}
do
  ymd=$ym$i
  echo $ymd

  bash loginflow_parquet2mysql_supply.sh $ymd

done


