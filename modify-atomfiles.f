      


   
       

        implicit none
        integer r(5000)
        character(len=4) q(6941)
        character(len=3) l(7000,5000)
        character(len=3) res(7000)
        real h(7000)
        real b(7000)
        real sap_fr(10000)
        character(len=45) m(7000)
        character(len=40) f(100000)
        character(len=40) g(6941)
        integer ft(20000)
        character(len=40) w(100000)
        integer resno(7000)
        character(len=3) resname(7000)
c        real, dimension(1:659,1:7000,1:5000) :: d
c        real d2(8000,8000,8000)
        integer p(7000), n(7000), s(7000)
c        integer b(1:7000,0:5000)
        integer x(7000)              
        integer natom   
        integer i, j, k
        real a(7000), sap(70000)

cc        p = "ATOM  "
      open(unit=700,file="sasa-atomwise-output.dat",status="unknown")
      open(unit=199,file="atomwise-mod-output.dat",status="unknown") 
      open(unit=130,file="lines-atomsfile.dat",status="unknown") 
      open(unit=900,file="sequence.dat",status="old")
cc      open(unit=500,file="test.gro",status="unknown")  

        do i = 1,6941
        read(700,*) f(i)
        enddo

        do i = 1,6941
        read(199,*) m(i)
        enddo
        
        do i = 1,6941
        read(130,*) x(i)
        enddo

        do i = 1,441
        read(900,100) r(i),q(i)
        enddo

        print*,"Adding residue names to atom files"

        do i = 1,6941
c        print*,"Adding residue names to atom file:", i
        open(unit=189,file= f(i),status="unknown")
        open(unit=139,file= m(i),status="unknown")
                do j = 1,x(i)
                read(189,*) p(j), n(j), s(j), a(j)
c                print*, s(j)
c                 print*,k        
                 do k = 1,461
c                 print*,k
c                 read(900,100) r(k), q(k)
c                 print*, r(k), q(k)
                 if (r(k).eq.s(j)) write(139,*) p(j),n(j),s(j),a(j),q(k)
c                    go to 10
c                     else
c                     go to 10
c                     endif                 
10               enddo
                enddo
        enddo

        open(unit=111,file="hydrophobicity.dat",status="unknown")
        open(unit=109,file="sap-calc-inputfiles.dat",status="unknown")        

        do i = 1,20
        read(111,*) res(i), h(i), b(i)
        enddo
        
        do i = 1,6941
        read(109,*) g(i)
        enddo

       print*,"Adding hydrophobicity & SASA information to atom files"

        do i = 1,6941
c        open(unit=600,file= f(i),status="unknown")
        open(unit=139,file= m(i),status="unknown")
        open(unit=189,file= g(i),status="unknown")
        do j = 1,x(i)
        read(139,*) p(j), n(j), s(j), a(j), q(j)
        do k = 1,20
      if (q(j).eq.res(k)) write(189,*)p(j),n(j),s(j),a(j),q(j),h(k),b(k)
        enddo
        enddo
        enddo       

         open(unit=153,file="sap-atomwise-raw.dat",status="unknown")

        do i = 1,6941
        read(153,*) m(i)
        enddo

        open(unit=303,file="sap-atomwise.dat",status="unknown")

       print*,"Residuewise SAP contriution for atom files"

        do 55 i = 1,6941
        sap(i) = 0.0
c       print*,"Residuewise SAP contriution for atom file:",i
        open(unit=189,file= g(i),status="unknown")      
        open(unit=213,file= m(i), status="unknown")
        do 99 j = 1,x(i)
        read(189,*) p(j),n(j),s(j),a(j),q(j),h(j),b(j)
        sap_fr(j) = (a(j)/b(j))*h(j)
        sap(i) = sap(i) + sap_fr(j)
        write(213,*) n(j), s(j), sap_fr(j)
99      enddo
        sap(i) = sap(i)/500
        write(303,*) i, sap(i)
55      enddo

cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

c          open(unit=117,file="frame1.gro",status="unknown")
c          open(unit=333,file="ressize.dat",status="unknown")
c          do 17 i = 1,6941
c          read(117,120) resno(i), resname(i)
c          print*, resno(i)
c17        enddo 
c
c          natom = 0
c          do 43 i = 1,6589
c                if(p(i) .ne. p(i+1)) then
c                        write(333,*) resno(i),resname(i),natom
c                        natom = 0
c                else
c                        natom = natom + 1
c                endif
c
c
c43        enddo
c
c120      format(i5, a3)

cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

100     format(i12, a4)
        stop
        end





