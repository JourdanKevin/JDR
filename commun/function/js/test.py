def main():
    véhiculeArrive = {"direction" : "Nord", "traverser" : False}
    if (véhiculeArrive):
        arrive(véhiculeArrive)

def arrive(direction):
    feux = {"Nord" : False , "Sud" : False}# True = occupé; False = libre
    if (direction["direction"] = "Nord")
        feux["Sud"] = True
    else feux["Nord"] = True
    while not direction["traverser"]:
        if (SensorVéhiculeFiniDeTraverser):
            direction["traverser"] = True
            if (direction["direction"] = "Nord")
                feux["Sud"] = False
            else feux["Nord"] = False