conv_base = ResNet50V2(
    weights = 'imagenet', 
    include_top = False, 
    input_shape=(150, 150, 3)
)

model = models.Sequential()
model.add(conv_base)
model.add(layers.GlobalAveragePooling2D())
model.add(layers.Dense(256, activation='relu'))
model.add(layers.Dense(1, activation='sigmoid'))

model.summary()