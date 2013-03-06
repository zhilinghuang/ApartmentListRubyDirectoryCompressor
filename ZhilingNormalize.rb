
# main idea we add folder name, not including . and .. on to a list. Whenever we see a .., we take the last element on the list away. When we see . , we just ignore it.


#Zhiling Huang UCBerkeley Sophomore Summer Internship


def normalize(onedir = "")
	if onedir == ""
		""
	else
		firstcharacter = onedir[0,1] #we need to check what is the fist character   if it is "/", which means the root directory, we can't take it away
		inputarray = onedir.split(/\//)   #we can do this step because we know that no file name or folder name can include "/", even if you can name it with "/", in the system, it is stored with other character
		resultarray = []
		
		for x in inputarray
			if x != "."
				if x != ".."
					resultarray = resultarray + [x]
				else
					if resultarray.length>0
						if resultarray[resultarray.length-1,resultarray.length] != [".."]    #if it is not "..", then ".." and the directory cancells each other
							resultarray = resultarray[0,resultarray.length-1]
						else
							resultarray = resultarray+[x]        #else then it means .. is useful and can't be taken away
						end
					else
						resultarray = resultarray+[x]					#if it is not . and .., we temporarily add it to the list.  If there is a .. following, we take it away
						puts resultarray.length
					end
				end
			end
		end
		output = ""
		if firstcharacter == "/"										
			resultarray = resultarray[1,resultarray.length]
		end
		for z in resultarray
			output = output+"/"+z
		end

		if output.length == 0     
			if firstcharacter == "/"
				"/"
			else
				"."
			end
		else
			if firstcharacter == "/"
				output
			else
				output[1,output.length]
			end
		end
	end
end
val = gets
begin
	puts normalize(val)
	val = gets
end while val != nil

