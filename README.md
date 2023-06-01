# Chaocipher: Kevin Liu and Xinqing Lin: Rotisserlin Chaoken

The Chaocipher is a cipher based on two rotating disks. We have a python encoder and decoder as well as a visualization on Processing to explain the algorithm. 

In order to use the python encoder, open your terminal and clone the repository.
```
cd encoder
python3 encoder.py message.txt
```
(message.txt being a text file containing the message you want to encrypt/decrypt.)
To use the decoder:
```
cd decoder
python3 decoder.py message.txt
```

In order to use the visualizer:
- run ```Demo.pde``` in Processing. 
    - On the upper left hand side are the current settings of the visualizer. You may change them with the buttons on the lower left hand side, or with a hotkey. 
- In order to encrypt, locate the plaintext character on the right disk and move it to the zenith position (indicated by the green box) using the up and down arrow keys. Then, press the **space** button.
- Continue locating the plaintext character on the right disk and the encrypted message will appear in the space below the disks. 
- In order to decrypt, change the mode to decryption using the button or the hotkey. Then, locate the ciphertext character on the left disk and move it to the zenith position (indicated by the red box) using the up and down arrow keys. Then, press the **space** button. 

Visualizer Hotkeys: 
| Key | Description |
| --- | ----------- |
| Space | Encrypts/decrypts the current letter at the zenith position of the plaintext/ciphertext disks. |
| ```m``` | Toggles the step-by-step animation feature on and off |
| ```r``` | Resets the simulation | 
| ```n``` | Changes between encryption mode and decryption mode | 


The presentation can be found [here](PRESENTATION.md)

The homework assignment can be found [here](HOMEWORK.md)
