from ultralytics import YOLO
import cv2

model = YOLO("yolov8n.pt")

results = model.train(data="coco8.yaml", epochs=100, imgsz=640)


'''
@TODO OPTIMIZE THIS CODE WITH JUPYTER NOTEBOOK
'''

def main():
    # Open a connection to the camera (0 is usually the default camera)
    cap = cv2.VideoCapture(0)

    if not cap.isOpened():
        print("Error: Could not open video stream.")
        return

    while True:
        # Capture frame-by-frame
        ret, frame = cap.read()

        if not ret:
            print("Error: Could not read frame.")
            break


        # Perform object detection
        results = model(frame)
        print(results)

        # Draw the results on the frame
        frame = results[0].plot()  # Assuming the results object has a plot method

        # Display the resulting frame
        cv2.imshow('Video Stream', frame)

        # Break the loop on 'q' key press
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    # When everything is done, release the capture
    cap.release()
    cv2.destroyAllWindows()

if __name__ == "__main__":
    main()
