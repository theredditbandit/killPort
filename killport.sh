echo "building killport"

cd /root/killPort/usp/
CGO_ENABLED=0 go build . 

echo "build complete!"
