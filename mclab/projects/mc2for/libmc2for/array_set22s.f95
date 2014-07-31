module mod_array_set22s
contains

subroutine array_set22s(MM, kk, value)
implicit none
double precision, dimension(:,:) :: MM
integer, dimension(:,:) :: kk
double precision :: value
integer :: kk_new_1, kk_new_2, MM_new_1, MM_new_2, i, idx

kk_new_2 = 1;
MM_new_2 = 1;
do i = 1, size(kk)
  kk_new_1 = i - (kk_new_2-1)*size(kk,1);
  if (kk_new_1 > size(kk,1)) then
    kk_new_2 = kk_new_2 + 1;
    kk_new_1 = kk_new_1 - size(kk,1);
  end if
  idx = kk(kk_new_1, kk_new_2);
  MM_new_1 = idx - (MM_new_2-1)*size(MM, 1);
  if (MM_new_1 > size(MM,1)) then
    MM_new_2 = MM_new_2 + 1;
    MM_new_1 = MM_new_1 - size(MM,1);
  end if
  MM(MM_new_1, MM_new_2) = value;
end do

end subroutine

end module
