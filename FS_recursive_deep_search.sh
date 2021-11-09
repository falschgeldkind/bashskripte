#!/bin/bash
### Recursively iterates over a filesystem structure and performs some action (defined in action() ) on it

### Debug switch
debug=false

### Useful variables for use in action()
#path=/PATH/TO/DIRECTORY/
#file=/PATH/TO/FILE
#

action() {
### Examples:
#	echo "I would copy the file $file now to $path"
#	rsync -arv $file $path --progress
#	echo $file
#	mv "$file" "$file.pdf"
}

checkiffile() {
	pFile=$1
	if [ -d "${pFile}" ] ; then
        if $debug; then
            echo "${pFile} is a directory!"; 
        fi
	    exit 1
	else
	    if [ -f "${pFile}" ]; then
            if $debug; then
                echo "${pFile} is a regular file!";
            fi
            exit 0
        else
            if $debug; then
                echo "${pFile} is neither a directory nor a regular file!";
            fi
            exit 2
	    fi
	fi
}

recursivesearch() {
	#echo $(realpath $1)
	
	for f in $1/*;
	do
		if $(checkiffile $f) ;
		then
			file=$(realpath $f)
			action
		else
			#echo "$f"
			#echo "directory"
			recursivesearch $(realpath $f)
		fi
		
		
	done

}

recursivesearch $(realpath ./)
