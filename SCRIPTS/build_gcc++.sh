#/bin/bash

# SOME G++ MACROS AND FLAGS

# -fsyntax-only  -fmax-errors=n  -Wpedantic -pedantic-errors -w
  # -Wextra -Wall \
  # -Wall \
  # -Waddress  -Waddress-of-packed-member \
  # -Waggregate-return  -Waligned-new -Walloc-zero \
  # -Walloc-size-larger-than=byte-size -Walloca \
  # -Walloca-larger-than=byte-size \
  # -Wno-aggressive-loop-optimizations  -Warray-bounds \
  # -Warray-bounds=n -Wno-attributes  -Wattribute-alias=n \
  # -Wbool-compare  -Wbool-operation \
  # -Wno-builtin-declaration-mismatch \
  # -Wno-builtin-macro-redefined  -Wc90-c99-compat \
  # -Wc99-c11-compat -Wc11-c2x-compat -Wc++-compat \
  # -Wc++11-compat  -Wc++14-compat  -Wc++17-compat -Wcast-align \
  # -Wcast-align=strict  -Wcast-function-type  -Wcast-qual \
  # -Wchar-subscripts  -Wcatch-value  -Wcatch-value=n -Wclobbered \
  # -Wcomment  -Wconditionally-supported -Wconversion \
  # -Wcoverage-mismatch  -Wno-cpp  -Wdangling-else  -Wdate-time \
  # -Wdelete-incomplete -Wno-attribute-warning -Wno-deprecated \
  # -Wno-deprecated-declarations  -Wno-designated-init \
  # -Wdisabled-optimization -Wno-discarded-qualifiers \
  # -Wno-discarded-array-qualifiers -Wno-div-by-zero \
  # -Wdouble-promotion -Wduplicated-branches  -Wduplicated-cond \
  # -Wempty-body  -Wenum-compare  -Wno-endif-labels \
  # -Wexpansion-to-defined -Werror  -Werror=*  -Wextra-semi \
  # -Wfatal-errors -Wfloat-equal  -Wformat  -Wformat=2 \
  # -Wno-format-contains-nul  -Wno-format-extra-args \
  # -Wformat-nonliteral  -Wformat-overflow=n -Wformat-security \
  # -Wformat-signedness  -Wformat-truncation=n -Wformat-y2k \
  # -Wframe-address -Wframe-larger-than=byte-size \
  # -Wno-free-nonheap-object -Wjump-misses-init -Whsa \
  # -Wif-not-aligned -Wignored-qualifiers  -Wignored-attributes \
  # -Wincompatible-pointer-types -Wimplicit \
  # -Wimplicit-fallthrough  -Wimplicit-fallthrough=n \
  # -Wimplicit-function-declaration  -Wimplicit-int -Winit-self \
  # -Winline  -Wno-int-conversion  -Wint-in-bool-context \
  # -Wno-int-to-pointer-cast  -Winvalid-memory-model \
  # -Wno-invalid-offsetof -Winvalid-pch  -Wlarger-than=1000 \
  # -Wlogical-op  -Wlogical-not-parentheses  -Wlong-long -Wmain \
  # -Wmaybe-uninitialized  -Wmemset-elt-size \I
  # -Wmemset-transposed-args -Wmisleading-indentation \
  # -Wmissing-attributes  -Wmissing-braces \
  # -Wmissing-field-initializers  -Wmissing-format-attribute \
  # -Wmissing-include-dirs  -Wmissing-noreturn  -Wmissing-profile \
  # -Wno-multichar  -Wmultistatement-macros  -Wnonnull \
  # -Wnonnull-compare -Wnormalized=none \
  # -Wnull-dereference  -Wodr  -Wno-overflow  -Wopenmp-simd \
  # -Woverride-init-side-effects  -Woverlength-strings -Wpacked \
  # -Wpacked-bitfield-compat -Wpacked-not-aligned  -Wpadded \
  # -Wparentheses  -Wno-pedantic-ms-format -Wplacement-new \
  # -Wplacement-new=n -Wpointer-arith  -Wpointer-compare \
  # -Wno-pointer-to-int-cast -Wno-pragmas  -Wno-prio-ctor-dtor \
  # -Wredundant-decls -Wrestrict  -Wno-return-local-addr \
  # -Wreturn-type  -Wsequence-point  -Wshadow  -Wno-shadow-ivar \
  # -Wshadow=global,  -Wshadow=local,  -Wshadow=compatible-local \
  # -Wshift-overflow  -Wshift-overflow=n -Wshift-count-negative \
  # -Wshift-count-overflow  -Wshift-negative-value -Wsign-compare \
  # -Wsign-conversion  -Wfloat-conversion \
  # -Wno-scalar-storage-order  -Wsizeof-pointer-div \
  # -Wsizeof-pointer-memaccess  -Wsizeof-array-argument \
  # -Wstack-protector  -Wstack-usage=byte-size  -Wstrict-aliasing \
  # -Wstrict-aliasing=n  -Wstrict-overflow  -Wstrict-overflow=n \
  # -Wstringop-overflow=n  -Wstringop-truncation \
  # -Wsubobject-linkage \
  # -Wsuggest-attribute=[pure|const|noreturn|format|malloc] \
  # -Wsuggest-final-types   -Wsuggest-final-methods \
  # -Wsuggest-override -Wswitch  -Wswitch-bool  -Wswitch-default \
  # -Wswitch-enum -Wswitch-unreachable  -Wsync-nand \
  # -Wsystem-headers  -Wtautological-compare  -Wtrampolines \
  # -Wtrigraphs -Wtype-limits  -Wundef -Wuninitialized \
  # -Wunknown-pragmas -Wunsuffixed-float-constants  -Wunused \
  # -Wunused-function -Wunused-label  -Wunused-local-typedefs \
  # -Wunused-macros -Wunused-parameter  -Wno-unused-result \
  # -Wunused-value  -Wunused-variable -Wunused-const-variable \
  # -Wunused-const-variable=n -Wunused-but-set-parameter \
  # -Wunused-but-set-variable -Wuseless-cast  -Wvariadic-macros \


# SCRIPT START

if [[ ( "$#" == 1 ) && ( "$1" == "-help" ) ]]; then
    echo "~~~~~~~~~~~ HELP MENU ~~~~~~~~~~~~"
    echo "----> HOW DOES IT WORK?"
    echo "DEF - A BASH SCRIPT THAT PERFORMS COMPILE/BUILD/LINK/LAUNCH OPERATIONS ON A C/C++ DIRECTORY"
    echo "!THE OUTPUT FOLDER IS ROOTDIR/GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES - EXECUTABLES + ASSEMBLED OBJECTS LOCATED IN ROOTDIR/GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES!"
    echo "" && echo "~~~~~~~~~~ COMMANDS / FLAGS ~~~~~~~~~~"

    echo "IF YOU ARE NOT SURE WHAT TO RUN SPECIFICALLY:"
    echo "BUILD + LINK: bash build_gcc++.sh -dbuild -dexe -build -c17 -link"
    echo "LAUNCH: bash build_gcc++.sh -launch"
    echo "BUILD + LINK + EXPORTED: bash build_gcc++.sh -dbuild -dexe -build -c17 -link -e"
    echo "BUILD ONLY SELECTED FILES: bash build_gcc++.sh -jbuild ..>FILES.cpp<.. -c17"

    echo "" && echo "-dbuild ---> DELETES ALL FILES IN ROOTDIR/GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES"
    echo "-dexe ---> DELETES EVERYTHING IN ROOTDIR/GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES"
    echo "-build -c11/-c14/-c17 ---> BUILDS ALL C++/CXX IN ROOTDIR/SOURCE_CPP USING STANDARD C++11/C++14/C++17"
    echo "-link ---> LINKS ALL .o FILES CREATED AT BUILD IN ROOTDIR/GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES"
    echo "-launch ---> LAUNCHES EXECUTABLE FROM ROOTDIR/GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe"
    echo "-blinklaunch -c11/-c14/-c17 ---> ATTEMPTS TO REBUILD ALL FILES IN ROOTDIR/SOURCE_CPP, LINK THEM AND EXECUTE THE GENERATED EXECUTABLE"
    echo "-jbuild [FILES] -c11/-c14/-c17 ---> ONLY BUILDS SPECIFIED FILES FROM ROOTDIR/SOURCE_CPP"

    echo "" && echo "BUILD OUTPUT PER OPERATION LOCATED IN ROOTDIR/GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/*.txt AND ROOTDIR/GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/*.txt"
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
  if [[ "$arg" == "-dbuild" ]]; then
      # echo "DELETING PREVIOUS BUILD FILES..." | tee ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
      # echo "rm -rf ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/*" | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
      echo "DELETING PREVIOUS BUILD FILES..."
      echo "rm -rf ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/*"
      rm -rf ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/* # | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
      # elif [[ -z "$2" ]]; then
      # echo "OVERWRITING PREVIOUS BUILD FILES..." | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
  fi
  if [[ "$arg" == "-dexe" ]]; then
      echo "DELETING PREVIOUS EXECUTABLE FILE AND DISASSEMBLED FILES..."
      rm -rf ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/*
  fi
  if [[ "$arg" == "-build" ]]; then
    echo "BUILDING YOUR EXECUTABLE..." | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
    # echo "COMPILING ALL .cpp .cxx .c FILES..."
    # g++ -v -g -Wall -Wextra -c ../SOURCE_CPP/*.cpp ../SOURCE_CPP/*.cxx ../SOURCE_CPP/*.c
    for arg_build in "$@"; do
      if [[ "$arg_build" == "-C17" || "$arg_build" == "-c17" ]]; then
        echo "COMPILING ALL .cpp FILES USING C++ STANDARD 17..." | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
        echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cpp\")" | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
        for file in $(ls ../SOURCE_CPP | grep ".cpp"); do
          echo Building file $file into an .o object... | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
          g++ -v -g -Wall -Wextra -libstdc++17 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt | tee ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          echo "BUILDING DYNAMIC LIBRARY... " 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          g++ -v -fPIC -shared ../SOURCE_CPP/$file ${LINKER_OPTIONS} -o ${file}.so 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt

        done

        echo "COMPILING ALL .cxx FILES USING C++ STANDARD 17..." | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
        echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cxx\")" | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
        for file in $(ls ../SOURCE_CPP | grep ".cxx"); do
          echo Building file $file into an .o object... | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
          g++ -v -g -Wall -Wextra -libstdc++17 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt | tee ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          echo "BUILDING DYNAMIC LIBRARY... " 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          g++ -v -fPIC -shared ../SOURCE_CPP/$file ${LINKER_OPTIONS} -o ${file}.so 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt

        done
      elif [[ "$arg_build" == "-C14" || "$arg_build" == "-c14" ]]; then
        echo "COMPILING ALL .cpp FILES USING C++ STANDARD 14..." | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
        echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cpp\")" | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
        for file in $(ls ../SOURCE_CPP | grep ".cpp"); do
          echo Building file $file into an .o object... | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
          g++ -v -g -Wall -Wextra -libstdc++14 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt | tee ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          echo "BUILDING DYNAMIC LIBRARY... " 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          g++ -v -fPIC -shared ../SOURCE_CPP/$file ${LINKER_OPTIONS} -o ${file}.so 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt

        done

        echo "COMPILING ALL .cxx FILES USING C++ STANDARD 14..." | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
        echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cxx\")" | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
        for file in $(ls ../SOURCE_CPP | grep ".cxx"); do
          echo Building file $file into an .o object... | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
          g++ -v -g -Wall -Wextra -libstdc++14 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt | tee ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          echo "BUILDING DYNAMIC LIBRARY... " 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          g++ -v -fPIC -shared ../SOURCE_CPP/$file ${LINKER_OPTIONS} -o ${file}.so 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt

        done
      elif [[ "$arg_build" == "-C11" || "$arg_build" == "-c11" ]]; then
        echo "COMPILING ALL .cpp FILES USING C++ STANDARD 11..." | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
        echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cpp\")" | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
        for file in $(ls ../SOURCE_CPP | grep ".cpp"); do
          echo Building file $file into an .o object... | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
          g++ -v -g -Wall -Wextra -libstdc++11 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt | tee ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          echo "BUILDING DYNAMIC LIBRARY... " 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          g++ -v -fPIC -shared ../SOURCE_CPP/$file ${LINKER_OPTIONS} -o ${file}.so 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt

        done

        echo "COMPILING ALL .cxx FILES USING C++ STANDARD 11..." | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
        echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cxx\")" | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
        for file in $(ls ../SOURCE_CPP | grep ".cxx"); do
          echo Building file $file into an .o object... | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
          g++ -v -g -Wall -Wextra -libstdc++11 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt | tee ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          echo "BUILDING DYNAMIC LIBRARY... " 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          g++ -v -fPIC -shared ../SOURCE_CPP/$file ${LINKER_OPTIONS} -o ${file}.so 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt

        done
      # else
      #  echo "COMPILING ALL .cpp FILES USING C++ STANDARD 17..." | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
      #  echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cpp\")" | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
      #  for file in $(ls ../SOURCE_CPP | grep ".cpp"); do
      #    echo Building file $file into an .o object... | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
      #    g++ -v -g -Wall -Wextra -libstdc++17 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt | tee ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
      #  done
      #
      #  echo "COMPILING ALL .cxx FILES USING C++ STANDARD 17..." | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
      #  echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cxx\")" | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
      #  for file in $(ls ../SOURCE_CPP | grep ".cxx"); do
      #    echo Building file $file into an .o object... | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
      #    g++ -v -g -Wall -Wextra -libstdc++17 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt | tee ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
      #  done
      fi
    done
        
    echo "Moving all .o and .so files to ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/" | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
    mv ./*.so ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
    mv ./*.o ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
    
    echo "PROGRAM BUILT! YOUR OBJECT FILES ARE IN THE \"BUILD\" FOLDER" | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
    # We do not want to compile C files at the moment
    # echo "COMPILING ALL .c FILES..."
    # for file in $(ls ../SOURCE_CPP | grep ".c"); do
    #   g++ -v -g ../SOURCE_CPP/$file
    # done

  elif [[ "$arg" == "-blinklaunch" || "$arg" == "-bll" ]]; then
    echo "BUILDING AND LINKING YOUR EXECUTABLE USING C++ STANDARD 17..." | tee ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
    
    echo "PHASE FROM -DBUILD FLAG"
    echo "DELETING PREVIOUS BUILD FILES..."
    echo "rm -rf ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/* ..."
    rm -rf ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/*
    
    echo "PHASE FROM -DEXE FLAG"
    echo "DELETING PREVIOUS EXECUTABLE FILE AND DISASSEMBLED FILES..."
    rm -rf ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/*
    
    for arg_build in "$@"; do
      # echo "COMPILING ALL .cpp .cxx .c FILES..."
      # g++ -v -g -Wall -Wextra -c ../SOURCE_CPP/*.cpp ../SOURCE_CPP/*.cxx ../SOURCE_CPP/*.c

      if [[ "$arg_build" == "-C17" || "$arg_build" == "-c17" ]]; then
        echo "~!BUILDING YOUR EXECUTABLE...!~" | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
        echo "COMPILING ALL .cpp FILES USING C++ STANDARD 17..." | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
        echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cpp\")" | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
        for file in $(ls ../SOURCE_CPP | grep ".cpp"); do
          echo Building file $file into an .o object... | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
          
          g++ -v -g -Wall -Wextra -libstdc++17 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt | tee ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          echo "BUILDING DYNAMIC LIBRARY... " 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
            
          g++ -v -fPIC -shared ../SOURCE_CPP/$file ${LINKER_OPTIONS} -o ${file}.so 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt

        done

        
        echo "COMPILING ALL .cxx FILES USING C++ STANDARD 17..." | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
        echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cxx\")" | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
        for file in $(ls ../SOURCE_CPP | grep ".cxx"); do
          echo Building file $file into an .o object... | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
          g++ -v -g -Wall -Wextra -libstdc++17 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt | tee ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          echo "BUILDING DYNAMIC LIBRARY... " 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          g++ -v -fPIC -shared ../SOURCE_CPP/$file ${LINKER_OPTIONS} -o ${file}.so 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt

        done
      elif [[ "$arg_build" == "-C14" || "$arg_build" == "-c14" ]]; then
        echo "~!BUILDING YOUR EXECUTABLE...!~" | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
        echo "COMPILING ALL .cpp FILES USING C++ STANDARD 14..." | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
        echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cpp\")" | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
        for file in $(ls ../SOURCE_CPP | grep ".cpp"); do
          echo Building file $file into an .o object... | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
          g++ -v -g -Wall -Wextra -libstdc++14 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt | tee ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          echo "BUILDING DYNAMIC LIBRARY... " 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          g++ -v -fPIC -shared ../SOURCE_CPP/$file ${LINKER_OPTIONS} -o ${file}.so 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt

        done

        echo "COMPILING ALL .cxx FILES USING C++ STANDARD 14..." | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
        echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cxx\")" | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
        for file in $(ls ../SOURCE_CPP | grep ".cxx"); do
          echo Building file $file into an .o object... | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
          g++ -v -g -Wall -Wextra -libstdc++14 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt | tee ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          echo "BUILDING DYNAMIC LIBRARY... " 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          g++ -v -fPIC -shared ../SOURCE_CPP/$file ${LINKER_OPTIONS} -o ${file}.so 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt

        done
      elif [[ "$arg_build" == "-C11" || "$arg_build" == "-c11" ]]; then
        echo "~!BUILDING YOUR EXECUTABLE...!~" | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
        echo "COMPILING ALL .cpp FILES USING C++ STANDARD 11..." | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
        echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cpp\")" | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
        for file in $(ls ../SOURCE_CPP | grep ".cpp"); do
          echo Building file $file into an .o object... | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
          g++ -v -g -Wall -Wextra -libstdc++11 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt | tee ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          echo "BUILDING DYNAMIC LIBRARY... " 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          g++ -v -fPIC -shared ../SOURCE_CPP/$file ${LINKER_OPTIONS} -o ${file}.so 2>&1 -o ${file}.so | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt

        done

        echo "COMPILING ALL .cxx FILES USING C++ STANDARD 11..." | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
        echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cxx\")" | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
        for file in $(ls ../SOURCE_CPP | grep ".cxx"); do
          echo Building file $file into an .o object... | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
          g++ -v -g -Wall -Wextra -libstdc++11 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt | tee ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          echo "BUILDING DYNAMIC LIBRARY... " 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          g++ -v -fPIC -shared ../SOURCE_CPP/$file ${LINKER_OPTIONS} -o ${file}.so 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt

        done
      # else
      #   echo "COMPILING ALL .cpp FILES USING C++ STANDARD 17..." | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
      #   echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cpp\")" | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
      #   for file in $(ls ../SOURCE_CPP | grep ".cpp"); do
      #     echo Building file $file into an .o object... | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
      #     g++ -v -g -Wall -Wextra -libstdc++17 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt | tee ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
      #   done
      #
      #   echo "COMPILING ALL .cxx FILES USING C++ STANDARD 17..." | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
      #   echo "RUNNING LOOP IN (ls ../SOURCE_CPP | grep \".cxx\")" | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
      #   for file in $(ls ../SOURCE_CPP | grep ".cxx"); do
      #     echo Building file $file into an .o object... | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
      #     g++ -v -g -Wall -Wextra -libstdc++17 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt | tee ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
      #   done
      fi
    done
        
    echo "Moving all .o and .so files to ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/" | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
    mv ./*.so ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
    mv ./*.o ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
    
    echo "EXECUTABLE BUILT! YOUR OBJECT FILES ARE IN THE \"BUILD\" FOLDER" | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
    echo "LINKING ALL .O FILES IN ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/" | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt | tee ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/GCC_LINK_MESSAGES.txt
    g++ -v -o ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/*.o -Wl,-rpath,"\$ORIGIN" ${LINKER_OPTIONS} 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/GCC_LINK_MESSAGES.txt
    echo "EXECUTABLE CREATED! IT IS LOCATED IN THE ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES FOLDER UNDER THE NAME OF EXECUTABLE.exe" | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/GCC_LINK_MESSAGES.txt
    
    # EXECUTABLE DISASSEMBLING PROCESS

      if [[ "$(command -v objdump) > /dev/null" ]] && [[ "$(command -v readelf) > /dev/null " ]] ; then
  		echo "DISSASEMBLING ALL SECTIONS OF THE EXECUTABLE..."
    		objdump -D ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe > ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/DISSASEMBLED_ALL.obj
    		echo "FULLY DISASSEMBLED EXECUTABLE. THE RESULTS ARE IN DISSASEMBLED_ALL.obj" 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXPORTED_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED_ALL.obj"
    	
    		echo "PARTLY DISSASEMBLING THE EXECUTABLE..."
    		objdump -d ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe > ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/DISSASEMBLED.obj
    		echo "PARTLY DISASSEMBLED EXECUTABLE." 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXPORTED_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED.obj"

    		objdump -x ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe > ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/DISSASEMBLED_ALL_HEADERS.obj
    		echo "DISSASSEMBLED ALL HEADERS OF THE EXECUTABLE." 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXPORTED_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED_ALL_HEADERS.obj"

    		objdump -i ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe > ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/DISSASEMBLED_INFO.obj
    		echo "OUTPUTTING DIFFERENT INFORMATION ABOUT THE EXECUTABLE." 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXPORTED_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED_INFO.obj"

    		objdump -g ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe > ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/DISSASEMBLED_DEBUGGING.obj
    		echo "OUTPUTTING DISASSEMBLY DEBUGGING INFORMATION ABOUT THE EXECUTABLE." 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXPORTED_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED_DEBUGGING.obj"

			  readelf -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe > ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/READELF_INFO.obj
    		echo "OUTPUTTING DISASSEMBLY INFORMATION ABOUT THE EXECUTABLE." 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXPORTED_DELIVERIES.txt
    		echo "OUTPUT IN READELF_INFO.obj"

      fi

    # SHARED LIBRARIES DETERMINATION + COPYING
    echo "REMOVING OLD LIBRARIES THE EXECUTABLE DEPENDED ON..."
    rm -rf ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/SHARED_LIBS/*
    rm -rf ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/GCC_COPIED_SHARED_LIBS.txt
    echo "CALCULATING DEPENDENCIES AND COPYING ALL REQUIRED .so FILES (DYNAMIC LINK LIBRARIES)..."
    mkdir ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/SHARED_LIBS/
    ldd ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe | grep "=> /" | awk '{print $3}' | xargs -I '{}' cp -v '{}' ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/SHARED_LIBS/ 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/GCC_COPIED_SHARED_LIBS.txt

    if [[ "$(command -v patchelf) > /dev/null" ]] ; then
    echo "CHANGING THE RPATH OF EVERY LIBRARY IN ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/SHARED_LIBS/ TO FIRST SEARCH IN THE CURRENT DIRECTORY"
    patchelf --force-rpath --set-rpath "\$ORIGIN" ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/SHARED_LIBS/*.so*
    fi

    echo "~~~~~~~~~~~~~~LAUNCHING...~~~~~~~~~~~~~~~~"
    ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe
    echo "~~~~~~~~~~~~~~~PROGRAM END~~~~~~~~~~~~~~~~~"
    
  elif [[ "$arg" == "-link" || "$arg" == "-l" ]]; then
    echo "~~~~~~~~~~~~~~LINKING OBJ FILES FROM /BUILD AND CHANGING RPATH OF THE EXECUTABLE TO \${ORIGIN}...~~~~~~~~~~~~~~~~" | tee ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/GCC_LINK_MESSAGES.txt
    g++ -v -o ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/*.o -Wl,-rpath,"\$ORIGIN" ${LINKER_OPTIONS} 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/GCC_LINK_MESSAGES.txt
	
	# EXECUTABLE DISASSEMBLING PROCESS
      
      if [[ "$(command -v objdump) > /dev/null" ]] && [[ "$(command -v readelf) > /dev/null " ]] ; then
  		  echo "DISSASEMBLING ALL SECTIONS OF THE EXECUTABLE..."
    		objdump -D ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe > ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/DISSASEMBLED_ALL.obj
    		echo "FULLY DISASSEMBLED EXECUTABLE. THE RESULTS ARE IN DISSASEMBLED_ALL.obj" 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXPORTED_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED_ALL.obj"
    	
    		echo "PARTLY DISSASEMBLING THE EXECUTABLE..."
    		objdump -d ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe > ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/DISSASEMBLED.obj
    		echo "PARTLY DISASSEMBLED EXECUTABLE." 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXPORTED_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED.obj"

    		objdump -x ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe > ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/DISSASEMBLED_ALL_HEADERS.obj
    		echo "DISSASSEMBLED ALL HEADERS OF THE EXECUTABLE." 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXPORTED_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED_ALL_HEADERS.obj"

    		objdump -i ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe > ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/DISSASEMBLED_INFO.obj
    		echo "OUTPUTTING DIFFERENT INFORMATION ABOUT THE EXECUTABLE." 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXPORTED_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED_INFO.obj"

    		objdump -g ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe > ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/DISSASEMBLED_DEBUGGING.obj
    		echo "OUTPUTTING DISASSEMBLY DEBUGGING INFORMATION ABOUT THE EXECUTABLE." 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXPORTED_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED_DEBUGGING.obj"

			  readelf -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe > ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/READELF_INFO.obj
    		echo "OUTPUTTING DISASSEMBLY INFORMATION ABOUT THE EXECUTABLE." 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXPORTED_DELIVERIES.txt
    		echo "OUTPUT IN READELF_INFO.obj"
      fi

    # SHARED LIBRARIES DETERMINATION + COPYING
    echo "REMOVING OLD LIBRARIES THE EXECUTABLE DEPENDED ON..."
    rm -rf ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/SHARED_LIBS
    rm -rf ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/GCC_COPIED_SHARED_LIBS.txt
    echo "CALCULATING DEPENDENCIES AND COPYING ALL REQUIRED .so FILES (DYNAMIC LINK LIBRARIES)..."
    mkdir ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/SHARED_LIBS/
    ldd ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe | grep "=> /" | awk '{print $3}' | xargs -I '{}' cp -v '{}' ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/SHARED_LIBS/ 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/GCC_COPIED_SHARED_LIBS.txt
    
    if [[ "$(command -v patchelf) > /dev/null" ]] ; then
    echo "CHANGING THE RPATH OF EVERY LIBRARY IN ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/SHARED_LIBS/ TO FIRST SEARCH IN THE CURRENT DIRECTORY"
    patchelf --force-rpath --set-rpath "\$ORIGIN" ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/SHARED_LIBS/*.so*
    fi

    echo "~~~~~~~~~~~~~~EXECUTABLE BUILT! OUTPUT IN /GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe~~~~~~~~~~~~~~~~" | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/GCC_LINK_MESSAGES.txt
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
          echo Building $file... | tee ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
          for argcversion in "$@"; do
            if [[ "$argcversion" == "-C11" || "$argcversion" == "-c11" ]]; then
              echo "USING C++11 STDLIB..." | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
              g++ -v -g -Wall -Wextra -libstdc++11 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
              echo "BUILDING DYNAMIC LIBRARY... " 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
              g++ -v -fPIC -shared ../SOURCE_CPP/$file ${LINKER_OPTIONS} -o ${file}.so 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt

            elif [[ "$argcversion" == "-C14" || "$argcversion" == "-c14" ]]; then
              echo "USING C++14 STDLIB..." | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
              g++ -v -g -Wall -Wextra -libstdc++14 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
              echo "BUILDING DYNAMIC LIBRARY... " 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
              g++ -v -fPIC -shared ../SOURCE_CPP/$file ${LINKER_OPTIONS} -o ${file}.so 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt

            elif [[ "$argcversion" == "-C17" || "$argcversion" == "-c17" ]]; then
              echo "USING C++17 STDLIB..." | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
              g++ -v -g -Wall -Wextra -libstdc++17 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
              echo "BUILDING DYNAMIC LIBRARY... " 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
              g++ -v -fPIC -shared ../SOURCE_CPP/$file ${LINKER_OPTIONS} -o ${file}.so 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
            
            #else
            #  echo "USING C++17 STDLIB..." | tee ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
            #  g++ -v -g -Wall -Wextra -libstdc++17 -c ../SOURCE_CPP/$file ${LINKER_OPTIONS} | tee ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/${file}_BUILD_MESSAGE.txt
            fi
          done
          
          echo "Moving all .o and .so files to ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/" | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
          mv ./*.so ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt
          mv ./*.o ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BUILD_FILES/GCC_BUILD_MESSAGES.txt

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
        ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe
    fi
    echo "~~~~~~~~~~~~~~~PROGRAM END~~~~~~~~~~~~~~~~~"
  elif [[ "$arg" == "-export" || "$arg" == "-e" ]]; then
  	# echo "REMOVING OLD LIBRARIES THE EXECUTABLE DEPENDED ON..."
    # rm -rf ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/SHARED_LIBS/*
    # rm -rf ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/GCC_COPIED_SHARED_LIBS.txt
    echo "~~~~STARTING PROJECT CREATION PROCESS~~~~"
    echo "SEARCHING IF THE EXECUTABLE IS AVAILABLE..."
    if [[ -f "../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe" ]]; then 
   		echo "EXECUTABLE FOUND IN ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe"
   		echo "REMOVING THE ALREADY-CREATED EXPORTED IF IT EXISTS..."
   		
   		rm -rf ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/GCC_PROJECT_TO_BE_EXPORTEDED
   		mkdir ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/GCC_PROJECT_TO_BE_EXPORTEDED
   		
   		echo "~~~~~~~~~~EXPORTEDED PROJECT MESSAGES + WHAT IT CONTAINS~~~~~~~~~" > ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXPORTED_DELIVERIES.txt && echo "" >> ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXPORTED_DELIVERIES.txt
   		
   		echo "REMOVING THE ALREADY-EXISTING ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/SHARED_LIBS/ AND CREATING A NEW FOLDER WITH THE SAME NAME..."
   		rm -rf ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/SHARED_LIBS
   		mkdir ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/SHARED_LIBS
   		
    	echo "CALCULATING DEPENDENCIES AND CREATING ALL REQUIRED .so FILES (DYNAMIC LINK LIBRARIES) TO THE SHARED LIBS FOLDER..."	
    	echo "~FOUND THE FOLLOWING .so FILES THE EXECUTABLE DEPENDS ON~" >> ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXPORTED_DELIVERIES.txt
    	
    	ldd ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe | grep "=> /" | awk '{print $3}' | xargs -I '{}' cp -v '{}' ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/SHARED_LIBS/ 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXPORTED_DELIVERIES.txt
    	if [[ "$(command -v patchelf) > /dev/null" ]] ; then
      	echo "CHANGING THE RPATH OF EVERY LIBRARY IN ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/SHARED_LIBS/ TO FIRST SEARCH IN THE CURRENT DIRECTORY"
      	patchelf --force-rpath --set-rpath "\$ORIGIN" ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/SHARED_LIBS/*.so*
  
      fi

    	# COPYING SHARED LIBS FROM THE SHARED LIBS DIRECTORY
    	echo "COPYING SHARED LIBS FROM THE SHARED LIBS DIRECTORY + EXECUTABLE..."
  		
      cp ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/SHARED_LIBS/* ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/GCC_PROJECT_TO_BE_EXPORTEDED
  		cp ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/GCC_PROJECT_TO_BE_EXPORTEDED/EXECUTABLE.exe
  		
      	# COPYING INFORMATION RELATED TO EXECUTABLE + DISASSEMBLE USING OBJUMP AND READELF
        cp ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/DISSASEMBLED.obj  ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/GCC_PROJECT_TO_BE_EXPORTEDED/
      	cp ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/DISSASEMBLED_ALL_HEADERS.obj  ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/GCC_PROJECT_TO_BE_EXPORTEDED/     
  		  cp ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/DISSASEMBLED_ALL.obj  ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/GCC_PROJECT_TO_BE_EXPORTEDED/
        cp ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/READELF_INFO.obj  ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/GCC_PROJECT_TO_BE_EXPORTEDED/
        cp ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/DISSASEMBLED_INFO.obj  ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/GCC_PROJECT_TO_BE_EXPORTEDED/
        cp ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/DISSASEMBLED_DEBUGGING.obj  ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/GCC_PROJECT_TO_BE_EXPORTEDED/

      # echo "SETTING THE RPATH OF THE EXECUTABLE..."
      if [[ "$(command -v patchelf) > /dev/null" ]] ; then
  		  patchelf --set-rpath '$ORIGIN/' ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe
  		  patchelf --set-interpreter ./ld-linux-x86-64.so.2 ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe
  		fi

  		echo "~DONE COPYING ENUMERATED FILES FILES~"
  		
      if [[ "$(command -v objdump) > /dev/null" ]] && [[ "$(command -v readelf) > /dev/null " ]] ; then
  		echo "DISSASEMBLING ALL SECTIONS OF THE EXECUTABLE..."
    		objdump -D ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe > ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/DISSASEMBLED_ALL.obj
    		echo "FULLY DISASSEMBLED EXECUTABLE. THE RESULTS ARE IN DISSASEMBLED_ALL.obj" 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXPORTED_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED_ALL.obj"
    	
    		echo "PARTLY DISSASEMBLING THE EXECUTABLE..."
    		objdump -d ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe > ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/DISSASEMBLED.obj
    		echo "PARTLY DISASSEMBLED EXECUTABLE." 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXPORTED_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED.obj"

    		objdump -x ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe > ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/DISSASEMBLED_ALL_HEADERS.obj
    		echo "DISSASSEMBLED ALL HEADERS OF THE EXECUTABLE." 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXPORTED_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED_ALL_HEADERS.obj"

    		objdump -i ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe > ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/DISSASEMBLED_INFO.obj
    		echo "OUTPUTTING DIFFERENT INFORMATION ABOUT THE EXECUTABLE." 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXPORTED_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED_INFO.obj"

    		objdump -g ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe > ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/DISSASEMBLED_DEBUGGING.obj
    		echo "OUTPUTTING DISASSEMBLY DEBUGGING INFORMATION ABOUT THE EXECUTABLE." 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXPORTED_DELIVERIES.txt
    		echo "OUTPUT IN DISSASEMBLED_DEBUGGING.obj"

			  readelf -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe > ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/READELF_INFO.obj
    		echo "OUTPUTTING DISASSEMBLY INFORMATION ABOUT THE EXECUTABLE." 2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXPORTED_DELIVERIES.txt
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
    	2>&1 | tee -a ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/MIT_LICENSE.md
    	echo "" && echo "" >> ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXPORTED_DELIVERIES.txt
    	
      if [[ "$(command -v zip) > /dev/null" ]] && [[ "$(command -v tar) > /dev/null " ]] ; then
      echo "ARCHIVING FOLDER INTO A ZIP ARCHIVE..." | tee -a ./GCC_PROJECT_TO_BE_EXPORTEDED/EXPORTED_DELIVERIES.txt && echo "" >> ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXPORTED_DELIVERIES.txt
    	cd ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/
   		zip -r GCC_PROJECT_TO_BE_EXPORTEDED.zip GCC_PROJECT_TO_BE_EXPORTEDED/* 2>&1 | tee -a ./GCC_PROJECT_TO_BE_EXPORTEDED/EXPORTED_DELIVERIES.txt
   		
      echo "" && echo "" | tee -a ./GCC_PROJECT_TO_BE_EXPORTEDED/EXPORTED_DELIVERIES.txt
   		echo "ARCHIVING FOLDER INTO A TAR ARCHIVE..." && echo "" | tee -a ./GCC_PROJECT_TO_BE_EXPORTEDED/EXPORTED_DELIVERIES.txt
   		tar -czvf GCC_PROJECT_TO_BE_EXPORTEDED.tar.gz GCC_PROJECT_TO_BE_EXPORTEDED/* 2>&1 | tee -a ./GCC_PROJECT_TO_BE_EXPORTEDED/EXPORTED_DELIVERIES.txt
   		fi

    	echo "~~~~~DONE~~~~~"
    	echo "~~~~EOF~~~~" >> ./GCC_PROJECT_TO_BE_EXPORTEDED/EXPORTED_DELIVERIES.txt
    	
    	
  	else
  		echo "EXECUTABLE NOT FOUND IN ../GCC++_BUILD_AND_BINARY_FILES/GCC++_BINARY_FILES/EXECUTABLE.exe. NOTHING HAS BEEN CREATED OR REMOVED"
  	fi
  fi
done
exit
