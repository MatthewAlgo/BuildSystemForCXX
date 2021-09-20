#/cLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/bash

# SCRIPT START

if [[ ( "$#" == 1 ) && ( "$1" == "-help" ) ]]; then
    echo "~~~~~~~~~~~ HELP MENU ~~~~~~~~~~~~"
    echo "----> HOW DOES IT WORK?"
    echo "DEF - A BASH SCRIPT THAT PERFORMS COMPILE/BUILD/LINK/LAUNCH OPERATIONS ON A C/C++ DIRECTORY"
    echo "!THE OUTPUT FOLDER IS ROOTDIR/CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES - EXECUTABLES + ASSEMBLED OBJECTS LOCATED IN ROOTDIR/CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES!"
    echo "" && echo "~~~~~~~~~~ COMMANDS / FLAGS ~~~~~~~~~~"

    echo "IF YOU ARE NOT SURE WHAT TO RUN SPECIFICALLY:"
    echo "BUILD + LINK: bash build_clang++.sh -erase -dexe -build -c17 -link"
    echo "LAUNCH: bash build_clang++.sh -launch"
    echo "BUILD + LINK + EXPORT: bash build_clang++.sh -erase -dexe -build -c17 -link -e"
    echo "BUILD + LINK + LAUNCH (DIRECT COMMAND): bash build_clang++.sh -bll -c17"
    echo "BUILD + LINK + LAUNCH: bash build_clang++.sh -blinklaunch -c17"
    echo "BUILD ONLY SELECTED FILES: bash build_clang++.sh -jbuild ..>FILES.cpp<.. -c17"

    echo "" && echo "-erase ---> DELETES ALL FILES IN ROOTDIR/CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES"
    echo "-dexe ---> DELETES EVERYTHING IN ROOTDIR/CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES"
    echo "-build -c11/-c14/-c17 ---> BUILDS ALL C++/CXX IN ROOTDIR/SOURCE_CPP USING STANDARD C++11/C++14/C++17"
    echo "-link ---> LINKS ALL .o FILES CREATED AT BUILD IN ROOTDIR/CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES"
    echo "-launch ---> LAUNCHES EXECUTABLE FROM ROOTDIR/CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXECUTABLE.exe"
    echo "-blinklaunch -c11/-c14/-c17 ---> ATTEMPTS TO REBUILD ALL FILES IN ROOTDIR/SOURCE_CPP, LINK THEM AND EXECUTE THE GENERATED EXECUTABLE"
    echo "-jbuild [FILES] -c11/-c14/-c17 ---> ONLY BUILDS SPECIFIED FILES FROM ROOTDIR/SOURCE_CPP"

    echo "" && echo "BUILD OUTPUT PER OPERATION LOCATED IN ROOTDIR/CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/*.txt AND ROOTDIR/CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/*.txt"
    exit
fi

declare -r LINKER_OPTIONS='-lsfml-graphics -lsfml-window -lsfml-audio -lsfml-system'
declare -r GTK4_OPTIONS_FOR_COMPILE=$(pkg-config --libs gtk4)
declare -r SFML_ALL_LINKER_OPTS=$(pkg-config --libs sfml-all)
declare -r BOOST_ALL_LINKER_OPTS=''
declare -r ASIO_ALL_LINKER_OPTS=''
declare -r PROTOBUF_ALL_LINKER_OPTS=$(pkg-config --libs protobuf)
declare -r OPENGL_ALL_LINKER_OPTS=$(pkg-config --libs opengl)
declare -r OPENCV_ALL_LINKER_OPTS=$(pkg-config --libs opencv4)

for arg in "$@"; do
  if [[ "$arg" == "-erase" ]]; then
      # echo "DELETING PREVIOUS BUILD FILES..." | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
      # echo "rm -rf ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/*" | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
      echo "DELETING PREVIOUS BUILD FILES..."
      echo "rm -rf ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/*"
      rm -rf ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/* # | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
      # elif [[ -z "$2" ]]; then
      # echo "OVERWRITING PREVIOUS BUILD FILES..." | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
  fi
  if [[ "$arg" == "-dexe" ]]; then
      echo "DELETING PREVIOUS EXECUTABLE FILE AND DISASSEMBLED FILES..."
      rm -rf ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/*
  fi
  if [[ "$arg" == "-build" ]]; then
    echo "BUILDING YOUR EXECUTABLE..." | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
    # echo "COMPILING ALL .cpp .cxx .c FILES..."
    # clang++ -v -g -Wall -Weverything -Wextra -c ../SOURCE_CPP/*.cpp ../SOURCE_CPP/*.cxx ../SOURCE_CPP/*.c
    for arg_build in "$@"; do
      if [[ "$arg_build" == "-C17" || "$arg_build" == "-c17" ]]; then
        echo "COMPILING ALL .cpp FILES USING C++ STANDARD 17..." | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
        echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cpp\")" | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
        for file in $(ls ../SOURCE_CPP | grep ".cpp"); do
          echo Building file $file into an .o object... | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
          clang++ -v -g -Wall -Weverything -Wextra -libstdc++17 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          echo "BUILDING DYNAMIC LIBRARY... " 2>&1 | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          clang++ -v -fPIC -shared ../SOURCE_CPP/$file ${LINKER_OPTIONS} -o ${file}.so 2>&1 | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt

        done

        echo "COMPILING ALL .cxx FILES USING C++ STANDARD 17..." | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
        echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cxx\")" | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
        for file in $(ls ../SOURCE_CPP | grep ".cxx"); do
          echo Building file $file into an .o object... | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
          clang++ -v -g -Wall -Weverything -Wextra -libstdc++17 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          echo "BUILDING DYNAMIC LIBRARY... " 2>&1 | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          clang++ -v -fPIC -shared ../SOURCE_CPP/$file ${LINKER_OPTIONS} -o ${file}.so 2>&1 | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt

        done
      elif [[ "$arg_build" == "-C14" || "$arg_build" == "-c14" ]]; then
        echo "COMPILING ALL .cpp FILES USING C++ STANDARD 14..." | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
        echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cpp\")" | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
        for file in $(ls ../SOURCE_CPP | grep ".cpp"); do
          echo Building file $file into an .o object... | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
          clang++ -v -g -Wall -Weverything -Wextra -libstdc++14 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          echo "BUILDING DYNAMIC LIBRARY... " 2>&1 | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          clang++ -v -fPIC -shared ../SOURCE_CPP/$file ${LINKER_OPTIONS} -o ${file}.so 2>&1 | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt

        done

        echo "COMPILING ALL .cxx FILES USING C++ STANDARD 14..." | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
        echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cxx\")" | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
        for file in $(ls ../SOURCE_CPP | grep ".cxx"); do
          echo Building file $file into an .o object... | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
          clang++ -v -g -Wall -Weverything -Wextra -libstdc++14 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          echo "BUILDING DYNAMIC LIBRARY... " 2>&1 | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          clang++ -v -fPIC -shared ../SOURCE_CPP/$file ${LINKER_OPTIONS} -o ${file}.so 2>&1 | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt

        done
      elif [[ "$arg_build" == "-C11" || "$arg_build" == "-c11" ]]; then
        echo "COMPILING ALL .cpp FILES USING C++ STANDARD 11..." | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
        echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cpp\")" | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
        for file in $(ls ../SOURCE_CPP | grep ".cpp"); do
          echo Building file $file into an .o object... | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
          clang++ -v -g -Wall -Weverything -Wextra -libstdc++11 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          echo "BUILDING DYNAMIC LIBRARY... " 2>&1 | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          clang++ -v -fPIC -shared ../SOURCE_CPP/$file ${LINKER_OPTIONS} -o ${file}.so 2>&1 | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt

        done

        echo "COMPILING ALL .cxx FILES USING C++ STANDARD 11..." | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
        echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cxx\")" | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
        for file in $(ls ../SOURCE_CPP | grep ".cxx"); do
          echo Building file $file into an .o object... | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
          clang++ -v -g -Wall -Weverything -Wextra -libstdc++11 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          echo "BUILDING DYNAMIC LIBRARY... " 2>&1 | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          clang++ -v -fPIC -shared ../SOURCE_CPP/$file ${LINKER_OPTIONS} -o ${file}.so 2>&1 | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt

        done
      # else
      #  echo "COMPILING ALL .cpp FILES USING C++ STANDARD 17..." | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
      #  echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cpp\")" | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
      #  for file in $(ls ../SOURCE_CPP | grep ".cpp"); do
      #    echo Building file $file into an .o object... | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
      #    clang++ -v -g -Wall -Weverything -Wextra -libstdc++17 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
      #  done
      #
      #  echo "COMPILING ALL .cxx FILES USING C++ STANDARD 17..." | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
      #  echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cxx\")" | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
      #  for file in $(ls ../SOURCE_CPP | grep ".cxx"); do
      #    echo Building file $file into an .o object... | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
      #    clang++ -v -g -Wall -Weverything -Wextra -libstdc++17 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
      #  done
      fi
    done

    echo "Moving all .o and .so files to ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/" | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
    mv ./*.so ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
    mv ./*.o ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
    
    echo "PROGRAM BUILT! YOUR OBJECT FILES ARE IN THE \"BUILD\" FOLDER" | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
    # We do not want to compile C files at the moment
    # echo "COMPILING ALL .c FILES..."
    # for file in $(ls ../SOURCE_CPP | grep ".c"); do
    #   clang++ -v -g ../SOURCE_CPP/$file
    # done

  elif [[ "$arg" == "-blinklaunch" || "$arg" == "-bll" ]]; then
    echo "BUILDING AND LINKING YOUR EXECUTABLE USING C++ STANDARD 17..." | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
    
    echo "PHASE FROM -ERASE FLAG"
    echo "DELETING PREVIOUS BUILD FILES..."
    echo "rm -rf ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/* ..."
    rm -rf ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/*
    
    echo "PHASE FROM -DEXE FLAG"
    echo "DELETING PREVIOUS EXECUTABLE FILE AND DISASSEMBLED FILES..."
    rm -rf ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/*
    
    for arg_build in "$@"; do
      # if [[ "$arg_build" == "-erase" ]]; then
      #   echo "DELETING PREVIOUS BUILD FILES... (DELETING FROM ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/*)" | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
      #   rm -rf ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/* | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
      # elif [[ -z "$2" ]]; then
      #   echo "OVERWRITING PREVIOUS BUILD FILES..." | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
      # fi
      # echo "COMPILING ALL .cpp .cxx .c FILES..."
      # clang++ -v -g -Wall -Weverything -Wextra -c ../SOURCE_CPP/*.cpp ../SOURCE_CPP/*.cxx ../SOURCE_CPP/*.c

      if [[ "$arg_build" == "-C17" || "$arg_build" == "-c17" ]]; then
        echo "~!BUILDING YOUR EXECUTABLE...!~" | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
        echo "COMPILING ALL .cpp FILES USING C++ STANDARD 17..." | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
        echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cpp\")" | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
        for file in $(ls ../SOURCE_CPP | grep ".cpp"); do
          echo Building file $file into an .o object... | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
          clang++ -v -g -Wall -Weverything -Wextra -libstdc++17 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
           echo "BUILDING DYNAMIC LIBRARY... " 2>&1 | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          clang++ -v -fPIC -shared ../SOURCE_CPP/$file ${LINKER_OPTIONS} -o ${file}.so 2>&1 | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt

        done

        
        echo "COMPILING ALL .cxx FILES USING C++ STANDARD 17..." | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
        echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cxx\")" | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
        for file in $(ls ../SOURCE_CPP | grep ".cxx"); do
          echo Building file $file into an .o object... | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
          clang++ -v -g -Wall -Weverything -Wextra -libstdc++17 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
           echo "BUILDING DYNAMIC LIBRARY... " 2>&1 | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          clang++ -v -fPIC -shared ../SOURCE_CPP/$file ${LINKER_OPTIONS} -o ${file}.so 2>&1 | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt

        done
      elif [[ "$arg_build" == "-C14" || "$arg_build" == "-c14" ]]; then
        echo "~!BUILDING YOUR EXECUTABLE...!~" | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
        echo "COMPILING ALL .cpp FILES USING C++ STANDARD 14..." | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
        echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cpp\")" | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
        for file in $(ls ../SOURCE_CPP | grep ".cpp"); do
          echo Building file $file into an .o object... | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
          clang++ -v -g -Wall -Weverything -Wextra -libstdc++14 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
           echo "BUILDING DYNAMIC LIBRARY... " 2>&1 | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          clang++ -v -fPIC -shared ../SOURCE_CPP/$file ${LINKER_OPTIONS} -o ${file}.so 2>&1 | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt

        done

        echo "COMPILING ALL .cxx FILES USING C++ STANDARD 14..." | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
        echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cxx\")" | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
        for file in $(ls ../SOURCE_CPP | grep ".cxx"); do
          echo Building file $file into an .o object... | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
          clang++ -v -g -Wall -Weverything -Wextra -libstdc++14 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
           echo "BUILDING DYNAMIC LIBRARY... " 2>&1 | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          clang++ -v -fPIC -shared ../SOURCE_CPP/$file ${LINKER_OPTIONS} -o ${file}.so 2>&1 | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt

        done
      elif [[ "$arg_build" == "-C11" || "$arg_build" == "-c11" ]]; then
        echo "~!BUILDING YOUR EXECUTABLE...!~" | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
        echo "COMPILING ALL .cpp FILES USING C++ STANDARD 11..." | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
        echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cpp\")" | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
        for file in $(ls ../SOURCE_CPP | grep ".cpp"); do
          echo Building file $file into an .o object... | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
          clang++ -v -g -Wall -Weverything -Wextra -libstdc++11 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
           echo "BUILDING DYNAMIC LIBRARY... " 2>&1 | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          clang++ -v -fPIC -shared ../SOURCE_CPP/$file ${LINKER_OPTIONS} -o ${file}.so 2>&1 | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt

        done

        echo "COMPILING ALL .cxx FILES USING C++ STANDARD 11..." | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
        echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cxx\")" | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
        for file in $(ls ../SOURCE_CPP | grep ".cxx"); do
          echo Building file $file into an .o object... | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
          clang++ -v -g -Wall -Weverything -Wextra -libstdc++11 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
           echo "BUILDING DYNAMIC LIBRARY... " 2>&1 | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          clang++ -v -fPIC -shared ../SOURCE_CPP/$file ${LINKER_OPTIONS} -o ${file}.so 2>&1 | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt

        done
      # else
      #   echo "COMPILING ALL .cpp FILES USING C++ STANDARD 17..." | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
      #   echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cpp\")" | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
      #   for file in $(ls ../SOURCE_CPP | grep ".cpp"); do
      #     echo Building file $file into an .o object... | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
      #     clang++ -v -g -Wall -Weverything -Wextra -libstdc++17 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
      #   done
      #
      #   echo "COMPILING ALL .cxx FILES USING C++ STANDARD 17..." | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
      #   echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cxx\")" | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
      #   for file in $(ls ../SOURCE_CPP | grep ".cxx"); do
      #     echo Building file $file into an .o object... | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
      #     clang++ -v -g -Wall -Weverything -Wextra -libstdc++17 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
      #   done
      fi
    done

    echo "Moving all .o and .so files to ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/" | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
    mv ./*.so ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
    mv ./*.o ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
    
    echo "EXECUTABLE BUILT! YOUR OBJECT FILES ARE IN THE \"BUILD\" FOLDER" | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt
    echo "LINKING ALL .O FILES IN ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/" | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_LINK_MESSAGES.txt
    clang++ -v -o ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXECUTABLE.exe ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/*.o -Wl,-rpath,"\$ORIGIN" ${LINKER_OPTIONS} 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_LINK_MESSAGES.txt
    echo "EXECUTABLE CREATED! IT IS LOCATED IN THE ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES FOLDER UNDER THE NAME OF EXECUTABLE.exe" | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/CLANG_BUILD_MESSAGES.txt | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_LINK_MESSAGES.txt
    
    # DISASSEMBLING PROCESS
	      if [[ "$(command -v objdump) > /dev/null" ]] && [[ "$(command -v readelf) > /dev/null " ]] ; then
        echo "DISSASEMBLING ALL SECTIONS OF THE EXECUTABLE..."
    		objdump -D ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXECUTABLE.exe > ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/DISSASEMBLED_ALL.obj
    		echo "FULLY DISASSEMBLED EXECUTABLE. THE RESULTS ARE IN DISSASEMBLED_ALL.obj" 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXPORT_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED_ALL.obj"
    	
    		echo "PARTLY DISSASEMBLING THE EXECUTABLE..."
    		objdump -d ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXECUTABLE.exe > ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/DISSASEMBLED.obj
    		echo "PARTLY DISASSEMBLED EXECUTABLE." 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXPORT_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED.obj"

    		objdump -x ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXECUTABLE.exe > ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/DISSASEMBLED_ALL_HEADERS.obj
    		echo "DISSASSEMBLED ALL HEADERS OF THE EXECUTABLE." 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXPORT_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED_ALL_HEADERS.obj"

    		objdump -i ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXECUTABLE.exe > ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/DISSASEMBLED_INFO.obj
    		echo "OUTPUTTING DIFFERENT INFORMATION ABOUT THE EXECUTABLE." 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXPORT_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED_INFO.obj"

    		objdump -g ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXECUTABLE.exe > ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/DISSASEMBLED_DEBUGGING.obj
    		echo "OUTPUTTING DISASSEMBLY DEBUGGING INFORMATION ABOUT THE EXECUTABLE." 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXPORT_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED_DEBUGGING.obj"

			  readelf -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXECUTABLE.exe > ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/READELF_INFO.obj
    		echo "OUTPUTTING DISASSEMBLY INFORMATION ABOUT THE EXECUTABLE." 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXPORT_DELIVERIES.txt
    		echo "OUTPUT IN READELF_INFO.obj"
        fi

    # SHARED LIBRARIES DETERMINATION + COPYING
    echo "REMOVING OLD LIBRARIES THE EXECUTABLE DEPENDED ON..."
    rm -rf ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/SHARED_LIBS/*
    rm -rf ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_COPIED_SHARED_LIBS.txt
    echo "CALCULATING DEPENDENCIES AND COPYING ALL REQUIRED .so FILES (DYNAMIC LINK LIBRARIES)..."
    mkdir ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/SHARED_LIBS/
    ldd ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXECUTABLE.exe | grep "=> /" | awk '{print $3}' | xargs -I '{}' cp -v '{}' ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/SHARED_LIBS/ 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_COPIED_SHARED_LIBS.txt
    
    if [[ "$(command -v patchelf) > /dev/null" ]] ; then
    echo "CHANGING THE RPATH OF EVERY LIBRARY IN ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/SHARED_LIBS/ TO FIRST SEARCH IN THE CURRENT DIRECTORY"
    patchelf --force-rpath --set-rpath "\$ORIGIN" ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/SHARED_LIBS/*.so*
    fi

    echo "~~~~~~~~~~~~~~LAUNCHING...~~~~~~~~~~~~~~~~"
    ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXECUTABLE.exe
    echo "~~~~~~~~~~~~~~~PROGRAM END~~~~~~~~~~~~~~~~~"


  elif [[ "$arg" == "-link" || "$arg" == "-l" ]]; then
    echo "~~~~~~~~~~~~~~LINKING OBJ FILES FROM /BUILD...~~~~~~~~~~~~~~~~" | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_LINK_MESSAGES.txt
    clang++ -v -o ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXECUTABLE.exe ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/*.o ${LINKER_OPTIONS} 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_LINK_MESSAGES.txt
    
    # DISASSEMBLING PROCESS
      if [[ "$(command -v objdump) > /dev/null" ]] && [[ "$(command -v readelf) > /dev/null " ]] ; then
        echo "DISSASEMBLING ALL SECTIONS OF THE EXECUTABLE..."
    		objdump -D ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXECUTABLE.exe > ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/DISSASEMBLED_ALL.obj
    		echo "FULLY DISASSEMBLED EXECUTABLE. THE RESULTS ARE IN DISSASEMBLED_ALL.obj" 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXPORT_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED_ALL.obj"
    	
    		echo "PARTLY DISSASEMBLING THE EXECUTABLE..."
    		objdump -d ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXECUTABLE.exe > ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/DISSASEMBLED.obj
    		echo "PARTLY DISASSEMBLED EXECUTABLE." 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXPORT_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED.obj"

    		objdump -x ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXECUTABLE.exe > ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/DISSASEMBLED_ALL_HEADERS.obj
    		echo "DISSASSEMBLED ALL HEADERS OF THE EXECUTABLE." 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXPORT_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED_ALL_HEADERS.obj"

    		objdump -i ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXECUTABLE.exe > ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/DISSASEMBLED_INFO.obj
    		echo "OUTPUTTING DIFFERENT INFORMATION ABOUT THE EXECUTABLE." 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXPORT_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED_INFO.obj"

    		objdump -g ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXECUTABLE.exe > ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/DISSASEMBLED_DEBUGGING.obj
    		echo "OUTPUTTING DISASSEMBLY DEBUGGING INFORMATION ABOUT THE EXECUTABLE." 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXPORT_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED_DEBUGGING.obj"

			  readelf -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXECUTABLE.exe > ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/READELF_INFO.obj
    		echo "OUTPUTTING DISASSEMBLY INFORMATION ABOUT THE EXECUTABLE." 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXPORT_DELIVERIES.txt
    		echo "OUTPUT IN READELF_INFO.obj"
        fi


    # SHARED LIBRARIES DETERMINATION + COPYING
    echo "REMOVING OLD LIBRARIES THE EXECUTABLE DEPENDED ON..."
    rm -rf ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/SHARED_LIBS/*
    rm -rf ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_COPIED_SHARED_LIBS.txt
    echo "CALCULATING DEPENDENCIES AND COPYING ALL REQUIRED .so FILES (DYNAMIC LINK LIBRARIES)..."
    mkdir ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/SHARED_LIBS/
    ldd ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXECUTABLE.exe | grep "=> /" | awk '{print $3}' | xargs -I '{}' cp -v '{}' ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/SHARED_LIBS/ 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_COPIED_SHARED_LIBS.txt
    
    if [[ "$(command -v patchelf) > /dev/null" ]] ; then
    echo "CHANGING THE RPATH OF EVERY LIBRARY IN ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/SHARED_LIBS/ TO FIRST SEARCH IN THE CURRENT DIRECTORY"
    patchelf --force-rpath --set-rpath "\$ORIGIN" ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/SHARED_LIBS/*.so*
    
    fi

    echo "~~~~~~~~~~~~~~EXECUTABLE BUILT! OUTPUT IN /CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXECUTABLE.exe~~~~~~~~~~~~~~~~" | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_LINK_MESSAGES.txt
  elif [[ "$arg" == "-jbuild" || "$arg" == "-jb" ]]; then
    # if [[ -z "$2" ]]; then
    #   echo "File to be built not provided!"
    # else
      # $2 Holds the name of our file
      # We have to check if it exists on the disk
    for arg_jbuild in "$@"; do
      for file in $(ls ../SOURCE_CPP | grep -E '.cpp|.cxx'); do
        # echo $file
        if [[ $file == $arg_jbuild ]]; then
          echo Building $file... | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          for argcversion in "$@"; do
            if [[ "$argcversion" == "-C11" || "$argcversion" == "-c11" ]]; then
              echo "USING C++11 STDLIB..." | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
              clang++ -v -g -Wall -Weverything -Wextra -libstdc++11 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
               echo "BUILDING DYNAMIC LIBRARY... " 2>&1 | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
               clang++ -v -fPIC -shared ../SOURCE_CPP/$file ${LINKER_OPTIONS} -o ${file}.so 2>&1 | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt

            elif [[ "$argcversion" == "-C14" || "$argcversion" == "-c14" ]]; then
              echo "USING C++14 STDLIB..." | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
              clang++ -v -g -Wall -Weverything -Wextra -libstdc++14 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
               echo "BUILDING DYNAMIC LIBRARY... " 2>&1 | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
              clang++ -v -fPIC -shared ../SOURCE_CPP/$file ${LINKER_OPTIONS} -o ${file}.so 2>&1 | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt


            elif [[ "$argcversion" == "-C17" || "$argcversion" == "-c17" ]]; then
              echo "USING C++17 STDLIB..." | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
              clang++ -v -g -Wall -Weverything -Wextra -libstdc++17 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
               echo "BUILDING DYNAMIC LIBRARY... " 2>&1 | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
              clang++ -v -fPIC -shared ../SOURCE_CPP/$file ${LINKER_OPTIONS} -o ${file}.so 2>&1 | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt

            #else
            #  echo "USING C++17 STDLIB..." | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
            #  clang++ -v -g -Wall -Weverything -Wextra -libstdc++17 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} | tee ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
            fi
          done

          echo "Moving all .o and .so files to ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES/" 
          mv ./*.so ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES 
          mv ./*.o ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BUILD_FILES 

        fi
      done 
    done
    # fi
  elif [[ "$arg" == "-launch" || "$arg" == "-exe" ]]; then
    echo "~~~~~~~~~~~~~~LAUNCHING...~~~~~~~~~~~~~~~~"
    declare EXPORTED="0"
    for argument in "$@"; do
      if [[ "$argument" == "-e" || "$argument" == "-export" ]]; then
        ./EXECUTABLE.exe
        EXPORTED="1"
      fi
    done
    if [[ "$EXPORTED" == "0" ]]; then
        ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXECUTABLE.exe
    fi
    
    echo "~~~~~~~~~~~~~~~PROGRAM END~~~~~~~~~~~~~~~~~"
  elif [[ "$arg" == "-export" || "$arg" == "-e" ]]; then
  	# echo "REMOVING OLD LIBRARIES THE EXECUTABLE DEPENDED ON..."
    # rm -rf ../BIN_CLANG/SHARED_LIBS/*
    # rm -rf ../BIN_CLANG/CLANG_COPIED_SHARED_LIBS.txt
    echo "~~~~STARTING PROJECT CREATION PROCESS~~~~"
    echo "SEARCHING IF THE EXECUTABLE IS AVAILABLE..."
    if [[ -f "../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXECUTABLE.exe" ]]; then 
   		echo "EXECUTABLE FOUND IN ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXECUTABLE.exe"
   		echo "REMOVING THE ALREADY-CREATED EXPORT IF IT EXISTS..."
   		
   		rm -rf ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/
   		mkdir ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED
   		
   		echo "~~~~~~~~~~EXPORTED PROJECT MESSAGES + WHAT IT CONTAINS~~~~~~~~~" > ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/EXPORT_DELIVERIES.txt && echo "" >> ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/EXPORT_DELIVERIES.txt
   		
   		echo "REMOVING THE ALREADY-EXISTING ../BIN_CLANG/SHARED_LIBS/ AND CREATING A NEW FOLDER WITH THE SAME NAME..."
   		rm -rf ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/SHARED_LIBS
   		mkdir ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/SHARED_LIBS
   		
    	echo "CALCULATING DEPENDENCIES AND CREATING ALL REQUIRED .so FILES (DYNAMIC LINK LIBRARIES) TO THE SHARED LIBS FOLDER..."	
    	echo "~FOUND THE FOLLOWING .so FILES THE EXECUTABLE DEPENDS ON~" >> ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/EXPORT_DELIVERIES.txt
    	
    	ldd ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXECUTABLE.exe | grep "=> /" | awk '{print $3}' | xargs -I '{}' cp -v '{}' ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/SHARED_LIBS/ 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/EXPORT_DELIVERIES.txt
    	if [[ "$(command -v patchelf) > /dev/null" ]] ; then
    	echo "CHANGING THE RPATH OF EVERY LIBRARY IN ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/SHARED_LIBS/ TO FIRST SEARCH IN THE CURRENT DIRECTORY"
 	    patchelf --force-rpath --set-rpath "\$ORIGIN" ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/SHARED_LIBS/*.so*
    
      fi

    	# COPYING SHARED LIBS FROM THE SHARED LIBS DIRECTORY
    	echo "COPYING SHARED LIBS FROM THE SHARED LIBS DIRECTORY + EXECUTABLE..."
  		cp ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/SHARED_LIBS/* ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED
  		cp ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXECUTABLE.exe ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/EXECUTABLE.exe
  		echo "~DONE COPYING ENUMERATED FILES FILES~"
  		
  		
  		# COPYING INFORMATION RELATED TO EXECUTABLE + DISASSEMBLE USING OBJUMP AND READELF
      	cp ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/DISSASEMBLED.obj  ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/
      	cp ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/DISSASEMBLED_ALL_HEADERS.obj  ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/     
  		  cp ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/DISSASEMBLED_ALL.obj  ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/
        cp ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/READELF_INFO.obj  ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/
        cp ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/DISSASEMBLED_INFO.obj  ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/
        cp ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/DISSASEMBLED_DEBUGGING.obj  ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/

      #echo "SETTING THE RPATH OF THE EXECUTABLE..."
  		#patchelf --set-rpath '$ORIGIN/' ../BIN_CLANG/CLANG_PROJECT_TO_BE_EXPORTED/EXECUTABLE.exe
  		
  		if [[ "$(command -v objdump) > /dev/null" ]] && [[ "$(command -v readelf) > /dev/null " ]] ; then
  		echo "DISSASEMBLING ALL SECTIONS OF THE EXECUTABLE..."
    		objdump -D ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/EXECUTABLE.exe  > ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/DISSASEMBLED_ALL.obj
    		echo "FULLY DISASSEMBLED EXECUTABLE." 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/EXPORT_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED_ALL.obj"
    	
    		echo "PARTLY DISSASEMBLING THE EXECUTABLE..."
    		objdump -d ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/EXECUTABLE.exe > ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/DISSASEMBLED.obj
    		echo "PARTLY DISASSEMBLED EXECUTABLE." 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/EXPORT_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED.obj"

    		objdump -x ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/EXECUTABLE.exe > ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/DISSASEMBLED_ALL_HEADERS.obj
    		echo "DISSASSEMBLED ALL HEADERS OF THE EXECUTABLE." 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/EXPORT_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED_ALL_HEADERS.obj"

    		objdump -i ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/EXECUTABLE.exe > ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/DISSASEMBLED_INFO.obj
    		echo "OUTPUTTING DIFFERENT INFORMATION ABOUT THE EXECUTABLE." 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/EXPORT_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED_INFO.obj"

    		objdump -g ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/EXECUTABLE.exe > ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/DISSASEMBLED_DEBUGGING.obj
    		echo "OUTPUTTING DISASSEMBLY DEBUGGING INFORMATION ABOUT THE EXECUTABLE." 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/EXPORT_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED_DEBUGGING.obj"

			  readelf -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/EXECUTABLE.exe > ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/READELF_INFO.obj
    		echo "OUTPUTTING DISASSEMBLY INFORMATION ABOUT THE EXECUTABLE." 2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/EXPORT_DELIVERIES.txt 
    		echo "OUTPUT IN READELF_INFO.obj"
    	fi

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
    	2>&1 | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/MIT_LICENSE.md
    	
      echo "" && echo "" | tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/EXPORT_DELIVERIES.txt
    	
      if [[ "$(command -v zip) > /dev/null" ]] && [[ "$(command -v tar) > /dev/null " ]] ; then # WE CHECK IF THE PROGRAMS ACTUALLY EXIST
      echo "ARCHIVING FOLDER INTO A ZIP ARCHIVE..." && echo ""| tee -a ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/CLANG_PROJECT_TO_BE_EXPORTED/EXPORT_DELIVERIES.txt
    	cd ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/
   		zip -r CLANG_PROJECT_TO_BE_EXPORTED.zip CLANG_PROJECT_TO_BE_EXPORTED/* 2>&1 | tee -a ./EXPORT_DELIVERIES.txt
   		
      echo "" && echo "" | tee -a ./EXPORT_DELIVERIES.txt
   		echo "ARCHIVING FOLDER INTO A TAR ARCHIVE..." && echo "" | tee -a ./EXPORT_DELIVERIES.txt

   		tar -czvf CLANG_PROJECT_TO_BE_EXPORTED.tar.gz CLANG_PROJECT_TO_BE_EXPORTED/* 2>&1 | tee -a ./EXPORT_DELIVERIES.txt
   		
    	echo "~~~~~DONE~~~~~"
    	echo "~~~~EOF~~~~" >> ./EXPORT_DELIVERIES.txt
    	fi
  	else
  		echo "EXECUTABLE NOT FOUND IN ../CLANG++_BUILD_AND_BINARY_FILES/CLANG++_BINARY_FILES/EXECUTABLE.exe. NOTHING HAS BEEN CREATED OR REMOVED"
  	fi
  fi
done
exit
