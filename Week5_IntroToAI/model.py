# Use YOLOv8 to create a model that makes bounding boxes for things that a robot might need to watch out for. 
from ultralytics import YOLO
from ultralytics.yolo.v8.detection.predict import DetectionPredictor

# Load a model
model = YOLO("yolov8n.pt")

# Use the model
model.train(data="coco8.yaml", epochs=3)
metrics = model.val()
results = model("https://ultralytics.com/images/bus.jpg")
path = model.export(format="onnx")