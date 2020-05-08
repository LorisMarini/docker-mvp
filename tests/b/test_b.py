import pytest
from dockermvp.b.b_code import *

def test_sum_numbers():

    sum_numbers(2,5)

    with pytest.raises(TypeError):
        sum_numbers()
        sum_numbers(3)
        sum_numbers(5,"7")
