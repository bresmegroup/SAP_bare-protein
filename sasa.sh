s=1

while [ $s -le 500 ]

do
#p=` expr $p + 1 `
gmx sasa -f frame${s}-old.gro -s prod.tpr -surface -output -o sasa-frame${s} -n frame${s}-mod.ndx -probe 0.2 < sasa-input-frame${s}.dat
echo ${s}
s=` expr $s + 1 `
rm -f \#*
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
