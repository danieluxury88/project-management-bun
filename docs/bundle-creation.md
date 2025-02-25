1. Build container
   ```
    docker build -t fmo/fmo-logger-bundle .
    docker build -t seriousdesign/project-management-bundle .
   ```

2. Run everything inside the container
   ```
   docker run -d --rm -p 9334:8000 -v $(pwd):/app --name project-management-bundle seriousdesign/project-management-bundle
   docker exec -it project-management-bundle sh
   ```