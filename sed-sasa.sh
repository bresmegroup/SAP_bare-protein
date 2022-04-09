s=1

while [ $s -le 500 ]

do
#p=` expr $p + 1 `
sed '/^@/d' sasa-frame${s}.xvg > sasa-frame${s}-mod.xvg
sed '/^#/d' sasa-frame${s}-mod.xvg > sasa-frame${s}-clean.xvg
rm -f sasa-frame${s}-mod.xvg
#sed -i -e 's/      0.000/    0.000/g' sasa-frame${s}-clean.xvg
sed -i 's/^.\{2\}//'  sasa-frame${s}-clean.xvg
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
