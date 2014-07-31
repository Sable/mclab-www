MODULE mod_any
INTERFACE any
MODULE PROCEDURE any_dble
END INTERFACE any

CONTAINS

FUNCTION any_dble(matrix)
IMPLICIT NONE
DOUBLE PRECISION, DIMENSION(:,:), INTENT(IN) :: matrix
LOGICAL :: any_dble
INTEGER :: i, j

any_dble = .TRUE.;
DO i = 1, SIZE(matrix, 1)
  DO j = 1, SIZE(matrix, 2)
    IF (matrix(i,j) .EQ. 0) THEN
      any_dble = .FALSE.;
    END IF
  END DO
END DO

END FUNCTION any_dble

END MODULE mod_any
