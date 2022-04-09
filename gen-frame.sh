#gmx trjconv -f prod0-6.xtc -s prod.tpr -pbc mol -center -o prod-centered.xtc -n chain-hist.ndx
s=0
p=1
while [ $p -le 500 ]

do
#p=` expr $p + 1 `
gmx traj -f prod0-100-forsap.xtc -s prod.tpr -b ${s} -e ${s} -oxt frame${p}-initial.gro < input
gmx editconf -f frame${p}-initial.gro -o frame${p}.gro -resnr 1
rm -f frame${p}-initial.gro
#echo ${p}
p=` expr $p + 1 `
s=` expr $s + 20 `
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
