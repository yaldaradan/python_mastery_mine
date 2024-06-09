def portfolio_cost(filename):
    cost = 0
    with open(filename, 'r') as f:
        for line in f:
            arr = line.split()
            #cost += (int(arr[1]) * float(arr[2]))
            try:
                cost += (int(arr[1])*float(arr[2]))
            except ValueError as e:
                print("Couldn't parse", line)
                print("reason:", e)
    return cost


print(portfolio_cost('/Users/yaldaradan/Downloads/stock_data.txt'))


