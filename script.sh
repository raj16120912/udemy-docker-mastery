declare -a iarray
for i in  $(docker images | awk 'NR!=1 {print $1}')
do 
 iarray+=("$i")
done 
echo  ${iarray[*]}

declare -a jarray
for j in  $(docker images | awk 'NR!=1 {print $3}')
do
 jarray+=("$j")
done
echo  ${jarray[*]}


for x in {0..24} 
do 
 if [[ ${iarray[$x]} == \<none\> ]]
  then 
  docker rmi -f ${jarray[$x]} 
 fi
x=$((x+1))
done
