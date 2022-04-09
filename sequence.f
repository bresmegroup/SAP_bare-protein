      


   
       

        implicit none
        integer r(5000)
        character(len=4) q(6941)
        character(len=3) l(7351,5000)
        character(len=3) res(7351)
        real h(7351)
        real b(7351)
        real sap_fr(10000)
        character(len=45) m(7351)
        character(len=40) f(100000)
        integer ft(20000)
        character(len=40) w(100000)
        integer resno(0:7352)
        character(len=3) resname(7351)
c        real, dimension(1:659,1:7351,1:5000) :: d
c        real d2(8000,8000,8000)
        integer p(7351), n(7351)
c        integer b(1:7351,0:5000)
        integer x(7351)              
        integer natom   
        integer i, j, k, s
        real a(7351), sap(73510)

ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
          open(unit=117,file="frame1.gro",status="unknown")
          open(unit=333,file="sequence.dat",status="unknown")
        
          do 17 i = 1,7351
          read(117,120) resno(i), resname(i)
c          print*, resno(i)
17        enddo 
          resno(0) = 0
          natom = 0
          do 43 i = 1,7351
                if(resno(i) .ne. resno(i-1)) then
                        write(333,*) resno(i),resname(i)
                        natom=0
                else
                        natom = natom + 1
                endif


43        enddo
          resno(7352) = 1000 

          open(unit=334,file="ressize.dat",status="unknown")
          s=0
          natom = 0
          do 44 i = 1,7351
                if(resno(i) .ne. resno(i+1)) then
                        write(334,*) resno(i),resname(i),natom+1
                        s = s + natom+1
                        natom = 0
                else
                        natom = natom + 1
                endif


44        enddo
          print*, s 




120      format(i5, a3)

cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

        stop
        end





