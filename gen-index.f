      


   
c        real x(6941,5000), y(6941,5000), z(6941,5000)
       
        integer r(6941)
        character(len=15) q(6941)
        character(len=3) l(6941,35000)
        character(len=15) m(6941)
c        character(len=20) f(100000)
        character(len=25) ft(500)
c        real, dimension(1:6941,1:6941,1:1000) :: d
c        real d2(8000,8000,8000)
        integer p(6941,5000), n(6941,35000), a(1:6941,0:35000)
        integer b(1:6941,0:35000)
                 
        integer i, j

cc        p = "ATOM  "
      open(unit=100,file="lines.dat",status="unknown")
      open(unit=700,file="output-filename.dat",status="unknown")
      open(unit=900,file="index-filename.dat",status="unknown")
      open(unit=600,file="input-tracefile.dat",status="unknown")  

cc      open(unit=500,file="test.gro",status="unknown")  

        do i = 1,6941
        read(100,*) r(i)
c        print*, r(i)
        enddo
        
        do i = 1,500
        read(600,*) ft(i)
        enddo
        

        do i = 1,6941
        read(700,*) q(i)
        enddo
        
        do i = 1,500
        read(900,*) m(i)
        enddo

        
        do i = 1,6941
c        print*,"Reading file for atom:", i
        b(i,0) = 0
        a(i,0) = 0  
        open(unit=800,file=q(i),status="unknown")
        do j = 1,r(i)
        read(800,*) a(i,j),b(i,j),l(i,j),n(i,j)
        enddo
        enddo

        do j = 1,500
        print*,"Writing index file for frame:",j
        open(unit=300,file= m(j),status="unknown")
        open(unit=10,file= ft(j),status="unknown")
        do i = 1,6941
        do k = 1,r(i)
        if (a(i,k) .eq. j) then
            if (a(i,k).ne.a(i,k-1).or.b(i,k).ne.b(i,k-1)) then
                write(300,*)"[ f",j,"at",i,"re",b(i,k),"]"
                write(10,*) i, b(i,k)
            else
            go to 10    
10          endif                
        write(300,*) n(i,k)
        else
        go to 200
200     endif
        enddo    
        enddo
        enddo   

        stop
        end






