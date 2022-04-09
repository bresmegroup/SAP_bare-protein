      


   
       
        integer r(5000)
        character(len=15) q(6941)
        character(len=3) l(7000,5000)
        character(len=15) m(7000)
        character(len=40) f(100000)
        integer ft(20000)
        real, dimension(1:659,1:7000,1:5000) :: d
c        real d2(8000,8000,8000)
        integer p(7000,5000), n(7000,5000), a(1:7000,0:5000)
        integer b(1:7000,0:5000)
        integer x                 
        integer i, j

cc        p = "ATOM  "
      open(unit=100,file="lines-tracefile.dat",status="unknown")
      open(unit=700,file="sasa-inputname.dat",status="unknown")

cc      open(unit=500,file="test.gro",status="unknown")  

        do i = 1,500
        read(700,*) f(i)
        enddo
        
        do j = 1,500
        read(100,*) ft(j)
c        print*, ft(j)
        enddo
        

        do i = 1,500
        open(unit=600,file= f(i),status="unknown")
        x = ft(i) + 1
c        print*, x
                do j = 1,x
                        write(600,*) j-1
                enddo
        enddo


        stop
        end






