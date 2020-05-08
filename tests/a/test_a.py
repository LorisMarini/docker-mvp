import pytest
from dockermvp.a.a_code import hello_world

def test_hello_world():

    hello_world()

    with pytest.raises(TypeError):
        hello_world(4)
        hello_world("name")
        hello_world({"key":"value"})
