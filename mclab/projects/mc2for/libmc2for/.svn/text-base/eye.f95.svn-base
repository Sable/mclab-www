MODULE mod_eye
INTERFACE eye
MODULE PROCEDURE eye_1 ! definitely more cases.
END INTERFACE eye

CONTAINS

FUNCTION eye_1(x)
IMPLICIT NONE
DOUBLE PRECISION, INTENT(IN) :: x
DOUBLE PRECISION, DIMENSION(INT(x),INT(x)) :: eye_1
integer :: i,j
do i = 1, int(x)
  do j = 1, int(x)
    if (i==j) then
      eye_1(i,j)=1.0;
    else
      eye_1(i,j)=0.0;
    end if
  end do
end do
END FUNCTION eye_1

END MODULE mod_eye
