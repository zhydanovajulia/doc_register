
# N - 1st number == N / 57

n = 57
x = 0

while True:
  # print("x * 57 = ", x * 70)
  # print("x = ", x)
  # print("n = ", n)

  if x * 57 == n:
    print(" Solution: ", n)
    break

  n = n+1
  i = 10
  # print("n++ = ", n)
  while True:
    if n / i > 0:
      x = n / i
      i = i * 10
    else:
      i = i/10
      # print('i = ', i)
      break

  x = n % i


# for i in range(10000, 1000999):
  # if i % 9127 == 0:
    # print(i)
