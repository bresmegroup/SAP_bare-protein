      


   
       
        integer r(5000)
        character(len=15) q(6590)
        character(len=3) l(7000,5000)
        character(len=45) m(500)
        character(len=40) f(6590)
c        integer ft(20000)
c        character(len=40) w(100000)
c        real, dimension(1:659,1:7000,1:5000) :: d
c        real d2(8000,8000,8000)
        integer p(50000), n(50000)
        integer b(1:7000,0:5000)
        integer x(7000)                 
        integer i, j
        real a(50000)

cc        p = "ATOM  "
      open(unit=700,file="sasa-atomwise-output.dat",status="unknown")
      open(unit=199,file="sasa-framewise-output.dat",status="unknown") 
      open(unit=130,file="lines-tracefile.dat",status="unknown") 
cc      open(unit=500,file="test.gro",status="unknown")  

        do i = 1,6590
        read(700,*) f(i)
        enddo

        do i = 1,500
        read(199,*) m(i)
        enddo
        
        do i = 1,500
        read(130,*) x(i)
        enddo

        do 10 i = 1,6590
        print*,i
        open(unit=600,file= f(i),status="unknown")
c        print*,j
        do 20 j = 1,500
        open(unit=900,file= m(j),status="unknown")
        do 30 k = 1,x(j)
        read(900,*) p(k), n(k), a(k)
        if (p(k) .eq. i) then
        write(600,*) p(k), j, n(k), a(k)
        else if (p(k) .gt. i) then
        go to 20      
        else
        go to 30
        endif 
30      enddo
20      enddo
10      enddo

        stop
        end





