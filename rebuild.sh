#!/bin/bash

cd "$(dirname "$0")"

set -ve
rm -rf tmp-*
mkdir -p tmp-student tmp-autograder tmp-uploads

cd go
# Generate student notebook
go run cmd/assign/assign.go --command student --input=../exercises/helloworld-en-master.ipynb --output=../tmp-student/helloworld-en-student.ipynb
go run cmd/assign/assign.go --command student --input=../exercises/oop-en-master.ipynb --output=../tmp-student/oop-en-student.ipynb
go run cmd/assign/assign.go --command student --input=../exercises/oop-1-en-master.ipynb --output=../tmp-student/oop-1-en-student.ipynb

# Generate the autograder script directories
go run cmd/assign/assign.go --command=autograder --input=../exercises/helloworld-en-master.ipynb --output=../tmp-autograder
go run cmd/assign/assign.go --command=autograder --input=../exercises/oop-en-master.ipynb --output=../tmp-autograder
go run cmd/assign/assign.go --command=autograder --input=../exercises/oop-1-en-master.ipynb --output=../tmp-autograder
