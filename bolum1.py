# BLP105 - Odev 1
# Bolum 1: Algoritma ve izleme

# Soru 1.1
numbers = [4, 7, 2, 9, 5, 1, 8]
total = 0
result = []

for i in range(len(numbers)):
    if numbers[i] % 2 == 0:
        total = total + numbers[i]
    else:
        result.append(numbers[i])

print(total)
print(result)


# Soru 1.2
readings = [18, 21, 23, 25, 24, 26, 27, 19, 20, 22, 23, 24, 25, 26]
threshold = 22

current = 0
longest = 0

for value in readings:
    if value > threshold:
        current = current + 1
        if current > longest:
            longest = current
    else:
        current = 0

print(longest)


# Soru 1.3
records = [
    {"student": "Ece", "course": "VTYS"},
    {"student": "Ali", "course": "Yapay Zeka"},
    {"student": "Ece", "course": "Yapay Zeka"},
    {"student": "Can", "course": "VTYS"},
    {"student": "Ali", "course": "VTYS"},
    {"student": "Ece", "course": "Robotik"},
]

course_counts = {}

for record in records:
    course = record["course"]

    if course in course_counts:
        course_counts[course] = course_counts[course] + 1
    else:
        course_counts[course] = 1

print(course_counts)