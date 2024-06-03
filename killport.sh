echo "building killport"

cd /killport/usp/
CGO_ENABLED=0 go build . 

echo "build complete!"
