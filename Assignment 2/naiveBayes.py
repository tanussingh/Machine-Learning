'''
#BY: TANUSHRI SINGH
#NETID: TTS150030
#CS 6375.001 - MACHINE LEARNING
#ASSIGNMENT 2
#INSTRUCTOR - ANJUM CHIDA
'''

#Import Libraries
import os
import sys
import math

class naiveBayes:
    trainPath = 'train'
    testPath = 'test'

    def __init__(object, useStopWords):
        #Initialize parands to be empty
        object.mapOfHam = {}
        object.mapOfSpam = {}
        object.setOfWords = None
        object.numOfHam = 0
        object.numOfSpam = 0
        object.stopWords = []
        object.useStopWords = useStopWords

    #TRAINING FUNCTION
    def train(object):
        object.numOfSpam, listOfSpam = object.initialList(object.trainPath + '/spam')
        object.numOfHam, listOfHam = object.initialList(object.trainPath + '/ham')

        # This is to remove empty strings
        if '' in listOfSpam:
            listOfSpam.remove('')
        if '' in listOfHam:
            listOfHam.remove('')

        # Remove a word if it is one of the stop words
        if object.useStopWords:
            object.stopWords = object.readInStopWords()
            for word in object.stopWords:
                if word in listOfSpam:
                    listOfSpam.remove(word)
                if word in listOfHam:
                    listOfHam.remove(word)

        #Calculate length of both spam and ham
        lengthOfSpam = len(listOfSpam)
        lengthOfHam = len(listOfHam)

        #Aggregate Spam and Ham to get setOfWords
        object.setOfWords = set(listOfSpam + listOfHam)
        words_space_len = len(object.setOfWords)

        #Map the Spam's and Hams
        object.mapOfHam = object.initialMap(listOfHam)
        object.mapOfSpam = object.initialMap(listOfSpam)

        #Calculate total number of spams and hams
        countOfTotalSpam = lengthOfSpam + words_space_len
        countOfTotalHam = lengthOfHam + words_space_len

        for word in object.mapOfHam.keys():
            object.mapOfHam[word] = math.log2((object.mapOfHam[word] + 1) * 1.0 / countOfTotalHam)

        for word in object.mapOfSpam.keys():
            object.mapOfSpam[word] = math.log2((object.mapOfSpam[word] + 1) * 1.0 / countOfTotalSpam)

        #Return Values back
        return countOfTotalSpam, countOfTotalHam

    def test(object, countOfTotalSpam, countOfTotalHam):

        # spam
        contentOfFile = os.listdir(object.testPath + '/spam')

        if not contentOfFile:
            return

        TestNumOfSpam = len(contentOfFile)
        postValueOfSpam = 0

        for filename in contentOfFile:
            with open(object.testPath + '/spam' + '/' + filename, 'r', encoding='utf-8', errors='ignore') as val:
                value = val.read().lower().replace('\n', ' ').split(' ')
            proportionOfHam = math.log2(object.numOfHam * 1.0 / (object.numOfHam + object.numOfSpam))
            proportionOfSpam = math.log2(object.numOfSpam * 1.0 / (object.numOfHam + object.numOfSpam))

            # delete empty string
            if '' in value:
                value.remove('')
            # delete stopWords from list
            if object.useStopWords:
                for word in object.stopWords:
                    if word in value:
                        value.remove(word)

            for word in value:
                if word in object.mapOfSpam:
                    proportionOfSpam += object.mapOfSpam[word]
                else:
                    proportionOfSpam += math.log2(1 / countOfTotalSpam)

                if word in object.mapOfHam:
                    proportionOfHam += object.mapOfHam[word]
                else:
                    proportionOfHam += math.log2(1 / countOfTotalHam)

            if proportionOfSpam >= proportionOfHam:
                postValueOfSpam += 1

        spamSuccess = postValueOfSpam * 1.0 / TestNumOfSpam

        # ham
        contentOfFile = os.listdir(object.testPath + '/ham')

        if not contentOfFile:
            return

        testNumOfHam = len(contentOfFile)
        postValueOfHam = 0

        for filename in contentOfFile:
            with open(object.testPath + '/ham' + '/' + filename, 'r', encoding='utf-8', errors='ignore') as f:
                value = f.read().lower().replace('\n', ' ').split(' ')

            # delete empty string if they exist
            if '' in value:
                value.remove('')

            proportionOfHam = math.log2(object.numOfHam * 1.0 / (object.numOfHam + object.numOfSpam))
            proportionOfSpam = math.log2(object.numOfSpam * 1.0 / (object.numOfHam + object.numOfSpam))

            # delete stopWords from list
            if object.useStopWords:
                for word in object.stopWords:
                    if word in value:
                        value.remove(word)

            for word in value:
                if word in object.mapOfSpam:
                    proportionOfSpam += object.mapOfSpam[word]
                else:
                    proportionOfSpam += math.log2(1 / countOfTotalSpam)

                if word in object.mapOfHam:
                    proportionOfHam += object.mapOfHam[word]
                else:
                    proportionOfHam += math.log2(1 / countOfTotalHam)

            if proportionOfSpam <= proportionOfHam:
                postValueOfHam += 1

        hamSuccess = postValueOfHam * 1.0 / testNumOfHam
        totalSuccess = (postValueOfSpam + postValueOfHam) * 1.0 / (TestNumOfSpam + testNumOfHam)

        return spamSuccess, hamSuccess, totalSuccess

    def initialMap(object, listOfWords):
        value = {}
        for word in listOfWords:
            if word in value:
                value[word] += 1
            else:
                value[word] = 0
        return value

    def initialList(object, folder):
        contentOfFile = os.listdir(folder)
        if not contentOfFile:
            return
        message = []
        for filename in contentOfFile:
            with open(folder + '/' + filename, 'r', encoding='utf-8', errors='ignore') as val:
                value = val.read().lower().replace('\n', ' ').split(' ')
                message = message + value
        return len(contentOfFile), message

    def readInStopWords(object):
        with open('stopWords.txt') as file:
            value = file.read().lower().replace('\n', ' ').split(' ')
        return value

#MAIN FUNCTION
def main(stopWords):
    #Call NaiveBayes Functionalities
    nb = naiveBayes(stopWords)
    totalCountOfSpam, totalCountOfHam = nb.train()

    #Call classify to retrieve results on how the algorithm performed
    spamSuccess, hamSuccess, overallSuccess = nb.test(totalCountOfSpam, totalCountOfHam)
    print('********************** -------- **********************')
    print('The Ratio of Success For Spam Emails -> %.4f%%' %(spamSuccess*100))
    print('The Ratio of Success For Ham Emails -> %.4f%%' %(hamSuccess*100))
    print('The Ratio of Success For All Emails -> %.4f%%' %(overallSuccess*100))
    print('********************** -------- **********************')

#PARAMETER DECLARATION
if __name__ == "__main__":
    stopWords = False
    if sys.argv[1].lower() == 'true':
        stopWords = True
    main(stopWords)
