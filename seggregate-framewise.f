      


   
       
c        integer r(5000)
c        character(len=15) q(6941)
c        character(len=3) l(7000,5000)
        character(len=45) m(-1:500)
        character(len=40) f(500)
        integer ft(500)
        character(len=40) w(500)
c        real, dimension(1:659,1:7000,1:5000) :: d
c        real d2(8000,8000,8000)
        integer p(7000,50000), n(7000,50000)
c        integer b(1:7000,0:5000)
c        integer x                 
        integer i, j
        real a(0:7000,-1:50000)

cc        p = "ATOM  "
      open(unit=100,file="lines-tracefile.dat",status="unknown")
      open(unit=900,file="sasa-outputname.dat",status="unknown")   
      open(unit=700,file="input-tracefile.dat",status="unknown")
      open(unit=199,file="sasa-framewise-output.dat",status="unknown")  
cc      open(unit=500,file="test.gro",status="unknown")  

        do i = 1,500
        read(700,*) f(i)
        enddo
        
        do j = 1,500
        read(100,*) ft(j)
c        print*, ft(j)
        enddo

        do i = 1,500
        read(900,*) m(i)
        enddo
        

        do i = 1,500
c        print*,"Reading frame:",i
        open(unit=600,file= f(i),status="unknown")
                do j = 1,ft(i)
                        read(600,*) p(i,j), n(i,j)
                enddo
        enddo

        do i = 1,500
        open(unit=130,file= m(i), status="unknown")
                do j = -1,ft(i),1
                        read(130,'(f9.3)',advance='no') a(i,j)
                enddo
        enddo


        do i = 1,500
c        print*,"Writing frame:",i
        read(199,*) w(i)
        open(unit=201,file= w(i),status="unknown")
                do j = 1,ft(i)
                        write(201,*) p(i,j), n(i,j), a(i,j)
                enddo
        enddo


        stop
        end






