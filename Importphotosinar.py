import cv2

# Open the default camera
camera = cv2.VideoCapture(0)

# Load the image to be used as the AR overlay
image = cv2.imread("ar_image.jpg")

while True:
    # Capture a frame from the camera
    ret, frame = camera.read()

    # Resize the image to match the size of the camera frame
    image = cv2.resize(image, (frame.shape[1], frame.shape[0]))

    # Create a mask for the image
    mask = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    # Add the image to the camera frame using the mask
    frame = cv2.addWeighted(frame, 0.7, image, 0.3, 0, mask=mask)

    # Display the frame
    cv2.imshow("Camera", frame)

    # Break the loop if the 'q' key is pressed
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# Release the camera
camera.release()

# Close all windows
cv2.destroyAllWindows()
