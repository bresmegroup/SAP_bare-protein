
   
        real x(20116,10000), y(20116,10000), z(20116,10000)
       
        character(len=15) r(10000)
        character(len=15) q(20116)
        character(len=3) l(20116,10000)
        character(len=8) m(20116,10000)
        character(len=20) f(100000)
        real d
c        real d2(8000,8000,8000)
        integer p(0:20116,10000), n(20116,10000)
        integer resno(0:20116)         
        integer i, j
        integer natom, sa(20000), e

cc        p = "ATOM  "
      open(unit=100,file="input-filename.dat",status="unknown")
      open(unit=700,file="output-filename.dat",status="unknown")
      open(unit=199,file="sequence.dat",status="unknown")  
c      open(unit=900,file="index-filename.dat",status="unknown")
      open(unit=110,file="sidechain.dat",status="unknown")
cc      open(unit=500,file="test.gro",status="unknown")  

        do i = 1,500
        read(100,*) r(i)
        enddo
        
        do i = 1,6941
        read(700,*) q(i)
        enddo
        
        do i = 1,4351
        read(110,*) sa(i)
        enddo
        p(0,1) = 0


        
        do 23 j = 1,500
        print*, "reading frame:", j
          open(unit=200,file= r(j),status="unknown")
          do 17 i = 1,6941
          read(200,100) p(i,j),l(i,j),m(i,j),n(i,j),x(i,j),y(i,j),z(i,j)
          natom = 0
        if (j .eq. 1) then
                if(p(i,j) .ne. p(i-1,j)) then
                        write(199,*) p(i,j),l(i,j)
                        natom = 0
                else
                        natom = natom + 1
                endif
                
        else
        endif
          
cc          write(500,100)p(i,j),l(i,j),m(i,j),n(i,j),x(i,j),y(i,j),z(i,j)
17        enddo
23      enddo        
         

c       do i = 1,20116
c       print*,i
c       do j = 1,500
c       do k = 1,20116
c       d(i,k,j)=(x(i,j)-x(k,j))**2+(y(i,j)-y(k,j))**2+(z(i,j)-z(k,j))**2
c       d(i,k,j) = sqrt(d(i,k,j))
c       enddo
c       enddo
c       enddo


c       do 11 i = 1,20116
c       print*,i
c       do 12 j = 1,500
c        read(1100,*) 
c       do 10 k = 1,20116
c        read(1100,*) sa(k)
c       e = sa(k)
c       d=(x(i,j)-x(k,j))**2+(y(i,j)-y(k,j))**2+(z(i,j)-z(k,j))**2
c       d= sqrt(d)
c        if (k .ne. i) then
c        if (d .le. 0.5) then
c        write(600,*) j, p(k,j),l(k,j), n(k,j)
c        write(950,*) n(q,j)
c        else
c        go to 200
c200     endif
c        else
c        go to 10
c        endif
c10      enddo
c12      enddo
c        print*,"finished: atom",i
c11      enddo
c
c100      format(i5, a3, a8, i5, 3F8.3)



        do i = 1,6941
c        print*,"writing file:", q(i)        
        open(unit=600,file= q(i), status="unknown")
        do j = 1,500
c        open(unit=950,file= f(j),status="unknown",access="append")
c        write(950,*) "[ atom",i,"frame",j,"  ]"
        do k = 1,4351
        e = sa(k)
        d=(x(i,j)-x(e,j))**2+(y(i,j)-y(e,j))**2+(z(i,j)-z(e,j))**2
        d= sqrt(d)

c        if (k .ne. i .and. p(k,j) .ne. p(i,j)) then
        if (k .ne. i) then
        if (d .le. 0.5) then 
        write(600,*) j, p(e,j),l(e,j), n(e,j)
c        write(950,*) n(k,j)
        else
        go to 200
200     endif
        else
        go to 10
        endif
10      enddo
c        write(600,*) ""
        enddo
        print*,"finished: atom",i
        enddo        
 
100      format(i5, a3, a7, i5, 3F8.3) 





        stop
        end






