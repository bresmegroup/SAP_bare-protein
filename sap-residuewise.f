      


   
       

        implicit none
        integer ressize(500)
        integer resno(0:7000)
        character(len=3) resname(7000)
        integer p(7000), n(7000), s(7000)
        integer i, j, k, a, b
        real sap(7000), sapres(500)

ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

          open(unit=117,file="ressize.dat",status="unknown")
          open(unit=333,file="sap-atomwise.dat",status="unknown")
       open(unit=444,file="sap-residuewise-2.0-sc.dat",status="unknown")

          do 17 i = 1,441
          read(117,*) resno(i), resname(i), ressize(i)
17        enddo 

          do 18 i = 1,6941
          read(333,*) p(i), sap(i) 
18        enddo

          b=0 

          do 19 i = 1,441
          a = b+1
          b = b+ressize(i)
          print*, a, b
          do 20 j = a,b
          sapres(i) = sapres(i) + sap(j)
20        enddo
          write(444,*) i, sapres(i)/(b-a)
19        enddo
        
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

        stop
        end





