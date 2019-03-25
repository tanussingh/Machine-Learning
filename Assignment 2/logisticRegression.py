'''
#BY: TANUSHRI SINGH
#NETID: TTS150030
#CS 6375.001 - MACHINE LEARNING
#ASSIGNMENT 2
#INSTRUCTOR - ANJUM CHIDA
'''

#Import Libaries
import os
import sys
import math

class logisticRegression:
    trainPath = 'train'
    testPath = 'test'
    learningRate = 0.001
    weights = {}

    def __init__(object, function, rounds, useStopWords):
        object.listOfMap = []
        object.listOfClass = []
        object.setOfWords = None
        object.stopWords = []
        object.useStopWords = bool(useStopWords)
        object.function = function
        object.rounds = rounds

    #TRAIN FUNCTION
    def train(object):
        numOfSpam, listOfSpam = object.initialList(object.trainPath + '/spam')
        numOfHam, listOfHam = object.initialList(object.trainPath + '/ham')

        #Set setOfWords by aggregating list of spam and ham
        object.setOfWords = set(listOfSpam + listOfHam)

        # To Remove empty strings from setOfWords
        if '' in object.setOfWords:
            object.setOfWords.remove('')

        # use stopWords
        if object.useStopWords:
            object.stopWords = object.readInStopWords()
            for word in object.stopWords:
                if word in object.setOfWords:
                    object.setOfWords.remove(word)

        #Set initial weights to zero
        object.weights['zero'] = 0.0
        for val in object.setOfWords:
            object.weights[val] = 0.0

        object.initialMapList(object.trainPath + '/spam', 'spam')
        object.initialMapList(object.trainPath + '/ham', 'ham')

        for val in range(object.rounds):
            print('Round/ Iteration -> %d' % (val))
            for word in object.weights:
                totalVal = 0.0
                for i in range(len(object.listOfClass)):
                    case = object.listOfMap[i]

                    if word in case:
                        nameOfClass = object.listOfClass[i]
                        valueOfY = 1 if nameOfClass == 'spam' else 0
                        probability = object.calculate(case, 'spam')
                        totalVal += float(case[word] * (valueOfY - probability))

                object.weights[word] += (
                        object.learningRate * totalVal - float(object.function) * object.learningRate * object.weights[word])

    #TEST FUNCTION
    def test(object):

        numOfSpam, listOfSpam = object.initialList(object.testPath + '/spam')
        numOfHam, listOfHam = object.initialList(object.testPath + '/ham')

        # clear train data
        object.listOfClass = []
        object.listOfMap = []
        object.setOfWords = None
        object.setOfWords = set(listOfSpam + listOfHam)

        # delete empty string
        if '' in object.setOfWords:
            object.setOfWords.remove('')

        # use stopWords
        if object.useStopWords:
            object.stopWords = object.readInStopWords()
            for word in object.stopWords:
                if word in object.setOfWords:
                    object.setOfWords.remove(word)

        object.initialMapList(object.testPath + '/spam', 'spam')
        object.initialMapList(object.testPath + '/ham', 'ham')

        #Initialize success rates to zero
        spamSuccess = 0
        hamSuccess = 0
        overallSuccess = 0

        for i in range(len(object.listOfClass)):
            case = object.listOfMap[i]
            nameOfClass = object.listOfClass[i]
            returnType = object.guessTypeOfMail(case)
            if returnType == nameOfClass:
                overallSuccess += 1
                if nameOfClass == 'spam':
                    spamSuccess += 1
                else:
                    hamSuccess += 1

        #Calculate success rates
        spamSuccess = spamSuccess * 1.0 / numOfSpam
        hamSuccess = hamSuccess * 1.0 / numOfHam
        overallSuccess = overallSuccess * 1.0 / (numOfSpam + numOfHam)

        #Return sucess rates
        return spamSuccess, hamSuccess, overallSuccess

    # see if proportion of spam or ham is higher
    def guessTypeOfMail(object, case):
        proportionOfSpam = object.calculate(case, 'spam')
        proportionOfHam = 1 - proportionOfSpam
        #Return whichever one is bigger
        if proportionOfSpam > proportionOfHam:
            return 'spam'
        else:
            return 'ham'

    # calculate weights
    def calculate(object, case, nameOfClass):
        weight = object.weights['zero']

        for word in case:
            if word not in object.weights:
                object.weights[word] = 0.0
            weight += object.weights[word] * float(case[word])

        exponentialWeight = math.exp(float(weight))
        signmoidWeight = exponentialWeight / (1 + exponentialWeight)

        if nameOfClass == 'spam':
            return signmoidWeight
        return (1 - signmoidWeight)

    def initialMapList(object, directory, classtype):
        contentOfFile = os.listdir(directory)
        #If no content is present return null
        if not contentOfFile:
            return

        for filename in contentOfFile:
            temporaryMap = {}
            with open(directory + '/' + filename, 'r', encoding='utf-8', errors='ignore') as val:
                tempVal = val.read().lower().replace('\n', ' ').split(' ')
                for word in tempVal:
                    if word in object.setOfWords:
                        if word not in temporaryMap:
                            temporaryMap[word] = 0
                        temporaryMap[word] += 1

            #Add values to map and class
            object.listOfMap.append(temporaryMap)
            object.listOfClass.append(classtype)

    def initialList(object, directory):
        contentOfFile = os.listdir(directory)
        #Return null if empty
        if not contentOfFile:
            return

        message = []
        for filename in contentOfFile:
            with open(directory + '/' + filename, 'r', encoding='utf-8', errors='ignore') as val:
                val = val.read().lower()
                temp = val.replace('\n', ' ').split(' ')
                message = message + temp
        return len(contentOfFile), message

    #Read in StopWords
    def readInStopWords(object):
        with open('stopWords.txt') as val:
            readFile = val.read().lower().replace('\n', ' ').split(' ')
        return readFile

#MAIN FUNCTION
def main(function, rounds, useStopWords):
    #Train with Logistic Regression
    lr = logisticRegression(function, rounds, useStopWords)
    lr.train()

    #Test with logistic Regression
    spamSuccess, hamSuccess, overallSuccess = lr.test()

    #Output Results
    print('********************** -------- **********************')
    print('The Ratio of Success For Spam Emails -> %.4f%%' % (spamSuccess * 100))
    print('The Ratio of Success For Ham Emails -> %.4f%%' % (hamSuccess * 100))
    print('The Ratio of Success For All Emails -> %.4f%%' % (overallSuccess * 100))
    print('********************** -------- **********************')

#PARAMETER DECLARATION
if __name__ == "__main__":
    useStopWords = False
    if sys.argv[3].lower() == 'true':
        useStopWords = True
    function = sys.argv[1]
    rounds = sys.argv[2]
    main(float(function), int(rounds), useStopWords)
