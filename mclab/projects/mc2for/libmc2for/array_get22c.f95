module mod_array_get22c
contains

function array_get22c(arr, matrix)
implicit none
double precision, dimension(:,:) :: arr
double precision, dimension(:,:) :: matrix
double precision, dimension(size(matrix,1)*size(matrix,2), size(arr,2)) :: array_get22c
integer :: ii, i, matrix_new_2, matrix_new_1, idx
! arr(matrix, :)
do ii = 1, size(arr,2)
  matrix_new_2 = 1;
  do i = 1, size(matrix)
    matrix_new_1 = i - (matrix_new_2-1)*size(matrix, 1);
    if (matrix_new_1 > size(matrix,1)) then
      matrix_new_2 = matrix_new_2 + 1;
      matrix_new_1 = matrix_new_1 - size(matrix,1);
    end if
    !print *, matrix_new_1, matrix_new_2;
    idx = int(matrix(matrix_new_1, matrix_new_2));
    !print *, idx, ii;
    array_get22c(i, ii) = arr(idx, ii);
    !print *, arr(idx, ii);
  end do
end do
end function

end module
