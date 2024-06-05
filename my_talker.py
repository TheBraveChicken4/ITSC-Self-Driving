import rclpy
from rclpy.node import Node
from std_msgs.msg import String

class MyTalkerNode(Node):
    def __init__(self):
        super().__init__('my_talker')
        self.talker_publisher = self.create_publisher(String, 'my_topic', 10)
        self.create_timer(1, self.timer_callback)
        self.i = 0

    def timer_callback(self):
        msg = String()
        msg.data = f"Hello ROS2! {self.i}"
        self.talker_publisher.publish(msg)
        self.get_logger().info('Publishing "%s"' % msg.data)
        self.i += 1



def main(args=None):
    rclpy.init(args=args)

    node = MyTalkerNode()   

    rclpy.spin(node)

    rclpy.shutdown()

if __name__ == '__main__':
    main()
