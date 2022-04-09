#rm -f sasa*
rm -f input-filename.dat
rm -f index-filename.dat
rm -f input-tracefile.dat
rm -f sasa-inputname.dat
rm -f sasa-outputname.dat
rm -f sasa-framewise-output.dat
s=1

while [ $s -le 500 ]

do
#p=` expr $p + 1 `
echo "frame${s}.gro" >> input-filename.dat
echo "frame${s}.ndx" >> index-filename.dat
echo "frame${s}-trace.dat" >> input-tracefile.dat
echo "sasa-input-frame${s}.dat" >> sasa-inputname.dat
echo "sasa-frame${s}-clean.xvg" >> sasa-outputname.dat
echo "frame${s}-sasa.dat" >> sasa-framewise-output.dat
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
