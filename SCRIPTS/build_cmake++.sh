#!/bin/bash

# SCRIPT START

if [[ ( "$#" == 1 ) && ( "$1" == "-help" ) ]]; then
    echo "~~~~~~~~~~~ HELP MENU ~~~~~~~~~~~~"
    echo "----> HOW DOES IT WORK?"
    echo "DEF - A BASH SCRIPT THAT PERFORMS COMPILE/BUILD/LINK/LAUNCH OPERATIONS ON A C/C++ CMAKE-d DIRECTORY"
    echo "!THE OUTPUT FOLDER IS ROOTDIR/BUILD_CLANG_CMAKE - EXECUTABLES + BINARIES BUILT IN THE SAME DIRECTORY!"
    echo "" && echo "~~~~~~~~~~ COMMANDS / FLAGS ~~~~~~~~~~"
    
    echo "" && echo "IF YOU ARE NOT SURE WHAT TO RUN SPECIFICALLY:"
    echo "BUILD + LINK: bash build_cmake++.sh -delall -b -link"
    echo "LAUNCH: bash build_cmake++.sh -launch"
    echo "BUILD + LINK + LAUNCH: bash build_cmake++.sh -delall -b -link -launch"
    echo "BUILD + LINK + EXPORT: bash build_cmake++.sh -delall -b -link -export"
    
    echo "" && echo "-b ---> BUILDS ALL FILES IN SOURCE_CPP"
    echo "-delall ---> DELETES EVERYTHING IN CMAKE_BUILD_AND_BINARY_FILES (RECOMMENDED WHEN SWITCHING MACHINES OR FOR FULL REBUILD)"
    echo "-launch ---> LAUNCHES THE EXECUTABLE IF IT EXISTS"
    echo "-link ---> LINKS ALL .o FILES CREATED AT BUILD"
    
    
    echo "" && echo "BUILD OUTPUT PER OPERATION LOCATED IN ROOTDIR/CMAKE_BUILD_AND_BINARY_FILES/CMAKE_MESSAGES.txt"
    exit
fi
# We move to the directory containing the build files
cd ../CMAKE_BUILD_AND_BINARY_FILES/

for arg_u in "$@"; do
    if [[ "$arg_u" == "-b" || "$arg_u" == "-launch" ]]; then
        echo "~~~~~~~~~SECTION_BEGIN~~~~~~~~~" 2>&1 | tee ./CMAKE_MESSAGES.txt
        break
    fi
done
    

for arg in "$@"; do
    # We search for different libraries and build the .o files...
    if [[ "$arg" == "-delall" || "$arg" == "-da" || "$arg" == "-erase" || "$arg" == "-del" ]]; then
        echo "REMOVING ALL BUILD FILES FROM ROOTDIR/CMAKE_BUILD_AND_BINARY_FILES..." | tee -a ./CMAKE_MESSAGES.txt
        rm -rf ./* | tee -a ./CMAKE_MESSAGES.txt
    fi
done

for arg in "$@"; do
    # We search for different libraries and build the .o files...
    if [[ "$arg" == "-b" || "$arg" == "-build" ]]; then
        echo "BUILDING ALL FILES IN ROOTDIR/SOURCE/CPP" | tee -a ./CMAKE_MESSAGES.txt
        cmake ../SOURCE_CPP/ 2>&1 | tee -a ./CMAKE_MESSAGES.txt
    fi
done

for arg in "$@"; do
    # We try to link them into an executable and to generate it...
    if [[ "$arg" == "-link" || "$arg" == "-l" ]]; then
    
    	# DISASSEMBLING PROCESS
        echo "LINKING ALL FILES IN ROOTDIR/SOURCE_CPP AND CREATING EXECUTABLE..." | tee -a ./CMAKE_MESSAGES.txt
        make VERBOSE=1 | tee -a ./CMAKE_MESSAGES.txt
        
		# FOR DISASSEMBLING PROCESS
	
		echo "DISASSEMBLING THE EXECUTABLE USING objdump -D (FULL SECTION DISASSEMBLING)"
        objdump -D ./MY_CPP_PROJECT_CMAKE.exe > ./DISSASEMBLED_ALL.obj
        echo "DISASSEMBLING THE EXECUTABLE USING objdump -D (PARTIAL SECTION DISASSEMBLING)"
        objdump -d ./MY_CPP_PROJECT_CMAKE.exe > ./DISSASEMBLED.obj
		echo "DISASSEMBLING THE EXECUTABLE USING objdump -x (ALL HEADERS DISASSEMBLING)"
        objdump -x ./MY_CPP_PROJECT_CMAKE.exe > ./DISSASEMBLED_ALL_HEADERS.obj
		echo "DISASSEMBLING THE EXECUTABLE USING objdump -i (DIFFERENT INFORMATION)"
        objdump -i ./MY_CPP_PROJECT_CMAKE.exe > ./DISSASEMBLED_ALL_HEADERS.obj
		echo "DISASSEMBLING THE EXECUTABLE USING objdump -g (DEBUGGING)"
        objdump -g ./MY_CPP_PROJECT_CMAKE.exe > ./DISSASEMBLED_DEBUGGING.obj
		echo "DISASSEMBLING THE EXECUTABLE USING readelf -a (READING AN ELF EXECUTABLE)"
        readelf -a ./MY_CPP_PROJECT_CMAKE.exe > ./READELF_INFO.obj
		
        
        echo "CHANGING THE RPATH OF EVERY LIBRARY IN ./SHARED_LIBS/ TO FIRST SEARCH IN THE CURRENT DIRECTORY"
    	patchelf --force-rpath --set-rpath "\$ORIGIN" ./MY_CPP_PROJECT_CMAKE.exe
        
        echo "OUTPUTTING READELF AND OBJDUMP INFORMATION..."
    	readelf -a ./MY_CPP_PROJECT_CMAKE.exe > ./READELF_INFOS.txt && objdump -x ./MY_CPP_PROJECT_CMAKE.exe > ./OBJDUMP_INFOS.txt
    
    	# SHARED LIBRARIES DETERMINATION + COPYING
    	echo "REMOVING OLD LIBRARIES THE EXECUTABLE DEPENDED ON..."
    	rm -rf ./SHARED_LIBS/*
    	rm -rf ./GCC_COPIED_SHARED_LIBS.txt
    	echo "CALCULATING DEPENDENCIES AND COPYING ALL REQUIRED .so FILES (DYNAMIC LINK LIBRARIES)..."
    	mkdir ./SHARED_LIBS/
    	ldd ./MY_CPP_PROJECT_CMAKE.exe | grep "=> /" | awk '{print $3}' | xargs -I '{}' cp -v '{}' ./SHARED_LIBS/ 2>&1 | tee -a ./GCC_COPIED_SHARED_LIBS.txt
    	
    	echo "CHANGING THE RPATH OF EVERY LIBRARY IN ./SHARED_LIBS/ TO FIRST SEARCH IN THE CURRENT DIRECTORY"
    	patchelf --force-rpath --set-rpath "\$ORIGIN" ./SHARED_LIBS/*.so*
    	
    fi
done

for arg in "$@"; do
    # We try to launch the executable...
    if [[ "$arg" == "-launch" || "$arg" == "-exe" ]]; then
        echo "LAUNCHING THE EXECUTABLE..." | tee -a ./CMAKE_MESSAGES.txt
        ./MY_CPP_PROJECT_CMAKE.exe
    fi
done

for arg in "$@"; do
    # BUILDING AN EXPORT PACKAGE FOR THE APP TO BE USED LATER...
    if [[ "$arg" == "-export" || "$arg" == "-exp" || "$arg" == "-push" ]]; then
		echo "~~~~STARTING PROJECT CREATION PROCESS~~~~"
    	echo "SEARCHING IF THE EXECUTABLE IS AVAILABLE..."
    	if [[ -f "./MY_CPP_PROJECT_CMAKE.exe" ]]; then
    		echo "EXECUTABLE FOUND IN ./MY_CPP_PROJECT_CMAKE.exe"
   			echo "REMOVING THE ALREADY-CREATED EXPORT IF IT EXISTS..."
   			rm -rf ./GCC_PROJECT_TO_BE_EXPORTED/
   			mkdir ./GCC_PROJECT_TO_BE_EXPORTED
   			echo "~~~~~~~~~~EXPORTED PROJECT MESSAGES + WHAT IT CONTAINS~~~~~~~~~" > ./GCC_PROJECT_TO_BE_EXPORTED/EXPORT_DELIVERIES.txt && echo "" >> ./GCC_PROJECT_TO_BE_EXPORTED/EXPORT_DELIVERIES.txt
   			echo "REMOVING THE ALREADY-EXISTING ../BIN_GCC/SHARED_LIBS/ AND CREATING A NEW FOLDER WITH THE SAME NAME..."
   			rm -rf ./SHARED_LIBS
   			mkdir ./SHARED_LIBS
   			echo "CALCULATING DEPENDENCIES AND CREATING ALL REQUIRED .so FILES (DYNAMIC LINK LIBRARIES) TO THE SHARED LIBS FOLDER..."
   			echo "~FOUND THE FOLLOWING .so FILES THE EXECUTABLE DEPENDS ON~" >> ./GCC_PROJECT_TO_BE_EXPORTED/EXPORT_DELIVERIES.txt
   			ldd ./MY_CPP_PROJECT_CMAKE.exe | grep "=> /" | awk '{print $3}' | xargs -I '{}' cp -v '{}' ./SHARED_LIBS/ 2>&1 | tee -a ./GCC_PROJECT_TO_BE_EXPORTED/EXPORT_DELIVERIES.txt
   			
   			# COPYING SHARED LIBS FROM THE SHARED LIBS DIRECTORY
    		echo "COPYING SHARED LIBS FROM THE SHARED LIBS DIRECTORY + EXECUTABLE..."
  			cp ./SHARED_LIBS/* ./GCC_PROJECT_TO_BE_EXPORTED
  			cp ./MY_CPP_PROJECT_CMAKE.exe ./GCC_PROJECT_TO_BE_EXPORTED/MY_CPP_PROJECT_CMAKE.exe
  			echo "~DONE COPYING ENUMERATED FILES FILES~"
  			
  			
  			# COPYING INFORMATION RELATED TO EXECUTABLE + DISASSEMBLE USING OBJUMP AND READELF
      		cp ./OBJDUMP_INFOS.txt  ./GCC_PROJECT_TO_BE_EXPORTED/
      		cp ./READELF_INFOS.txt  ./GCC_PROJECT_TO_BE_EXPORTED/     
  			#echo "SETTING THE RPATH OF THE EXECUTABLE..."
  			#patchelf --set-rpath '$ORIGIN/' ../BIN_GCC/GCC_PROJECT_TO_BE_EXPORTED/EXECUTABLE.exe
  		
  			echo "DISSASEMBLING ALL SECTIONS OF THE EXECUTABLE..."
    		objdump -D ./GCC_PROJECT_TO_BE_EXPORTED/MY_CPP_PROJECT_CMAKE.exe > ./GCC_PROJECT_TO_BE_EXPORTED/DISSASEMBLED_ALL.obj
    		echo "FULLY DISASSEMBLED EXECUTABLE. THE RESULTS ARE IN DISSASEMBLED_ALL.obj" 2>&1 | tee -a ./GCC_PROJECT_TO_BE_EXPORTED/EXPORT_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED_ALL.obj"
    	
    		echo "PARTLY DISSASEMBLING THE EXECUTABLE..."
    		objdump -d ./GCC_PROJECT_TO_BE_EXPORTED/MY_CPP_PROJECT_CMAKE.exe > ./GCC_PROJECT_TO_BE_EXPORTED/DISSASEMBLED.obj
    		echo "PARTLY DISASSEMBLED EXECUTABLE." 2>&1 | tee -a ./GCC_PROJECT_TO_BE_EXPORTED/EXPORT_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED.obj"

    		objdump -x ./GCC_PROJECT_TO_BE_EXPORTED/MY_CPP_PROJECT_CMAKE.exe > ./GCC_PROJECT_TO_BE_EXPORTED/DISSASEMBLED_ALL_HEADERS.obj
    		echo "DISSASSEMBLED ALL HEADERS OF THE EXECUTABLE." 2>&1 | tee -a ./GCC_PROJECT_TO_BE_EXPORTED/EXPORT_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED_ALL_HEADERS.obj"

    		objdump -i ./GCC_PROJECT_TO_BE_EXPORTED/MY_CPP_PROJECT_CMAKE.exe > ./GCC_PROJECT_TO_BE_EXPORTED/DISSASEMBLED_INFO.obj
    		echo "OUTPUTTING DIFFERENT INFORMATION ABOUT THE EXECUTABLE." 2>&1 | tee -a ./GCC_PROJECT_TO_BE_EXPORTED/EXPORT_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED_INFO.obj"

    		objdump -g ./GCC_PROJECT_TO_BE_EXPORTED/MY_CPP_PROJECT_CMAKE.exe > ./GCC_PROJECT_TO_BE_EXPORTED/DISSASEMBLED_DEBUGGING.obj
    		echo "OUTPUTTING DISASSEMBLY DEBUGGING INFORMATION ABOUT THE EXECUTABLE." 2>&1 | tee -a ./GCC_PROJECT_TO_BE_EXPORTED/EXPORT_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED_DEBUGGING.obj"

			readelf -a ./GCC_PROJECT_TO_BE_EXPORTED/MY_CPP_PROJECT_CMAKE.exe > ./GCC_PROJECT_TO_BE_EXPORTED/READELF_INFO.obj
    		echo "OUTPUTTING DISASSEMBLY INFORMATION ABOUT THE EXECUTABLE." 2>&1 | tee -a ./GCC_PROJECT_TO_BE_EXPORTED/EXPORT_DELIVERIES.txt
    		echo "OUTPUT IN READELF_INFO.obj"

			# DONE WITH THE DISASSEMBLING PROCESS

    		echo "GENERATING MIT LICENSE..."
    		
    		printf '%s\n' \
    		"Copyright (c) 2012-2021 MatthewAlgo (MattD)" \
    		"" \
			"Permission is hereby granted, free of charge, to any person obtaining" \
			"a copy of this software and associated documentation files (the" \
			"~Software~), to deal in the Software without restriction, including" \
			"without limitation the rights to use, copy, modify, merge, publish," \
			"distribute, sublicense, and/or sell copies of the Software, and to"  \
			"permit persons to whom the Software is furnished to do so, subject to" \
			"the following conditions:" \
			"" \
			"The above copyright notice and this permission notice shall be" \
			"included in all copies or substantial portions of the Software." \
			"" \
			"THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND," \
			"EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF" \
			"MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND" \
			"NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE" \
			"LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION" \
			"OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION" \
			"WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE." \
    		2>&1 | tee -a ./GCC_PROJECT_TO_BE_EXPORTED/MIT_LICENSE.md
    		
    		echo "" && echo ""
    		echo "ARCHIVING FOLDER INTO A ZIP ARCHIVE..." && echo ""

   			zip -r GCC_PROJECT_TO_BE_EXPORTED.zip GCC_PROJECT_TO_BE_EXPORTED/* 2>&1 | tee -a ./GCC_PROJECT_TO_BE_EXPORTED/EXPORT_DELIVERIES.txt

			echo "" && echo ""
   			echo "ARCHIVING FOLDER INTO A TAR ARCHIVE..." && echo ""
   			tar -czvf GCC_PROJECT_TO_BE_EXPORTED.tar.gz GCC_PROJECT_TO_BE_EXPORTED/* 2>&1 | tee -a ./GCC_PROJECT_TO_BE_EXPORTED/EXPORT_DELIVERIES.txt
   		
    		echo "~~~~~DONE~~~~~"
    		echo "~~~~EOF~~~~" >> ./GCC_PROJECT_TO_BE_EXPORTED/EXPORT_DELIVERIES.txt
   			
    	fi

	fi
done

exit
