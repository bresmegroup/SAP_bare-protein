      


   
        real x(7000), y(7000), z(7000), a(7000)
        real  b(7000)
        character(len=3) r(7000)
        character(len=5) at(7000)
        character(len=1) c(7000)
        character(len=4) p 
        integer n(7000), l(7000)
        real t(7000), m(7000)         
        integer i, d, q

        p = "ATOM  "
      open(unit=100,file="fab-mod.pdb",status="unknown")
      open(unit=200,file="contact-fab-res-new.dat",status="unknown")
      open(unit=300,file="fab-color-hip.pdb",status="unknown")
      open(unit=400,file="fab-color-hie.pdb",status="unknown")
c      open(unit=400,file="rdf-hip-his-fc-av.dat",status="unknown")
c        do i = 1,18
c        read(100,*) filename(i)
c        enddo
        do i = 1,443
        read(200,*) q, t(i), m(i)
        enddo

        do i =1,6596
      read(100,100) p,l(i),at(i),r(i),c(i),n(i),x(i),y(i),z(i),a(i),b(i)
      d = n(i)
      write(300,100)p,l(i),at(i),r(i),c(i),n(i),x(i),y(i),z(i),a(i),t(d)    
      write(400,100)p,l(i),at(i),r(i),c(i),n(i),x(i),y(i),z(i),a(i),m(d)  
100     format(a6, i5, a5, 1x, a3, 1x, a, i4, 4x, 3F8.3, 2F6.2)
        
        enddo
        stop
        end






