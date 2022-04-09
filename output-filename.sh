rm -f output-filename.dat
rm -f sasa-atomwise-output.dat
rm -f atomwise-mod-output.dat
rm -f sap-calc-inputfiles.dat
rm -f sap-atomwise-raw.dat

s=1

while [ $s -le 6941 ]

do
#p=` expr $p + 1 `
echo "atom${s}.dat" >> output-filename.dat
echo "atom${s}-sasa.dat" >> sasa-atomwise-output.dat	          
echo "atom${s}-sasa-mod.dat" >> atomwise-mod-output.dat
echo "atom${s}-sap.dat" >> sap-calc-inputfiles.dat
echo "atom${s}-sap-raw.dat" >> sap-atomwise-raw.dat 
#echo ${s}
s=` expr $s + 1 `
done
echo All done




#sed -i -e "1,18d" sasa-0.xvg
#sed -i -e "1,18d" sasa-1.xvg
#sed -i -e "1,18d" sasa-2.xvg
#sed -i -e "1,18d" sasa-3.xvg
#sed -i -e "1,18d" sasa-4.xvg
#sed -i -e "1,18d" sasa-5.xvg
#sed -i -e "1,18d" sasa-6.xvg


#cat sasa-0.xvg sasa-1.xvg sasa-2.xvg sasa-3.xvg sasa-4.xvg sasa-5.xvg sasa-6.xvg > sasa0-6.xvg
