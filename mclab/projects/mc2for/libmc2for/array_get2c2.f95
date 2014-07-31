module mod_array_get2c2
contains

function array_get2c2(arr, matrix)
implicit none
double precision, dimension(:,:) :: arr
double precision, dimension(:,:) :: matrix
double precision, dimension(size(arr,1), size(matrix)) :: array_get2c2
integer :: ii, i, matrix_new_2, matrix_new_1, idx
! arr(:, matrix)
do ii = 1, size(arr,1)
  matrix_new_2 = 1;
  do i = 1, size(matrix)
    matrix_new_1 = i - (matrix_new_2-1)*size(matrix, 1);
    if (matrix_new_1 > size(matrix,1)) then
      matrix_new_2 = matrix_new_2 + 1;
      matrix_new_1 = matrix_new_1 - size(matrix,1);
    end if
    !print *, matrix_new_1, matrix_new_2;
    idx = int(matrix(matrix_new_1, matrix_new_2));
    !print *, ii, idx;
    array_get2c2(ii, i) = arr(ii, idx);
    !print *, arr(ii, idx);
  end do
end do
end function

end module
