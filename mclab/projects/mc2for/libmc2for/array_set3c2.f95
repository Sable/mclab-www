module mod_array_set3c2
contains
subroutine array_set3c2(array, value)
implicit none
double precision, dimension(:,:,:) :: array
double precision, dimension(:,:) :: value
integer :: i, td1, td2, td3, sd1, sd2, td3_tmp, td2_tmp, td1_tmp, sd2_tmp, sd1_tmp
!
! assign an n*n-by-3 array to an n-by-n-by-3 array.
!
td1 = size(array, 1); ! n
td2 = size(array, 2); ! n
td3 = size(array, 3); ! 3
sd1 = size(value, 1); ! n*n
sd2 = size(value, 2); ! 3
!print *, td1, td2, td3, sd1, sd2;
do i = 1, td1*td2*td3
  td3_tmp = i/(td1*td2)+1;
  td2_tmp = (i-(td3_tmp-1)*td1*td2)/td1+1;
  td1_tmp = i-(td3_tmp-1)*td1*td2-(td2_tmp-1)*td1;

  sd2_tmp = i/sd1+1;
  sd1_tmp = i-(sd2_tmp-1)*sd1;
  !print *, td1_tmp, td2_tmp, td3_tmp, sd1_tmp, sd2_tmp;
  array(td1_tmp, td2_tmp, td3_tmp) = value(sd1_tmp, sd2_tmp);
end do
!print *, shape(array);
end subroutine
end module
