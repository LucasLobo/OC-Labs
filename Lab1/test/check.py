file = open("acessos.log", "r")

lines = file.readlines()
numberOfLines = len(lines)
fractions = 10

for offset in range(3,5):
    print("Blocksize:", 2**offset)
    for index in range(4,8):
        tag = 24-offset-index
        counter = 0
        for lineIndex in range(0, numberOfLines, 8):
            line = lines[lineIndex]
            address = line[9:33]
            begin = 512 * ((lineIndex // 512)) + 1
            end = 512 * ((lineIndex // 512) + 1)

            tags = set()
            for secondLineIndex in range(begin, end, 2):
                secondLine = lines[secondLineIndex]
                secondAddress = secondLine[9:33]
                if address[tag:tag + index] == secondAddress[tag:tag + index] and address[0:tag] != secondAddress[0:tag]:
                    tags.add(address[0:tag])
                    tags.add(secondAddress[0:tag])

            for secondLineIndex in range(lineIndex + 8, 512 * ((lineIndex // 512) + 1), 8):
                secondLine = lines[secondLineIndex]
                if line[tag:tag + index] == secondLine[tag:tag + index] and line[0:tag] != secondLine[0:tag]:
                    tags.add(address[0:tag])
                    tags.add(secondAddress[0:tag])

            if (len(tags) >= 2 ** (7-index)):
                counter += 1

        print("ways(",2 ** (7-index),"): ",counter)
