
def hello_world():
    print("Hello World")
    return True

def greetings(name:str):

    if not isinstance(name, str):
        raise TypeError(f"expected name of type string, passed {type(name)}")

    print(f"Hi {name}!")
    return True
