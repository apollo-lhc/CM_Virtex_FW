import os
#Simple python script to parse emData into right format for loading rams in testbench
#loadfile(dir,slicename,datatype,binned,nevent)

debug = True

def loadfile(dir, slice, type,binned,nbits):
    if debug:
        print(dir, type, slice)
    if binned:
        nwords_list=[[[],[],[],[],[],[],[],[]],[[],[],[],[],[],[],[],[]]]
    else:
        nwords_list=[[],[]]
    for path, subdirs, files in os.walk(dir):
        for filename in files:
            nentries=""
            nevent = 0
            if (type in filename) and (slice in filename) and ("MOD" in filename):
                if debug:
                    print(filename)
                f = os.path.join(path, filename)
                fread = open(f,"r")
                nl = 0
                nwords = 0
                nbin=0
                if binned:
                    Nline = 16
                else:
                    Nline = 128
                for line in fread:
                    if line != "0\n":
                        if debug:
                            print(line)
                            print("{0:#0{1}x}".format(nwords,nbits))
                        nwords += 1
                    nl += 1
                    if nl == Nline:
                        if debug:
                            print(nwords)
                        if binned:
                            nwords_list[nevent][nbin].append(''"{0:#0{1}b}"''.format(nwords,nbits)) #'''"{0:#0{1}x}"'''.format(nwords,nbits))
                        else:
                            nwords_list[nevent].append(''"{0:#0{1}b}"''.format(nwords,nbits))
                        nentries+=''","''+"{0:#0{1}b}".format(nwords,nbits)+'''"'''
                        nl = 0
                        nwords = 0
                        if binned:
                            nbin += 1
                            if nbin == 8:
                                nbin=0
                                nevent +=1
                        else:
                            nevent += 1
                fread.close()
#                print(nentries)
        for event in nwords_list:
            if binned:
                for bins in event:
                    print(bins)
            else:
                print(event)
            print("\n")

#loadfile("emData/","L3PHID", "TrackletProjections", False, 10)
# loadfile("emData/","L3PHIA", "AllStubs", False, 10)
# loadfile("emData/","L3PHIB", "AllStubs", False, 10)
# loadfile("emData/","L3PHIC", "AllStubs", False, 10)
# loadfile("emData/","L3PHID", "AllStubs", False, 10)
#loadfile("emData/","L3PHID", "VMStubs", True, 6)
loadfile("emData/","L5L6", "FullMatches", False, 10)



