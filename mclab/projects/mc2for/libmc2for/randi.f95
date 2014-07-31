MODULE mod_randi
INTERFACE randi
MODULE PROCEDURE randi_iii, randi_dii, randi_i, randi_d ! may be more
END INTERFACE randi

CONTAINS

FUNCTION randi_iii(scalar, dim1, dim2)
IMPLICIT NONE
INTEGER :: scalar, dim1, dim2
DOUBLE PRECISION, DIMENSION(dim1, dim2) :: randi_iii
DOUBLE PRECISION :: step
DOUBLE PRECISION :: minstep

CALL RANDOM_NUMBER(randi_iii);
randi_iii = INT(randi_iii*10);
step = MAXVAL(randi_iii) / scalar;
randi_iii = INT(randi_iii / step);

END FUNCTION randi_iii

FUNCTION randi_dii(scalar, dim1, dim2)
IMPLICIT NONE
DOUBLE PRECISION :: scalar
INTEGER :: dim1, dim2
DOUBLE PRECISION, DIMENSION(dim1, dim2) :: randi_dii
DOUBLE PRECISION :: step
DOUBLE PRECISION :: minstep

CALL RANDOM_NUMBER(randi_dii);
randi_dii = INT(randi_dii*10);
step = MAXVAL(randi_dii) / scalar;
randi_dii = INT(randi_dii / step);

END FUNCTION randi_dii

FUNCTION randi_i(scalar)
IMPLICIT NONE
INTEGER, PARAMETER :: seed = 86456
INTEGER :: scalar, scalar_bk
DOUBLE PRECISION :: randi_i

scalar_bk = scalar;
CALL SRAND(seed)
randi_i = irand();
scalar_bk = randi_i / scalar_bk;
randi_i = INT(randi_i / scalar_bk);

END FUNCTION randi_i

FUNCTION randi_d(scalar)
IMPLICIT NONE
INTEGER, PARAMETER :: seed = 86456
DOUBLE PRECISION :: scalar, scalar_bk
DOUBLE PRECISION :: randi_d

scalar_bk = scalar;
CALL SRAND(seed)
randi_d = irand();
scalar_bk = randi_d / scalar_bk;
randi_d = INT(randi_d / scalar_bk);

END FUNCTION randi_d

END MODULE mod_randi
