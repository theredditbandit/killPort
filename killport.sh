echo "building killport"

cd /home/dev/killport/usp/
CGO_ENABLED=0 go build . 

echo "build complete!"
